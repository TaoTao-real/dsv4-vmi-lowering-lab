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
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c2 = arith.constant 2 : index
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
        %19 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c32768 : index
      %3 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      %4 = pto.addptr %3, %c0 : <bf16, ub> -> <bf16, ub>
      %5 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      %7 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.castptr %c16960_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %19 = arith.muli %arg5, %c128 : index
        %20 = arith.addi %19, %c128 : index
        %21 = arith.addi %2, %19 : index
        %22 = pto.addptr %arg0, %21 : <bf16, gm> -> <bf16, gm>
        %23 = pto.addptr %22, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %23, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %24 = arith.addi %2, %20 : index
        %25 = pto.addptr %arg0, %24 : <bf16, gm> -> <bf16, gm>
        %26 = pto.addptr %25, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %26, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg6 : i16 to index
            %32 = arith.muli %31, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %33 = arith.index_cast %arg7 : i16 to index
              %34 = arith.addi %32, %33 : index
              %35 = pto.addptr %3, %34 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %36 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %37 = pto.addptr %7, %34 : <f32, ub> -> <f32, ub>
              pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %27 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %result = pto.vlds %7[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = arith.addi %36, %c64 : index
            %result_3 = pto.vlds %7[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result, %result, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmul %result_3, %result_3, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %7[%36], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %39, %7[%37], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %32 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %33 = pto.vdup %cst, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %34 = pto.pand %32, %mask, %31 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg6 : i16 to index
            %36 = arith.muli %35, %c128 : index
            %result = pto.vlds %7[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = arith.addi %36, %c64 : index
            %result_3 = pto.vlds %7[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vadd %result, %result_3, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vcadd %38, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vadd %39, %33, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %8[%35], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %28 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %30 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %32 = pto.vadd %result, %result_3, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %33 = pto.pand %30, %mask, %31 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %32, %7[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %34 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %35 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %36 = arith.index_cast %arg6 : i16 to index
            %37 = arith.muli %36, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %38 = arith.index_cast %arg7 : i16 to index
              %39 = arith.addi %37, %38 : index
              %40 = pto.addptr %5, %39 : <bf16, ub> -> <bf16, ub>
              %result_6 = pto.vlds %40[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %41 = pto.vcvt %result_6, %34 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %42 = pto.addptr %35, %39 : <f32, ub> -> <f32, ub>
              pto.vsts %41, %42[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %40 = arith.index_cast %arg6 : i16 to index
            %41 = arith.muli %40, %c128 : index
            %result_6 = pto.vlds %30[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %41, %c64 : index
            %result_7 = pto.vlds %30[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_6, %result_6, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vmul %result_7, %result_7, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %30[%41], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %44, %30[%42], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %33 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.vdup %cst, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %36 = pto.pand %35, %mask, %31 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %40 = arith.index_cast %arg6 : i16 to index
            %41 = arith.muli %40, %c128 : index
            %result_6 = pto.vlds %30[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %41, %c64 : index
            %result_7 = pto.vlds %30[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vadd %result_6, %result_7, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vcadd %43, %32 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vadd %44, %34, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %33[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vadd %result, %result_3, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %39 = pto.pand %38, %mask_4, %31 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %37, %1[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %21 = pto.vdup %cst_0, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vmul %result, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pand %19, %mask, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %22, %7[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %11 = pto.castptr %c8224_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst_1, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vadd %result, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pand %22, %mask, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %21, %7[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.vsqrt %result_3, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vdup %cst_2, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vdiv %25, %24, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %26, %11[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
      %14 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.castptr %c8512_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.castptr %c8768_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
      %18 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c32 step %c2 {
        %19 = arith.muli %arg5, %c128 : index
        %20 = arith.addi %19, %c128 : index
        %21 = arith.addi %2, %19 : index
        %22 = pto.addptr %arg0, %21 : <bf16, gm> -> <bf16, gm>
        %23 = pto.addptr %22, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %23, %13, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %24 = pto.addptr %arg2, %19 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %24, %14, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %25 = arith.addi %2, %20 : index
        %26 = pto.addptr %arg0, %25 : <bf16, gm> -> <bf16, gm>
        %27 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %27, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %28 = pto.addptr %arg2, %20 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %28, %15, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c256_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.addi %40, %41 : index
              %43 = pto.addptr %12, %42 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %44 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %45 = pto.addptr %7, %42 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %38 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = pto.addptr %14, %39 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %40[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %41 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %42 = pto.addptr %38, %39 : <f32, ub> -> <f32, ub>
            pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %41 = pto.addptr %11, %39 : <f32, ub> -> <f32, ub>
            %42 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %43 = arith.index_cast %arg7 : i16 to index
              %44 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
              %45 = arith.index_cast %scalar_out_4 : i32 to index
              %46 = arith.addi %40, %43 : index
              %47 = pto.addptr %7, %46 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result, %48, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %47[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %45 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %29 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %40 = arith.index_cast %arg6 : i16 to index
            %41 = arith.muli %40, %c128 : index
            %result_4 = pto.vlds %7[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %41, %c64 : index
            %result_5 = pto.vlds %7[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_4, %result, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vmul %result_5, %result_3, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %7[%41], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %44, %7[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %30 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %result = pto.vlds %7[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %40, %c64 : index
            %result_3 = pto.vlds %7[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = pto.vcvt %result, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %43 = pto.vcvt %result_3, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %42, %16[%40], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %43, %16[%41], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %31 = pto.addptr %arg1, %21 : <bf16, gm> -> <bf16, gm>
        %32 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %17, %32, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
              %41 = arith.index_cast %arg7 : i16 to index
              %42 = arith.addi %40, %41 : index
              %43 = pto.addptr %5, %42 : <bf16, ub> -> <bf16, ub>
              %result = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
              %44 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
              %45 = pto.addptr %18, %42 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %38 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = pto.addptr %15, %39 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %40[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %41 = pto.vcvt %result, %37 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %42 = pto.addptr %38, %39 : <f32, ub> -> <f32, ub>
            pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %41 = pto.addptr %11, %39 : <f32, ub> -> <f32, ub>
            %42 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
              %43 = arith.index_cast %arg7 : i16 to index
              %44 = arith.index_cast %arg8 : index to i32
              %mask_3, %scalar_out_4 = pto.plt_b32 %44 : i32 -> !pto.mask<b32>, i32
              %45 = arith.index_cast %scalar_out_4 : i32 to index
              %46 = arith.addi %40, %43 : index
              %47 = pto.addptr %18, %46 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.vdup %result_5, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmul %result, %48, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %47[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %45 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %33 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
        pto.vecscope {
          %37 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %37[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %40 = arith.index_cast %arg6 : i16 to index
            %41 = arith.muli %40, %c128 : index
            %result_4 = pto.vlds %18[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %41, %c64 : index
            %result_5 = pto.vlds %18[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_4, %result, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vmul %result_5, %result_3, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %18[%41], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %44, %18[%42], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %34 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        pto.vecscope {
          %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %39 = arith.index_cast %arg6 : i16 to index
            %40 = arith.muli %39, %c128 : index
            %result = pto.vlds %18[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %40, %c64 : index
            %result_3 = pto.vlds %18[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = pto.vcvt %result, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %43 = pto.vcvt %result_3, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %42, %3[%40], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %43, %3[%41], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %35 = pto.addptr %arg1, %25 : <bf16, gm> -> <bf16, gm>
        %36 = pto.addptr %35, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %4, %36, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c8192_i64, %c256_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

