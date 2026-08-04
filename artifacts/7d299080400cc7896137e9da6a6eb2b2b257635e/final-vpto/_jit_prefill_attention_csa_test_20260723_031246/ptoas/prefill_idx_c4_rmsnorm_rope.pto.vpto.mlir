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
        %32 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg10 : i16 to index
          %35 = arith.muli %34, %c32 : index
          %36 = pto.addptr %0, %35 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %33 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg10 : i16 to index
          %35 = arith.muli %34, %c32 : index
          %36 = pto.addptr %33, %35 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = arith.index_cast %arg8 : i32 to index
      %2 = arith.muli %1, %c16 : index
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %32 = arith.addi %2, %arg10 : index
        %33 = pto.load_scalar %arg0[%32] : !pto.ptr<i32, gm> -> i32
        %34 = arith.index_cast %33 : i32 to index
        %35 = arith.cmpi sge, %34, %c0 : index
        scf.if %35 {
          %36 = pto.load_scalar %arg1[%32] : !pto.ptr<i32, gm> -> i32
          %37 = arith.index_cast %36 : i32 to index
          %38 = arith.addi %37, %c-3 : index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %arg2, %39 : <bf16, gm> -> <bf16, gm>
          %41 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %42 = pto.addptr %40, %c0 : <bf16, gm> -> <bf16, gm>
          %43 = pto.addptr %41, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %42, %43, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %44 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          %46 = arith.index_cast %arg10 : index to i64
          %47 = arith.muli %46, %c128_i64 : i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %51 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %51, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %52 = arith.addi %47, %c25152_i64 : i64
            %53 = pto.castptr %52 : i64 -> !pto.ptr<f32, ub>
            %54 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result_5 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pand %54, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %53[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %48 = pto.addptr %arg3, %39 : <bf16, gm> -> <bf16, gm>
          %49 = pto.addptr %48, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %49, %43, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %43[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %51 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %51, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %52 = arith.addi %47, %c29248_i64 : i64
            %53 = pto.castptr %52 : i64 -> !pto.ptr<f32, ub>
            %result_5 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pand %54, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %53[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = arith.muli %1, %c2048 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg10 = %c0 to %c128 step %c64 {
        %32 = arith.addi %5, %arg10 : index
        %33 = pto.addptr %arg4, %32 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %35 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %40 = pto.vdup %cst_4, %39 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %41 = pto.pand %38, %mask, %39 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %45 = arith.index_cast %arg11 : i16 to index
            %46 = arith.muli %45, %c64 : index
            %result_8 = pto.vlds %6[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_8, %result_8, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %35[%46], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %48 = pto.vcadd %47, %36 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %48, %40, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %49, %37[%45], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %42 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vadd %result, %result_5, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %44 = pto.pand %42, %mask_6, %39 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %43, %3[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.vdup %cst_3, %32 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.vmul %result, %33, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %36 = pto.vdup %cst_2, %32 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vadd %34, %36, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %38 = pto.pand %35, %mask, %32 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %37, %6[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %39 = pto.vsqrt %result_5, %32 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %39, %6[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %40 = pto.vdup %cst_1, %32 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vdiv %40, %result_6, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %41, %8[%c0], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.addptr %arg4, %5 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %10, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.addptr %arg5, %c0 : <bf16, gm> -> <bf16, gm>
      %13 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %33 = pto.vcvt %result, %32 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %33, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %38 = pto.addptr %6, %37 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.addptr %8, %36 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_6, %40, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result_6 = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_6, %result_5, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %17 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg10 : i16 to index
          %35 = arith.muli %34, %c64 : index
          %result = pto.vlds %6[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result, %32 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %36, %17[%35], %33 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %18 = pto.addptr %arg6, %5 : <bf16, gm> -> <bf16, gm>
      %19 = pto.addptr %17, %c0 : <bf16, ub> -> <bf16, ub>
      %20 = pto.addptr %18, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %21 = arith.addi %5, %c64 : index
      %22 = pto.addptr %arg4, %21 : <f32, gm> -> <f32, gm>
      %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %23, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %24 = pto.addptr %arg5, %c64 : <bf16, gm> -> <bf16, gm>
      %25 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %25, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %32 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %33 = pto.vcvt %result, %32 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %33, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %6, %38 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.addptr %8, %37 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_6, %41, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result_5 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result_6 = pto.vlds %6[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_6, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %6[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %36 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %14, %38 : <f32, ub> -> <f32, ub>
          pto.vsts %36, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %26 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %32 = arith.index_cast %arg10 : index to i32
        pto.store %32, %26[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %27 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %32 = pto.addptr %26, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %32[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %33, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %36 = pto.vdup %cst_0, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %14[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %14[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vmul %43, %36, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %3[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %43 = pto.addptr %3, %42 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %45 = pto.addptr %26, %42 : <i32, ub> -> <i32, ub>
          pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %43 = pto.addptr %26, %42 : <i32, ub> -> <i32, ub>
          %result_6 = pto.vlds %43[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %44 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.addptr %3, %42 : <f32, ub> -> <f32, ub>
          pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %37 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %43 = pto.addptr %3, %42 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %45 = pto.addptr %37, %42 : <i32, ub> -> <i32, ub>
          pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %38 = pto.vdup %cst, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vdup %cst_1, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_6 = pto.vlds %3[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %38, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %14[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vsub %result_7, %43, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %3[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = pto.vadd %result_7, %39, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmul %44, %38, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %27[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = pto.vsub %45, %46, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %14[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %40 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg10 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %43 = pto.addptr %14, %42 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %45 = pto.addptr %40, %42 : <i32, ub> -> <i32, ub>
          pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %28 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.vdup %cst, %32 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result = pto.vlds %3[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result, %33, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %3[%41], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %35 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %3, %41 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vsub %result, %35, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %36 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c128_i64 : i64
          %43 = arith.addi %42, %c25152_i64 : i64
          %44 = arith.muli %41, %c256_i64 : i64
          %45 = arith.addi %44, %c16448_i64 : i64
          %46 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c20544_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c128_i64 : i64
          %43 = arith.addi %42, %c29248_i64 : i64
          %44 = arith.muli %41, %c256_i64 : i64
          %45 = arith.addi %44, %c16448_i64 : i64
          %46 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c25152_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %38 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %39 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c256_i64 : i64
          %43 = arith.addi %42, %c4096_i64 : i64
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.castptr %42 : i64 -> !pto.ptr<i32, ub>
          %46 = pto.addptr %45, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %46[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %47 = pto.vgather2 %44, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %48 = arith.addi %42, %c16448_i64 : i64
          %49 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %49[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg10 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result = pto.vlds %6[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %27[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result, %result_5, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %3[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %result_7, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %0[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vmul %43, %result_8, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %14[%41], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = pto.vadd %42, %44, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %6[%41], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %29 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg10 : i16 to index
          %35 = arith.muli %34, %c64 : index
          %result = pto.vlds %6[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result, %32 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %36, %17[%35], %33 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %30 = pto.addptr %arg6, %21 : <bf16, gm> -> <bf16, gm>
      %31 = pto.addptr %30, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %31, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
