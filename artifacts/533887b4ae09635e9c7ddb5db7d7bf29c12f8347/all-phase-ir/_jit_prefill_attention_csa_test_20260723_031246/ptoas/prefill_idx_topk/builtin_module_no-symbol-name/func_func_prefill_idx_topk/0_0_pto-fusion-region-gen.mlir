// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_topk(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c262144 = arith.constant 262144 : index
  %c65536 = arith.constant 65536 : index
  %c1024 = arith.constant 1024 : index
  %c1024_i32 = arith.constant 1024 : i32
  %c256_i32 = arith.constant 256 : i32
  %c64_i32 = arith.constant 64 : i32
  %c4096 = arith.constant 4096 : index
  %c8192_i64 = arith.constant 8192 : i64
  %c24576_i64 = arith.constant 24576 : i64
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c2048 = arith.constant 2048 : index
  %c16 = arith.constant 16 : index
  %c0 = arith.constant 0 : index
  %c-1_i32 = arith.constant -1 : i32
  %c4 = arith.constant 4 : index
  %c256 = arith.constant 256 : index
  %c0_i32 = arith.constant 0 : i32
  %0 = builtin.unrealized_conversion_cast %c0_i32 : i32 to ui32
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg1, shape = [%arg3], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c2048], strides = [%c262144, %c262144, %c262144, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.muli %4, %c16 : index
  scf.for %arg6 = %c0 to %c16 step %c1 {
    %6 = arith.addi %5, %arg6 : index
    %7 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
    pto.texpands ins(%c-1_i32 : i32) outs(%7 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %8 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%7 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) outs(%8 : !pto.partition_tensor_view<1x1x1x1x512xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %9 = arith.cmpi slt, %6, %c128 : index
    scf.if %9 {
      %10 = pto.load_scalar %arg1[%6] : !pto.ptr<i32, gm> -> i32
      %11 = arith.index_cast %10 : i32 to index
      %12 = arith.addi %11, %c1 : index
      %13 = arith.divsi %12, %c4 : index
      %14 = arith.minsi %13, %c256 : index
      %15 = arith.cmpi sgt, %14, %c0 : index
      scf.if %15 {
        %16 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c2048 : !pto.tile_buf<vec, 1x2048xf32, valid=?x?>
        %17 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %c2048] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%17 : !pto.partition_tensor_view<1x1x1x1x2048xf32>) outs(%16 : !pto.tile_buf<vec, 1x2048xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c2048 : !pto.tile_buf<vec, 1x2048xui32, valid=?x?>
        pto.tci ins(%0 : ui32) outs(%18 : !pto.tile_buf<vec, 1x2048xui32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %19 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tsort32 ins(%16, %18 : !pto.tile_buf<vec, 1x2048xf32, valid=?x?>, !pto.tile_buf<vec, 1x2048xui32, valid=?x?>) outs(%19 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsort32", postupdate = 0 : i64, tags = ["sort", "aligned"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsort32", postupdate = 0 : i64, tags = ["sort", "aligned"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %20 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmrgsort ins(%19, %c64_i32 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, i32) outs(%20 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %21 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmrgsort ins(%20, %c256_i32 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, i32) outs(%21 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %22 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmrgsort ins(%21, %c1024_i32 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, i32) outs(%22 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %23 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
        %24 = pto.subview %22[%c0, %c0] sizes [1, 1024] : !pto.tile_buf<vec, 1x4096xf32, valid=?x?> -> !pto.tile_buf<vec, 1x1024xf32>
        %25 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
        pto.tgather ins(%24, {maskPattern = #pto.mask_pattern<P1010>} : !pto.tile_buf<vec, 1x1024xf32>) outs(%25 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tgather_mask", postupdate = 0 : i64, tags = ["gather", "mask", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tgather_mask", postupdate = 0 : i64, tags = ["gather", "mask", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        pto.set_validshape %25, %c1, %14 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
        %26 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %6, %c0], sizes = [%c1, %c1, %c1, %c1, %14] : !pto.tensor_view<1x1x1x?x?xi32>
        pto.tstore ins(%25 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) outs(%26 : !pto.partition_tensor_view<1x1x1x1x?xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      } else {
      }
    } else {
    }
  }
  return
}

