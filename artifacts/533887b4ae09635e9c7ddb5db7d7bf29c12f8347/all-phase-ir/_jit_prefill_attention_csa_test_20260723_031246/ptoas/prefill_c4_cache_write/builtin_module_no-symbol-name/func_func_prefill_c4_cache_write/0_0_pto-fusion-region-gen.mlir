// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_c4_cache_write(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16384 = arith.constant 16384 : index
  %c0_i64 = arith.constant 0 : i64
  %c4096 = arith.constant 4096 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c16 = arith.constant 16 : index
  %c0 = arith.constant 0 : index
  %c4064 = arith.constant 4064 : index
  %c2097152 = arith.constant 2097152 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c4096, %c512], strides = [%c2097152, %c2097152, %c2097152, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c32, %c512], strides = [%c16384, %c16384, %c16384, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = arith.index_cast %arg3 : i32 to index
  %4 = arith.muli %3, %c16 : index
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %5 = arith.addi %4, %arg5 : index
    %6 = pto.load_scalar %arg1[%5] : !pto.ptr<i32, gm> -> i32
    %7 = arith.index_cast %6 : i32 to index
    %8 = arith.cmpi sge, %7, %c0 : index
    scf.if %8 {
      %9 = arith.index_cast %6 : i32 to index
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %11 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%11 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%10 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %12 = pto.fusion_region {
        %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
        pto.tcvt ins(%10 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>)
        pto.yield(%14) : (!pto.tile_buf<vec, 1x512xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
      %13 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %9, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%12 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%13 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
      %9 = arith.addi %5, %c4064 : index
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
      %11 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %9, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%11 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%10 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %12 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %9, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%10 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%12 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
  }
  return
}

