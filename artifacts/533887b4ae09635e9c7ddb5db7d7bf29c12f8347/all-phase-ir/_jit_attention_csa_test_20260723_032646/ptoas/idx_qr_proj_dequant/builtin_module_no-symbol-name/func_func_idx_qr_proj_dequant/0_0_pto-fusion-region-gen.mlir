// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @idx_qr_proj_dequant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c65536 = arith.constant 65536 : index
  %c131072 = arith.constant 131072 : index
  %c0_i64 = arith.constant 0 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c36864_i64 = arith.constant 36864 : i64
  %c8192 = arith.constant 8192 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c8 = arith.constant 8 : index
  %c1024 = arith.constant 1024 : index
  %c0 = arith.constant 0 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c8192], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c16, %c8192], strides = [%c131072, %c131072, %c131072, %c8192, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c1], strides = [%c8, %c8, %c8, %c1, %c8] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c8192], strides = [%c65536, %c65536, %c65536, %c8192, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.muli %4, %c1024 : index
  %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
  %7 = pto.partition_view %0, offsets = [%5], sizes = [%c1024] : !pto.tensor_view<?xf32>
  pto.tload ins(%7 : !pto.partition_tensor_view<1024xf32>) outs(%6 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
  %9 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 : !pto.tile_buf<vec, 8x1024xi32, valid=?x?>
  %10 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %5], sizes = [%c1, %c1, %c1, %c8, %c1024] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tload ins(%10 : !pto.partition_tensor_view<1x1x1x8x1024xi32>) outs(%9 : !pto.tile_buf<vec, 8x1024xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
  pto.tcvt ins(%9 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x1024xi32, valid=?x?>) outs(%11 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>)
  %12 = pto.alloc_tile addr = %c36864_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  %13 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%13 : !pto.partition_tensor_view<1x1x1x8x1xf32>) outs(%12 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %14 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
  pto.trowexpandmul ins(%11, %12 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%14 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %15 = pto.fusion_region {
    %17 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
    pto.tcolexpandmul ins(%14, %8 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>, !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%17) : (!pto.tile_buf<vec, 8x1024xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
  %16 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %c0, %5], sizes = [%c1, %c1, %c1, %c8, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%15 : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>) outs(%16 : !pto.partition_tensor_view<1x1x1x8x1024xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

