// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @csa_cmp_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c0_i64 = arith.constant 0 : i64
  %c64_i64 = arith.constant 64 : i64
  %c4 = arith.constant 4 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %c16384 = arith.constant 16384 : index
  %c64 = arith.constant 64 : index
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c128 = arith.constant 128 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c8], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  scf.for %arg5 = %c0 to %c4 step %c1 {
    %5 = arith.muli %arg5, %c2 : index
    %6 = pto.load_scalar %arg2[%5] : !pto.ptr<i32, gm> -> i32
    %7 = arith.index_cast %6 : i32 to index
    %8 = arith.remsi %7, %c4 : index
    %9 = arith.subi %c4, %8 : index
    %10 = arith.index_cast %6 : i32 to index
    %11 = arith.addi %10, %9 : index
    %12 = arith.subi %11, %c4 : index
    %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
    %14 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%14 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%13 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %15 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.tcvt ins(%13 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%15 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
    %16 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %arg5, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%15 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%16 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
    %18 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%18 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%17 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %19 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.tcvt ins(%17 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%19 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
    %20 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg5, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%19 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%20 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
