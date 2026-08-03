// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qr_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c65536 = arith.constant 65536 : index
  %c24576_i64 = arith.constant 24576 : i64
  %c28672_i64 = arith.constant 28672 : i64
  %c37376_i64 = arith.constant 37376 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c29184_i64 = arith.constant 29184 : i64
  %c28928_i64 = arith.constant 28928 : i64
  %c4 = arith.constant 4 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c128 = arith.constant 128 : index
  %c0 = arith.constant 0 : index
  %c64 = arith.constant 64 : index
  %cst = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_0 = arith.constant 5.000000e-01 : f32
  %cst_1 = arith.constant 2.000000e+00 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c512, %c128], strides = [%c65536, %c65536, %c65536, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c512, %c128], strides = [%c65536, %c65536, %c65536, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.muli %4, %c32 : index
  %6 = arith.divsi %5, %c128 : index
  %7 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %8 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%8 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%7 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %9 = pto.alloc_tile addr = %c28672_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %10 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%10 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%9 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%11 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%12 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%12 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%13 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %14 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%11, %13 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %15 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%14, %cst_0 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%15 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tcvt ins(%16 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xi32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>)
  %18 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%17 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %19 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%17, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %20 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tsub ins(%14, %19 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %21 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tadds ins(%14, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %22 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%20, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %23 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tsub ins(%21, %22 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %24 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>
  pto.tcvt ins(%23 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>)
  %25 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmuls ins(%20, %cst_1 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  pto.tsubs ins(%25, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%26 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %27 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%27 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %28 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c29184_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%27, %7 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x32xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  %29 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%29 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %30 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c24576_i64 valid_row = %c32 valid_col = %c32 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%29, %9 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x32xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 32x32xf32, valid=?x?>
  %31 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c32 step %c1 {
    %49 = pto.alloc_tile addr = %c29184_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %50 = pto.subview %28[%arg6, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 32x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %51 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %52 = pto.subview %18[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %53 = pto.alloc_tile addr = %c28672_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %54 = pto.alloc_tile addr = %c28928_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%50, %52, %53 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %55 = pto.subview %31[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%55 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 16 : i64} : 
  }
  %32 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %33 = pto.alloc_tile addr = %c29184_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c32 step %c1 {
    %49 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %50 = pto.subview %30[%arg6, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 32x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %51 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %52 = pto.subview %18[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %53 = pto.alloc_tile addr = %c28672_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %54 = pto.alloc_tile addr = %c28928_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%50, %52, %53 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %55 = pto.subview %33[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%55 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 17 : i64} : 
  }
  %34 = pto.alloc_tile addr = %c29184_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %35 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmul ins(%34, %26 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %37 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%37 : !pto.partition_tensor_view<1x1x1x32x64xf32>) outs(%36 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %38 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
    pto.tcvt ins(%36 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>)
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
  %39 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tstore ins(%38 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>) outs(%39 : !pto.partition_tensor_view<1x1x1x32x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %40 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %41 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %5, %c64], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%41 : !pto.partition_tensor_view<1x1x1x32x64xf32>) outs(%40 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %42 = pto.alloc_tile addr = %c29184_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  scf.for %arg6 = %c0 to %c32 step %c1 {
    %49 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %50 = pto.subview %40[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    %51 = pto.alloc_tile addr = %c37376_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %52 = pto.subview %24[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %53 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %54 = pto.alloc_tile addr = %c28672_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%50, %52, %53 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %55 = pto.subview %42[%arg6, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 32x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%55 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 18 : i64} : 
  }
  %43 = pto.alloc_tile addr = %c29184_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %44 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmul ins(%40, %32 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %45 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tmul ins(%43, %35 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %46 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
    pto.tadd ins(%44, %45 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
  %47 = pto.fusion_region {
    %49 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
    pto.tcvt ins(%46 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>)
    pto.yield(%49) : (!pto.tile_buf<vec, 32x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
  %48 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %5, %c64], sizes = [%c1, %c1, %c1, %c32, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tstore ins(%47 : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>) outs(%48 : !pto.partition_tensor_view<1x1x1x32x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

