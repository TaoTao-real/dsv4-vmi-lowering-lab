// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qkv_rope_rows(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c64 = arith.constant 64 : index
  %c1 = arith.constant 1 : index
  %c16384 = arith.constant 16384 : index
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c8192 = arith.constant 8192 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%arg5], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = arith.index_cast %arg6 : i32 to index
  %6 = arith.muli %5, %c8 : index
  scf.for %arg8 = %c0 to %c8 step %c1 {
    %7 = arith.addi %6, %arg8 : index
    %8 = arith.cmpi slt, %7, %c128 : index
    scf.if %8 {
      %9 = pto.load_scalar %arg2[%7] : !pto.ptr<i32, gm> -> i32
      %10 = arith.index_cast %9 : i32 to index
      %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
      %12 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %10, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%11 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %13 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%11 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%13 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
      %15 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%14 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %16 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%14 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%16 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}

