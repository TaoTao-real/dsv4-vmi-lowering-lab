// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @csa_slots_build_valid_qk_plan(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c39_i32 = arith.constant 39 : i32
  %c38_i32 = arith.constant 38 : i32
  %c37_i32 = arith.constant 37 : i32
  %c36_i32 = arith.constant 36 : i32
  %c35_i32 = arith.constant 35 : i32
  %c34_i32 = arith.constant 34 : i32
  %c33_i32 = arith.constant 33 : i32
  %c32_i32 = arith.constant 32 : i32
  %c31_i32 = arith.constant 31 : i32
  %c30_i32 = arith.constant 30 : i32
  %c29_i32 = arith.constant 29 : i32
  %c28_i32 = arith.constant 28 : i32
  %c27_i32 = arith.constant 27 : i32
  %c26_i32 = arith.constant 26 : i32
  %c25_i32 = arith.constant 25 : i32
  %c24_i32 = arith.constant 24 : i32
  %c23_i32 = arith.constant 23 : i32
  %c22_i32 = arith.constant 22 : i32
  %c21_i32 = arith.constant 21 : i32
  %c20_i32 = arith.constant 20 : i32
  %c19_i32 = arith.constant 19 : i32
  %c18_i32 = arith.constant 18 : i32
  %c17_i32 = arith.constant 17 : i32
  %c16_i32 = arith.constant 16 : i32
  %c15_i32 = arith.constant 15 : i32
  %c14_i32 = arith.constant 14 : i32
  %c13_i32 = arith.constant 13 : i32
  %c12_i32 = arith.constant 12 : i32
  %c11_i32 = arith.constant 11 : i32
  %c10_i32 = arith.constant 10 : i32
  %c9_i32 = arith.constant 9 : i32
  %c8_i32 = arith.constant 8 : i32
  %c7_i32 = arith.constant 7 : i32
  %c6_i32 = arith.constant 6 : i32
  %c5_i32 = arith.constant 5 : i32
  %c4_i32 = arith.constant 4 : i32
  %c3_i32 = arith.constant 3 : i32
  %c2_i32 = arith.constant 2 : i32
  %c0_i32 = arith.constant 0 : i32
  %c1_i32 = arith.constant 1 : i32
  %c5120 = arith.constant 5120 : index
  %c1024 = arith.constant 1024 : index
  %c32800_i64 = arith.constant 32800 : i64
  %c0_i64 = arith.constant 0 : i64
  %c32_i64 = arith.constant 32 : i64
  %c16416_i64 = arith.constant 16416 : i64
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c5 = arith.constant 5 : index
  %c128 = arith.constant 128 : index
  %c640 = arith.constant 640 : index
  %c40 = arith.constant 40 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 1.000000e+00 : f32
  %cst_0 = arith.constant 2.500000e-01 : f32
  %cst_1 = arith.constant 0.000000e+00 : f32
  %cst_2 = arith.constant 1.000000e+20 : f32
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %c6 = arith.constant 6 : index
  %c7 = arith.constant 7 : index
  %c9 = arith.constant 9 : index
  %c10 = arith.constant 10 : index
  %c11 = arith.constant 11 : index
  %c12 = arith.constant 12 : index
  %c13 = arith.constant 13 : index
  %c14 = arith.constant 14 : index
  %c15 = arith.constant 15 : index
  %c16 = arith.constant 16 : index
  %c17 = arith.constant 17 : index
  %c18 = arith.constant 18 : index
  %c19 = arith.constant 19 : index
  %c20 = arith.constant 20 : index
  %c21 = arith.constant 21 : index
  %c22 = arith.constant 22 : index
  %c23 = arith.constant 23 : index
  %c24 = arith.constant 24 : index
  %c25 = arith.constant 25 : index
  %c26 = arith.constant 26 : index
  %c27 = arith.constant 27 : index
  %c28 = arith.constant 28 : index
  %c29 = arith.constant 29 : index
  %c30 = arith.constant 30 : index
  %c31 = arith.constant 31 : index
  %c32 = arith.constant 32 : index
  %c33 = arith.constant 33 : index
  %c34 = arith.constant 34 : index
  %c35 = arith.constant 35 : index
  %c36 = arith.constant 36 : index
  %c37 = arith.constant 37 : index
  %c38 = arith.constant 38 : index
  %c39 = arith.constant 39 : index
  %c32768 = arith.constant 32768 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c8, %c1], strides = [%c8, %c8, %c8, %c1, %c8] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c512], strides = [%c4096, %c4096, %c4096, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c5], strides = [%c40, %c40, %c40, %c5, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8, %c128], strides = [%c1024, %c1024, %c1024, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8, %c640], strides = [%c5120, %c5120, %c5120, %c640, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %7 = pto.make_tensor_view %arg7, shape = [%c40], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %8 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
  %9 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%9 : !pto.partition_tensor_view<1x1x1x8x512xi32>) outs(%8 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %10 = pto.fusion_region {
    %276 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tcvt ins(%8 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%276 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
    pto.yield(%276) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>
  %12 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x8x1xi32>) outs(%11 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
  %14 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.tcvt ins(%13 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xi32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>)
  %15 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %16 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %17 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.tadds ins(%16, %cst : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%17 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %18 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %19 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %20 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.tmuls ins(%19, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%20 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %21 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %22 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %23 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
  pto.tcvt ins(%22 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>)
  %24 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>
  %25 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
  %26 = pto.alloc_tile addr = %c16416_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.tcvt ins(%25 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xi32, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>)
  %27 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %28:3 = pto.fusion_region {
    %276 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%276 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %277 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.trowexpandmul ins(%276, %27 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%277 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %278 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tadds ins(%10, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%278 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %279 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmaxs ins(%278, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%279 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %280 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%279, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%280 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %281 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tsub ins(%277, %10 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%281 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %282 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmaxs ins(%281, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%282 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %283 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%282, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%283 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %284 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmul ins(%280, %283 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%284 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %285 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tadds ins(%10, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%285 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %286 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmul ins(%284, %285 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%286 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %287 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tsubs ins(%286, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%287 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsubs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsubs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %288 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
    pto.tcvt ins(%287 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%288 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>)
    pto.yield(%284, %287, %288) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xi32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xi32, valid=?x?>
  %29 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tstore ins(%28#2 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%29 : !pto.partition_tensor_view<1x1x1x8x512xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  scf.for %arg8 = %c0 to %c8 step %c1 {
    %276 = arith.muli %arg8, %c5 : index
    pto.store_scalar %c1_i32, %arg3[%276] : !pto.ptr<i32, gm>, i32
  }
  scf.for %arg8 = %c1 to %c5 step %c1 {
    %276 = arith.subi %arg8, %c1 : index
    %277 = arith.muli %276, %c128 : index
    %278 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %279 = pto.subview %28#0[%c0, %277] sizes [8, 128] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x128xf32>
    %280 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %281 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    pto.trowmax ins(%279, %280 : !pto.tile_buf<vec, 8x128xf32>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%281 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    scf.for %arg9 = %c0 to %c8 step %c1 {
      %282 = pto.tgetval ins(%281, %arg9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
      %283 = arith.fptosi %282 : f32 to i32
      %284 = arith.muli %arg9, %c5 : index
      %285 = arith.addi %284, %arg8 : index
      pto.store_scalar %283, %arg3[%285] : !pto.ptr<i32, gm>, i32
    }
  }
  %30 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xi32, valid=?x?>
  %31 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%31 : !pto.partition_tensor_view<1x1x1x8x128xi32>) outs(%30 : !pto.tile_buf<vec, 8x128xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %32 = pto.fusion_region {
    %276 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tcvt ins(%30 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xi32, valid=?x?>) outs(%276 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
    %277 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tadds ins(%276, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%277 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %278 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmaxs ins(%277, %cst_1 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%278 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %279 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmins ins(%278, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%279 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %280 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tsubs ins(%279, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%280 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsubs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsubs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %281 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmuls ins(%280, %cst_2 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%281 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%281) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
  %33 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%32 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%33 : !pto.partition_tensor_view<1x1x1x8x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %34 = pto.fusion_region {
    %276 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%28#1, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%276 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %277 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmuls ins(%276, %cst_2 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%277 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%277) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  %35 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c128], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%34 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%35 : !pto.partition_tensor_view<1x1x1x8x512xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  pto.store_scalar %c0_i32, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  %36 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
  %37 = arith.index_cast %36 : i32 to index
  %38 = arith.cmpi sgt, %37, %c0 : index
  scf.if %38 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c0_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %39 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
  %40 = arith.index_cast %39 : i32 to index
  %41 = arith.cmpi sgt, %40, %c0 : index
  scf.if %41 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c1_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %42 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
  %43 = arith.index_cast %42 : i32 to index
  %44 = arith.cmpi sgt, %43, %c0 : index
  scf.if %44 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c2_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %45 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
  %46 = arith.index_cast %45 : i32 to index
  %47 = arith.cmpi sgt, %46, %c0 : index
  scf.if %47 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c3_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %48 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
  %49 = arith.index_cast %48 : i32 to index
  %50 = arith.cmpi sgt, %49, %c0 : index
  scf.if %50 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c4_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %51 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
  %52 = arith.index_cast %51 : i32 to index
  %53 = arith.cmpi sgt, %52, %c0 : index
  scf.if %53 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c5_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %54 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
  %55 = arith.index_cast %54 : i32 to index
  %56 = arith.cmpi sgt, %55, %c0 : index
  scf.if %56 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c6_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %57 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
  %58 = arith.index_cast %57 : i32 to index
  %59 = arith.cmpi sgt, %58, %c0 : index
  scf.if %59 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c7_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %60 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
  %61 = arith.index_cast %60 : i32 to index
  %62 = arith.cmpi sgt, %61, %c0 : index
  scf.if %62 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c8_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %63 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
  %64 = arith.index_cast %63 : i32 to index
  %65 = arith.cmpi sgt, %64, %c0 : index
  scf.if %65 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c9_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %66 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
  %67 = arith.index_cast %66 : i32 to index
  %68 = arith.cmpi sgt, %67, %c0 : index
  scf.if %68 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c10_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %69 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
  %70 = arith.index_cast %69 : i32 to index
  %71 = arith.cmpi sgt, %70, %c0 : index
  scf.if %71 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c11_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %72 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
  %73 = arith.index_cast %72 : i32 to index
  %74 = arith.cmpi sgt, %73, %c0 : index
  scf.if %74 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c12_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %75 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
  %76 = arith.index_cast %75 : i32 to index
  %77 = arith.cmpi sgt, %76, %c0 : index
  scf.if %77 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c13_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %78 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
  %79 = arith.index_cast %78 : i32 to index
  %80 = arith.cmpi sgt, %79, %c0 : index
  scf.if %80 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c14_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %81 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
  %82 = arith.index_cast %81 : i32 to index
  %83 = arith.cmpi sgt, %82, %c0 : index
  scf.if %83 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c15_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %84 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
  %85 = arith.index_cast %84 : i32 to index
  %86 = arith.cmpi sgt, %85, %c0 : index
  scf.if %86 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c16_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %87 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
  %88 = arith.index_cast %87 : i32 to index
  %89 = arith.cmpi sgt, %88, %c0 : index
  scf.if %89 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c17_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %90 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
  %91 = arith.index_cast %90 : i32 to index
  %92 = arith.cmpi sgt, %91, %c0 : index
  scf.if %92 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c18_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %93 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
  %94 = arith.index_cast %93 : i32 to index
  %95 = arith.cmpi sgt, %94, %c0 : index
  scf.if %95 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c19_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %96 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
  %97 = arith.index_cast %96 : i32 to index
  %98 = arith.cmpi sgt, %97, %c0 : index
  scf.if %98 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c20_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %99 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
  %100 = arith.index_cast %99 : i32 to index
  %101 = arith.cmpi sgt, %100, %c0 : index
  scf.if %101 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c21_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %102 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
  %103 = arith.index_cast %102 : i32 to index
  %104 = arith.cmpi sgt, %103, %c0 : index
  scf.if %104 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c22_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %105 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
  %106 = arith.index_cast %105 : i32 to index
  %107 = arith.cmpi sgt, %106, %c0 : index
  scf.if %107 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c23_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %108 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
  %109 = arith.index_cast %108 : i32 to index
  %110 = arith.cmpi sgt, %109, %c0 : index
  scf.if %110 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c24_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %111 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
  %112 = arith.index_cast %111 : i32 to index
  %113 = arith.cmpi sgt, %112, %c0 : index
  scf.if %113 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c25_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %114 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
  %115 = arith.index_cast %114 : i32 to index
  %116 = arith.cmpi sgt, %115, %c0 : index
  scf.if %116 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c26_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %117 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
  %118 = arith.index_cast %117 : i32 to index
  %119 = arith.cmpi sgt, %118, %c0 : index
  scf.if %119 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c27_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %120 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
  %121 = arith.index_cast %120 : i32 to index
  %122 = arith.cmpi sgt, %121, %c0 : index
  scf.if %122 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c28_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %123 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
  %124 = arith.index_cast %123 : i32 to index
  %125 = arith.cmpi sgt, %124, %c0 : index
  scf.if %125 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c29_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %126 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
  %127 = arith.index_cast %126 : i32 to index
  %128 = arith.cmpi sgt, %127, %c0 : index
  scf.if %128 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c30_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %129 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
  %130 = arith.index_cast %129 : i32 to index
  %131 = arith.cmpi sgt, %130, %c0 : index
  scf.if %131 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c31_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %132 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
  %133 = arith.index_cast %132 : i32 to index
  %134 = arith.cmpi sgt, %133, %c0 : index
  scf.if %134 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c32_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %135 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
  %136 = arith.index_cast %135 : i32 to index
  %137 = arith.cmpi sgt, %136, %c0 : index
  scf.if %137 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c33_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %138 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
  %139 = arith.index_cast %138 : i32 to index
  %140 = arith.cmpi sgt, %139, %c0 : index
  scf.if %140 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c34_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %141 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
  %142 = arith.index_cast %141 : i32 to index
  %143 = arith.cmpi sgt, %142, %c0 : index
  scf.if %143 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c35_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %144 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
  %145 = arith.index_cast %144 : i32 to index
  %146 = arith.cmpi sgt, %145, %c0 : index
  scf.if %146 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c36_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %147 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
  %148 = arith.index_cast %147 : i32 to index
  %149 = arith.cmpi sgt, %148, %c0 : index
  scf.if %149 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c37_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %150 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
  %151 = arith.index_cast %150 : i32 to index
  %152 = arith.cmpi sgt, %151, %c0 : index
  scf.if %152 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c38_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %153 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
  %154 = arith.index_cast %153 : i32 to index
  %155 = arith.cmpi sgt, %154, %c0 : index
  scf.if %155 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c39_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %156 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
  %157 = arith.index_cast %156 : i32 to index
  %158 = arith.cmpi sle, %157, %c0 : index
  scf.if %158 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c0_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %159 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
  %160 = arith.index_cast %159 : i32 to index
  %161 = arith.cmpi sle, %160, %c0 : index
  scf.if %161 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c1_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %162 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
  %163 = arith.index_cast %162 : i32 to index
  %164 = arith.cmpi sle, %163, %c0 : index
  scf.if %164 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c2_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %165 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
  %166 = arith.index_cast %165 : i32 to index
  %167 = arith.cmpi sle, %166, %c0 : index
  scf.if %167 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c3_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %168 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
  %169 = arith.index_cast %168 : i32 to index
  %170 = arith.cmpi sle, %169, %c0 : index
  scf.if %170 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c4_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %171 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
  %172 = arith.index_cast %171 : i32 to index
  %173 = arith.cmpi sle, %172, %c0 : index
  scf.if %173 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c5_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %174 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
  %175 = arith.index_cast %174 : i32 to index
  %176 = arith.cmpi sle, %175, %c0 : index
  scf.if %176 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c6_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %177 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
  %178 = arith.index_cast %177 : i32 to index
  %179 = arith.cmpi sle, %178, %c0 : index
  scf.if %179 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c7_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %180 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
  %181 = arith.index_cast %180 : i32 to index
  %182 = arith.cmpi sle, %181, %c0 : index
  scf.if %182 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c8_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %183 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
  %184 = arith.index_cast %183 : i32 to index
  %185 = arith.cmpi sle, %184, %c0 : index
  scf.if %185 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c9_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %186 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
  %187 = arith.index_cast %186 : i32 to index
  %188 = arith.cmpi sle, %187, %c0 : index
  scf.if %188 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c10_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %189 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
  %190 = arith.index_cast %189 : i32 to index
  %191 = arith.cmpi sle, %190, %c0 : index
  scf.if %191 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c11_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %192 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
  %193 = arith.index_cast %192 : i32 to index
  %194 = arith.cmpi sle, %193, %c0 : index
  scf.if %194 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c12_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %195 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
  %196 = arith.index_cast %195 : i32 to index
  %197 = arith.cmpi sle, %196, %c0 : index
  scf.if %197 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c13_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %198 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
  %199 = arith.index_cast %198 : i32 to index
  %200 = arith.cmpi sle, %199, %c0 : index
  scf.if %200 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c14_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %201 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
  %202 = arith.index_cast %201 : i32 to index
  %203 = arith.cmpi sle, %202, %c0 : index
  scf.if %203 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c15_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %204 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
  %205 = arith.index_cast %204 : i32 to index
  %206 = arith.cmpi sle, %205, %c0 : index
  scf.if %206 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c16_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %207 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
  %208 = arith.index_cast %207 : i32 to index
  %209 = arith.cmpi sle, %208, %c0 : index
  scf.if %209 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c17_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %210 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
  %211 = arith.index_cast %210 : i32 to index
  %212 = arith.cmpi sle, %211, %c0 : index
  scf.if %212 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c18_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %213 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
  %214 = arith.index_cast %213 : i32 to index
  %215 = arith.cmpi sle, %214, %c0 : index
  scf.if %215 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c19_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %216 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
  %217 = arith.index_cast %216 : i32 to index
  %218 = arith.cmpi sle, %217, %c0 : index
  scf.if %218 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c20_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %219 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
  %220 = arith.index_cast %219 : i32 to index
  %221 = arith.cmpi sle, %220, %c0 : index
  scf.if %221 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c21_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %222 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
  %223 = arith.index_cast %222 : i32 to index
  %224 = arith.cmpi sle, %223, %c0 : index
  scf.if %224 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c22_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %225 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
  %226 = arith.index_cast %225 : i32 to index
  %227 = arith.cmpi sle, %226, %c0 : index
  scf.if %227 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c23_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %228 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
  %229 = arith.index_cast %228 : i32 to index
  %230 = arith.cmpi sle, %229, %c0 : index
  scf.if %230 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c24_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %231 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
  %232 = arith.index_cast %231 : i32 to index
  %233 = arith.cmpi sle, %232, %c0 : index
  scf.if %233 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c25_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %234 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
  %235 = arith.index_cast %234 : i32 to index
  %236 = arith.cmpi sle, %235, %c0 : index
  scf.if %236 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c26_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %237 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
  %238 = arith.index_cast %237 : i32 to index
  %239 = arith.cmpi sle, %238, %c0 : index
  scf.if %239 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c27_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %240 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
  %241 = arith.index_cast %240 : i32 to index
  %242 = arith.cmpi sle, %241, %c0 : index
  scf.if %242 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c28_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %243 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
  %244 = arith.index_cast %243 : i32 to index
  %245 = arith.cmpi sle, %244, %c0 : index
  scf.if %245 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c29_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %246 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
  %247 = arith.index_cast %246 : i32 to index
  %248 = arith.cmpi sle, %247, %c0 : index
  scf.if %248 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c30_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %249 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
  %250 = arith.index_cast %249 : i32 to index
  %251 = arith.cmpi sle, %250, %c0 : index
  scf.if %251 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c31_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %252 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
  %253 = arith.index_cast %252 : i32 to index
  %254 = arith.cmpi sle, %253, %c0 : index
  scf.if %254 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c32_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %255 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
  %256 = arith.index_cast %255 : i32 to index
  %257 = arith.cmpi sle, %256, %c0 : index
  scf.if %257 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c33_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %258 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
  %259 = arith.index_cast %258 : i32 to index
  %260 = arith.cmpi sle, %259, %c0 : index
  scf.if %260 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c34_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %261 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
  %262 = arith.index_cast %261 : i32 to index
  %263 = arith.cmpi sle, %262, %c0 : index
  scf.if %263 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c35_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %264 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
  %265 = arith.index_cast %264 : i32 to index
  %266 = arith.cmpi sle, %265, %c0 : index
  scf.if %266 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c36_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %267 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
  %268 = arith.index_cast %267 : i32 to index
  %269 = arith.cmpi sle, %268, %c0 : index
  scf.if %269 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c37_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %270 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
  %271 = arith.index_cast %270 : i32 to index
  %272 = arith.cmpi sle, %271, %c0 : index
  scf.if %272 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c38_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %273 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
  %274 = arith.index_cast %273 : i32 to index
  %275 = arith.cmpi sle, %274, %c0 : index
  scf.if %275 {
    %276 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %277 = arith.index_cast %276 : i32 to index
    pto.store_scalar %c39_i32, %arg7[%277] : !pto.ptr<i32, gm>, i32
    %278 = arith.index_cast %276 : i32 to index
    %279 = arith.addi %278, %c1 : index
    %280 = arith.index_cast %279 : index to i32
    pto.store_scalar %280, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  return
}
