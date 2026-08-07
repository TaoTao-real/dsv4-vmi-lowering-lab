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
  %10 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  pto.tcvt ins(%8 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%10 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
  %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>
  %12 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x8x1xi32>) outs(%11 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
  %14 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.tcvt ins(%13 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xi32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>)
  %15 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %16 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %17:2 = pto.fusion_region {
    %268 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tadds ins(%16, %cst : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%268 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %269 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    %270 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %271 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tmuls ins(%270, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%271 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %272 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    %273 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %274 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
    pto.tcvt ins(%273 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%274 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>)
    %275 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xi32, valid=?x?, blayout=col_major>
    %276 = pto.alloc_tile addr = %c32_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xi32, valid=?x?>
    %277 = pto.alloc_tile addr = %c16416_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tcvt ins(%276 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x8xi32, valid=?x?>) outs(%277 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>)
    %278 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    %279 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%279 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %280 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.trowexpandmul ins(%279, %278 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%280 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %281 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tadds ins(%10, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%281 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %282 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmaxs ins(%281, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%282 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %283 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%282, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%283 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %284 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tsub ins(%280, %10 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%284 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %285 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmaxs ins(%284, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%285 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %286 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%285, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%286 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %287 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmul ins(%283, %286 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%287 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %288 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tadds ins(%10, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%288 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %289 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmul ins(%287, %288 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%289 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%287, %289) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  %18 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  pto.tsubs ins(%17#1, %cst : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%18 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %19 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
  pto.tcvt ins(%18 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%19 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>)
  %20 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tstore ins(%19 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%20 : !pto.partition_tensor_view<1x1x1x8x512xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  scf.for %arg8 = %c0 to %c8 step %c1 {
    %268 = arith.muli %arg8, %c5 : index
    pto.store_scalar %c1_i32, %arg3[%268] : !pto.ptr<i32, gm>, i32
  }
  scf.for %arg8 = %c1 to %c5 step %c1 {
    %268 = arith.subi %arg8, %c1 : index
    %269 = arith.muli %268, %c128 : index
    %270 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %271 = pto.subview %17#0[%c0, %269] sizes [8, 128] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x128xf32>
    %272 = pto.alloc_tile addr = %c16416_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %273 = pto.fusion_region {
      %274 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowmax ins(%271, %272 : !pto.tile_buf<vec, 8x128xf32>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%274 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%274) : (!pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    scf.for %arg9 = %c0 to %c8 step %c1 {
      %274 = pto.tgetval ins(%273, %arg9 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
      %275 = arith.fptosi %274 : f32 to i32
      %276 = arith.muli %arg9, %c5 : index
      %277 = arith.addi %276, %arg8 : index
      pto.store_scalar %275, %arg3[%277] : !pto.ptr<i32, gm>, i32
    }
  }
  %21 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xi32, valid=?x?>
  %22 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%22 : !pto.partition_tensor_view<1x1x1x8x128xi32>) outs(%21 : !pto.tile_buf<vec, 8x128xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %23 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
  pto.tcvt ins(%21 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xi32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
  %24 = pto.fusion_region {
    %268 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tadds ins(%23, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%268 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %269 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmaxs ins(%268, %cst_1 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%269 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmaxs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmaxs", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %270 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmins ins(%269, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%270 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %271 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tsubs ins(%270, %cst : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%271 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %272 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tmuls ins(%271, %cst_2 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, f32) outs(%272 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%272) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
  %25 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%24 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%25 : !pto.partition_tensor_view<1x1x1x8x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %26 = pto.fusion_region {
    %268 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmins ins(%18, %cst_1 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%268 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmins", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmins", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %269 = pto.alloc_tile addr = %c32800_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
    pto.tmuls ins(%268, %cst_2 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, f32) outs(%269 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%269) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
  %27 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c128], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%26 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%27 : !pto.partition_tensor_view<1x1x1x8x512xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  pto.store_scalar %c0_i32, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  %28 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
  %29 = arith.index_cast %28 : i32 to index
  %30 = arith.cmpi sgt, %29, %c0 : index
  scf.if %30 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c0_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %31 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
  %32 = arith.index_cast %31 : i32 to index
  %33 = arith.cmpi sgt, %32, %c0 : index
  scf.if %33 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c1_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %34 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
  %35 = arith.index_cast %34 : i32 to index
  %36 = arith.cmpi sgt, %35, %c0 : index
  scf.if %36 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c2_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %37 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
  %38 = arith.index_cast %37 : i32 to index
  %39 = arith.cmpi sgt, %38, %c0 : index
  scf.if %39 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c3_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %40 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
  %41 = arith.index_cast %40 : i32 to index
  %42 = arith.cmpi sgt, %41, %c0 : index
  scf.if %42 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c4_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %43 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
  %44 = arith.index_cast %43 : i32 to index
  %45 = arith.cmpi sgt, %44, %c0 : index
  scf.if %45 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c5_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %46 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
  %47 = arith.index_cast %46 : i32 to index
  %48 = arith.cmpi sgt, %47, %c0 : index
  scf.if %48 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c6_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %49 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
  %50 = arith.index_cast %49 : i32 to index
  %51 = arith.cmpi sgt, %50, %c0 : index
  scf.if %51 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c7_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %52 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
  %53 = arith.index_cast %52 : i32 to index
  %54 = arith.cmpi sgt, %53, %c0 : index
  scf.if %54 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c8_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %55 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
  %56 = arith.index_cast %55 : i32 to index
  %57 = arith.cmpi sgt, %56, %c0 : index
  scf.if %57 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c9_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %58 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
  %59 = arith.index_cast %58 : i32 to index
  %60 = arith.cmpi sgt, %59, %c0 : index
  scf.if %60 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c10_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %61 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
  %62 = arith.index_cast %61 : i32 to index
  %63 = arith.cmpi sgt, %62, %c0 : index
  scf.if %63 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c11_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %64 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
  %65 = arith.index_cast %64 : i32 to index
  %66 = arith.cmpi sgt, %65, %c0 : index
  scf.if %66 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c12_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %67 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
  %68 = arith.index_cast %67 : i32 to index
  %69 = arith.cmpi sgt, %68, %c0 : index
  scf.if %69 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c13_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %70 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
  %71 = arith.index_cast %70 : i32 to index
  %72 = arith.cmpi sgt, %71, %c0 : index
  scf.if %72 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c14_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %73 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
  %74 = arith.index_cast %73 : i32 to index
  %75 = arith.cmpi sgt, %74, %c0 : index
  scf.if %75 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c15_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %76 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
  %77 = arith.index_cast %76 : i32 to index
  %78 = arith.cmpi sgt, %77, %c0 : index
  scf.if %78 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c16_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %79 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
  %80 = arith.index_cast %79 : i32 to index
  %81 = arith.cmpi sgt, %80, %c0 : index
  scf.if %81 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c17_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %82 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
  %83 = arith.index_cast %82 : i32 to index
  %84 = arith.cmpi sgt, %83, %c0 : index
  scf.if %84 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c18_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %85 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
  %86 = arith.index_cast %85 : i32 to index
  %87 = arith.cmpi sgt, %86, %c0 : index
  scf.if %87 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c19_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %88 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
  %89 = arith.index_cast %88 : i32 to index
  %90 = arith.cmpi sgt, %89, %c0 : index
  scf.if %90 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c20_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %91 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
  %92 = arith.index_cast %91 : i32 to index
  %93 = arith.cmpi sgt, %92, %c0 : index
  scf.if %93 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c21_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %94 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
  %95 = arith.index_cast %94 : i32 to index
  %96 = arith.cmpi sgt, %95, %c0 : index
  scf.if %96 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c22_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %97 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
  %98 = arith.index_cast %97 : i32 to index
  %99 = arith.cmpi sgt, %98, %c0 : index
  scf.if %99 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c23_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %100 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
  %101 = arith.index_cast %100 : i32 to index
  %102 = arith.cmpi sgt, %101, %c0 : index
  scf.if %102 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c24_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %103 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
  %104 = arith.index_cast %103 : i32 to index
  %105 = arith.cmpi sgt, %104, %c0 : index
  scf.if %105 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c25_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %106 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
  %107 = arith.index_cast %106 : i32 to index
  %108 = arith.cmpi sgt, %107, %c0 : index
  scf.if %108 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c26_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %109 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
  %110 = arith.index_cast %109 : i32 to index
  %111 = arith.cmpi sgt, %110, %c0 : index
  scf.if %111 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c27_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %112 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
  %113 = arith.index_cast %112 : i32 to index
  %114 = arith.cmpi sgt, %113, %c0 : index
  scf.if %114 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c28_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %115 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
  %116 = arith.index_cast %115 : i32 to index
  %117 = arith.cmpi sgt, %116, %c0 : index
  scf.if %117 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c29_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %118 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
  %119 = arith.index_cast %118 : i32 to index
  %120 = arith.cmpi sgt, %119, %c0 : index
  scf.if %120 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c30_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %121 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
  %122 = arith.index_cast %121 : i32 to index
  %123 = arith.cmpi sgt, %122, %c0 : index
  scf.if %123 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c31_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %124 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
  %125 = arith.index_cast %124 : i32 to index
  %126 = arith.cmpi sgt, %125, %c0 : index
  scf.if %126 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c32_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %127 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
  %128 = arith.index_cast %127 : i32 to index
  %129 = arith.cmpi sgt, %128, %c0 : index
  scf.if %129 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c33_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %130 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
  %131 = arith.index_cast %130 : i32 to index
  %132 = arith.cmpi sgt, %131, %c0 : index
  scf.if %132 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c34_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %133 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
  %134 = arith.index_cast %133 : i32 to index
  %135 = arith.cmpi sgt, %134, %c0 : index
  scf.if %135 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c35_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %136 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
  %137 = arith.index_cast %136 : i32 to index
  %138 = arith.cmpi sgt, %137, %c0 : index
  scf.if %138 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c36_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %139 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
  %140 = arith.index_cast %139 : i32 to index
  %141 = arith.cmpi sgt, %140, %c0 : index
  scf.if %141 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c37_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %142 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
  %143 = arith.index_cast %142 : i32 to index
  %144 = arith.cmpi sgt, %143, %c0 : index
  scf.if %144 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c38_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %145 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
  %146 = arith.index_cast %145 : i32 to index
  %147 = arith.cmpi sgt, %146, %c0 : index
  scf.if %147 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c39_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %148 = pto.load_scalar %arg3[%c0] : !pto.ptr<i32, gm> -> i32
  %149 = arith.index_cast %148 : i32 to index
  %150 = arith.cmpi sle, %149, %c0 : index
  scf.if %150 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c0_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %151 = pto.load_scalar %arg3[%c1] : !pto.ptr<i32, gm> -> i32
  %152 = arith.index_cast %151 : i32 to index
  %153 = arith.cmpi sle, %152, %c0 : index
  scf.if %153 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c1_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %154 = pto.load_scalar %arg3[%c2] : !pto.ptr<i32, gm> -> i32
  %155 = arith.index_cast %154 : i32 to index
  %156 = arith.cmpi sle, %155, %c0 : index
  scf.if %156 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c2_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %157 = pto.load_scalar %arg3[%c3] : !pto.ptr<i32, gm> -> i32
  %158 = arith.index_cast %157 : i32 to index
  %159 = arith.cmpi sle, %158, %c0 : index
  scf.if %159 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c3_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %160 = pto.load_scalar %arg3[%c4] : !pto.ptr<i32, gm> -> i32
  %161 = arith.index_cast %160 : i32 to index
  %162 = arith.cmpi sle, %161, %c0 : index
  scf.if %162 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c4_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %163 = pto.load_scalar %arg3[%c5] : !pto.ptr<i32, gm> -> i32
  %164 = arith.index_cast %163 : i32 to index
  %165 = arith.cmpi sle, %164, %c0 : index
  scf.if %165 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c5_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %166 = pto.load_scalar %arg3[%c6] : !pto.ptr<i32, gm> -> i32
  %167 = arith.index_cast %166 : i32 to index
  %168 = arith.cmpi sle, %167, %c0 : index
  scf.if %168 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c6_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %169 = pto.load_scalar %arg3[%c7] : !pto.ptr<i32, gm> -> i32
  %170 = arith.index_cast %169 : i32 to index
  %171 = arith.cmpi sle, %170, %c0 : index
  scf.if %171 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c7_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %172 = pto.load_scalar %arg3[%c8] : !pto.ptr<i32, gm> -> i32
  %173 = arith.index_cast %172 : i32 to index
  %174 = arith.cmpi sle, %173, %c0 : index
  scf.if %174 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c8_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %175 = pto.load_scalar %arg3[%c9] : !pto.ptr<i32, gm> -> i32
  %176 = arith.index_cast %175 : i32 to index
  %177 = arith.cmpi sle, %176, %c0 : index
  scf.if %177 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c9_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %178 = pto.load_scalar %arg3[%c10] : !pto.ptr<i32, gm> -> i32
  %179 = arith.index_cast %178 : i32 to index
  %180 = arith.cmpi sle, %179, %c0 : index
  scf.if %180 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c10_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %181 = pto.load_scalar %arg3[%c11] : !pto.ptr<i32, gm> -> i32
  %182 = arith.index_cast %181 : i32 to index
  %183 = arith.cmpi sle, %182, %c0 : index
  scf.if %183 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c11_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %184 = pto.load_scalar %arg3[%c12] : !pto.ptr<i32, gm> -> i32
  %185 = arith.index_cast %184 : i32 to index
  %186 = arith.cmpi sle, %185, %c0 : index
  scf.if %186 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c12_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %187 = pto.load_scalar %arg3[%c13] : !pto.ptr<i32, gm> -> i32
  %188 = arith.index_cast %187 : i32 to index
  %189 = arith.cmpi sle, %188, %c0 : index
  scf.if %189 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c13_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %190 = pto.load_scalar %arg3[%c14] : !pto.ptr<i32, gm> -> i32
  %191 = arith.index_cast %190 : i32 to index
  %192 = arith.cmpi sle, %191, %c0 : index
  scf.if %192 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c14_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %193 = pto.load_scalar %arg3[%c15] : !pto.ptr<i32, gm> -> i32
  %194 = arith.index_cast %193 : i32 to index
  %195 = arith.cmpi sle, %194, %c0 : index
  scf.if %195 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c15_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %196 = pto.load_scalar %arg3[%c16] : !pto.ptr<i32, gm> -> i32
  %197 = arith.index_cast %196 : i32 to index
  %198 = arith.cmpi sle, %197, %c0 : index
  scf.if %198 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c16_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %199 = pto.load_scalar %arg3[%c17] : !pto.ptr<i32, gm> -> i32
  %200 = arith.index_cast %199 : i32 to index
  %201 = arith.cmpi sle, %200, %c0 : index
  scf.if %201 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c17_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %202 = pto.load_scalar %arg3[%c18] : !pto.ptr<i32, gm> -> i32
  %203 = arith.index_cast %202 : i32 to index
  %204 = arith.cmpi sle, %203, %c0 : index
  scf.if %204 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c18_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %205 = pto.load_scalar %arg3[%c19] : !pto.ptr<i32, gm> -> i32
  %206 = arith.index_cast %205 : i32 to index
  %207 = arith.cmpi sle, %206, %c0 : index
  scf.if %207 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c19_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %208 = pto.load_scalar %arg3[%c20] : !pto.ptr<i32, gm> -> i32
  %209 = arith.index_cast %208 : i32 to index
  %210 = arith.cmpi sle, %209, %c0 : index
  scf.if %210 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c20_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %211 = pto.load_scalar %arg3[%c21] : !pto.ptr<i32, gm> -> i32
  %212 = arith.index_cast %211 : i32 to index
  %213 = arith.cmpi sle, %212, %c0 : index
  scf.if %213 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c21_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %214 = pto.load_scalar %arg3[%c22] : !pto.ptr<i32, gm> -> i32
  %215 = arith.index_cast %214 : i32 to index
  %216 = arith.cmpi sle, %215, %c0 : index
  scf.if %216 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c22_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %217 = pto.load_scalar %arg3[%c23] : !pto.ptr<i32, gm> -> i32
  %218 = arith.index_cast %217 : i32 to index
  %219 = arith.cmpi sle, %218, %c0 : index
  scf.if %219 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c23_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %220 = pto.load_scalar %arg3[%c24] : !pto.ptr<i32, gm> -> i32
  %221 = arith.index_cast %220 : i32 to index
  %222 = arith.cmpi sle, %221, %c0 : index
  scf.if %222 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c24_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %223 = pto.load_scalar %arg3[%c25] : !pto.ptr<i32, gm> -> i32
  %224 = arith.index_cast %223 : i32 to index
  %225 = arith.cmpi sle, %224, %c0 : index
  scf.if %225 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c25_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %226 = pto.load_scalar %arg3[%c26] : !pto.ptr<i32, gm> -> i32
  %227 = arith.index_cast %226 : i32 to index
  %228 = arith.cmpi sle, %227, %c0 : index
  scf.if %228 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c26_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %229 = pto.load_scalar %arg3[%c27] : !pto.ptr<i32, gm> -> i32
  %230 = arith.index_cast %229 : i32 to index
  %231 = arith.cmpi sle, %230, %c0 : index
  scf.if %231 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c27_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %232 = pto.load_scalar %arg3[%c28] : !pto.ptr<i32, gm> -> i32
  %233 = arith.index_cast %232 : i32 to index
  %234 = arith.cmpi sle, %233, %c0 : index
  scf.if %234 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c28_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %235 = pto.load_scalar %arg3[%c29] : !pto.ptr<i32, gm> -> i32
  %236 = arith.index_cast %235 : i32 to index
  %237 = arith.cmpi sle, %236, %c0 : index
  scf.if %237 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c29_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %238 = pto.load_scalar %arg3[%c30] : !pto.ptr<i32, gm> -> i32
  %239 = arith.index_cast %238 : i32 to index
  %240 = arith.cmpi sle, %239, %c0 : index
  scf.if %240 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c30_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %241 = pto.load_scalar %arg3[%c31] : !pto.ptr<i32, gm> -> i32
  %242 = arith.index_cast %241 : i32 to index
  %243 = arith.cmpi sle, %242, %c0 : index
  scf.if %243 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c31_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %244 = pto.load_scalar %arg3[%c32] : !pto.ptr<i32, gm> -> i32
  %245 = arith.index_cast %244 : i32 to index
  %246 = arith.cmpi sle, %245, %c0 : index
  scf.if %246 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c32_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %247 = pto.load_scalar %arg3[%c33] : !pto.ptr<i32, gm> -> i32
  %248 = arith.index_cast %247 : i32 to index
  %249 = arith.cmpi sle, %248, %c0 : index
  scf.if %249 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c33_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %250 = pto.load_scalar %arg3[%c34] : !pto.ptr<i32, gm> -> i32
  %251 = arith.index_cast %250 : i32 to index
  %252 = arith.cmpi sle, %251, %c0 : index
  scf.if %252 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c34_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %253 = pto.load_scalar %arg3[%c35] : !pto.ptr<i32, gm> -> i32
  %254 = arith.index_cast %253 : i32 to index
  %255 = arith.cmpi sle, %254, %c0 : index
  scf.if %255 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c35_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %256 = pto.load_scalar %arg3[%c36] : !pto.ptr<i32, gm> -> i32
  %257 = arith.index_cast %256 : i32 to index
  %258 = arith.cmpi sle, %257, %c0 : index
  scf.if %258 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c36_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %259 = pto.load_scalar %arg3[%c37] : !pto.ptr<i32, gm> -> i32
  %260 = arith.index_cast %259 : i32 to index
  %261 = arith.cmpi sle, %260, %c0 : index
  scf.if %261 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c37_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %262 = pto.load_scalar %arg3[%c38] : !pto.ptr<i32, gm> -> i32
  %263 = arith.index_cast %262 : i32 to index
  %264 = arith.cmpi sle, %263, %c0 : index
  scf.if %264 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c38_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  %265 = pto.load_scalar %arg3[%c39] : !pto.ptr<i32, gm> -> i32
  %266 = arith.index_cast %265 : i32 to index
  %267 = arith.cmpi sle, %266, %c0 : index
  scf.if %267 {
    %268 = pto.load_scalar %arg6[%c0] : !pto.ptr<i32, gm> -> i32
    %269 = arith.index_cast %268 : i32 to index
    pto.store_scalar %c39_i32, %arg7[%269] : !pto.ptr<i32, gm>, i32
    %270 = arith.index_cast %268 : i32 to index
    %271 = arith.addi %270, %c1 : index
    %272 = arith.index_cast %271 : index to i32
    pto.store_scalar %272, %arg6[%c0] : !pto.ptr<i32, gm>, i32
  }
  return
}
