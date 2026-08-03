// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @split_pre_post(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: f32, %arg6: f32, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c512 = arith.constant 512 : index
  %c256_i64 = arith.constant 256 : i64
  %c288_i64 = arith.constant 288 : i64
  %c320_i64 = arith.constant 320 : i64
  %c0_i64 = arith.constant 0 : i64
  %c1 = arith.constant 1 : index
  %c24 = arith.constant 24 : index
  %c32 = arith.constant 32 : index
  %c8 = arith.constant 8 : index
  %c128 = arith.constant 128 : index
  %c4 = arith.constant 4 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 1.000000e+00 : f32
  %cst_0 = arith.constant 9.99999997E-7 : f32
  %cst_1 = arith.constant 2.000000e+00 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg7, %c1], strides = [%arg7, %arg7, %arg7, %c1, %arg7] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c24], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %2 = arith.muli %arg7, %c32 : index
  %3 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %arg7, %c32], strides = [%2, %2, %2, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.muli %arg7, %c8 : index
  %5 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %arg7, %c8], strides = [%4, %4, %4, %c8, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c4], strides = [%c512, %c512, %c512, %c4, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = arith.index_cast %arg8 : i32 to index
  %8 = arith.muli %7, %c8 : index
  %9 = pto.alloc_tile addr = %c256_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %10 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%10 : !pto.partition_tensor_view<1x1x1x8x1xf32>) outs(%9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c288_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %12 = pto.partition_view %1, offsets = [%c0], sizes = [%c8] : !pto.tensor_view<?xf32>
  pto.tload ins(%12 : !pto.partition_tensor_view<8xf32>) outs(%11 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %13 = pto.alloc_tile addr = %c288_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %14 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %15 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c8, %c8] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x8x8xf32>) outs(%14 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %16 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.trowexpandmul ins(%14, %9 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%16 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %17 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tmuls ins(%16, %arg5 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.tcolexpand ins(%13 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpand", postupdate = 0 : i64, tags = ["broadcast", "column"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpand", postupdate = 0 : i64, tags = ["broadcast", "column"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %19 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tadd ins(%17, %18 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %20 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.tneg ins(%19 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%20 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %21 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.texp ins(%20 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %22 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tadds ins(%21, %cst : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.trecip ins(%22 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %24 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tadds ins(%23, %cst_0 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %25 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c8, %c8] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%24 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%25 : !pto.partition_tensor_view<1x1x1x8x8xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %26 = pto.alloc_tile addr = %c288_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %27 = pto.partition_view %1, offsets = [%c4], sizes = [%c8] : !pto.tensor_view<?xf32>
  pto.tload ins(%27 : !pto.partition_tensor_view<8xf32>) outs(%26 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %28 = pto.alloc_tile addr = %c288_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %29 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %30 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %8, %c4], sizes = [%c1, %c1, %c1, %c8, %c8] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%30 : !pto.partition_tensor_view<1x1x1x8x8xf32>) outs(%29 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %31 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.trowexpandmul ins(%29, %9 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%31 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %32 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tmuls ins(%31, %arg6 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.tcolexpand ins(%28 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%33 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpand", postupdate = 0 : i64, tags = ["broadcast", "column"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpand", postupdate = 0 : i64, tags = ["broadcast", "column"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %34 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tadd ins(%32, %33 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %35 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.tneg ins(%34 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%35 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %36 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.texp ins(%35 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %37 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tadds ins(%36, %cst : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %38 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  pto.trecip ins(%37 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) outs(%38 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %39 = pto.fusion_region {
    %43 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
    pto.tmuls ins(%38, %cst_1 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>, f32) outs(%43 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%43) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %40 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c4 : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
  %41 = pto.subview %39[%c0, %c0] sizes [8, 8] valid [%c8, %c4] : !pto.tile_buf<vec, 8x8xf32, valid=?x?> -> !pto.tile_buf<vec, 8x8xf32, valid=8x4>
  %42 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c8, %c4] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%41 : !pto.tile_buf<vec, 8x8xf32, valid=8x4>) outs(%42 : !pto.partition_tensor_view<1x1x1x8x4xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

