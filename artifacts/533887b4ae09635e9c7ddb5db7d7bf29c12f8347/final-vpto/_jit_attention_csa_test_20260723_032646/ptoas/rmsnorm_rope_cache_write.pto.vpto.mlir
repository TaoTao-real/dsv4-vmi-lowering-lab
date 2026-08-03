module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>, %arg8: !pto.ptr<i64, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4_i16 = arith.constant 4 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c27200_i64 = arith.constant 27200 : i64
      %c0_i64 = arith.constant 0 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c14400_i64 = arith.constant 14400 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c14336_i64 = arith.constant 14336 : i64
      %c18496_i64 = arith.constant 18496 : i64
      %c22592_i64 = arith.constant 22592 : i64
      %c26688_i64 = arith.constant 26688 : i64
      %c26944_i64 = arith.constant 26944 : i64
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c512 = arith.constant 512 : index
      %c2 = arith.constant 2 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 0.001953125 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c448 = arith.constant 448 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c3 = arith.constant 3 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c16_i64 = arith.constant 16 : i64
      %c64_i32 = arith.constant 64 : i32
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c1024 = arith.constant 1024 : index
      %c1_i32 = arith.constant 1 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %0 = pto.castptr %c27200_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg9 : i16 to index
          %35 = arith.muli %34, %c32 : index
          %36 = pto.addptr %0, %35 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg9 : i16 to index
          %35 = arith.muli %34, %c32 : index
          %36 = pto.addptr %1, %35 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %33 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.pand %33, %mask, %34 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c32 : index
          %result = pto.vlds %2[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %0[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %35 = pto.pand %34, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg9 : i16 to index
          %38 = arith.muli %37, %c32 : index
          %result = pto.vlds %2[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %1[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %36 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %36, %7[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      scf.for %arg9 = %c0 to %c512 step %c64 {
        %33 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %35 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %36 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %46 = arith.index_cast %arg10 : i16 to index
            %47 = arith.muli %46, %c64 : index
            %result_8 = pto.vlds %2[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_8, %result_8, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %48, %36[%47], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %39 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %41 = pto.vdup %cst, %38 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %42 = pto.pand %40, %mask, %38 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %46 = arith.index_cast %arg10 : i16 to index
            %47 = arith.muli %46, %c64 : index
            %result_8 = pto.vlds %36[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = pto.vcadd %result_8, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %48, %41, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %49, %39[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %43 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vadd %result, %result_5, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %45 = pto.pand %43, %mask_6, %38 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %44, %6[%c0], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %9 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %33 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %35 = pto.vdup %cst_0, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vmul %result, %35, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.pand %33, %mask, %34 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %36, %2[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %38 = pto.vdup %cst_1, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vadd %result_5, %38, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %39, %2[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %40 = pto.vsqrt %result_6, %34 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %40, %2[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %41 = pto.vdup %cst_2, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.vdiv %41, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %42, %9[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      %12 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c448 step %c64 {
        %33 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %35 = pto.addptr %arg4, %arg9 : <bf16, gm> -> <bf16, gm>
        %36 = pto.addptr %35, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %36, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %40 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %41 = pto.vcvt %result, %40 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %42 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg10 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %45 = pto.addptr %2, %44 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.addptr %9, %43 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_5, %47, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %48, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %37 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %42 = arith.index_cast %arg10 : i16 to index
            %43 = arith.muli %42, %c64 : index
            %result_5 = pto.vlds %2[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = pto.vmul %result_5, %result, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %44, %2[%43], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %38 = pto.addptr %arg3, %arg9 : <f32, gm> -> <f32, gm>
        %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %39, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %13 = pto.addptr %arg2, %c448 : <f32, gm> -> <f32, gm>
      %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %14, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %15 = pto.addptr %arg4, %c448 : <bf16, gm> -> <bf16, gm>
      %16 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %16, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %34 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %35 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg9 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %41 = pto.addptr %2, %40 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.addptr %9, %39 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result_6, %43, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg9 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result_6 = pto.vlds %2[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_6, %result_5, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %2[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %38 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg9 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %41 = pto.addptr %12, %40 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %17 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %33 = arith.index_cast %arg9 : index to i32
        pto.store %33, %17[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %33 = pto.addptr %17, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %33[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %34, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %18 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_5 = pto.vlds %12[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_5, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %12[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %19 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_3, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg9 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %12[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %6[%38], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg9 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %6, %38 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %41 = pto.addptr %17, %38 : <i32, ub> -> <i32, ub>
          pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg9 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %17, %38 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.addptr %6, %38 : <f32, ub> -> <f32, ub>
          pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %36 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg9 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %6, %38 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %41 = pto.addptr %36, %38 : <i32, ub> -> <i32, ub>
          pto.vsts %40, %41[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %20 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_4, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %21 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %12[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vsub %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %6[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %22 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_2, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %12[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %23 = pto.alloc_tile addr = %c22592_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %24 = pto.castptr %c22592_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_4, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %24[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %25 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %24[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vsub %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %12[%37], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg9 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %38 = pto.addptr %12, %37 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %40 = pto.addptr %35, %37 : <i32, ub> -> <i32, ub>
          pto.vsts %39, %40[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %26 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_4, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg9 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %6[%42], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %36 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg9 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %43 = pto.addptr %6, %42 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.vsub %result, %36, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %37 = pto.castptr %c26944_i64 : i64 -> !pto.ptr<f32, ub>
        %38 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg9 : i16 to index
          %42 = arith.index_cast %41 : index to i64
          %43 = arith.muli %42, %c128_i64 : i64
          %44 = arith.addi %43, %c27200_i64 : i64
          %45 = arith.muli %42, %c256_i64 : i64
          %46 = arith.addi %45, %c18496_i64 : i64
          %47 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
          %48 = pto.castptr %46 : i64 -> !pto.ptr<i32, ub>
          %49 = pto.addptr %48, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %49[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %50 = pto.vgather2 %47, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = arith.addi %45, %c22592_i64 : i64
          %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %52[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg9 : i16 to index
          %42 = arith.index_cast %41 : index to i64
          %43 = arith.muli %42, %c128_i64 : i64
          %44 = arith.muli %42, %c256_i64 : i64
          %45 = arith.addi %44, %c18496_i64 : i64
          %46 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c27200_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %39 = pto.castptr %c26688_i64 : i64 -> !pto.ptr<f32, ub>
        %40 = pto.addptr %39, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg9 : i16 to index
          %42 = arith.index_cast %41 : index to i64
          %43 = arith.muli %42, %c256_i64 : i64
          %44 = arith.addi %43, %c6144_i64 : i64
          %45 = arith.addi %43, %c2048_i64 : i64
          %46 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %43, %c18496_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %27 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %2[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %24[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %2[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %28 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %9[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %12[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %29 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %12[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %0[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %12[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %30 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg9 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %2[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %12[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vadd %result, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %2[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %31 = pto.addptr %arg3, %c448 : <f32, gm> -> <f32, gm>
      %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %4, %32, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %33 = arith.muli %arg9, %c2 : index
        %34 = pto.load_scalar %arg7[%33] : !pto.ptr<i32, gm> -> i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.remsi %35, %c4 : index
        %37 = arith.cmpi sge, %36, %c2 : index
        scf.if %37 {
          %38 = arith.subi %c3, %36 : index
          %39 = arith.muli %arg9, %c512 : index
          %40 = pto.addptr %arg3, %39 : <f32, gm> -> <f32, gm>
          %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %41, %4, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %42 = arith.addi %33, %38 : index
          %43 = pto.load_scalar %arg8[%42] : !pto.ptr<i64, gm> -> i64
          %44 = arith.index_cast %43 : i64 to index
          %45 = arith.cmpi sge, %44, %c0 : index
          scf.if %45 {
            %46 = arith.muli %arg9, %c1024 : index
            %47 = pto.addptr %arg6, %46 : <f32, gm> -> <f32, gm>
            %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %4, %48, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %49 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
            %50 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
            pto.vecscope {
              %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %2[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %2[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %2[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %2[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %2[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %2[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %2[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %56 = pto.vcvt %result, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %57 = pto.vcvt %result_5, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %58 = pto.vcvt %result_6, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %59 = pto.vcvt %result_7, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %60 = pto.vcvt %result_8, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %61 = pto.vcvt %result_9, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %62 = pto.vcvt %result_10, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %63 = pto.vcvt %result_11, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %64 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %56, %50[%c0], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %57, %50[%c64], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %58, %50[%c128], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %59, %50[%c192], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %60, %50[%c256], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %61, %50[%c320], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %62, %50[%c384], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %63, %50[%c448], %64 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
            %51 = arith.muli %44, %c512 : index
            %52 = pto.addptr %arg5, %51 : <bf16, gm> -> <bf16, gm>
            %53 = pto.addptr %50, %c0 : <bf16, ub> -> <bf16, ub>
            %54 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
            pto.copy_ubuf_to_gm %53, %54, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}

