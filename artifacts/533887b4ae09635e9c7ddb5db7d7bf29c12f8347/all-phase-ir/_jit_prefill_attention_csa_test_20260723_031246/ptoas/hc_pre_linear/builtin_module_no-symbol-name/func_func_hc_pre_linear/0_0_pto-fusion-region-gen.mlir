// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_pre_linear(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c393216 = arith.constant 393216 : index
  %c0_i64 = arith.constant 0 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c49152_i64 = arith.constant 49152 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c16384 = arith.constant 16384 : index
  %c1 = arith.constant 1 : index
  %c24 = arith.constant 24 : index
  %c32 = arith.constant 32 : index
  %c4 = arith.constant 4 : index
  %c16 = arith.constant 16 : index
  %c4096 = arith.constant 4096 : index
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c256 = arith.constant 256 : index
  %0 = arith.muli %arg4, %c16384 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg4, %c16384], strides = [%0, %0, %0, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c24, %c16384], strides = [%c393216, %c393216, %c393216, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = arith.muli %arg5, %c32 : index
  %4 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %arg5, %c32], strides = [%3, %3, %3, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  %6 = arith.index_cast %arg6 : i32 to index
  %7 = arith.divsi %6, %c4 : index
  %8 = arith.muli %7, %c16 : index
  %9 = arith.remsi %6, %c4 : index
  %10 = arith.muli %9, %c4096 : index
  %11 = arith.subi %arg4, %8 : index
  %12 = arith.minsi %11, %c16 : index
  %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
  scf.for %arg8 = %c0 to %c16 step %c2 {
    %15 = arith.muli %arg8, %c256 : index
    %16 = arith.addi %10, %15 : index
    %17 = arith.muli %arg8, %c256 : index
    %18 = arith.addi %17, %c256 : index
    %19 = arith.addi %10, %18 : index
    %20 = pto.alloc_tile addr = %c0_i64 valid_row = %12 valid_col = %c256 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
    %21 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %8, %16], sizes = [%c1, %c1, %c1, %12, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x?x256xf32>) outs(%20 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %22 = pto.alloc_tile addr = %c16384_i64 valid_row = %c24 valid_col = %c256 : !pto.tile_buf<mat, 32x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
    %23 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %16], sizes = [%c1, %c1, %c1, %c24, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x24x256xf32>) outs(%22 : !pto.tile_buf<mat, 32x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %24 = pto.alloc_tile addr = %c49152_i64 valid_row = %12 valid_col = %c256 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
    %25 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %8, %19], sizes = [%c1, %c1, %c1, %12, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%25 : !pto.partition_tensor_view<1x1x1x?x256xf32>) outs(%24 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %26 = pto.alloc_tile addr = %c65536_i64 valid_row = %c24 valid_col = %c256 : !pto.tile_buf<mat, 32x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
    %27 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %19], sizes = [%c1, %c1, %c1, %c24, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x24x256xf32>) outs(%26 : !pto.tile_buf<mat, 32x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %28 = arith.cmpi eq, %arg8, %c0 : index
    scf.if %28 {
      %33 = pto.alloc_tile addr = %c16384_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>
      %34 = pto.alloc_tile addr = %c16384_i64 valid_row = %12 valid_col = %c256 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
      pto.tmov ins(%20 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) outs(%34 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %35 = pto.alloc_tile addr = %c32768_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>
      pto.tmov ins(%33 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>) outs(%35 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      pto.tmatmul ins(%34, %35 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) outs(%36 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
      %33 = pto.alloc_tile addr = %c16384_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>
      %34 = pto.alloc_tile addr = %c16384_i64 valid_row = %12 valid_col = %c256 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
      pto.tmov ins(%20 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) outs(%34 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %35 = pto.alloc_tile addr = %c32768_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>
      pto.tmov ins(%33 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>) outs(%35 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      pto.tmatmul.acc ins(%36, %34, %35 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) outs(%36 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
    %29 = pto.alloc_tile addr = %c65536_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>
    %30 = pto.alloc_tile addr = %c0_i64 valid_row = %12 valid_col = %c256 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%24 : !pto.tile_buf<mat, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) outs(%30 : !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %31 = pto.alloc_tile addr = %c0_i64 valid_row = %c256 valid_col = %c24 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>
    pto.tmov ins(%29 : !pto.tile_buf<mat, 256x32xf32, valid=?x?, slayout=col_major>) outs(%31 : !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %32 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul.acc ins(%32, %30, %31 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.tile_buf<left, 16x256xf32, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 256x32xf32, valid=?x?, slayout=col_major>) outs(%32 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul_acc", postupdate = 0 : i64, tags = ["cube", "matmul", "acc"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %14 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c16, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%13 : !pto.tile_buf<acc, 16x32xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) outs(%14 : !pto.partition_tensor_view<1x1x1x16x32xf32>) {atomicType = #pto<atomic_type atomic_add>, candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

