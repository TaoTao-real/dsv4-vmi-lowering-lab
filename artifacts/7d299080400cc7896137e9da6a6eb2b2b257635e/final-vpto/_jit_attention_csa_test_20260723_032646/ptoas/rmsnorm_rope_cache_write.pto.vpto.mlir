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
        %22 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg9 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %0, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg9 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %1, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %22 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pand %22, %mask, %23 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg9 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %result = pto.vlds %2[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %0[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg9 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %result = pto.vlds %2[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %1[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %7[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      scf.for %arg9 = %c0 to %c512 step %c64 {
        %22 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %23, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %24 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.vdup %cst, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %27, %mask, %28 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg10 : i16 to index
            %35 = arith.muli %34, %c64 : index
            %result_8 = pto.vlds %2[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_8, %result_8, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %24[%35], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %37 = pto.vcadd %36, %25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vadd %37, %29, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %26[%34], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %31 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result, %result_5, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %33 = pto.pand %31, %mask_6, %28 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %32, %6[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst_0, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vmul %result, %23, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %26 = pto.vdup %cst_1, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.vadd %24, %26, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.pand %25, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %27, %2[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %29 = pto.vsqrt %result_5, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %29, %2[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.vdup %cst_2, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.vdiv %30, %result_6, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %31, %8[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
      %11 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c448 step %c64 {
        %22 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %23, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %24 = pto.addptr %arg4, %arg9 : <bf16, gm> -> <bf16, gm>
        %25 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %10[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %30 = pto.vcvt %result, %29 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %31 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg10 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %34 = pto.addptr %2, %33 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.addptr %8, %32 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_5, %36, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %26 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %31 = arith.index_cast %arg10 : i16 to index
            %32 = arith.muli %31, %c64 : index
            %result_5 = pto.vlds %2[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vmul %result_5, %result, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %33, %2[%32], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %27 = pto.addptr %arg3, %arg9 : <f32, gm> -> <f32, gm>
        %28 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %28, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %12 = pto.addptr %arg2, %c448 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %13, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = pto.addptr %arg4, %c448 : <bf16, gm> -> <bf16, gm>
      %15 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %15, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %10[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %23 = pto.vcvt %result, %22 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %24 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.addptr %8, %28 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_6, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %2[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_6, %result_5, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %2[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %27 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %11, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %27, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %16 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %22 = arith.index_cast %arg9 : index to i32
        pto.store %22, %16[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %17 = pto.castptr %c22592_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %22 = pto.addptr %16, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %22[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %23, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_3, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result_6 = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_6, %result_5, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %11[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = pto.vmul %33, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %6[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %6, %32 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %16, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %16, %32 : <i32, ub> -> <i32, ub>
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %34 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.addptr %6, %32 : <f32, ub> -> <f32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %6, %32 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %27, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %28 = pto.vdup %cst_4, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vdup %cst_2, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result_6 = pto.vlds %6[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_6, %28, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vsub %result_7, %33, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %6[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.vadd %result_7, %29, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %34, %28, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %17[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %37 = pto.vsub %35, %36, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %11[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %30 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg9 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %11, %32 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %30, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %18 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst_4, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result = pto.vlds %6[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result, %23, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %6[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %25 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %32 = pto.addptr %6, %31 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vsub %result, %25, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %26 = pto.castptr %c26944_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c128_i64 : i64
          %33 = arith.addi %32, %c27200_i64 : i64
          %34 = arith.muli %31, %c256_i64 : i64
          %35 = arith.addi %34, %c18496_i64 : i64
          %36 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %38 = pto.addptr %37, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %39 = pto.vgather2 %36, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = arith.addi %34, %c22592_i64 : i64
          %41 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %41[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c128_i64 : i64
          %33 = arith.muli %31, %c256_i64 : i64
          %34 = arith.addi %33, %c18496_i64 : i64
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %34 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %33, %c27200_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %40[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %28 = pto.castptr %c26688_i64 : i64 -> !pto.ptr<f32, ub>
        %29 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c256_i64 : i64
          %33 = arith.addi %32, %c6144_i64 : i64
          %34 = arith.addi %32, %c2048_i64 : i64
          %35 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %34 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %32, %c18496_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %40[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg9 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result = pto.vlds %2[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %17[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result, %result_5, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %2[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_6 = pto.vlds %8[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %6[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_6, %result_7, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %0[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %33, %result_8, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %11[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %19 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg9 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %result = pto.vlds %2[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %11[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vadd %result, %result_5, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %2[%25], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %20 = pto.addptr %arg3, %c448 : <f32, gm> -> <f32, gm>
      %21 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %4, %21, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %22 = arith.muli %arg9, %c2 : index
        %23 = pto.load_scalar %arg7[%22] : !pto.ptr<i32, gm> -> i32
        %24 = arith.index_cast %23 : i32 to index
        %25 = arith.remsi %24, %c4 : index
        %26 = arith.cmpi sge, %25, %c2 : index
        scf.if %26 {
          %27 = arith.subi %c3, %25 : index
          %28 = arith.muli %arg9, %c512 : index
          %29 = pto.addptr %arg3, %28 : <f32, gm> -> <f32, gm>
          %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %30, %4, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %31 = arith.addi %22, %27 : index
          %32 = pto.load_scalar %arg8[%31] : !pto.ptr<i64, gm> -> i64
          %33 = arith.index_cast %32 : i64 to index
          %34 = arith.cmpi sge, %33, %c0 : index
          scf.if %34 {
            %35 = arith.muli %arg9, %c1024 : index
            %36 = pto.addptr %arg6, %35 : <f32, gm> -> <f32, gm>
            %37 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %4, %37, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %38 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
            %39 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
            pto.vecscope {
              %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %2[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %2[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %2[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %2[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %2[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %2[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %2[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %45 = pto.vcvt %result, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %46 = pto.vcvt %result_5, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %47 = pto.vcvt %result_6, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %48 = pto.vcvt %result_7, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %49 = pto.vcvt %result_8, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %50 = pto.vcvt %result_9, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %51 = pto.vcvt %result_10, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %52 = pto.vcvt %result_11, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %45, %39[%c0], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %46, %39[%c64], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %47, %39[%c128], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %48, %39[%c192], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %49, %39[%c256], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %50, %39[%c320], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %51, %39[%c384], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %52, %39[%c448], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
            %40 = arith.muli %33, %c512 : index
            %41 = pto.addptr %arg5, %40 : <bf16, gm> -> <bf16, gm>
            %42 = pto.addptr %39, %c0 : <bf16, ub> -> <bf16, ub>
            %43 = pto.addptr %41, %c0 : <bf16, gm> -> <bf16, gm>
            pto.copy_ubuf_to_gm %42, %43, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}
