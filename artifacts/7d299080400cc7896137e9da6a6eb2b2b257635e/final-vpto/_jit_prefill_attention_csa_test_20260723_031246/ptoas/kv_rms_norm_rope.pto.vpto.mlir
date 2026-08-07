module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_rms_norm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c6208_i64 = arith.constant 6208 : i64
      %c14912_i64 = arith.constant 14912 : i64
      %c2080_i64 = arith.constant 2080 : i64
      %c12864_i64 = arith.constant 12864 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32_i64 = arith.constant 32 : i64
      %c6176_i64 = arith.constant 6176 : i64
      %c10560_i64 = arith.constant 10560 : i64
      %c8256_i64 = arith.constant 8256 : i64
      %c10304_i64 = arith.constant 10304 : i64
      %c12608_i64 = arith.constant 12608 : i64
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %cst_0 = arith.constant 0.001953125 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c6 = arith.constant 6 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c384 = arith.constant 384 : index
      %c1_i64 = arith.constant 1 : i64
      %c2_i64 = arith.constant 2 : i64
      %c128_i64 = arith.constant 128 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c448 = arith.constant 448 : index
      %c64_i32 = arith.constant 64 : i32
      %c2048_i64 = arith.constant 2048 : i64
      %c8_i32 = arith.constant 8 : i32
      %c4096 = arith.constant 4096 : index
      %c512 = arith.constant 512 : index
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = pto.castptr %c6208_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %33, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c4096 : index
      %3 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c2 {
        %33 = arith.muli %arg8, %c64 : index
        %34 = arith.addi %33, %c64 : index
        %35 = arith.addi %2, %33 : index
        %36 = pto.addptr %arg0, %35 : <f32, gm> -> <f32, gm>
        %37 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %37, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %38 = arith.addi %2, %34 : index
        %39 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
        %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %40, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %41 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %43 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %46 = pto.vdup %cst, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.pand %44, %mask, %45 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %result_10 = pto.vlds %3[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_10, %result_10, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %41[%55], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %57 = pto.vcadd %56, %42 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %46, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %58, %43[%54], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %48 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vadd %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pand %48, %mask_6, %45 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %49, %3[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
          %52 = pto.castptr %c6176_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %result_10 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_10, %result_10, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %51[%55], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %57 = pto.vcadd %56, %42 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %46, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %58, %52[%54], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_8 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result_8, %result_9, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %1[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %33 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst_0, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.pand %33, %mask, %34 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %36, %3[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %7 = pto.alloc_tile addr = %c14912_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %8 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_1, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vadd %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.pand %36, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %35, %3[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %38 = pto.vsqrt %result_5, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vdup %cst_2, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vdiv %39, %38, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %40, %8[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.castptr %c6208_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg8 = %c0 to %c6 step %c2 {
        %33 = arith.muli %arg8, %c64 : index
        %34 = arith.addi %33, %c64 : index
        %35 = arith.addi %2, %33 : index
        %36 = pto.addptr %arg0, %35 : <f32, gm> -> <f32, gm>
        %37 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %37, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %38 = pto.addptr %arg2, %33 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %38, %9, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %39 = arith.addi %2, %34 : index
        %40 = pto.addptr %arg0, %39 : <f32, gm> -> <f32, gm>
        %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %41, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %42 = pto.addptr %arg2, %34 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %42, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %48 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %48[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %49 = pto.vcvt %result, %47 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %50 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %51 = pto.addptr %50, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %49, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %56 = pto.addptr %3, %55 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.addptr %8, %54 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_6, %58, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %56[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %52 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result_5 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %result_6 = pto.vlds %3[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_6, %result_5, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %3[%55], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %43 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.vecscope {
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %49 = arith.index_cast %arg9 : i16 to index
            %50 = arith.muli %49, %c64 : index
            %result = pto.vlds %3[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = pto.vcvt %result, %47 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %51, %11[%50], %48 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %44 = pto.addptr %arg1, %35 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %11, %44, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %47 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %47[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %48 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %49 = pto.vcvt %result, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %50 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
          %51 = pto.addptr %50, %c0 : <f32, ub> -> <f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %49, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %56 = pto.addptr %5, %55 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.addptr %8, %54 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_6, %58, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %56[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %result_5 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c64 : index
            %result_6 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_6, %result_5, %52 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %5[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %45 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.vecscope {
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %49 = arith.index_cast %arg9 : i16 to index
            %50 = arith.muli %49, %c64 : index
            %result = pto.vlds %5[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = pto.vcvt %result, %47 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %51, %12[%50], %48 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %46 = pto.addptr %arg1, %39 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %12, %46, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      %13 = arith.addi %2, %c384 : index
      %14 = pto.addptr %arg0, %13 : <f32, gm> -> <f32, gm>
      %15 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %15, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %16 = pto.addptr %arg2, %c384 : <bf16, gm> -> <bf16, gm>
      %17 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %16, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %34 = pto.addptr %17, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %35 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %35, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %3, %39 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.addptr %8, %38 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %42, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg8 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %3[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %result_5, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %3[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %18 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg8 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %3[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vcvt %result, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %37, %11[%36], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %19 = pto.addptr %arg1, %13 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %11, %19, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %20 = pto.addptr %arg2, %c448 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %20, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %33 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %33[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %34 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %35 = pto.vcvt %result, %34 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %35, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %21 = arith.addi %2, %c448 : index
      %22 = pto.addptr %arg0, %21 : <f32, gm> -> <f32, gm>
      %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %23, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg8 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %38 = pto.addptr %3, %37 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.addptr %8, %36 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_5, %40, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg8 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result_5 = pto.vlds %3[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_5, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %3[%37], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %35 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg8 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %38 = pto.addptr %5, %37 : <f32, ub> -> <f32, ub>
          pto.vsts %35, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %24 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %33 = arith.index_cast %arg8 : index to i32
        pto.store %33, %24[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %25 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %33 = pto.addptr %24, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %33[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.vdup %cst_3, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %result_6 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_6, %result_5, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %5[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = pto.vmul %45, %38, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %25[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %45 = pto.addptr %25, %44 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %47 = pto.addptr %24, %44 : <i32, ub> -> <i32, ub>
          pto.vsts %46, %47[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %45 = pto.addptr %24, %44 : <i32, ub> -> <i32, ub>
          %result_6 = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.addptr %25, %44 : <f32, ub> -> <f32, ub>
          pto.vsts %46, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %39 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %45 = pto.addptr %25, %44 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %47 = pto.addptr %39, %44 : <i32, ub> -> <i32, ub>
          pto.vsts %46, %47[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %40 = pto.vdup %cst_4, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vdup %cst_2, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %result_6 = pto.vlds %25[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_6, %40, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vsub %result_7, %45, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %25[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = pto.vadd %result_7, %41, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmul %46, %40, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %1[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = pto.vsub %47, %48, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %5[%44], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %42 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg8 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %45 = pto.addptr %5, %44 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %47 = pto.addptr %42, %44 : <i32, ub> -> <i32, ub>
          pto.vsts %46, %47[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %26 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_4, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg8 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %25[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %25[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %36 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg8 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %25, %38 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vsub %result, %36, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %27 = arith.muli %0, %c512 : index
      %28 = pto.addptr %arg3, %27 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %28, %10, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg8 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %10, %38 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %39[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %40 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %41 = pto.addptr %1, %38 : <f32, ub> -> <f32, ub>
          pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %34 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %35 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg8 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c256_i64 : i64
          %40 = arith.addi %39, %c6208_i64 : i64
          %41 = arith.addi %39, %c32_i64 : i64
          %42 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %43 = pto.castptr %41 : i64 -> !pto.ptr<i32, ub>
          %44 = pto.addptr %43, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %44[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %45 = pto.vgather2 %42, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = arith.addi %39, %c8256_i64 : i64
          %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %47[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %29 = pto.addptr %arg4, %27 : <bf16, gm> -> <bf16, gm>
      %30 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg8 : i16 to index
          %43 = arith.muli %42, %c64 : index
          %44 = pto.addptr %30, %43 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %44[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %45 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %46 = pto.addptr %1, %43 : <f32, ub> -> <f32, ub>
          pto.vsts %45, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %34 = pto.castptr %c12608_i64 : i64 -> !pto.ptr<f32, ub>
        %35 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg8 : i16 to index
          %43 = arith.index_cast %42 : index to i64
          %44 = arith.muli %43, %c256_i64 : i64
          %45 = arith.addi %44, %c6208_i64 : i64
          %46 = arith.addi %44, %c32_i64 : i64
          %47 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %48 = pto.castptr %46 : i64 -> !pto.ptr<i32, ub>
          %49 = pto.addptr %48, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %49[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %50 = pto.vgather2 %47, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = arith.addi %44, %c10560_i64 : i64
          %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %52[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %37 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %38 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg8 : i16 to index
          %43 = arith.index_cast %42 : index to i64
          %44 = arith.muli %43, %c256_i64 : i64
          %45 = arith.addi %44, %c14912_i64 : i64
          %46 = arith.addi %44, %c2080_i64 : i64
          %47 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %48 = pto.castptr %46 : i64 -> !pto.ptr<i32, ub>
          %49 = pto.addptr %48, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %49[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %50 = pto.vgather2 %47, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = arith.addi %44, %c32_i64 : i64
          %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %52[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %39 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %40 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
        %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg8 : i16 to index
          %43 = arith.muli %42, %c64 : index
          %result = pto.vlds %3[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %39[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result, %result_5, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %40[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %25[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_6, %result_7, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %8[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %45, %result_8, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %5[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = pto.vadd %44, %46, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %3[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %31 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg8 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %3[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vcvt %result, %33 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %37, %11[%36], %34 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %32 = pto.addptr %arg1, %21 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %11, %32, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
