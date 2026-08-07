// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_qr_hadamard_quant_aic(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c16384 = arith.constant 16384 : index
  %c524288 = arith.constant 524288 : index
  %c32768_i64 = arith.constant 32768 : i64
  %c40960_i64 = arith.constant 40960 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192 = arith.constant 8192 : index
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1048576 = arith.constant 1048576 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8192, %c64], strides = [%c524288, %c524288, %c524288, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = pto.reserve_buffer{name = "prefill_idx_qr_hadamard_quant_v2c_slot_buffer", size = 32768, location = <mat>, auto = false, base = 0} -> i32
  %6 = pto.import_reserved_buffer{name = "prefill_idx_qr_hadamard_quant_c2v_slot_buffer", peer_func = @prefill_idx_qr_hadamard_quant_aiv} -> i32
  %7 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 8192, slot_num = 4, nosplit = true} (%6 : i32, %5 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %8 = arith.index_cast %arg5 : i32 to index
  %9 = arith.muli %8, %c256 : index
  scf.for %arg7 = %c0 to %c256 step %c64 {
    %10 = pto.alloc_tile addr = %c32768_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    %11 = arith.addi %9, %arg7 : index
    %12 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %11, %c0], sizes = [%c1, %c1, %c1, %c64, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x64x64xbf16>) outs(%10 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, {id = 4 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_dn2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "dn2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %13 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    %14 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c64, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%14 : !pto.partition_tensor_view<1x1x1x64x128xbf16>) outs(%13 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %15 = pto.declare_tile -> !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tpop(%15, %7 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
    %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%15 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%16 : !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    pto.tfree(%7 : !pto.pipe) {split = 0}
    %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>
    pto.tmov ins(%13 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%17 : !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul ins(%16, %17 : !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>) outs(%18 : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %19 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    %20 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c64, %c0], sizes = [%c1, %c1, %c1, %c64, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%20 : !pto.partition_tensor_view<1x1x1x64x128xbf16>) outs(%19 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %21 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%10 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%21 : !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %22 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>
    pto.tmov ins(%19 : !pto.tile_buf<mat, 64x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) outs(%22 : !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul.acc ins(%23, %21, %22 : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 64x128xbf16, valid=?x?, slayout=col_major>) outs(%23 : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    scf.for %arg8 = %c0 to %c128 step %c32 {
      %24 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<acc, 64x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %25 = pto.subview %23[%c0, %arg8] sizes [64, 32] : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>
      pto.tpush(%25, %7 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
    }
    scf.for %arg8 = %c0 to %c128 step %c32 {
      %24 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<acc, 64x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      %25 = pto.subview %23[%c0, %arg8] sizes [64, 32] : !pto.tile_buf<acc, 64x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024> -> !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>
      pto.tpush(%25, %7 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
    }
  }
  return
}
