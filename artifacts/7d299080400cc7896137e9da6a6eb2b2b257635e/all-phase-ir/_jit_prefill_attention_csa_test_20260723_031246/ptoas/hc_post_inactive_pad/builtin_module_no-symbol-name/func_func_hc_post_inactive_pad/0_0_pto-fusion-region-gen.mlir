// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_post_inactive_pad(%arg0: !pto.ptr<f32, gm>, %arg1: index, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c0_i64 = arith.constant 0 : i64
  %c16384 = arith.constant 16384 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %c16 = arith.constant 16 : index
  %c256 = arith.constant 256 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c4096 = arith.constant 4096 : index
  %0 = arith.muli %arg3, %c16384 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg3, %c16384], strides = [%0, %0, %0, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = arith.index_cast %arg4 : i32 to index
  %3 = arith.divsi %2, %c4 : index
  %4 = arith.remsi %2, %c4 : index
  %5 = arith.muli %3, %c16 : index
  %6 = arith.addi %arg1, %5 : index
  %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%7 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg6 = %c0 to %c16 step %c1 {
    %8 = arith.addi %6, %arg6 : index
    %9 = arith.cmpi slt, %8, %arg3 : index
    scf.if %9 {
      scf.for %arg7 = %c0 to %c4096 step %c256 {
        %10 = arith.muli %4, %c4096 : index
        %11 = arith.addi %10, %arg7 : index
        %12 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %8, %11], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%7 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%12 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    } else {
    }
  }
  return
}
