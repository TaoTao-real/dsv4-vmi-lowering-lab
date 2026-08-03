module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c1_i32 = arith.constant 1 : i32
      %c8192 = arith.constant 8192 : index
      %c16_i32 = arith.constant 16 : i32
      %c64_i64 = arith.constant 64 : i64
      %c1_i64 = arith.constant 1 : i64
      %c64_i32 = arith.constant 64 : i32
      %c2048_i64 = arith.constant 2048 : i64
      %c16_i64 = arith.constant 16 : i64
      %cst = arith.constant 2.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c448 = arith.constant 448 : index
      %cst_2 = arith.constant 9.99999997E-7 : f32
      %cst_3 = arith.constant 0.001953125 : f32
      %c-3 = arith.constant -3 : index
      %c512 = arith.constant 512 : index
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
        %34 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c32 : index
          %38 = pto.addptr %0, %37 : <f32, ub> -> <f32, ub>
          pto.vsts %34, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %35 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c32 : index
          %38 = pto.addptr %35, %37 : <f32, ub> -> <f32, ub>
          pto.vsts %34, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = arith.index_cast %arg8 : i32 to index
      %2 = arith.muli %1, %c16 : index
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %34 = arith.addi %2, %arg10 : index
        %35 = pto.load_scalar %arg0[%34] : !pto.ptr<i32, gm> -> i32
        %36 = arith.index_cast %35 : i32 to index
        %37 = arith.cmpi sge, %36, %c0 : index
        scf.if %37 {
          %38 = pto.load_scalar %arg1[%34] : !pto.ptr<i32, gm> -> i32
          %39 = arith.index_cast %38 : i32 to index
          %40 = arith.addi %39, %c-3 : index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %arg2, %41 : <bf16, gm> -> <bf16, gm>
          %43 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %44 = pto.addptr %42, %c0 : <bf16, gm> -> <bf16, gm>
          %45 = pto.addptr %43, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %44, %45, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %46 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.addptr %46, %c0 : <f32, ub> -> <f32, ub>
          %48 = arith.index_cast %arg10 : index to i64
          %49 = arith.muli %48, %c128_i64 : i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %52 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %45[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %53 = pto.vcvt %result, %52 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %53, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = arith.addi %49, %c25152_i64 : i64
            %55 = pto.castptr %54 : i64 -> !pto.ptr<f32, ub>
            %56 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pand %56, %mask, %57 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %55[%c0], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %50 = pto.addptr %arg3, %41 : <bf16, gm> -> <bf16, gm>
          %51 = pto.addptr %50, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %51, %45, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %45[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %52 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %53 = pto.vcvt %result, %52 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %53, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = arith.addi %49, %c29248_i64 : i64
            %55 = pto.castptr %54 : i64 -> !pto.ptr<f32, ub>
            %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pand %56, %mask, %57 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %55[%c0], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %34, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = arith.muli %1, %c8192 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg10 = %c0 to %c512 step %c64 {
        %34 = arith.addi %5, %arg10 : index
        %35 = pto.addptr %arg4, %34 : <f32, gm> -> <f32, gm>
        %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %36, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %37 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %38 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %48 = arith.index_cast %arg11 : i16 to index
            %49 = arith.muli %48, %c64 : index
            %result_8 = pto.vlds %6[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_8, %result_8, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %50, %38[%49], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %41 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %43 = pto.vdup %cst_4, %40 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %44 = pto.pand %42, %mask, %40 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %48 = arith.index_cast %arg11 : i16 to index
            %49 = arith.muli %48, %c64 : index
            %result_8 = pto.vlds %38[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = pto.vcadd %result_8, %39 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %50, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %51, %41[%48], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %45 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vadd %result, %result_5, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.pand %45, %mask_6, %40 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %46, %3[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %34 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %36 = pto.vdup %cst_3, %35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vmul %result, %36, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %38 = pto.pand %34, %mask, %35 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %37, %6[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %39 = pto.vdup %cst_2, %35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vadd %result_5, %39, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %40, %6[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %41 = pto.vsqrt %result_6, %35 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %41, %6[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %42 = pto.vdup %cst_1, %35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %43 = pto.vdiv %42, %result_7, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %43, %9[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg10 = %c0 to %c448 step %c64 {
        %34 = arith.addi %5, %arg10 : index
        %35 = pto.addptr %arg4, %34 : <f32, gm> -> <f32, gm>
        %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %36, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %37 = pto.addptr %arg6, %arg10 : <bf16, gm> -> <bf16, gm>
        %38 = pto.addptr %37, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %38, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %42 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %43 = pto.vcvt %result, %42 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %44 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %45 = arith.index_cast %arg11 : i16 to index
            %46 = arith.muli %45, %c64 : index
            %47 = pto.addptr %6, %46 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = pto.addptr %9, %45 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_5, %49, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %50, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %39 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %44 = arith.index_cast %arg11 : i16 to index
            %45 = arith.muli %44, %c64 : index
            %result_5 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_5, %result, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %6[%45], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %40 = pto.addptr %arg5, %34 : <f32, gm> -> <f32, gm>
        %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %7, %41, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %13 = arith.addi %5, %c448 : index
      %14 = pto.addptr %arg4, %13 : <f32, gm> -> <f32, gm>
      %15 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %15, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %16 = pto.addptr %arg6, %c448 : <bf16, gm> -> <bf16, gm>
      %17 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %17, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %35 = pto.vcvt %result, %34 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %36 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %6, %41 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.addptr %9, %40 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_6, %44, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result_6 = pto.vlds %6[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_6, %result_5, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %6[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %39 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %12, %41 : <f32, ub> -> <f32, ub>
          pto.vsts %39, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %18 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %34 = arith.index_cast %arg10 : index to i32
        pto.store %34, %18[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %34 = pto.addptr %18, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %34[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %35, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %19 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result_5 = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_5, %result, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %12[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %20 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst_0, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result = pto.vlds %12[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %3[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %3, %39 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.addptr %18, %39 : <i32, ub> -> <i32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %18, %39 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %40[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %41 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.addptr %3, %39 : <f32, ub> -> <f32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %37 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %3, %39 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.addptr %37, %39 : <i32, ub> -> <i32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %21 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %3[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %3[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %22 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %3[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vsub %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %3[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst_1, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %12[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %12[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %24 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %25 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %3[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %25[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %12[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %25[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vsub %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %12[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %36 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %12, %38 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %41 = pto.addptr %36, %38 : <i32, ub> -> <i32, ub>
          pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %27 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg10 : i16 to index
          %43 = arith.muli %42, %c64 : index
          %result = pto.vlds %3[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %3[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %37 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg10 : i16 to index
          %43 = arith.muli %42, %c64 : index
          %44 = pto.addptr %3, %43 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vsub %result, %37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %38 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %39 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg10 : i16 to index
          %43 = arith.index_cast %42 : index to i64
          %44 = arith.muli %43, %c128_i64 : i64
          %45 = arith.addi %44, %c25152_i64 : i64
          %46 = arith.muli %43, %c256_i64 : i64
          %47 = arith.addi %46, %c16448_i64 : i64
          %48 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %49 = pto.castptr %47 : i64 -> !pto.ptr<i32, ub>
          %50 = pto.addptr %49, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %50[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %51 = pto.vgather2 %48, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %52 = arith.addi %46, %c20544_i64 : i64
          %53 = pto.castptr %52 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %53[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg10 : i16 to index
          %43 = arith.index_cast %42 : index to i64
          %44 = arith.muli %43, %c128_i64 : i64
          %45 = arith.addi %44, %c29248_i64 : i64
          %46 = arith.muli %43, %c256_i64 : i64
          %47 = arith.addi %46, %c16448_i64 : i64
          %48 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %49 = pto.castptr %47 : i64 -> !pto.ptr<i32, ub>
          %50 = pto.addptr %49, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %50[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %51 = pto.vgather2 %48, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %52 = arith.addi %46, %c25152_i64 : i64
          %53 = pto.castptr %52 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %53[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %40 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %42 = arith.index_cast %arg10 : i16 to index
          %43 = arith.index_cast %42 : index to i64
          %44 = arith.muli %43, %c256_i64 : i64
          %45 = arith.addi %44, %c4096_i64 : i64
          %46 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %44 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c16448_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %28 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %25[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %3[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %12[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %30 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %0[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %12[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %31 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %32 = pto.addptr %arg5, %13 : <f32, gm> -> <f32, gm>
      %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %33, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

