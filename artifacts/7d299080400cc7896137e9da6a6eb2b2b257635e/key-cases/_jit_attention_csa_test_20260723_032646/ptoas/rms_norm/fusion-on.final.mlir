module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c2 = arith.constant 2 : index
      %c128 = arith.constant 128 : index
      %cst_0 = arith.constant 2.44140625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8_i64 = arith.constant 8 : i64
      %c64 = arith.constant 64 : index
      %c128_i32 = arith.constant 128 : i32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c32768 = arith.constant 32768 : index
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %17, %18[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c32768 : index
      %3 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %4 = pto.addptr %3, %c0 : <bf16, ub> -> <bf16, ub>
      %5 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %17 = arith.muli %arg5, %c128 : index
        %18 = arith.addi %17, %c128 : index
        %19 = arith.addi %2, %17 : index
        %20 = pto.addptr %arg0, %19 : <bf16, gm> -> <bf16, gm>
        %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %22 = arith.addi %2, %18 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %25 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %26 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.addi %40, %41 : index
              %43 = pto.addptr %3, %42 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %44 = pto.vcvt %result_10, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %45 = pto.addptr %26, %42 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.vdup %cst, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %32 = pto.pand %29, %mask_3, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %result_10 = pto.vlds %26[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %40, %c64 : index
            %result_11 = pto.vlds %26[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = pto.vmul %result_10, %result_10, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_11, %result_11, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %42, %26[%40], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %43, %26[%41], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = pto.vadd %42, %43, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vcadd %44, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %45, %31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %28[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %33 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result, %result_5, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %35 = pto.pand %33, %mask_6, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %34, %26[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %36 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.addi %40, %41 : index
              %43 = pto.addptr %5, %42 : <bf16, ub> -> <bf16, ub>
              %result_10 = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %44 = pto.vcvt %result_10, %25 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %45 = pto.addptr %36, %42 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %37 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %result_10 = pto.vlds %36[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %40, %c64 : index
            %result_11 = pto.vlds %36[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = pto.vmul %result_10, %result_10, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_11, %result_11, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %42, %36[%40], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %43, %36[%41], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = pto.vadd %42, %43, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vcadd %44, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vadd %45, %31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %37[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_8 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result_8, %result_9, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %1[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %7 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %17 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %19 = pto.vdup %cst_0, %18 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vmul %result, %19, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pand %17, %mask, %18 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %20, %7[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %9 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.vdup %cst_1, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vadd %result, %18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pand %20, %mask, %17 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %19, %7[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.vsqrt %result_3, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.vdup %cst_2, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vdiv %23, %22, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %9[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      %12 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
      %16 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %17 = arith.muli %arg5, %c128 : index
        %18 = arith.addi %17, %c128 : index
        %19 = arith.addi %2, %17 : index
        %20 = pto.addptr %arg0, %19 : <bf16, gm> -> <bf16, gm>
        %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %11, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %22 = pto.addptr %arg2, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %22, %12, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %23 = arith.addi %2, %18 : index
        %24 = pto.addptr %arg0, %23 : <bf16, gm> -> <bf16, gm>
        %25 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = pto.addptr %arg2, %18 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %26, %13, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %39 = arith.index_cast %arg7 : i16 to index
              %40 = arith.addi %38, %39 : index
              %41 = pto.addptr %10, %40 : <bf16, ub> -> <bf16, ub>
              %result_4 = pto.vlds %41[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %42 = pto.vcvt %result_4, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %43 = pto.addptr %7, %40 : <f32, ub> -> <f32, ub>
              pto.vsts %42, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %34 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = pto.addptr %12, %37 : <bf16, ub> -> <bf16, ub>
            %result_4 = pto.vlds %38[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_4, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %40 = pto.addptr %34, %37 : <f32, ub> -> <f32, ub>
            pto.vsts %39, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            %39 = pto.addptr %9, %37 : <f32, ub> -> <f32, ub>
            %40 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.index_cast %arg8 : index to i32
              %mask_4, %scalar_out_5 = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out_5 : i32 to index
              %44 = arith.addi %38, %41 : index
              %45 = pto.addptr %7, %44 : <f32, ub> -> <f32, ub>
              %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vmul %result_6, %46, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %47, %45[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            %result_4 = pto.vlds %7[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_5 = pto.vlds %7[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_4, %result, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %41 = pto.vmul %result_5, %result_3, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %7[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %41, %7[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %27 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %result = pto.vlds %7[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = arith.addi %36, %c64 : index
            %result_3 = pto.vlds %7[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vcvt %result, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_3, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %38, %14[%36], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %39, %14[%37], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %28 = pto.addptr %arg1, %19 : <bf16, gm> -> <bf16, gm>
        %29 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %15, %29, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %39 = arith.index_cast %arg7 : i16 to index
              %40 = arith.addi %38, %39 : index
              %41 = pto.addptr %5, %40 : <bf16, ub> -> <bf16, ub>
              %result_4 = pto.vlds %41[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %42 = pto.vcvt %result_4, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %43 = pto.addptr %16, %40 : <f32, ub> -> <f32, ub>
              pto.vsts %42, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %34 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = pto.addptr %13, %37 : <bf16, ub> -> <bf16, ub>
            %result_4 = pto.vlds %38[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_4, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %40 = pto.addptr %34, %37 : <f32, ub> -> <f32, ub>
            pto.vsts %39, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            %39 = pto.addptr %9, %37 : <f32, ub> -> <f32, ub>
            %40 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.index_cast %arg8 : index to i32
              %mask_4, %scalar_out_5 = pto.plt_b32 %42 : i32 -> !pto.mask<b32>, i32
              %43 = arith.index_cast %scalar_out_5 : i32 to index
              %44 = arith.addi %38, %41 : index
              %45 = pto.addptr %16, %44 : <f32, ub> -> <f32, ub>
              %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vmul %result_6, %46, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %47, %45[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %43 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %34[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg6 : i16 to index
            %38 = arith.muli %37, %c128 : index
            %result_4 = pto.vlds %16[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_5 = pto.vlds %16[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_4, %result, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %41 = pto.vmul %result_5, %result_3, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %16[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %41, %16[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %30 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %result = pto.vlds %16[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = arith.addi %36, %c64 : index
            %result_3 = pto.vlds %16[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vcvt %result, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %39 = pto.vcvt %result_3, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %38, %3[%36], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %39, %3[%37], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %31 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
        %32 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %4, %32, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
