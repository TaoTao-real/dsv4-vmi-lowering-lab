module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @q_rope_prepare(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c8704_i64 = arith.constant 8704 : i64
      %c10752_i64 = arith.constant 10752 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c8448_i64 = arith.constant 8448 : i64
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c64_i32 = arith.constant 64 : i32
      %c512 = arith.constant 512 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg8 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %27 = pto.addptr %1, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %24 = arith.index_cast %arg8 : index to i32
        pto.store %24, %2[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %3 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %25 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg8 : i16 to index
          %27 = arith.muli %26, %c64 : index
          %result_2 = pto.vlds %1[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_2, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %1[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %5 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_0, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result = pto.vlds %1[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %3[%29], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %3, %29 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %2, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %2, %29 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.addptr %3, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %3, %29 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %27, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %6 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %3[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %7 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg8 : i16 to index
          %27 = arith.muli %26, %c64 : index
          %result = pto.vlds %1[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %3[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vsub %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %3[%27], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %8 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vadd %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %1[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %9 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %10 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %10[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %11 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %10[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vsub %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %1[%28], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %29 = pto.addptr %1, %28 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %31 = pto.addptr %26, %28 : <i32, ub> -> <i32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %12 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result = pto.vlds %3[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %3[%29], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %27 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg8 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %30 = pto.addptr %3, %29 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vsub %result, %27, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %13 = arith.muli %0, %c512 : index
      %14 = pto.addptr %arg0, %13 : <bf16, gm> -> <bf16, gm>
      %15 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %14, %15, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %16 = pto.addptr %arg1, %13 : <bf16, gm> -> <bf16, gm>
      %17 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %16, %17, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg8 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %15, %30 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %31[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %32 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %33 = pto.addptr %10, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %25 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg8 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %17, %30 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %31[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %32 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %33 = pto.addptr %25, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %26 = pto.castptr %c8448_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg8 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c256_i64 : i64
          %32 = arith.addi %31, %c2048_i64 : i64
          %33 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.castptr %31 : i64 -> !pto.ptr<i32, ub>
          %35 = pto.addptr %34, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %35[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %36 = pto.vgather2 %33, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %37 = arith.addi %31, %c6144_i64 : i64
          %38 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %38[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg8 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c256_i64 : i64
          %32 = arith.addi %31, %c4096_i64 : i64
          %33 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.castptr %31 : i64 -> !pto.ptr<i32, ub>
          %35 = pto.addptr %34, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %35[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %36 = pto.vgather2 %33, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %37 = arith.addi %31, %c2048_i64 : i64
          %38 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %38[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %18 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg8 : i16 to index
          %27 = arith.muli %26, %c64 : index
          %result = pto.vlds %10[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %3[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %3[%27], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %19 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.addptr %arg2, %13 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %21 = pto.addptr %arg3, %13 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %21, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %22 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<i32, ub>
      %23 = pto.addptr %arg4, %13 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %22, %23, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

