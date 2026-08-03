module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4_i16 = arith.constant 4 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c25152_i64 = arith.constant 25152 : i64
      %c29248_i64 = arith.constant 29248 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c12352_i64 = arith.constant 12352 : i64
      %c0_i64 = arith.constant 0 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c20544_i64 = arith.constant 20544 : i64
      %c24640_i64 = arith.constant 24640 : i64
      %c24896_i64 = arith.constant 24896 : i64
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 7.812500e-03 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %42 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg5 : i16 to index
          %44 = arith.muli %43, %c32 : index
          %45 = pto.addptr %0, %44 : <f32, ub> -> <f32, ub>
          pto.vsts %42, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg5 : i16 to index
          %44 = arith.muli %43, %c32 : index
          %45 = pto.addptr %1, %44 : <f32, ub> -> <f32, ub>
          pto.vsts %42, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %42 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %44 = pto.pand %42, %mask, %43 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c32 : index
          %result = pto.vlds %2[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %0[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %44 = pto.pand %43, %mask, %42 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %46 = arith.index_cast %arg5 : i16 to index
          %47 = arith.muli %46, %c32 : index
          %result = pto.vlds %2[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %1[%47], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %45, %7[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %42 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %43, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %44 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %45 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %55 = arith.index_cast %arg6 : i16 to index
            %56 = arith.muli %55, %c64 : index
            %result_8 = pto.vlds %2[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_8, %result_8, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %57, %45[%56], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %48 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %49 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %50 = pto.vdup %cst, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %51 = pto.pand %49, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %55 = arith.index_cast %arg6 : i16 to index
            %56 = arith.muli %55, %c64 : index
            %result_8 = pto.vlds %45[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vcadd %result_8, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %50, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %58, %48[%55], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %52 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result, %result_5, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %54 = pto.pand %52, %mask_6, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %53, %6[%c0], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %42 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %44 = pto.vdup %cst_0, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.vmul %result, %44, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %46 = pto.pand %42, %mask, %43 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %45, %2[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %47 = pto.vdup %cst_1, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %48 = pto.vadd %result_5, %47, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %48, %2[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %49 = pto.vsqrt %result_6, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %49, %2[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %50 = pto.vdup %cst_2, %43 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.vdiv %50, %result_7, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %51, %9[%c0], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %10, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.addptr %arg3, %c0 : <bf16, gm> -> <bf16, gm>
      %13 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %42 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %43 = pto.vcvt %result, %42 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %43, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %46 = pto.addptr %2, %45 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.addptr %9, %44 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_5, %48, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result_5 = pto.vlds %2[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_5, %result, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %2[%45], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %17 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %18 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %2[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result, %42 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %46, %18[%45], %43 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %19 = pto.addptr %18, %c0 : <bf16, ub> -> <bf16, ub>
      %20 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %21 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %22 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %22, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %23 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %24 = pto.addptr %23, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %24, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %42 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %43 = pto.vcvt %result, %42 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %43, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg5 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %2, %48 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.addptr %9, %47 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_6, %51, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result_5 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %45 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg5 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_6 = pto.vlds %2[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_6, %result_5, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %2[%48], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %46 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg5 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %14, %48 : <f32, ub> -> <f32, ub>
          pto.vsts %46, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %25 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %42 = arith.index_cast %arg5 : index to i32
        pto.store %42, %25[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.vecscope {
        %42 = pto.addptr %25, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %42[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %43 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %43, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result_5 = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_5, %result, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %14[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %27 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.vdup %cst_3, %42 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %46 = arith.index_cast %arg5 : i16 to index
          %47 = arith.muli %46, %c64 : index
          %result = pto.vlds %14[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %6[%47], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %46 = arith.index_cast %arg5 : i16 to index
          %47 = arith.muli %46, %c64 : index
          %48 = pto.addptr %6, %47 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %50 = pto.addptr %25, %47 : <i32, ub> -> <i32, ub>
          pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %46 = arith.index_cast %arg5 : i16 to index
          %47 = arith.muli %46, %c64 : index
          %48 = pto.addptr %25, %47 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.addptr %6, %47 : <f32, ub> -> <f32, ub>
          pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %45 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %46 = arith.index_cast %arg5 : i16 to index
          %47 = arith.muli %46, %c64 : index
          %48 = pto.addptr %6, %47 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %50 = pto.addptr %45, %47 : <i32, ub> -> <i32, ub>
          pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %28 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.vdup %cst_4, %42 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result = pto.vlds %6[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %6[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %29 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vsub %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %6[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %30 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.vdup %cst_2, %42 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result = pto.vlds %14[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vadd %result, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %14[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %31 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %32 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.vdup %cst_4, %42 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result = pto.vlds %6[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %32[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result = pto.vlds %14[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %32[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vsub %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %14[%46], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %44 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg5 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %47 = pto.addptr %14, %46 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %49 = pto.addptr %44, %46 : <i32, ub> -> <i32, ub>
          pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %34 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.vdup %cst_4, %42 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg5 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %6[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result, %43, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %6[%51], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %45 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg5 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %52 = pto.addptr %6, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vsub %result, %45, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %46 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %47 = pto.addptr %46, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg5 : i16 to index
          %51 = arith.index_cast %50 : index to i64
          %52 = arith.muli %51, %c128_i64 : i64
          %53 = arith.addi %52, %c25152_i64 : i64
          %54 = arith.muli %51, %c256_i64 : i64
          %55 = arith.addi %54, %c16448_i64 : i64
          %56 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
          %57 = pto.castptr %55 : i64 -> !pto.ptr<i32, ub>
          %58 = pto.addptr %57, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %58[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %59 = pto.vgather2 %56, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %59, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %60 = arith.addi %54, %c20544_i64 : i64
          %61 = pto.castptr %60 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %61[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg5 : i16 to index
          %51 = arith.index_cast %50 : index to i64
          %52 = arith.muli %51, %c128_i64 : i64
          %53 = arith.addi %52, %c29248_i64 : i64
          %54 = arith.muli %51, %c256_i64 : i64
          %55 = arith.addi %54, %c16448_i64 : i64
          %56 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
          %57 = pto.castptr %55 : i64 -> !pto.ptr<i32, ub>
          %58 = pto.addptr %57, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %58[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %59 = pto.vgather2 %56, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %59, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %60 = arith.addi %54, %c25152_i64 : i64
          %61 = pto.castptr %60 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %61[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %48 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %49 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg5 : i16 to index
          %51 = arith.index_cast %50 : index to i64
          %52 = arith.muli %51, %c256_i64 : i64
          %53 = arith.addi %52, %c4096_i64 : i64
          %54 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
          %55 = pto.castptr %52 : i64 -> !pto.ptr<i32, ub>
          %56 = pto.addptr %55, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %56[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %57 = pto.vgather2 %54, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %57, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %58 = arith.addi %52, %c16448_i64 : i64
          %59 = pto.castptr %58 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %59[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %35 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %2[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %32[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %2[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %9[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %14[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %37 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %0[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %14[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %38 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %2[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vadd %result, %result_5, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %2[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %39 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg5 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %result = pto.vlds %2[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result, %42 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %46, %18[%45], %43 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %40 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %41 = pto.addptr %40, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %41, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

