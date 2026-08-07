// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @kv_proj_seed(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c0 = arith.constant 0 : index
  %c16 = arith.constant 16 : index
  %c4 = arith.constant 4 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c65536 = arith.constant 65536 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = arith.divsi %arg1, %c16 : index
  scf.for %arg2 = %c0 to %1 step %c1 {
    %2 = arith.muli %arg2, %c16 : index
    scf.for %arg3 = %c0 to %c4 step %c1 {
      %3 = arith.muli %arg3, %c128 : index
      %4 = pto.fusion_region {
        %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
        pto.texpands ins(%cst : f32) outs(%6 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%6) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      %5 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %2, %3], sizes = [%c1, %c1, %c1, %c16, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%4 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%5 : !pto.partition_tensor_view<1x1x1x16x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
  }
  return
}
