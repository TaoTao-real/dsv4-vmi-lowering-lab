// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @score_mat(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i8, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
  %c1048576 = arith.constant 1048576 : index
  %c2097152 = arith.constant 2097152 : index
  %c65536 = arith.constant 65536 : index
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c24576_i64 = arith.constant 24576 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c4 = arith.constant 4 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c128 = arith.constant 128 : index
  %c32768 = arith.constant 32768 : index
  %c64 = arith.constant 64 : index
  %c256 = arith.constant 256 : index
  %c8192 = arith.constant 8192 : index
  %c2 = arith.constant 2 : index
  %c127 = arith.constant 127 : index
  %c0 = arith.constant 0 : index
  %c4096 = arith.constant 4096 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c4], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c512, %c128], strides = [%c65536, %c65536, %c65536, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c32768, %c64], strides = [%c2097152, %c2097152, %c2097152, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c256], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %5 = arith.index_cast %arg5 : i32 to index
  %6 = arith.divsi %5, %c2 : index
  %7 = arith.muli %6, %c2 : index
  %8 = arith.subi %5, %7 : index
  %9 = pto.load_scalar %arg0[%6] : !pto.ptr<i32, gm> -> i32
  %10 = arith.index_cast %9 : i32 to index
  %11 = arith.divsi %10, %c4 : index
  %12 = arith.addi %11, %c127 : index
  %13 = arith.divsi %12, %c128 : index
  %14 = arith.muli %6, %c128 : index
  %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<mat, 64x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
  %16 = arith.muli %8, %c64 : index
  %17 = arith.addi %14, %16 : index
  %18 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %17, %c0], sizes = [%c1, %c1, %c1, %c64, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
  pto.tload ins(%18 : !pto.partition_tensor_view<1x1x1x64x128xi8>) outs(%15 : !pto.tile_buf<mat, 64x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %19 = arith.divsi %13, %c2 : index
  %20 = arith.muli %19, %c2 : index
  scf.for %arg7 = %c0 to %20 step %c2 {
    %23 = arith.muli %arg7, %c128 : index
    %24 = arith.muli %6, %c64 : index
    %25 = arith.addi %24, %arg7 : index
    %26 = pto.load_scalar %arg3[%25] : !pto.ptr<i32, gm> -> i32
    %27 = arith.index_cast %26 : i32 to index
    %28 = arith.muli %27, %c128 : index
    %29 = arith.muli %5, %c4096 : index
    %30 = arith.addi %29, %23 : index
    %31 = arith.muli %arg7, %c128 : index
    %32 = arith.addi %31, %c128 : index
    %33 = arith.muli %6, %c64 : index
    %34 = arith.addi %arg7, %c1 : index
    %35 = arith.addi %33, %34 : index
    %36 = pto.load_scalar %arg3[%35] : !pto.ptr<i32, gm> -> i32
    %37 = arith.index_cast %36 : i32 to index
    %38 = arith.muli %37, %c128 : index
    %39 = arith.muli %5, %c4096 : index
    %40 = arith.addi %39, %32 : index
    %41 = pto.alloc_tile addr = %c8192_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    %42 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %28, %c0], sizes = [%c1, %c1, %c1, %c128, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
    pto.tload ins(%42 : !pto.partition_tensor_view<1x1x1x128x128xi8>) outs(%41 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, {id = 4 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_dn2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "dn2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %43 = pto.alloc_tile addr = %c24576_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    %44 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %38, %c0], sizes = [%c1, %c1, %c1, %c128, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
    pto.tload ins(%44 : !pto.partition_tensor_view<1x1x1x128x128xi8>) outs(%43 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, {id = 4 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_dn2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "dn2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %45 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>
    %46 = pto.alloc_tile addr = %c16384_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%41 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) outs(%46 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %47 = pto.alloc_tile addr = %c8192_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>
    pto.tmov ins(%45 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>) outs(%47 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %48 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul ins(%46, %47 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) outs(%48 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %49 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %30, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%48 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) outs(%49 : !pto.partition_tensor_view<1x1x1x128x64xi32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %50 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>
    %51 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%43 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) outs(%51 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %52 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>
    pto.tmov ins(%50 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>) outs(%52 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %53 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul ins(%51, %52 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) outs(%53 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %54 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %40, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%53 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) outs(%54 : !pto.partition_tensor_view<1x1x1x128x64xi32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %21 = arith.subi %13, %20 : index
  %22 = arith.cmpi eq, %21, %c1 : index
  scf.if %22 {
    %23 = arith.muli %20, %c128 : index
    %24 = arith.muli %6, %c64 : index
    %25 = arith.addi %24, %20 : index
    %26 = pto.load_scalar %arg3[%25] : !pto.ptr<i32, gm> -> i32
    %27 = arith.index_cast %26 : i32 to index
    %28 = arith.muli %27, %c128 : index
    %29 = arith.muli %5, %c4096 : index
    %30 = arith.addi %29, %23 : index
    %31 = pto.alloc_tile addr = %c8192_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    %32 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %28, %c0], sizes = [%c1, %c1, %c1, %c128, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
    pto.tload ins(%32 : !pto.partition_tensor_view<1x1x1x128x128xi8>) outs(%31 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, {id = 4 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_dn2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "dn2nz"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tload_gm_to_mat_nd2nz", postupdate = 0 : i64, tags = ["load", "gm", "mat", "nd2nz"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>
    %34 = pto.alloc_tile addr = %c16384_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tmov ins(%31 : !pto.tile_buf<mat, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) outs(%34 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 2 : i64, loop_depth = 1 : i64, name = "template_tmov_m2l", postupdate = 0 : i64, tags = ["move", "mat", "left"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %35 = pto.alloc_tile addr = %c8192_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>
    pto.tmov ins(%33 : !pto.tile_buf<mat, 128x64xi8, valid=?x?, slayout=col_major>) outs(%35 : !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) {candidates = [{id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 1 : i64, name = "template_tmov_m2r", postupdate = 0 : i64, tags = ["move", "mat", "right"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
    pto.tmatmul ins(%34, %35 : !pto.tile_buf<left, 128x128xi8, valid=?x?, blayout=col_major, slayout=row_major>, !pto.tile_buf<right, 128x64xi8, valid=?x?, slayout=col_major>) outs(%36 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tmatmul", postupdate = 0 : i64, tags = ["cube", "matmul"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %37 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %30, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%36 : !pto.tile_buf<acc, 128x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>) outs(%37 : !pto.partition_tensor_view<1x1x1x128x64xi32>) {candidates = [{id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 3 : i64, loop_depth = 0 : i64, name = "template_tstore_acc_to_gm_nz2nd", postupdate = 0 : i64, tags = ["store", "acc", "gm", "nz2nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
  }
  return
}
