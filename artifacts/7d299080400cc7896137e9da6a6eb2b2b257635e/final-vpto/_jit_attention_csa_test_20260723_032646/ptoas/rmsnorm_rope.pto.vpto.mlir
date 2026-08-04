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
        %29 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c32 : index
          %32 = pto.addptr %0, %31 : <f32, ub> -> <f32, ub>
          pto.vsts %29, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c32 : index
          %32 = pto.addptr %1, %31 : <f32, ub> -> <f32, ub>
          pto.vsts %29, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %29 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.pand %29, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg5 : i16 to index
          %33 = arith.muli %32, %c32 : index
          %result = pto.vlds %2[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %0[%33], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %30 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %31 = pto.pand %30, %mask, %29 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c32 : index
          %result = pto.vlds %2[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %1[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %7[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %29 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %30, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %31 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %33 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.vdup %cst, %35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pand %34, %mask, %35 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %41 = arith.index_cast %arg6 : i16 to index
            %42 = arith.muli %41, %c64 : index
            %result_8 = pto.vlds %2[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result_8, %result_8, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %31[%42], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = pto.vcadd %43, %32 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vadd %44, %36, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %33[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %38 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result, %result_5, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %40 = pto.pand %38, %mask_6, %35 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %39, %6[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %30 = pto.vdup %cst_0, %29 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.vmul %result, %30, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %33 = pto.vdup %cst_1, %29 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.vadd %31, %33, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.pand %32, %mask, %29 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %34, %2[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %36 = pto.vsqrt %result_5, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %36, %2[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %37 = pto.vdup %cst_2, %29 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.vdiv %37, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %38, %8[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %9, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %10 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %arg3, %c0 : <bf16, gm> -> <bf16, gm>
      %12 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %11, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %12[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %30 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %30, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %2, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %8, %33 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_6, %37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result_6 = pto.vlds %2[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_6, %result_5, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %2[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %15 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %16 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg5 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %2[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vcvt %result, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %33, %16[%32], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %17 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
      %18 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %17, %18, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %19 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %20, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %21 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %22 = pto.addptr %21, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %22, %12, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %result = pto.vlds %12[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %30 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %30, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg5 : i16 to index
          %35 = arith.muli %34, %c64 : index
          %36 = pto.addptr %2, %35 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.addptr %8, %34 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_6, %38, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %result_5 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg5 : i16 to index
          %35 = arith.muli %34, %c64 : index
          %result_6 = pto.vlds %2[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_6, %result_5, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %2[%35], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %33 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg5 : i16 to index
          %35 = arith.muli %34, %c64 : index
          %36 = pto.addptr %13, %35 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %23 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %29 = arith.index_cast %arg5 : index to i32
        pto.store %29, %23[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %24 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %29 = pto.addptr %23, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %30, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.vdup %cst_3, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %13[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %result_5, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %13[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = pto.vmul %40, %33, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %6[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %6, %39 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.addptr %23, %39 : <i32, ub> -> <i32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %23, %39 : <i32, ub> -> <i32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %41 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.addptr %6, %39 : <f32, ub> -> <f32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %34 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %6, %39 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.addptr %34, %39 : <i32, ub> -> <i32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %35 = pto.vdup %cst_4, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vdup %cst_2, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %35, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %13[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vsub %result_7, %40, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %6[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %42 = pto.vadd %result_7, %36, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %41, %35, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %24[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vsub %42, %43, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %13[%39], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg5 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %13, %39 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %42 = pto.addptr %37, %39 : <i32, ub> -> <i32, ub>
          pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %25 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %30 = pto.vdup %cst_4, %29 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %6[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %30, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %6[%38], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %32 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %6, %38 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vsub %result, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %33 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c128_i64 : i64
          %40 = arith.addi %39, %c25152_i64 : i64
          %41 = arith.muli %38, %c256_i64 : i64
          %42 = arith.addi %41, %c16448_i64 : i64
          %43 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.castptr %42 : i64 -> !pto.ptr<i32, ub>
          %45 = pto.addptr %44, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vgather2 %43, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = arith.addi %41, %c20544_i64 : i64
          %48 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %48[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c128_i64 : i64
          %40 = arith.addi %39, %c29248_i64 : i64
          %41 = arith.muli %38, %c256_i64 : i64
          %42 = arith.addi %41, %c16448_i64 : i64
          %43 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.castptr %42 : i64 -> !pto.ptr<i32, ub>
          %45 = pto.addptr %44, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vgather2 %43, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = arith.addi %41, %c25152_i64 : i64
          %48 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %48[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %35 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %36 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c256_i64 : i64
          %40 = arith.addi %39, %c4096_i64 : i64
          %41 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.castptr %39 : i64 -> !pto.ptr<i32, ub>
          %43 = pto.addptr %42, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %43[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %44 = pto.vgather2 %41, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %45 = arith.addi %39, %c16448_i64 : i64
          %46 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %46[%c0], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg5 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result = pto.vlds %2[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %24[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result, %result_5, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %6[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %result_7, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %0[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %40, %result_8, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %13[%38], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %42 = pto.vadd %39, %41, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %2[%38], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %26 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg5 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %2[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vcvt %result, %29 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %33, %16[%32], %30 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %27 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %28 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %17, %28, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
