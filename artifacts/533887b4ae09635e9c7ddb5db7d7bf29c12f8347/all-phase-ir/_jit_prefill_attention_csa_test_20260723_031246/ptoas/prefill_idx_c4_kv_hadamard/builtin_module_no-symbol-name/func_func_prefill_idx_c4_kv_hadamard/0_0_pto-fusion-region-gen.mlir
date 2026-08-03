// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_c4_kv_hadamard(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c16384 = arith.constant 16384 : index
  %c0_i64 = arith.constant 0 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c32 = arith.constant 32 : index
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c0 = arith.constant 0 : index
  %c64 = arith.constant 64 : index
  %c4096 = arith.constant 4096 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c32, %c128], strides = [%c4096, %c4096, %c4096, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c32, %c128], strides = [%c4096, %c4096, %c4096, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = arith.index_cast %arg3 : i32 to index
  %4 = arith.muli %3, %c16 : index
  scf.for %arg5 = %c0 to %c128 step %c64 {
    %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<mat, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    %6 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c16, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%6 : !pto.partition_tensor_view<1x1x1x16x128xbf16>) outs(%5 : !pto.tile_buf<mat, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %7 = pto.alloc_tile addr = %c4096_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<mat, 128x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    %8 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %arg5], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%8 : !pto.partition_tensor_view<1x1x1x128x64xbf16>) outs(%7 : !pto.tile_buf<mat, 128x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<left, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%5 : !pto.tile_buf<mat, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%9 : !pto.tile_buf<left, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<right, 128x64xbf16, valid=?x?, slayout=col_major>
    pto.tmov ins(%7 : !pto.tile_buf<mat, 128x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%10 : !pto.tile_buf<right, 128x64xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<acc, 16x64xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul ins(%9, %10 : !pto.tile_buf<left, 16x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x64xbf16, valid=?x?, slayout=col_major>) outs(%11 : !pto.tile_buf<acc, 16x64xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %12 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %arg5], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%11 : !pto.tile_buf<acc, 16x64xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) outs(%12 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}

