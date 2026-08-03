// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_csa_cache_write(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i64, gm>, %arg2: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c65536 = arith.constant 65536 : index
  %c0_i64 = arith.constant 0 : i64
  %c16384 = arith.constant 16384 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c0 = arith.constant 0 : index
  %c8388608 = arith.constant 8388608 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c16384, %c512], strides = [%c8388608, %c8388608, %c8388608, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c128], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi64>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  scf.for %arg3 = %c0 to %c128 step %c1 {
    %3 = pto.load_scalar %arg1[%arg3] : !pto.ptr<i64, gm> -> i64
    %4 = arith.index_cast %3 : i64 to index
    %5 = arith.cmpi sge, %4, %c0 : index
    scf.if %5 {
      %6 = arith.index_cast %3 : i64 to index
      %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
      %8 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %arg3, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%8 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%7 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %9 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%7 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%9 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}

