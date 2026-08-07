// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @kv_and_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i64, gm>, %arg5: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1024 = arith.constant 1024 : index
  %c1048576 = arith.constant 1048576 : index
  %c8256_i64 = arith.constant 8256 : i64
  %c16448_i64 = arith.constant 16448 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c16 = arith.constant 16 : index
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c8192 = arith.constant 8192 : index
  %c8 = arith.constant 8 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 9.99999974E-5 : f32
  %cst_0 = arith.constant 1.270000e+02 : f32
  %c3 = arith.constant 3 : index
  %c2048 = arith.constant 2048 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c16, %c128], strides = [%c2048, %c2048, %c2048, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c128], strides = [%c1024, %c1024, %c1024, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi64>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  %7 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c16, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%7 : !pto.partition_tensor_view<1x1x1x16x128xf32>) outs(%6 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8:2 = pto.fusion_region {
    %16 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xbf16, valid=?x?>
    pto.tcvt ins(%6 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 16x128xbf16, valid=?x?>)
    %17 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tcvt ins(%16 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xbf16, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>)
    %18 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tabs ins(%17 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tabs", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tabs", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %19 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    %20 = pto.alloc_tile addr = %c8192_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    pto.trowmax ins(%18, %19 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%20 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %21 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %22 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%22 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %23 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmax ins(%21, %22 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %24 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%24 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %25 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tdiv ins(%24, %23 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%25 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%17, %25) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.trecip ins(%8#1 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%9 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %11 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %12 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  pto.trowexpandmul ins(%8#0, %11 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%12 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %13 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xi32, valid=?x?>
  pto.tcvt ins(%12 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%13 : !pto.tile_buf<vec, 16x128xi32, valid=?x?>)
  %14 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf16, valid=?x?>
  pto.tcvt ins(%13 {candidates = [{id = 38 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 38 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xi32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 16x128xf16, valid=?x?>)
  %15 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xi8, valid=?x?>
  pto.tcvt ins(%14 {candidates = [{id = 19 : i64, loop_depth = 2 : i64, name = "template_tcvt_f16_to_si8", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 19 : i64, loop_depth = 2 : i64, name = "template_tcvt_f16_to_si8", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xf16, valid=?x?>) outs(%15 : !pto.tile_buf<vec, 16x128xi8, valid=?x?>)
  scf.for %arg6 = %c0 to %c4 step %c1 {
    %16 = arith.muli %arg6, %c2 : index
    %17 = pto.load_scalar %arg3[%16] : !pto.ptr<i32, gm> -> i32
    %18 = arith.index_cast %17 : i32 to index
    %19 = arith.remsi %18, %c4 : index
    %20 = arith.cmpi sge, %19, %c2 : index
    scf.if %20 {
      %21 = arith.subi %c3, %19 : index
      %22 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %23 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %arg6, %c0], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x1x128xf32>) outs(%22 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %24 = arith.muli %arg6, %c2 : index
      %25 = arith.addi %24, %21 : index
      %26 = pto.load_scalar %arg4[%25] : !pto.ptr<i64, gm> -> i64
      %27 = arith.index_cast %26 : i64 to index
      %28 = arith.cmpi sge, %27, %c0 : index
      scf.if %28 {
        %29 = arith.index_cast %26 : i64 to index
        %30 = arith.muli %arg6, %c2 : index
        %31 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %30, %c0], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%22 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%31 : !pto.partition_tensor_view<1x1x1x1x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %32 = pto.alloc_tile addr = %c8256_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xi8, valid=?x?>
        %33 = pto.subview %15[%arg6, %c0] sizes [1, 128] : !pto.tile_buf<vec, 16x128xi8, valid=?x?> -> !pto.tile_buf<vec, 1x128xi8>
        %34 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %29, %c0], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xi8>
        pto.tstore ins(%33 : !pto.tile_buf<vec, 1x128xi8>) outs(%34 : !pto.partition_tensor_view<1x1x1x1x128xi8>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %35 = pto.tgetval ins(%10, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
        pto.store_scalar %35, %arg5[%29] : !pto.ptr<f32, gm>, f32
      } else {
      }
    } else {
    }
  }
  return
}
