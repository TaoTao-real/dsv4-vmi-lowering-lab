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
        %48 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %2 = arith.muli %0, %c4096 : index
      %3 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c2 {
        %48 = arith.muli %arg8, %c64 : index
        %49 = arith.addi %48, %c64 : index
        %50 = arith.addi %2, %48 : index
        %51 = pto.addptr %arg0, %50 : <f32, gm> -> <f32, gm>
        %52 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %52, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %53 = arith.addi %2, %49 : index
        %54 = pto.addptr %arg0, %53 : <f32, gm> -> <f32, gm>
        %55 = pto.addptr %54, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %55, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %56 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %59 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %65 = arith.index_cast %arg9 : i16 to index
            %66 = arith.muli %65, %c64 : index
            %result = pto.vlds %3[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result, %result, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %59[%66], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %62 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %63 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %64 = pto.pand %62, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %65 = arith.index_cast %arg9 : i16 to index
            %66 = arith.muli %65, %c64 : index
            %result = pto.vlds %59[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vcadd %result, %60 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %67, %63, %62 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %68, %7[%65], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %57 = pto.alloc_tile addr = %c14912_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %59 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.vadd %result, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %62 = pto.pand %59, %mask, %60 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %61, %3[%c0], %62 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %58 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %59 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %61 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %69 = arith.index_cast %arg9 : i16 to index
            %70 = arith.muli %69, %c64 : index
            %result_8 = pto.vlds %5[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %71 = pto.vmul %result_8, %result_8, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %71, %59[%70], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %62 = pto.castptr %c6176_i64 : i64 -> !pto.ptr<f32, ub>
          %63 = pto.vdup %cst, %60 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %65 = pto.pand %64, %mask, %60 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %69 = arith.index_cast %arg9 : i16 to index
            %70 = arith.muli %69, %c64 : index
            %result_8 = pto.vlds %59[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %71 = pto.vcadd %result_8, %61 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %71, %63, %64 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %72, %62[%69], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = pto.vadd %result, %result_5, %60 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %68 = pto.pand %67, %mask_6, %60 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %66, %1[%c0], %68 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.alloc_tile addr = %c14912_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %50 = pto.vdup %cst_0, %49 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.vmul %result, %50, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %52 = pto.pand %48, %mask, %49 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %51, %3[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.alloc_tile addr = %c14912_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %10 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_1, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.vadd %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %52 = pto.pand %51, %mask, %48 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %50, %3[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %53 = pto.vsqrt %result_5, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %54 = pto.vdup %cst_2, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %55 = pto.vdiv %54, %53, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %55, %10[%c0], %52 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %11 = pto.castptr %c6208_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c14912_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg8 = %c0 to %c6 step %c2 {
        %48 = arith.muli %arg8, %c64 : index
        %49 = arith.addi %48, %c64 : index
        %50 = arith.addi %2, %48 : index
        %51 = pto.addptr %arg0, %50 : <f32, gm> -> <f32, gm>
        %52 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %52, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %53 = pto.addptr %arg2, %48 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %53, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %54 = arith.addi %2, %49 : index
        %55 = pto.addptr %arg0, %54 : <f32, gm> -> <f32, gm>
        %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %56, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %57 = pto.addptr %arg2, %49 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %57, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %64 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %65 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %65[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %66 = pto.vcvt %result, %64 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %67 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %66, %67[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %68 = arith.index_cast %arg9 : i16 to index
            %69 = arith.muli %68, %c64 : index
            %70 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %71 = pto.addptr %10, %68 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %72 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vmul %result_5, %72, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %73, %70[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %58 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %65 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %66 = arith.index_cast %arg9 : i16 to index
            %67 = arith.muli %66, %c64 : index
            %result_5 = pto.vlds %3[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_5, %result, %65 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %68, %3[%67], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %59 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.vecscope {
          %64 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %65 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %66 = arith.index_cast %arg9 : i16 to index
            %67 = arith.muli %66, %c64 : index
            %result = pto.vlds %3[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vcvt %result, %64 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %68, %14[%67], %65 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %60 = pto.addptr %arg1, %50 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %14, %60, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %64 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %64[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %65 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %66 = pto.vcvt %result, %65 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %67 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %66, %67[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %68 = arith.index_cast %arg9 : i16 to index
            %69 = arith.muli %68, %c64 : index
            %70 = pto.addptr %5, %69 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %71 = pto.addptr %10, %68 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %72 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vmul %result_5, %72, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %73, %70[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %61 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %64 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %65 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %66 = arith.index_cast %arg9 : i16 to index
            %67 = arith.muli %66, %c64 : index
            %result_5 = pto.vlds %5[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_5, %result, %64 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %68, %5[%67], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %62 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.vecscope {
          %64 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %65 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %66 = arith.index_cast %arg9 : i16 to index
            %67 = arith.muli %66, %c64 : index
            %result = pto.vlds %5[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vcvt %result, %64 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %68, %16[%67], %65 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %63 = pto.addptr %arg1, %54 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %16, %63, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      %17 = arith.addi %2, %c384 : index
      %18 = pto.addptr %arg0, %17 : <f32, gm> -> <f32, gm>
      %19 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %19, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %20 = pto.addptr %arg2, %c384 : <bf16, gm> -> <bf16, gm>
      %21 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %20, %21, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %48 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %49 = pto.addptr %21, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %49[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %50 = pto.vcvt %result, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %50, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %3, %52 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmul %result_5, %55, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %22 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_5 = pto.vlds %3[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_5, %result, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %3[%51], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %23 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %3[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result, %48 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %52, %14[%51], %49 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %24 = pto.addptr %arg1, %17 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %14, %24, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %25 = pto.addptr %arg2, %c448 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %25, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %48 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
        %result = pto.vlds %48[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %49 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %50 = pto.vcvt %result, %49 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %50, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %26 = arith.addi %2, %c448 : index
      %27 = pto.addptr %arg0, %26 : <f32, gm> -> <f32, gm>
      %28 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %28, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %3, %52 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmul %result_5, %55, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result_5 = pto.vlds %3[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result_5, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %3[%52], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %50 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %5, %52 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %29 = pto.castptr %c12864_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %48 = arith.index_cast %arg8 : index to i32
        pto.store %48, %29[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %48 = pto.addptr %29, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %30 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_5 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_5, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %5[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %31 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_3, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %result = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %13[%53], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %54 = pto.addptr %13, %53 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %56 = pto.addptr %29, %53 : <i32, ub> -> <i32, ub>
          pto.vsts %55, %56[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %54 = pto.addptr %29, %53 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %54[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %55 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.addptr %13, %53 : <f32, ub> -> <f32, ub>
          pto.vsts %55, %56[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %51 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %54 = pto.addptr %13, %53 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %56 = pto.addptr %51, %53 : <i32, ub> -> <i32, ub>
          pto.vsts %55, %56[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %32 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_4, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %13[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %13[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %33 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %13[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vsub %result, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %13[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %34 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_2, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %5[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %35 = pto.alloc_tile addr = %c6208_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_4, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %13[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %1[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %36 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %1[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vsub %result, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %5[%52], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %50 = pto.castptr %c2080_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %5, %52 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %55 = pto.addptr %50, %52 : <i32, ub> -> <i32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %37 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_4, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %result = pto.vlds %13[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %13[%53], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %51 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %54 = pto.addptr %13, %53 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vsub %result, %51, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %38 = arith.muli %0, %c512 : index
      %39 = pto.addptr %arg3, %38 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %39, %12, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %48 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.muli %52, %c64 : index
          %54 = pto.addptr %12, %53 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %54[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %55 = pto.vcvt %result, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %56 = pto.addptr %1, %53 : <f32, ub> -> <f32, ub>
          pto.vsts %55, %56[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %49 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %50 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %52 = arith.index_cast %arg8 : i16 to index
          %53 = arith.index_cast %52 : index to i64
          %54 = arith.muli %53, %c256_i64 : i64
          %55 = arith.addi %54, %c6208_i64 : i64
          %56 = arith.addi %54, %c32_i64 : i64
          %57 = pto.castptr %55 : i64 -> !pto.ptr<f32, ub>
          %58 = pto.castptr %56 : i64 -> !pto.ptr<i32, ub>
          %59 = pto.addptr %58, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %59[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %60 = pto.vgather2 %57, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %60, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %61 = arith.addi %54, %c8256_i64 : i64
          %62 = pto.castptr %61 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %62[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %40 = pto.addptr %arg4, %38 : <bf16, gm> -> <bf16, gm>
      %41 = pto.castptr %c10560_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %40, %41, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %48 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %54 = arith.index_cast %arg8 : i16 to index
          %55 = arith.muli %54, %c64 : index
          %56 = pto.addptr %41, %55 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %56[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %57 = pto.vcvt %result, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %58 = pto.addptr %1, %55 : <f32, ub> -> <f32, ub>
          pto.vsts %57, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %49 = pto.castptr %c12608_i64 : i64 -> !pto.ptr<f32, ub>
        %50 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %54 = arith.index_cast %arg8 : i16 to index
          %55 = arith.index_cast %54 : index to i64
          %56 = arith.muli %55, %c256_i64 : i64
          %57 = arith.addi %56, %c6208_i64 : i64
          %58 = arith.addi %56, %c32_i64 : i64
          %59 = pto.castptr %57 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.castptr %58 : i64 -> !pto.ptr<i32, ub>
          %61 = pto.addptr %60, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %61[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %62 = pto.vgather2 %59, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %62, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %63 = arith.addi %56, %c10560_i64 : i64
          %64 = pto.castptr %63 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %64[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %52 = pto.castptr %c10304_i64 : i64 -> !pto.ptr<f32, ub>
        %53 = pto.addptr %52, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %54 = arith.index_cast %arg8 : i16 to index
          %55 = arith.index_cast %54 : index to i64
          %56 = arith.muli %55, %c256_i64 : i64
          %57 = arith.addi %56, %c14912_i64 : i64
          %58 = arith.addi %56, %c2080_i64 : i64
          %59 = pto.castptr %57 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.castptr %58 : i64 -> !pto.ptr<i32, ub>
          %61 = pto.addptr %60, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %61[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %62 = pto.vgather2 %59, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %62, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %63 = arith.addi %56, %c32_i64 : i64
          %64 = pto.castptr %63 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %64[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %42 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
        %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg8 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %3[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %48[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %result_5, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %3[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %43 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %15[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %13[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %5[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %44 = pto.alloc_tile addr = %c2080_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %10[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %5[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %45 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %3[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vadd %result, %result_5, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %3[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %46 = pto.alloc_tile addr = %c14912_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %3[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result, %48 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %52, %14[%51], %49 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %47 = pto.addptr %arg1, %26 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %14, %47, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c1024_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

