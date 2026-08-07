// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_c4_write_map(%arg0: !pto.ptr<i64, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c0_i64 = arith.constant 0 : i64
  %c128_i64 = arith.constant 128 : i64
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c0_i32 = arith.constant 0 : i32
  %c-1_i32 = arith.constant -1 : i32
  %c0 = arith.constant 0 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c128], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi64>
  %1 = pto.make_tensor_view %arg1, shape = [%arg4], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %4 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
  pto.texpands ins(%c0_i32 : i32) outs(%4 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %5 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
  pto.texpands ins(%c-1_i32 : i32) outs(%5 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %6 = scf.for %arg5 = %c0 to %c128 step %c1 iter_args(%arg6 = %c0) -> (index) {
    %9 = pto.load_scalar %arg0[%arg5] : !pto.ptr<i64, gm> -> i64
    %10 = arith.index_cast %9 : i64 to index
    %11 = arith.cmpi sge, %10, %c0 : index
    %12 = scf.if %11 -> (index) {
      %13 = pto.load_scalar %arg1[%arg5] : !pto.ptr<i32, gm> -> i32
      pto.tsetval ins(%arg6, %13 : index, i32) outs(%4 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>)
      %14 = arith.trunci %9 : i64 to i32
      pto.tsetval ins(%arg6, %14 : index, i32) outs(%5 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>)
      %15 = arith.addi %arg6, %c1 : index
      scf.yield %15 : index
    } else {
      scf.yield %arg6 : index
    }
    scf.yield %12 : index
  }
  %7 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tstore ins(%4 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%7 : !pto.partition_tensor_view<1x1x1x1x32xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tstore ins(%5 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%8 : !pto.partition_tensor_view<1x1x1x1x32xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}
