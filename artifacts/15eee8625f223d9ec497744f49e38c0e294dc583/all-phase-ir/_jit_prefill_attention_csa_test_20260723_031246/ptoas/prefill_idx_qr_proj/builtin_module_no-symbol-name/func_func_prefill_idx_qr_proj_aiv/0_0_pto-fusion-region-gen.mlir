// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_qr_proj_aiv(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c8388608 = arith.constant 8388608 : index
  %c131072_i64 = arith.constant 131072 : i64
  %c132096_i64 = arith.constant 132096 : i64
  %c148480_i64 = arith.constant 148480 : i64
  %c128 = arith.constant 128 : index
  %c1024 = arith.constant 1024 : index
  %c1 = arith.constant 1 : index
  %c8192 = arith.constant 8192 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c16 = arith.constant 16 : index
  %c131072 = arith.constant 131072 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c1024], strides = [%c131072, %c131072, %c131072, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1024, %c8192], strides = [%c8388608, %c8388608, %c8388608, %c8192, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %2 = pto.make_tensor_view %arg2, shape = [%c8192], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c128, %c8192], strides = [%c1048576, %c1048576, %c1048576, %c8192, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c1], strides = [%c128, %c128, %c128, %c1, %c128] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.reserve_buffer{name = "prefill_idx_qr_proj_c2v_slot_buffer", size = 131072, location = <vec>, auto = false, base = 0} -> i32
  %6 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 16384, slot_num = 8, nosplit = true} (%5 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %7 = arith.index_cast %arg5 : i32 to index
  %8 = arith.muli %7, %c256 : index
  %9 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  %10 = pto.partition_view %2, offsets = [%8], sizes = [%c256] : !pto.tensor_view<?xf32>
  pto.tload ins(%10 : !pto.partition_tensor_view<256xf32>) outs(%9 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  scf.for %arg7 = %c0 to %c128 step %c16 {
    %12 = pto.declare_tile -> !pto.tile_buf<vec, 16x256xi32, valid=?x?>
    pto.tpop(%12, %6 : !pto.tile_buf<vec, 16x256xi32, valid=?x?>, !pto.pipe) {split = 0}
    %13 = pto.fusion_region {
      %18 = pto.alloc_tile addr = %c132096_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.tcvt ins(%12 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x256xi32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>)
      pto.yield(%18) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    pto.tfree(%6 : !pto.pipe) {split = 0}
    %14 = pto.alloc_tile addr = %c148480_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %15 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %arg7, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%14 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %16 = pto.fusion_region {
      %18 = pto.alloc_tile addr = %c132096_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.trowexpandmul ins(%13, %14 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%18 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %19 = pto.alloc_tile addr = %c132096_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.tcolexpandmul ins(%18, %11 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%19 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%19) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    %17 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %arg7, %8], sizes = [%c1, %c1, %c1, %c16, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%16 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) outs(%17 : !pto.partition_tensor_view<1x1x1x16x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
