// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_score_out(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32768 = arith.constant 32768 : index
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c2048 = arith.constant 2048 : index
  %c1 = arith.constant 1 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c262144 = arith.constant 262144 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c2048], strides = [%c262144, %c262144, %c262144, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c256], strides = [%c32768, %c32768, %c32768, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c256 : !pto.tile_buf<vec, 128x256xf32, valid=?x?>
  %3 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c128, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%3 : !pto.partition_tensor_view<1x1x1x128x256xf32>) outs(%2 : !pto.tile_buf<vec, 128x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %4 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c128, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%2 : !pto.tile_buf<vec, 128x256xf32, valid=?x?>) outs(%4 : !pto.partition_tensor_view<1x1x1x128x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

