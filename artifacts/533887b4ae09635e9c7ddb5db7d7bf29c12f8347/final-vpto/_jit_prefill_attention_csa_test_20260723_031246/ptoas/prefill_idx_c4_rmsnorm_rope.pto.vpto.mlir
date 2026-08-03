module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c1_i32 = arith.constant 1 : i32
      %c2048 = arith.constant 2048 : index
      %c16_i32 = arith.constant 16 : i32
      %c64_i64 = arith.constant 64 : i64
      %c512_i64 = arith.constant 512 : i64
      %c1_i64 = arith.constant 1 : i64
      %c64_i32 = arith.constant 64 : i32
      %c16_i64 = arith.constant 16 : i64
      %cst = arith.constant 2.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 1.000000e+00 : f32
      %cst_2 = arith.constant 9.99999997E-7 : f32
      %cst_3 = arith.constant 7.812500e-03 : f32
      %c-3 = arith.constant -3 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c25152_i64 = arith.constant 25152 : i64
      %c29248_i64 = arith.constant 29248 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c12352_i64 = arith.constant 12352 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c20544_i64 = arith.constant 20544 : i64
      %c24640_i64 = arith.constant 24640 : i64
      %c24896_i64 = arith.constant 24896 : i64
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %cst_4 = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32_i32 = arith.constant 32 : i32
      %0 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c32 : index
          %49 = pto.addptr %0, %48 : <f32, ub> -> <f32, ub>
          pto.vsts %45, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %46 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c32 : index
          %49 = pto.addptr %46, %48 : <f32, ub> -> <f32, ub>
          pto.vsts %45, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = arith.index_cast %arg8 : i32 to index
      %2 = arith.muli %1, %c16 : index
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %45 = arith.addi %2, %arg10 : index
        %46 = pto.load_scalar %arg0[%45] : !pto.ptr<i32, gm> -> i32
        %47 = arith.index_cast %46 : i32 to index
        %48 = arith.cmpi sge, %47, %c0 : index
        scf.if %48 {
          %49 = pto.load_scalar %arg1[%45] : !pto.ptr<i32, gm> -> i32
          %50 = arith.index_cast %49 : i32 to index
          %51 = arith.addi %50, %c-3 : index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %arg2, %52 : <bf16, gm> -> <bf16, gm>
          %54 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %55 = pto.addptr %53, %c0 : <bf16, gm> -> <bf16, gm>
          %56 = pto.addptr %54, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %55, %56, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %57 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %58 = pto.addptr %57, %c0 : <f32, ub> -> <f32, ub>
          %59 = arith.index_cast %arg10 : index to i64
          %60 = arith.muli %59, %c128_i64 : i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %63 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %56[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %64 = pto.vcvt %result, %63 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %64, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %65 = arith.addi %60, %c25152_i64 : i64
            %66 = pto.castptr %65 : i64 -> !pto.ptr<f32, ub>
            %67 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result_5 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %69 = pto.pand %67, %mask, %68 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %66[%c0], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %61 = pto.addptr %arg3, %52 : <bf16, gm> -> <bf16, gm>
          %62 = pto.addptr %61, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %62, %56, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %56[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %63 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %64 = pto.vcvt %result, %63 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %64, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %65 = arith.addi %60, %c29248_i64 : i64
            %66 = pto.castptr %65 : i64 -> !pto.ptr<f32, ub>
            %result_5 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %68 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %69 = pto.pand %67, %mask, %68 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %66[%c0], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %45, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = arith.muli %1, %c2048 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg10 = %c0 to %c128 step %c64 {
        %45 = arith.addi %5, %arg10 : index
        %46 = pto.addptr %arg4, %45 : <f32, gm> -> <f32, gm>
        %47 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %47, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %48 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %49 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %59 = arith.index_cast %arg11 : i16 to index
            %60 = arith.muli %59, %c64 : index
            %result_8 = pto.vlds %6[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vmul %result_8, %result_8, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %61, %49[%60], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %52 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %53 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %54 = pto.vdup %cst_4, %51 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %55 = pto.pand %53, %mask, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %59 = arith.index_cast %arg11 : i16 to index
            %60 = arith.muli %59, %c64 : index
            %result_8 = pto.vlds %49[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vcadd %result_8, %50 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %54, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %52[%59], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %56 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = pto.vadd %result, %result_5, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %58 = pto.pand %56, %mask_6, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %57, %3[%c0], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %45 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %47 = pto.vdup %cst_3, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %48 = pto.vmul %result, %47, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.pand %45, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %48, %6[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %50 = pto.vdup %cst_2, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.vadd %result_5, %50, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %51, %6[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %52 = pto.vsqrt %result_6, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %52, %6[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %53 = pto.vdup %cst_1, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %54 = pto.vdiv %53, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %54, %9[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.addptr %arg4, %5 : <f32, gm> -> <f32, gm>
      %11 = pto.addptr %10, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %11, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %12 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.addptr %arg5, %c0 : <bf16, gm> -> <bf16, gm>
      %14 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %13, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %14[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %46 = pto.vcvt %result, %45 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %46, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %6, %48 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.addptr %9, %47 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_5, %51, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %17 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_5 = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_5, %result, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %6[%48], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %18 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %19 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result, %45 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %49, %19[%48], %46 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %20 = pto.addptr %arg6, %5 : <bf16, gm> -> <bf16, gm>
      %21 = pto.addptr %19, %c0 : <bf16, ub> -> <bf16, ub>
      %22 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %21, %22, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %23 = arith.addi %5, %c64 : index
      %24 = pto.addptr %arg4, %23 : <f32, gm> -> <f32, gm>
      %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %26 = pto.addptr %arg5, %c64 : <bf16, gm> -> <bf16, gm>
      %27 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %27, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %result = pto.vlds %14[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %45 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %46 = pto.vcvt %result, %45 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %46, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg10 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %52 = pto.addptr %6, %51 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %9, %50 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vmul %result_6, %54, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result_5 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg10 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_6 = pto.vlds %6[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_6, %result_5, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %6[%51], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %49 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg10 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %52 = pto.addptr %15, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %49, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %28 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %45 = arith.index_cast %arg10 : index to i32
        pto.store %45, %28[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %45 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %46 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %46, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_5 = pto.vlds %15[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_5, %result, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %15[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %30 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst_0, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg10 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %15[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %3[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg10 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %51 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %53 = pto.addptr %28, %50 : <i32, ub> -> <i32, ub>
          pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg10 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %51 = pto.addptr %28, %50 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %52 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %48 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg10 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %51 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %53 = pto.addptr %48, %50 : <i32, ub> -> <i32, ub>
          pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %31 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg10 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result = pto.vlds %3[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %3[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %32 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %15[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %3[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vsub %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %3[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst_1, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg10 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result = pto.vlds %15[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vadd %result, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %15[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %34 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %35 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg10 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result = pto.vlds %3[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %35[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg10 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result = pto.vlds %15[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %35[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vsub %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %15[%49], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %47 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg10 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %50 = pto.addptr %15, %49 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %52 = pto.addptr %47, %49 : <i32, ub> -> <i32, ub>
          pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %37 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %53 = arith.index_cast %arg10 : i16 to index
          %54 = arith.muli %53, %c64 : index
          %result = pto.vlds %3[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vmul %result, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %3[%54], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %48 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %53 = arith.index_cast %arg10 : i16 to index
          %54 = arith.muli %53, %c64 : index
          %55 = pto.addptr %3, %54 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %56 = pto.vsub %result, %48, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %49 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %50 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %53 = arith.index_cast %arg10 : i16 to index
          %54 = arith.index_cast %53 : index to i64
          %55 = arith.muli %54, %c128_i64 : i64
          %56 = arith.addi %55, %c25152_i64 : i64
          %57 = arith.muli %54, %c256_i64 : i64
          %58 = arith.addi %57, %c16448_i64 : i64
          %59 = pto.castptr %56 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.castptr %58 : i64 -> !pto.ptr<i32, ub>
          %61 = pto.addptr %60, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %61[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %62 = pto.vgather2 %59, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %62, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %63 = arith.addi %57, %c20544_i64 : i64
          %64 = pto.castptr %63 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %64[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %53 = arith.index_cast %arg10 : i16 to index
          %54 = arith.index_cast %53 : index to i64
          %55 = arith.muli %54, %c128_i64 : i64
          %56 = arith.addi %55, %c29248_i64 : i64
          %57 = arith.muli %54, %c256_i64 : i64
          %58 = arith.addi %57, %c16448_i64 : i64
          %59 = pto.castptr %56 : i64 -> !pto.ptr<f32, ub>
          %60 = pto.castptr %58 : i64 -> !pto.ptr<i32, ub>
          %61 = pto.addptr %60, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %61[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %62 = pto.vgather2 %59, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %62, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %63 = arith.addi %57, %c25152_i64 : i64
          %64 = pto.castptr %63 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %64[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %51 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %52 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %53 = arith.index_cast %arg10 : i16 to index
          %54 = arith.index_cast %53 : index to i64
          %55 = arith.muli %54, %c256_i64 : i64
          %56 = arith.addi %55, %c4096_i64 : i64
          %57 = pto.castptr %56 : i64 -> !pto.ptr<f32, ub>
          %58 = pto.castptr %55 : i64 -> !pto.ptr<i32, ub>
          %59 = pto.addptr %58, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %59[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %60 = pto.vgather2 %57, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %60, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %61 = arith.addi %55, %c16448_i64 : i64
          %62 = pto.castptr %61 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %62[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %38 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %35[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %6[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %9[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %3[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %15[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %40 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %15[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %0[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %15[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %41 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vadd %result, %result_5, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %6[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %42 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg10 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result = pto.vlds %6[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result, %45 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %49, %19[%48], %46 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %43 = pto.addptr %arg6, %23 : <bf16, gm> -> <bf16, gm>
      %44 = pto.addptr %43, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %21, %44, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

