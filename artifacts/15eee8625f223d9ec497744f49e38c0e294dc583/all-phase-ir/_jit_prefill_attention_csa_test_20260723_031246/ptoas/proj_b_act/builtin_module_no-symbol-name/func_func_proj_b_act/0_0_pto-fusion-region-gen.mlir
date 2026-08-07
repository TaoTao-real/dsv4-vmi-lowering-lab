// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @proj_b_act(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1024 = arith.constant 1024 : index
  %c4194304 = arith.constant 4194304 : index
  %c524288 = arith.constant 524288 : index
  %c0_i64 = arith.constant 0 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c34816_i64 = arith.constant 34816 : i64
  %c67584_i64 = arith.constant 67584 : i64
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c32768 = arith.constant 32768 : index
  %c8 = arith.constant 8 : index
  %c4 = arith.constant 4 : index
  %c512 = arith.constant 512 : index
  %c32 = arith.constant 32 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c4096], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c4096], strides = [%c524288, %c524288, %c524288, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c32768], strides = [%c4194304, %c4194304, %c4194304, %c32768, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c128], strides = [%c1024, %c1024, %c1024, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.divsi %4, %c4 : index
  %6 = arith.muli %5, %c4 : index
  %7 = arith.subi %4, %6 : index
  %8 = arith.muli %5, %c512 : index
  %9 = arith.muli %7, %c32 : index
  %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  %11 = pto.partition_view %0, offsets = [%8], sizes = [%c512] : !pto.tensor_view<?xf32>
  pto.tload ins(%11 : !pto.partition_tensor_view<512xf32>) outs(%10 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  %13 = arith.addi %9, %c32 : index
  scf.for %arg6 = %9 to %13 step %c16 {
    %14 = pto.fusion_region {
      %17 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%17 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%17) : (!pto.tile_buf<vec, 16x512xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
    scf.for %arg7 = %c0 to %c8 step %c1 {
      %17 = pto.alloc_tile addr = %c34816_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xi32, valid=?x?>
      %18 = arith.muli %arg7, %c4096 : index
      %19 = arith.addi %18, %8 : index
      %20 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %arg6, %19], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
      pto.tload ins(%20 : !pto.partition_tensor_view<1x1x1x16x512xi32>) outs(%17 : !pto.tile_buf<vec, 16x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %21 = pto.alloc_tile addr = %c67584_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %22 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %arg7, %arg6], sizes = [%c1, %c1, %c1, %c1, %c16] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%22 : !pto.partition_tensor_view<1x1x1x1x16xf32>) outs(%21 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %23 = pto.alloc_tile addr = %c67584_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.fusion_region {
        %24 = pto.alloc_tile addr = %c34816_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        pto.tcvt ins(%17 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x512xi32, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>)
        %25 = pto.alloc_tile addr = %c34816_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        pto.trowexpandmul ins(%24, %23 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%25 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %26 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        pto.tadd ins(%14, %25 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x512xf32, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
    }
    %15 = pto.fusion_region {
      %17 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.tcolexpandmul ins(%14, %12 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %18 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
      pto.tcvt ins(%17 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>)
      pto.yield(%18) : (!pto.tile_buf<vec, 16x512xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
    %16 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg6, %8], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%15 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>) outs(%16 : !pto.partition_tensor_view<1x1x1x16x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
