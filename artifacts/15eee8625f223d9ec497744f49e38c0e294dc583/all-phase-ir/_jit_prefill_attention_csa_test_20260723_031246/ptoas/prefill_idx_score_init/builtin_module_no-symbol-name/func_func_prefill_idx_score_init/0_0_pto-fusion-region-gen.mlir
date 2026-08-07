// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_score_init(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c2048 = arith.constant 2048 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant -3.40282347E+38 : f32
  %c0 = arith.constant 0 : index
  %c262144 = arith.constant 262144 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c2048], strides = [%c262144, %c262144, %c262144, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.fusion_region {
    %3 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c2048 : !pto.tile_buf<vec, 16x2048xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%3 : !pto.tile_buf<vec, 16x2048xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%3) : (!pto.tile_buf<vec, 16x2048xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x2048xf32, valid=?x?>
  %2 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %arg1, %c0], sizes = [%c1, %c1, %c1, %c16, %c2048] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%1 : !pto.tile_buf<vec, 16x2048xf32, valid=?x?>) outs(%2 : !pto.partition_tensor_view<1x1x1x16x2048xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}
