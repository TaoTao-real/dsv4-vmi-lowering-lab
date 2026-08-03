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
        %15 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %15, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c32768 : index
      %3 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %4 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %15 = arith.muli %arg6, %c128 : index
        %16 = arith.addi %15, %c128 : index
        %17 = arith.addi %2, %15 : index
        %18 = pto.addptr %arg0, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %18, %3, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %19 = arith.addi %2, %16 : index
        %20 = pto.addptr %arg0, %19 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %20, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg7 : i16 to index
            %26 = arith.muli %25, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %27 = arith.index_cast %arg8 : i16 to index
              %28 = arith.addi %26, %27 : index
              %29 = pto.addptr %3, %28 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %29[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %30 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %31 = pto.addptr %5, %28 : <f32, ub> -> <f32, ub>
              pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %21 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %result = pto.vlds %5[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %30, %c64 : index
            %result_3 = pto.vlds %5[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_3, %result_3, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %5[%30], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %33, %5[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %26 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %27 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %28 = pto.pand %26, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.muli %29, %c128 : index
            %result = pto.vlds %5[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = arith.addi %30, %c64 : index
            %result_3 = pto.vlds %5[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vadd %result, %result_3, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vcadd %32, %24 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vadd %33, %27, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %34, %6[%29], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %22 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %24 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.vadd %result, %result_3, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %27 = pto.pand %24, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %26, %5[%c0], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %28 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %29 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %30 = arith.index_cast %arg7 : i16 to index
            %31 = arith.muli %30, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %32 = arith.index_cast %arg8 : i16 to index
              %33 = arith.addi %31, %32 : index
              %34 = pto.addptr %4, %33 : <bf16, ub> -> <bf16, ub>
              %result_6 = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %35 = pto.vcvt %result_6, %28 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %36 = pto.addptr %29, %33 : <f32, ub> -> <f32, ub>
              pto.vsts %35, %36[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg7 : i16 to index
            %35 = arith.muli %34, %c128 : index
            %result_6 = pto.vlds %24[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = arith.addi %35, %c64 : index
            %result_7 = pto.vlds %24[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_6, %result_6, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_7, %result_7, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %24[%35], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %38, %24[%36], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %27 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %29, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg7 : i16 to index
            %35 = arith.muli %34, %c128 : index
            %result_6 = pto.vlds %24[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = arith.addi %35, %c64 : index
            %result_7 = pto.vlds %24[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vadd %result_6, %result_7, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vcadd %37, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vadd %38, %28, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %39, %27[%34], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result, %result_3, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %33 = pto.pand %32, %mask_4, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %31, %1[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %7 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %15 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %17 = pto.vdup %cst_0, %16 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.vmul %result, %17, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pand %15, %mask, %16 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %18, %5[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %9 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.vdup %cst_1, %15 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vadd %result, %16, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pand %18, %mask, %15 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %17, %5[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %20 = pto.vsqrt %result_3, %15 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vdup %cst_2, %15 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vdiv %21, %20, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %22, %9[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c2 {
        %15 = arith.muli %arg6, %c128 : index
        %16 = arith.addi %15, %c128 : index
        %17 = arith.addi %2, %15 : index
        %18 = pto.addptr %arg0, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %18, %10, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %19 = pto.addptr %arg2, %15 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %19, %11, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %20 = arith.addi %2, %16 : index
        %21 = pto.addptr %arg0, %20 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %21, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %22 = pto.addptr %arg2, %16 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %22, %12, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %33 = arith.index_cast %arg8 : i16 to index
              %34 = arith.addi %32, %33 : index
              %35 = pto.addptr %10, %34 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %36 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %37 = pto.addptr %5, %34 : <f32, ub> -> <f32, ub>
              pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = pto.addptr %11, %31 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %32[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %33 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %34 = pto.addptr %30, %31 : <f32, ub> -> <f32, ub>
            pto.vsts %33, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %33 = pto.addptr %9, %31 : <f32, ub> -> <f32, ub>
            %34 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %36 : i32 -> !pto.mask<b32>, i32
              %37 = arith.index_cast %scalar_out_4 : i32 to index
              %38 = arith.addi %32, %35 : index
              %39 = pto.addptr %5, %38 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.vmul %result, %40, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %41, %39[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %37 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %23 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %29 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %29[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg7 : i16 to index
            %33 = arith.muli %32, %c128 : index
            %result_4 = pto.vlds %5[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = arith.addi %33, %c64 : index
            %result_5 = pto.vlds %5[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_4, %result, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_5, %result_3, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %35, %5[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %36, %5[%34], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %24 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %result = pto.vlds %5[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = arith.addi %32, %c64 : index
            %result_3 = pto.vlds %5[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result_3, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %34, %13[%32], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %35, %13[%33], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %25 = pto.addptr %arg1, %17 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %13, %25, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %33 = arith.index_cast %arg8 : i16 to index
              %34 = arith.addi %32, %33 : index
              %35 = pto.addptr %4, %34 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %36 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %37 = pto.addptr %14, %34 : <f32, ub> -> <f32, ub>
              pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %30 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = pto.addptr %12, %31 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %32[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %33 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %34 = pto.addptr %30, %31 : <f32, ub> -> <f32, ub>
            pto.vsts %33, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %33 = pto.addptr %9, %31 : <f32, ub> -> <f32, ub>
            %34 = scf.for %arg8 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg9 = %c128) -> (index)  : i16 {
              %35 = arith.index_cast %arg8 : i16 to index
              %36 = arith.index_cast %arg9 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %36 : i32 -> !pto.mask<b32>, i32
              %37 = arith.index_cast %scalar_out_4 : i32 to index
              %38 = arith.addi %32, %35 : index
              %39 = pto.addptr %14, %38 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.vmul %result, %40, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %41, %39[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %37 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %26 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %29 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %29[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg7 : i16 to index
            %33 = arith.muli %32, %c128 : index
            %result_4 = pto.vlds %14[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = arith.addi %33, %c64 : index
            %result_5 = pto.vlds %14[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_4, %result, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_5, %result_3, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %35, %14[%33], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %36, %14[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %27 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg7 : i16 to index
            %32 = arith.muli %31, %c128 : index
            %result = pto.vlds %14[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = arith.addi %32, %c64 : index
            %result_3 = pto.vlds %14[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %35 = pto.vcvt %result_3, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %34, %3[%32], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %35, %3[%33], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %28 = pto.addptr %arg1, %20 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %3, %28, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

