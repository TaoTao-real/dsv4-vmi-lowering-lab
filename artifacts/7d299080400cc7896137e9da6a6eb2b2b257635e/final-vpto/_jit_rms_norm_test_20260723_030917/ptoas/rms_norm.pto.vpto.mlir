module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c8256_i64 = arith.constant 8256 : i64
      %c12864_i64 = arith.constant 12864 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c8768_i64 = arith.constant 8768 : i64
      %c16960_i64 = arith.constant 16960 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c8224_i64 = arith.constant 8224 : i64
      %c8512_i64 = arith.constant 8512 : i64
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c2 = arith.constant 2 : index
      %c128 = arith.constant 128 : index
      %cst_0 = arith.constant 2.44140625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c64 = arith.constant 64 : index
      %c128_i32 = arith.constant 128 : i32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c32768 = arith.constant 32768 : index
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %14 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %13, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c32768 : index
      %3 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %4 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %13 = arith.muli %arg6, %c128 : index
        %14 = arith.addi %13, %c128 : index
        %15 = arith.addi %2, %13 : index
        %16 = pto.addptr %arg0, %15 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %16, %3, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %17 = arith.addi %2, %14 : index
        %18 = pto.addptr %arg0, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %18, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %19 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %20 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg7 : i16 to index
            %34 = arith.muli %33, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.addi %34, %35 : index
              %37 = pto.addptr %3, %36 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %37[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %38 = pto.vcvt %result_10, %19 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %39 = pto.addptr %20, %36 : <f32, ub> -> <f32, ub>
              pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %22 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %25 = pto.vdup %cst, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %26 = pto.pand %23, %mask_3, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg7 : i16 to index
            %34 = arith.muli %33, %c128 : index
            %result_10 = pto.vlds %20[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = arith.addi %34, %c64 : index
            %result_11 = pto.vlds %20[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_10, %result_10, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_11, %result_11, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %20[%34], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %37, %20[%35], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %38 = pto.vadd %36, %37, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vcadd %38, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vadd %39, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %22[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %27 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result, %result_5, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.pand %27, %mask_6, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %28, %20[%c0], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg7 : i16 to index
            %34 = arith.muli %33, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.addi %34, %35 : index
              %37 = pto.addptr %4, %36 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %37[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %38 = pto.vcvt %result_10, %19 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %39 = pto.addptr %30, %36 : <f32, ub> -> <f32, ub>
              pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %31 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg7 : i16 to index
            %34 = arith.muli %33, %c128 : index
            %result_10 = pto.vlds %30[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = arith.addi %34, %c64 : index
            %result_11 = pto.vlds %30[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_10, %result_10, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_11, %result_11, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %30[%34], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %37, %30[%35], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %38 = pto.vadd %36, %37, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vcadd %38, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vadd %39, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %31[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_8 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result_8, %result_9, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %1[%c0], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %5 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %13 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.vdup %cst_0, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vmul %result, %15, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pand %13, %mask, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %16, %5[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %6 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %7 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.vdup %cst_1, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.vadd %result, %14, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pand %16, %mask, %13 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %15, %5[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.vsqrt %result_3, %13 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vdup %cst_2, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vdiv %19, %18, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %7[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %9 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %13 = arith.muli %arg6, %c128 : index
        %14 = arith.addi %13, %c128 : index
        %15 = arith.addi %2, %13 : index
        %16 = pto.addptr %arg0, %15 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %16, %8, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %17 = pto.addptr %arg2, %13 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %17, %9, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %18 = arith.addi %2, %14 : index
        %19 = pto.addptr %arg0, %18 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %19, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %20 = pto.addptr %arg2, %14 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %20, %10, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %31 = arith.index_cast %arg8 : i16 to index
              %32 = arith.addi %30, %31 : index
              %33 = pto.addptr %8, %32 : <bf16, ub> -> <bf16, ub>
              %result_4 = pto.vlds %33[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %34 = pto.vcvt %result_4, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %35 = pto.addptr %5, %32 : <f32, ub> -> <f32, ub>
              pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = pto.addptr %9, %29 : <bf16, ub> -> <bf16, ub>
            %result_4 = pto.vlds %30[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %31 = pto.vcvt %result_4, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %32 = pto.addptr %26, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %31 = pto.addptr %7, %29 : <f32, ub> -> <f32, ub>
            %32 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %33 = arith.index_cast %arg8 : i16 to index
              %34 = arith.index_cast %arg9 : index to i32
              %mask_4, %scalar_out_5 = pto.plt_b32 %34 : i32 -> !pto.mask<b32>, i32
              %35 = arith.index_cast %scalar_out_5 : i32 to index
              %36 = arith.addi %30, %33 : index
              %37 = pto.addptr %5, %36 : <f32, ub> -> <f32, ub>
              %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vmul %result_6, %38, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %39, %37[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %35 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %26[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %result_4 = pto.vlds %5[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %30, %c64 : index
            %result_5 = pto.vlds %5[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result_4, %result, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_5, %result_3, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %5[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %33, %5[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %21 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg7 : i16 to index
            %28 = arith.muli %27, %c128 : index
            %result = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %28, %c64 : index
            %result_3 = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = pto.vcvt %result, %25 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %31 = pto.vcvt %result_3, %25 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %30, %11[%28], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %31, %11[%29], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %22 = pto.addptr %arg1, %15 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %11, %22, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %31 = arith.index_cast %arg8 : i16 to index
              %32 = arith.addi %30, %31 : index
              %33 = pto.addptr %4, %32 : <bf16, ub> -> <bf16, ub>
              %result_4 = pto.vlds %33[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %34 = pto.vcvt %result_4, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %35 = pto.addptr %12, %32 : <f32, ub> -> <f32, ub>
              pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %26 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = pto.addptr %10, %29 : <bf16, ub> -> <bf16, ub>
            %result_4 = pto.vlds %30[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %31 = pto.vcvt %result_4, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %32 = pto.addptr %26, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %31 = pto.addptr %7, %29 : <f32, ub> -> <f32, ub>
            %32 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %33 = arith.index_cast %arg8 : i16 to index
              %34 = arith.index_cast %arg9 : index to i32
              %mask_4, %scalar_out_5 = pto.plt_b32 %34 : i32 -> !pto.mask<b32>, i32
              %35 = arith.index_cast %scalar_out_5 : i32 to index
              %36 = arith.addi %30, %33 : index
              %37 = pto.addptr %12, %36 : <f32, ub> -> <f32, ub>
              %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vmul %result_6, %38, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %39, %37[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %35 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %26[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %result_4 = pto.vlds %12[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %30, %c64 : index
            %result_5 = pto.vlds %12[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result_4, %result, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_5, %result_3, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %12[%30], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %33, %12[%31], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %23 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg7 : i16 to index
            %28 = arith.muli %27, %c128 : index
            %result = pto.vlds %12[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = arith.addi %28, %c64 : index
            %result_3 = pto.vlds %12[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = pto.vcvt %result, %25 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %31 = pto.vcvt %result_3, %25 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %30, %3[%28], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %31, %3[%29], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %24 = pto.addptr %arg1, %18 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %3, %24, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
