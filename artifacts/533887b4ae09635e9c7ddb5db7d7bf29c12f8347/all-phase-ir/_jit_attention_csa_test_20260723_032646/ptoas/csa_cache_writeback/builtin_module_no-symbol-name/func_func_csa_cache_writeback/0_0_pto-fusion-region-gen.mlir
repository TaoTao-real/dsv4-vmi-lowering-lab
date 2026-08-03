// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @csa_cache_writeback(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i64, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4096 = arith.constant 4096 : index
  %c0_i64 = arith.constant 0 : i64
  %c16384 = arith.constant 16384 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c8388608 = arith.constant 8388608 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c16384, %c512], strides = [%c8388608, %c8388608, %c8388608, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c8], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi64>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c512], strides = [%c4096, %c4096, %c4096, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = arith.index_cast %arg3 : i32 to index
  %4 = arith.muli %3, %c8 : index
  scf.for %arg5 = %c0 to %c8 step %c1 {
    %5 = arith.addi %4, %arg5 : index
    %6 = pto.load_scalar %arg1[%5] : !pto.ptr<i64, gm> -> i64
    %7 = arith.index_cast %6 : i64 to index
    %8 = arith.cmpi sge, %7, %c0 : index
    scf.if %8 {
      %9 = arith.index_cast %6 : i64 to index
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
      %11 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%11 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%10 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %12 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %9, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%10 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%12 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}

