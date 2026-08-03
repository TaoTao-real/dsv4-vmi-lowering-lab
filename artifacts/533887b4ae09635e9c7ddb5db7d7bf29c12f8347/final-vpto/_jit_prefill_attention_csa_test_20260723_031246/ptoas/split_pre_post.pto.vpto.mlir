module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @split_pre_post(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: f32, %arg6: f32, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c288_i64 = arith.constant 288 : i64
      %c320_i64 = arith.constant 320 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8 = arith.constant 8 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 9.99999997E-7 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0 = arith.constant 0 : index
      %c16_i64 = arith.constant 16 : i64
      %c256 = arith.constant 256 : index
      %c8_i32 = arith.constant 8 : i32
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.castptr %c288_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %arg1, %4, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %5 = arith.muli %0, %c256 : index
      %6 = pto.addptr %arg2, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c320_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg10 : i16 to index
          %28 = arith.muli %27, %c8 : index
          %29 = pto.addptr %7, %28 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.addptr %3, %27 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result, %31, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %8 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.vdup %arg5, %28 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.pand %27, %mask, %28 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg10 : i16 to index
          %34 = arith.muli %33, %c8 : index
          %result = pto.vlds %7[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result, %29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %7[%34], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %31 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        %32 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.muli %33, %c8 : index
          %35 = pto.addptr %32, %34 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
      }
      %9 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %29 = pto.pand %28, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %result = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %10[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result, %result_2, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%31], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %32 = pto.addptr %7, %31 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %11 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %29 = pto.pand %28, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %result = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vexp %result, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%31], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %12 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %28 = pto.vdup %cst, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c8 : index
          %result = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result, %28, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %7[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c8 : index
          %result = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vdiv %28, %result, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %10[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
      }
      %13 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %28 = pto.vdup %cst_0, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg10 : i16 to index
          %32 = arith.muli %31, %c8 : index
          %result = pto.vlds %10[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result, %28, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %7[%32], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %14 = arith.muli %0, %c64 : index
      %15 = pto.addptr %arg3, %14 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %15, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c32_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %16 = pto.addptr %arg1, %c4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %16, %4, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %17 = arith.addi %5, %c4 : index
      %18 = pto.addptr %arg2, %17 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %18, %7, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg10 : i16 to index
          %28 = arith.muli %27, %c8 : index
          %29 = pto.addptr %7, %28 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.addptr %3, %27 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result, %31, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %19 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %28 = pto.vdup %arg6, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c8 : index
          %result = pto.vlds %7[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result, %28, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %7[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %31 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.muli %32, %c8 : index
          %34 = pto.addptr %10, %33 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
      }
      %20 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %29 = pto.pand %28, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %result = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %10[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result, %result_2, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%31], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %32 = pto.addptr %7, %31 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %21 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %28 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %29 = pto.pand %28, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c8 : index
          %result = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vexp %result, %27 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%31], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %22 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %28 = pto.vdup %cst, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %29 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %30 = pto.pand %29, %mask, %27 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c8 : index
          %result = pto.vlds %7[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result, %28, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %7[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c8 : index
          %result = pto.vlds %7[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vdiv %28, %result, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %10[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
        %31 = pto.vdup %cst_1, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg10 : i16 to index
          %33 = arith.muli %32, %c8 : index
          %result = pto.vlds %10[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result, %31, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %7[%33], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %23 = arith.muli %0, %c32 : index
      %24 = pto.addptr %arg4, %23 : <f32, gm> -> <f32, gm>
      %25 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %26 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %25, %26, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c16_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

