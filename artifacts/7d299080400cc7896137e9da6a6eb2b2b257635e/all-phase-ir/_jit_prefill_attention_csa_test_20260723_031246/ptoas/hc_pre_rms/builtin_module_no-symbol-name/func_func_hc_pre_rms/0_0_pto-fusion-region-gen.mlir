// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_pre_rms(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32832_i64 = arith.constant 32832 : i64
  %c49280_i64 = arith.constant 49280 : i64
  %c65664_i64 = arith.constant 65664 : i64
  %c82048_i64 = arith.constant 82048 : i64
  %c98432_i64 = arith.constant 98432 : i64
  %c114816_i64 = arith.constant 114816 : i64
  %c131200_i64 = arith.constant 131200 : i64
  %c0_i64 = arith.constant 0 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c16416_i64 = arith.constant 16416 : i64
  %c32800_i64 = arith.constant 32800 : i64
  %c32864_i64 = arith.constant 32864 : i64
  %c49248_i64 = arith.constant 49248 : i64
  %c16384 = arith.constant 16384 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c4 = arith.constant 4 : index
  %c512 = arith.constant 512 : index
  %c1024 = arith.constant 1024 : index
  %c1536 = arith.constant 1536 : index
  %cst_0 = arith.constant 6.10351563E-5 : f32
  %cst_1 = arith.constant 9.99999997E-7 : f32
  %0 = arith.muli %arg2, %c16384 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg2, %c16384], strides = [%0, %0, %0, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %arg3, %c1], strides = [%arg3, %arg3, %arg3, %c1, %arg3] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = arith.index_cast %arg4 : i32 to index
  %4 = arith.muli %3, %c8 : index
  %5 = pto.alloc_tile addr = %c32832_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%5 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg6 = %c0 to %c32 step %c4 {
    %11 = arith.muli %arg6, %c512 : index
    %12 = arith.muli %arg6, %c512 : index
    %13 = arith.addi %12, %c512 : index
    %14 = arith.muli %arg6, %c512 : index
    %15 = arith.addi %14, %c1024 : index
    %16 = arith.muli %arg6, %c512 : index
    %17 = arith.addi %16, %c1536 : index
    %18 = pto.alloc_tile addr = %c49280_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    %19 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %11], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%19 : !pto.partition_tensor_view<1x1x1x8x512xf32>) outs(%18 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %20 = pto.alloc_tile addr = %c65664_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    %21 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %13], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x8x512xf32>) outs(%20 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %22 = pto.alloc_tile addr = %c82048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    %23 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %15], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x8x512xf32>) outs(%22 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %24 = pto.alloc_tile addr = %c98432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    %25 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %17], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%25 : !pto.partition_tensor_view<1x1x1x8x512xf32>) outs(%24 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    pto.fusion_region {
      %26 = pto.alloc_tile addr = %c49280_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tmul ins(%18, %18 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %27 = pto.alloc_tile addr = %c114816_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %28 = pto.alloc_tile addr = %c131200_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%26, %27 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%28 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %29 = pto.alloc_tile addr = %c131200_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %30 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%5, %29 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%30 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %31 = pto.alloc_tile addr = %c65664_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tmul ins(%20, %20 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %32 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %33 = pto.alloc_tile addr = %c16384_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%31, %32 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%33 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %34 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %35 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%30, %34 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%35 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %36 = pto.alloc_tile addr = %c82048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tmul ins(%22, %22 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %37 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %38 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%36, %37 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%38 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %39 = pto.alloc_tile addr = %c32800_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %40 = pto.alloc_tile addr = %c82048_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%35, %39 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%40 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %41 = pto.alloc_tile addr = %c98432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tmul ins(%24, %24 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%41 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %42 = pto.alloc_tile addr = %c32864_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %43 = pto.alloc_tile addr = %c49248_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%41, %42 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %44 = pto.alloc_tile addr = %c49248_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %45 = pto.alloc_tile addr = %c32832_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%40, %44 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 1 : i64} :
  }
  %6 = pto.fusion_region {
    %11 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tmuls ins(%5, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%11 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %12 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tadds ins(%11, %cst_1 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%12 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%12) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %7 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %8 = pto.alloc_tile addr = %c82048_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.trsqrt ins(%6, %7 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], precisionType = #pto<rsqrt_precision default>, pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %9 = pto.alloc_tile addr = %c82048_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %10 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%10 : !pto.partition_tensor_view<1x1x1x8x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}
