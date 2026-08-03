module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c33280_i64 = arith.constant 33280 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c41472_i64 = arith.constant 41472 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c25088_i64 = arith.constant 25088 : i64
      %c24832_i64 = arith.constant 24832 : i64
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c32_i64 = arith.constant 32 : i64
      %c512_i64 = arith.constant 512 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c64 : index
      %2 = arith.muli %0, %c32 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c33280_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %7 = pto.addptr %arg1, %2 : <f32, gm> -> <f32, gm>
      %8 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %11, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %28, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %28 = arith.index_cast %arg6 : index to i32
        pto.store %28, %12[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.addptr %12, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %29 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %14 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg6 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_2 = pto.vlds %11[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_2, %result, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %11[%31], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %cst_0, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg6 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %result = pto.vlds %11[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %13[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg6 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %13, %33 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %36 = pto.addptr %12, %33 : <i32, ub> -> <i32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg6 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %12, %33 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %34[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %35 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.addptr %13, %33 : <f32, ub> -> <f32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %31 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg6 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %13, %33 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %36 = pto.addptr %31, %33 : <i32, ub> -> <i32, ub>
          pto.vsts %35, %36[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %cst_1, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %13[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %13[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg6 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result = pto.vlds %11[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %13[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result, %result_2, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %13[%31], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %18 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %cst, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %11[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %19 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %20 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %cst_1, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %13[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %20[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %21 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %20[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vsub %result, %result_2, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %11[%32], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %11, %32 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %30, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %22 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %23 = pto.castptr %c25088_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %cst_1, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %result_5 = pto.vlds %13[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %13[%38], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %31 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c64 : index
          %39 = pto.addptr %13, %38 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vsub %result_5, %31, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.vdup %cst, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c32 : index
          %39 = pto.addptr %20, %38 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %39[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %33 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.pand %33, %mask_2, %28 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c32 : index
          %result_5 = pto.vlds %20[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %result, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %23[%38], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c32 : index
          %39 = pto.addptr %20, %38 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %39[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %result_4 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.muli %37, %c32 : index
          %result_5 = pto.vlds %20[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_5, %result_4, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %4[%38], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %35 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %36 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c128_i64 : i64
          %40 = arith.addi %39, %c25088_i64 : i64
          %41 = arith.muli %38, %c256_i64 : i64
          %42 = arith.addi %41, %c8192_i64 : i64
          %43 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.castptr %42 : i64 -> !pto.ptr<i32, ub>
          %45 = pto.addptr %44, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vgather2 %43, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = arith.addi %41, %c16384_i64 : i64
          %48 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %48[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg6 : i16 to index
          %38 = arith.index_cast %37 : index to i64
          %39 = arith.muli %38, %c128_i64 : i64
          %40 = arith.addi %39, %c33280_i64 : i64
          %41 = arith.muli %38, %c256_i64 : i64
          %42 = arith.addi %41, %c8192_i64 : i64
          %43 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.castptr %42 : i64 -> !pto.ptr<i32, ub>
          %45 = pto.addptr %44, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vgather2 %43, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = arith.addi %41, %c25088_i64 : i64
          %48 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %48[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %24 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
      %26 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      %27 = pto.addptr %26, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c64 step %c32 {
        %28 = arith.addi %1, %arg6 : index
        %29 = arith.muli %28, %c128 : index
        %30 = arith.addi %29, %c64 : index
        %31 = pto.addptr %arg3, %30 : <f32, gm> -> <f32, gm>
        %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %32, %25, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %41 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
          %42 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
          %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %44 = arith.index_cast %arg7 : i16 to index
            %45 = arith.index_cast %44 : index to i64
            %46 = arith.muli %45, %c256_i64 : i64
            %47 = arith.addi %46, %c8192_i64 : i64
            %48 = arith.addi %46, %c41472_i64 : i64
            %49 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
            %50 = pto.castptr %48 : i64 -> !pto.ptr<i32, ub>
            %51 = pto.addptr %50, %c0 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %52 = pto.vgather2 %49, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %52, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %53 = arith.addi %46, %c33280_i64 : i64
            %54 = pto.castptr %53 : i64 -> !pto.ptr<f32, ub>
            %result_2 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_2, %54[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        %33 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg7 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %result = pto.vlds %24[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %20[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vmul %result, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %24[%44], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        %34 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg7 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %result = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %13[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vmul %result, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %4[%44], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        %35 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg7 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %result = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %23[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vmul %result, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %4[%44], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg7 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %result = pto.vlds %24[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vadd %result, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %45, %24[%44], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %37 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
        pto.vecscope {
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %43 = arith.index_cast %arg7 : i16 to index
            %44 = arith.muli %43, %c64 : index
            %result = pto.vlds %24[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = pto.vcvt %result, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %45, %26[%44], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %38 = arith.muli %28, %c64 : index
        %39 = pto.addptr %arg2, %38 : <bf16, gm> -> <bf16, gm>
        %40 = pto.addptr %39, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %27, %40, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

