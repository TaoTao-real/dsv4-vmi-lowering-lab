// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @proj_b_act(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c64 = arith.constant 64 : index
  %c524288 = arith.constant 524288 : index
  %c0_i64 = arith.constant 0 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c18432_i64 = arith.constant 18432 : i64
  %c34816_i64 = arith.constant 34816 : i64
  %c34848_i64 = arith.constant 34848 : i64
  %c51232_i64 = arith.constant 51232 : i64
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c32768 = arith.constant 32768 : index
  %c8 = arith.constant 8 : index
  %c512 = arith.constant 512 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c4096], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c16, %c32768], strides = [%c524288, %c524288, %c524288, %c32768, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c8], strides = [%c64, %c64, %c64, %c8, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.muli %4, %c512 : index
  %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  %7 = pto.partition_view %0, offsets = [%5], sizes = [%c512] : !pto.tensor_view<?xf32>
  pto.tload ins(%7 : !pto.partition_tensor_view<512xf32>) outs(%6 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  %9 = pto.fusion_region {
    %12 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%12 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%12) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c8 step %c2 {
    %12 = arith.muli %arg6, %c4096 : index
    %13 = arith.addi %12, %5 : index
    %14 = arith.muli %arg6, %c4096 : index
    %15 = arith.addi %14, %5 : index
    %16 = arith.addi %15, %c4096 : index
    %17 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
    %18 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %13], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%18 : !pto.partition_tensor_view<1x1x1x8x512xi32>) outs(%17 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %19 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %20 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %arg6, %c0], sizes = [%c1, %c1, %c1, %c1, %c8] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%20 : !pto.partition_tensor_view<1x1x1x1x8xf32>) outs(%19 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %21 = pto.alloc_tile addr = %c34848_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
    %22 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %16], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%22 : !pto.partition_tensor_view<1x1x1x8x512xi32>) outs(%21 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %23 = pto.alloc_tile addr = %c51232_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %24 = arith.addi %arg6, %c1 : index
    %25 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c8] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%25 : !pto.partition_tensor_view<1x1x1x1x8xf32>) outs(%23 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %26 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    pto.fusion_region {
      %27 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tcvt ins(%17 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
      %28 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.trowexpandmul ins(%27, %26 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%28 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %29 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tadd ins(%9, %28 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%29 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %30 = pto.alloc_tile addr = %c51232_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      %31 = pto.alloc_tile addr = %c34848_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tcvt ins(%21 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
      %32 = pto.alloc_tile addr = %c34848_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.trowexpandmul ins(%31, %30 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%32 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %33 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tadd ins(%29, %32 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%33 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 2 : i64} :
  }
  %10 = pto.fusion_region {
    %12 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tcolexpandmul ins(%9, %8 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%12 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %13 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>
    pto.tcvt ins(%12 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%13 : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>)
    pto.yield(%13) : (!pto.tile_buf<vec, 8x512xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>
  %11 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %c0, %5], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tstore ins(%10 : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>) outs(%11 : !pto.partition_tensor_view<1x1x1x8x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}
