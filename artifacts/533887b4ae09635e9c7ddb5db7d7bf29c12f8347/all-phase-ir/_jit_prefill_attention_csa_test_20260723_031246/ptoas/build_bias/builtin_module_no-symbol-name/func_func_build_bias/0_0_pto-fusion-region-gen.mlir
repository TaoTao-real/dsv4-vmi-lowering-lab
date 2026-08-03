// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @build_bias(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c65536 = arith.constant 65536 : index
  %c49152 = arith.constant 49152 : index
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c384 = arith.constant 384 : index
  %c512 = arith.constant 512 : index
  %c16 = arith.constant 16 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 1.000000e+00 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %cst_1 = arith.constant 3.40282347E+38 : f32
  %c256 = arith.constant 256 : index
  %c16384 = arith.constant 16384 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c384], strides = [%c49152, %c49152, %c49152, %c384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = arith.index_cast %arg3 : i32 to index
  %4 = arith.muli %3, %c16 : index
  %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xi32, valid=?x?>
  %6 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c16, %c128] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%6 : !pto.partition_tensor_view<1x1x1x16x128xi32>) outs(%5 : !pto.tile_buf<vec, 16x128xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  pto.tcvt ins(%5 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x128xi32, valid=?x?>) outs(%7 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>)
  %8 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tadds ins(%7, %cst : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  %9 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tmaxs ins(%8, %cst_0 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  %10 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tmins ins(%9, %cst : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  pto.tsubs ins(%10, %cst : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, f32) outs(%11 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %12 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.tmuls ins(%11, %cst_1 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
  %13 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c16, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%12 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%13 : !pto.partition_tensor_view<1x1x1x16x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xi32, valid=?x?>
  %15 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %4, %c0], sizes = [%c1, %c1, %c1, %c16, %c256] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x16x256xi32>) outs(%14 : !pto.tile_buf<vec, 16x256xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  pto.tcvt ins(%14 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x256xi32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>)
  %17 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    pto.tadds ins(%16, %cst : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  %18 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    pto.tmaxs ins(%17, %cst_0 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  %19 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    pto.tmins ins(%18, %cst : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  %20 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  pto.tsubs ins(%19, %cst : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, f32) outs(%20 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %21 = pto.fusion_region {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
    pto.tmuls ins(%20, %cst_1 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>, f32) outs(%23 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%23) : (!pto.tile_buf<vec, 16x256xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
  %22 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %c128], sizes = [%c1, %c1, %c1, %c16, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%21 : !pto.tile_buf<vec, 16x256xf32, valid=?x?>) outs(%22 : !pto.partition_tensor_view<1x1x1x16x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

