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
        %23 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %0, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %24 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %24, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = arith.index_cast %arg8 : i32 to index
      %2 = arith.muli %1, %c16 : index
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %23 = arith.addi %2, %arg10 : index
        %24 = pto.load_scalar %arg0[%23] : !pto.ptr<i32, gm> -> i32
        %25 = arith.index_cast %24 : i32 to index
        %26 = arith.cmpi sge, %25, %c0 : index
        scf.if %26 {
          %27 = pto.load_scalar %arg1[%23] : !pto.ptr<i32, gm> -> i32
          %28 = arith.index_cast %27 : i32 to index
          %29 = arith.addi %28, %c-3 : index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %arg2, %30 : <bf16, gm> -> <bf16, gm>
          %32 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %33 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
          %34 = pto.addptr %32, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %33, %34, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %35 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
          %37 = arith.index_cast %arg10 : index to i64
          %38 = arith.muli %37, %c128_i64 : i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %41 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %42 = pto.vcvt %result, %41 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %42, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %43 = arith.addi %38, %c25152_i64 : i64
            %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
            %45 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %47 = pto.pand %45, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %44[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %39 = pto.addptr %arg3, %30 : <bf16, gm> -> <bf16, gm>
          %40 = pto.addptr %39, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %40, %34, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %34[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %41 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %42 = pto.vcvt %result, %41 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %42, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %43 = arith.addi %38, %c29248_i64 : i64
            %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
            %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %47 = pto.pand %45, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %result_5, %44[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %23, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = arith.muli %1, %c8192 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg10 = %c0 to %c512 step %c64 {
        %23 = arith.addi %5, %arg10 : index
        %24 = pto.addptr %arg4, %23 : <f32, gm> -> <f32, gm>
        %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.vdup %cst_4, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %32 = pto.pand %29, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %36 = arith.index_cast %arg11 : i16 to index
            %37 = arith.muli %36, %c64 : index
            %result_8 = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_8, %result_8, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %26[%37], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %39 = pto.vcadd %38, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vadd %39, %31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %28[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %33 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result, %result_5, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %35 = pto.pand %33, %mask_6, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %34, %3[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %8 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.vdup %cst_3, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vmul %result, %24, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %27 = pto.vdup %cst_2, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.vadd %25, %27, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pand %26, %mask, %23 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %28, %6[%c0], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.vsqrt %result_5, %23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %30, %6[%c0], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.vdup %cst_1, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.vdiv %31, %result_6, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %8[%c0], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg10 = %c0 to %c448 step %c64 {
        %23 = arith.addi %5, %arg10 : index
        %24 = pto.addptr %arg4, %23 : <f32, gm> -> <f32, gm>
        %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = pto.addptr %arg6, %arg10 : <bf16, gm> -> <bf16, gm>
        %27 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %27, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %10[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %32 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %33 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg11 : i16 to index
            %35 = arith.muli %34, %c64 : index
            %36 = pto.addptr %6, %35 : <f32, ub> -> <f32, ub>
            %result_5 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.addptr %8, %34 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmul %result_5, %38, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %39, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %28 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %33 = arith.index_cast %arg11 : i16 to index
            %34 = arith.muli %33, %c64 : index
            %result_5 = pto.vlds %6[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vmul %result_5, %result, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %35, %6[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %29 = pto.addptr %arg5, %23 : <f32, gm> -> <f32, gm>
        %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %7, %30, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %12 = arith.addi %5, %c448 : index
      %13 = pto.addptr %arg4, %12 : <f32, gm> -> <f32, gm>
      %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %14, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %15 = pto.addptr %arg6, %c448 : <bf16, gm> -> <bf16, gm>
      %16 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %16, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %10[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %24 = pto.vcvt %result, %23 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %25 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %6, %30 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.addptr %8, %29 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_6, %33, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_5 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %6[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_6, %result_5, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %28 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %11, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %28, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %17 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %23 = arith.index_cast %arg10 : index to i32
        pto.store %23, %17[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %18 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %23 = pto.addptr %17, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %27 = pto.vdup %cst_0, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %result_6 = pto.vlds %11[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_6, %result_5, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %11[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.vmul %34, %27, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %3[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %3, %33 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %36 = pto.addptr %17, %33 : <i32, ub> -> <i32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %17, %33 : <i32, ub> -> <i32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %35 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.addptr %3, %33 : <f32, ub> -> <f32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %28 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %3, %33 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %36 = pto.addptr %28, %33 : <i32, ub> -> <i32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %29 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.vdup %cst_1, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %result_6 = pto.vlds %3[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_6, %29, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %11[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vsub %result_7, %34, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %3[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %36 = pto.vadd %result_7, %30, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmul %35, %29, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %18[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = pto.vsub %36, %37, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %11[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %31 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %11, %33 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %36 = pto.addptr %31, %33 : <i32, ub> -> <i32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %19 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.vdup %cst, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %3[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result, %24, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %3[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %26 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %3, %32 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vsub %result, %26, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %27 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.index_cast %31 : index to i64
          %33 = arith.muli %32, %c128_i64 : i64
          %34 = arith.addi %33, %c25152_i64 : i64
          %35 = arith.muli %32, %c256_i64 : i64
          %36 = arith.addi %35, %c16448_i64 : i64
          %37 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %36 : i64 -> !pto.ptr<i32, ub>
          %39 = pto.addptr %38, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vgather2 %37, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = arith.addi %35, %c20544_i64 : i64
          %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %42[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.index_cast %31 : index to i64
          %33 = arith.muli %32, %c128_i64 : i64
          %34 = arith.addi %33, %c29248_i64 : i64
          %35 = arith.muli %32, %c256_i64 : i64
          %36 = arith.addi %35, %c16448_i64 : i64
          %37 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %36 : i64 -> !pto.ptr<i32, ub>
          %39 = pto.addptr %38, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vgather2 %37, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = arith.addi %35, %c25152_i64 : i64
          %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %42[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %29 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.index_cast %31 : index to i64
          %33 = arith.muli %32, %c256_i64 : i64
          %34 = arith.addi %33, %c4096_i64 : i64
          %35 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %33 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %33, %c16448_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %40[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %6[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %18[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result, %result_5, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %6[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_6 = pto.vlds %8[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %3[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_6, %result_7, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %0[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %34, %result_8, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %11[%32], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %20 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result = pto.vlds %6[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %11[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result, %result_5, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %6[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %21 = pto.addptr %arg5, %12 : <f32, gm> -> <f32, gm>
      %22 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %22, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
