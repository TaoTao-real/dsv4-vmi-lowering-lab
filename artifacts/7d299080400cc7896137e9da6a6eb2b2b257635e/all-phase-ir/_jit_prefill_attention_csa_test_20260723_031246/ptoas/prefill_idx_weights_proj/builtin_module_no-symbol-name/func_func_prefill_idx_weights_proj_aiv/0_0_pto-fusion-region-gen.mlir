// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_weights_proj_aiv(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c8192 = arith.constant 8192 : index
  %c262144 = arith.constant 262144 : index
  %c65536_i64 = arith.constant 65536 : i64
  %c128 = arith.constant 128 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c32 = arith.constant 32 : index
  %cst = arith.constant 0.0110485433 : f32
  %c0 = arith.constant 0 : index
  %c524288 = arith.constant 524288 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c4096], strides = [%c524288, %c524288, %c524288, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c4096, %c64], strides = [%c262144, %c262144, %c262144, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.reserve_buffer{name = "prefill_idx_weights_proj_c2v_slot_buffer", size = 65536, location = <vec>, auto = false, base = 0} -> i32
  %4 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, nosplit = true} (%3 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %5 = arith.index_cast %arg3 : i32 to index
  %6 = arith.muli %5, %c32 : index
  %7 = pto.declare_tile -> !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tpop(%7, %4 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.pipe) {split = 0}
  %8 = pto.fusion_region {
    %10 = pto.alloc_tile addr = %c65536_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%7, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%10 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%10) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tfree(%4 : !pto.pipe) {split = 0}
  %9 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%8 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%9 : !pto.partition_tensor_view<1x1x1x32x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}
