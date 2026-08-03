// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_qr_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c524288 = arith.constant 524288 : index
  %c33280_i64 = arith.constant 33280 : i64
  %c24576_i64 = arith.constant 24576 : i64
  %c41472_i64 = arith.constant 41472 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c25088_i64 = arith.constant 25088 : i64
  %c24832_i64 = arith.constant 24832 : i64
  %c128 = arith.constant 128 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c8192 = arith.constant 8192 : index
  %c64 = arith.constant 64 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_0 = arith.constant 5.000000e-01 : f32
  %cst_1 = arith.constant 2.000000e+00 : f32
  %c4096 = arith.constant 4096 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c32], strides = [%c4096, %c4096, %c4096, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c32], strides = [%c4096, %c4096, %c4096, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8192, %c64], strides = [%c524288, %c524288, %c524288, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.muli %4, %c64 : index
  %6 = pto.alloc_tile addr = %c33280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %7 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%7 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%6 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %9 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%9 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%8 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %10 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%10 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%11 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%11 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%12 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %13 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%10, %12 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %14 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%13, %cst_0 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%14 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%15 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tcvt ins(%15 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xi32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>)
  %17 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%16 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %18 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%16, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %19 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tsub ins(%13, %18 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %20 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tadds ins(%13, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %21 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%19, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %22 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tsub ins(%20, %21 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %23 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%22 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %24 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%19, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%34 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %25 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tsubs ins(%24, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%25 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %26 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%26 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %27 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c25088_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%26, %6 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%34 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x32xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  %28 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%28 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %29 = pto.fusion_region {
    %34 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%28, %8 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%34 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%34) : (!pto.tile_buf<vec, 32x32xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  %30 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c32 step %c1 {
    %34 = pto.alloc_tile addr = %c25088_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %35 = pto.subview %27[%arg6, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 32x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %37 = pto.subview %17[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %38 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %39 = pto.alloc_tile addr = %c24832_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%35, %37, %38 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%39 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %40 = pto.subview %30[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%39 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%40 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 10 : i64} : 
  }
  %31 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %32 = pto.alloc_tile addr = %c25088_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c32 step %c1 {
    %34 = pto.alloc_tile addr = %c33280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %35 = pto.subview %29[%arg6, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 32x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %37 = pto.subview %17[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %38 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %39 = pto.alloc_tile addr = %c24832_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%35, %37, %38 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%39 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %40 = pto.subview %32[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%39 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%40 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 11 : i64} : 
  }
  %33 = pto.alloc_tile addr = %c25088_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c64 step %c32 {
    %34 = arith.addi %5, %arg6 : index
    %35 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %36 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %34, %c64], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%36 : !pto.partition_tensor_view<1x1x1x32x64xf32>) outs(%35 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %37 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    scf.for %arg7 = %c0 to %c32 step %c1 {
      %45 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      %46 = pto.subview %35[%arg7, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
      %47 = pto.alloc_tile addr = %c41472_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
      %48 = pto.subview %23[%arg7, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
      %49 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
      %50 = pto.alloc_tile addr = %c24832_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      pto.tgather ins(%46, %48, %49 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%50 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %51 = pto.subview %37[%arg7, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
      pto.fusion_region {
        pto.tmov ins(%50 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%51 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 17 : i64} : 
    }
    %38 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %39 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.tmul ins(%35, %31 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%45) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %40 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.tmul ins(%38, %25 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%45) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %41 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c33280_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.tmul ins(%40, %33 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%45) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %42 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.tadd ins(%39, %41 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%45) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    %43 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
      pto.tcvt ins(%42 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>)
      pto.yield(%45) : (!pto.tile_buf<vec, 32x64xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
    %44 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %34, %c0], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%43 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>) outs(%44 : !pto.partition_tensor_view<1x1x1x32x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}

