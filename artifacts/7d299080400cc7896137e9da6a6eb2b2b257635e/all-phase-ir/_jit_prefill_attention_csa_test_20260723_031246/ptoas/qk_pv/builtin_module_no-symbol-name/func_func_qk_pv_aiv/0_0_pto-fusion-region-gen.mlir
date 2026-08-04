// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4194304 = arith.constant 4194304 : index
  %c25165824 = arith.constant 25165824 : index
  %c12582912 = arith.constant 12582912 : index
  %c73984_i64 = arith.constant 73984 : i64
  %c74496_i64 = arith.constant 74496 : i64
  %c90880_i64 = arith.constant 90880 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c65664_i64 = arith.constant 65664 : i64
  %c65792_i64 = arith.constant 65792 : i64
  %c24576 = arith.constant 24576 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c49152 = arith.constant 49152 : index
  %c128 = arith.constant 128 : index
  %c384 = arith.constant 384 : index
  %c8192 = arith.constant 8192 : index
  %c192 = arith.constant 192 : index
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %c2 = arith.constant 2 : index
  %c32 = arith.constant 32 : index
  %cst = arith.constant 0.0441941731 : f32
  %c48 = arith.constant 48 : index
  %c16 = arith.constant 16 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c24576, %c1], strides = [%c24576, %c24576, %c24576, %c1, %c24576] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c24576, %c1], strides = [%c24576, %c24576, %c24576, %c1, %c24576] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c24576, %c512], strides = [%c12582912, %c12582912, %c12582912, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c49152, %c512], strides = [%c25165824, %c25165824, %c25165824, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c384], strides = [%c49152, %c49152, %c49152, %c384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8192, %c512], strides = [%c4194304, %c4194304, %c4194304, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %6 = pto.import_reserved_buffer{name = "qk_pv_v2c_slot_buffer", peer_func = @qk_pv_aic} -> i32
  %7 = pto.reserve_buffer{name = "qk_pv_c2v_slot_buffer", size = 65536, location = <vec>, auto = false, base = 0} -> i32
  %8 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, nosplit = true} (%7 : i32, %6 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %9 = arith.index_cast %arg6 : i32 to index
  %10 = arith.cmpi slt, %9, %c128 : index
  scf.if %10 {
    %11 = arith.muli %9, %c192 : index
    scf.for %arg8 = %c0 to %c3 step %c1 {
      %12 = pto.alloc_tile addr = %c73984_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %13 = arith.muli %arg8, %c128 : index
      %14 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %9, %13], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%14 : !pto.partition_tensor_view<1x1x1x1x128xf32>) outs(%12 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      scf.for %arg9 = %c0 to %c2 step %c1 {
        %15 = pto.declare_tile -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tpop(%15, %8 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
        %16 = pto.fusion_region {
          %41 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.tmuls ins(%15, %cst : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, f32) outs(%41 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%41) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tfree(%8 : !pto.pipe) {split = 0}
        %17:3 = pto.fusion_region {
          %41 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.tcolexpandadd ins(%16, %12 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%41 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandadd", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandadd", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandadd", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %42 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %43 = pto.alloc_tile addr = %c65536_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
          pto.trowmax ins(%41, %42 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %44 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.trowexpandsub ins(%41, %43 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) outs(%44 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandsub", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %45 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.texp ins(%44 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %46 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %47 = pto.alloc_tile addr = %c65664_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
          pto.trowsum ins(%45, %46 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%47 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %48 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>
          pto.tcvt ins(%45 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%48 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>)
          %49 = pto.alloc_tile addr = %c65792_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tmov ins(%48 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 8 : i64, loop_depth = 1 : i64, name = "template_tmov_nd2nz", postupdate = 1 : i64, tags = ["move", "ub", "ub", "nd2nz", "nz"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield(%43, %47, %49) : (!pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tpush(%17#2, %8 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %18 = arith.muli %arg9, %c2 : index
        %19 = arith.muli %18, %c48 : index
        %20 = arith.addi %11, %19 : index
        %21 = arith.muli %arg8, %c16 : index
        %22 = arith.addi %20, %21 : index
        %23 = pto.alloc_tile addr = %c65536_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %24 = pto.subview %17#0[%c0, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %25 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %22, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%24 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%25 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %26 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %27 = pto.subview %17#1[%c0, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %28 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %22, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%27 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%28 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %29 = arith.muli %arg9, %c2 : index
        %30 = arith.addi %29, %c1 : index
        %31 = arith.muli %30, %c48 : index
        %32 = arith.addi %11, %31 : index
        %33 = arith.muli %arg8, %c16 : index
        %34 = arith.addi %32, %33 : index
        %35 = pto.alloc_tile addr = %c65536_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %36 = pto.subview %17#0[%c16, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %37 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %34, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%36 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%37 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %38 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %39 = pto.subview %17#1[%c16, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %40 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %34, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%39 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%40 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    }
  } else {
  }
  return
}
