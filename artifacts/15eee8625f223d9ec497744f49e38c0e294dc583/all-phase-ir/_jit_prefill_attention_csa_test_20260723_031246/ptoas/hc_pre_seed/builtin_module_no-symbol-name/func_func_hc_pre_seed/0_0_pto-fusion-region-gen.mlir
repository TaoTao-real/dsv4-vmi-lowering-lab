// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_pre_seed(%arg0: !pto.ptr<f32, gm>, %arg1: index, %arg2: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c0_i64 = arith.constant 0 : i64
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c0 = arith.constant 0 : index
  %c8 = arith.constant 8 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = arith.muli %arg2, %c32 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg2, %c32], strides = [%0, %0, %0, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  scf.for %arg3 = %c0 to %arg2 step %c8 {
    %2 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%2 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %3 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg3, %c0], sizes = [%c1, %c1, %c1, %c8, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%2 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>) outs(%3 : !pto.partition_tensor_view<1x1x1x8x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
