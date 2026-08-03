// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_score_aic(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c1048576 = arith.constant 1048576 : index
  %c262144 = arith.constant 262144 : index
  %c0_i64 = arith.constant 0 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c2048 = arith.constant 2048 : index
  %c64 = arith.constant 64 : index
  %c8192 = arith.constant 8192 : index
  %c127 = arith.constant 127 : index
  %c4 = arith.constant 4 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c8 = arith.constant 8 : index
  %c32 = arith.constant 32 : index
  %0 = pto.make_tensor_view %arg0, shape = [%arg8], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c2048], strides = [%c262144, %c262144, %c262144, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c64], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = pto.import_reserved_buffer{name = "prefill_idx_score_c2v_slot_buffer", peer_func = @prefill_idx_score_aiv} -> i32
  %9 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, nosplit = true} (%8 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %10 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
  %11 = arith.index_cast %10 : i32 to index
  %12 = arith.addi %11, %c1 : index
  %13 = arith.divsi %12, %c4 : index
  %14 = arith.minsi %13, %c256 : index
  scf.for %arg9 = %c0 to %c8 step %c1 {
    %15 = arith.muli %arg9, %c32 : index
    %16 = arith.cmpi slt, %15, %14 : index
    scf.if %16 {
      %17 = arith.divsi %15, %c128 : index
      %18 = pto.load_scalar %arg2[%17] : !pto.ptr<i32, gm> -> i32
      %19 = arith.index_cast %18 : i32 to index
      %20 = arith.muli %19, %c128 : index
      %21 = arith.remsi %15, %c128 : index
      %22 = arith.addi %20, %21 : index
      %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<mat, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
      %24 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %22, %c0], sizes = [%c1, %c1, %c1, %c32, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
      pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x32x128xi8>) outs(%23 : !pto.tile_buf<mat, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      scf.for %arg10 = %c0 to %c128 step %c1 {
        %25 = arith.muli %arg10, %c64 : index
        %26 = pto.alloc_tile addr = %c4096_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<mat, 64x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
        %27 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %25, %c0], sizes = [%c1, %c1, %c1, %c64, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
        pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x64x128xi8>) outs(%26 : !pto.tile_buf<mat, 64x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %28 = pto.alloc_tile addr = %c4096_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>
        %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<left, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tmov ins(%23 : !pto.tile_buf<mat, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) outs(%29 : !pto.tile_buf<left, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %30 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>
        pto.tmov ins(%28 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>) outs(%30 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %31 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tmatmul ins(%29, %30 : !pto.tile_buf<left, 32x128xi8, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) outs(%31 : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        pto.tpush(%31, %9 : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
      }
    } else {
    }
  }
  return
}

