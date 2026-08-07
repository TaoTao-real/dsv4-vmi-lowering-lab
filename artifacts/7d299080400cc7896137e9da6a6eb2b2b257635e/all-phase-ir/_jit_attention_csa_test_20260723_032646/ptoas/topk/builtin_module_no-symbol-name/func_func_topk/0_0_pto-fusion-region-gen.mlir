// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @topk(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32768 = arith.constant 32768 : index
  %cst = arith.constant dense<0> : vector<4xi16>
  %c512 = arith.constant 512 : index
  %c2048 = arith.constant 2048 : index
  %c1024 = arith.constant 1024 : index
  %c1024_i32 = arith.constant 1024 : i32
  %c256_i32 = arith.constant 256 : i32
  %c64_i32 = arith.constant 64 : i32
  %c8192 = arith.constant 8192 : index
  %c0_i64 = arith.constant 0 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c49152_i64 = arith.constant 49152 : i64
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c-1_i32 = arith.constant -1 : i32
  %c0 = arith.constant 0 : index
  %cst_0 = arith.constant -3.40282347E+38 : f32
  %c0_i32 = arith.constant 0 : i32
  %0 = builtin.unrealized_conversion_cast %c0_i32 : i32 to ui32
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg1, shape = [%c4], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %4 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = arith.index_cast %arg4 : i32 to index
  %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xi32, valid=?x?>
  pto.texpands ins(%c-1_i32 : i32) outs(%6 : !pto.tile_buf<vec, 1x4096xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %7 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xi32>
  pto.tstore ins(%6 : !pto.tile_buf<vec, 1x4096xi32, valid=?x?>) outs(%7 : !pto.partition_tensor_view<1x1x1x1x4096xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %8 = arith.divsi %5, %c2 : index
  %9 = arith.muli %8, %c2 : index
  %10 = arith.subi %5, %9 : index
  %11 = pto.load_scalar %arg1[%8] : !pto.ptr<i32, gm> -> i32
  %12 = arith.index_cast %11 : i32 to index
  %13 = arith.divsi %12, %c4 : index
  %14 = arith.muli %8, %c2 : index
  %15 = arith.addi %14, %10 : index
  %16 = pto.load_scalar %arg2[%15] : !pto.ptr<i32, gm> -> i32
  %17 = arith.index_cast %16 : i32 to index
  %18 = arith.addi %17, %c1 : index
  %19 = arith.divsi %18, %c4 : index
  %20 = arith.minsi %13, %19 : index
  %21 = arith.minsi %20, %c4096 : index
  %22 = arith.cmpi sgt, %21, %c0 : index
  scf.if %22 {
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %24 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%23 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    pto.set_validshape %23, %c1, %21 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %25 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>
    pto.tfillpad ins(%23 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%25 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %26 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%26 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %27 = pto.fusion_region {
      %45 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>
      pto.tmax ins(%25, %26 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%45) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>
    %28 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xui32, valid=?x?>
    pto.tci ins(%0 : ui32) outs(%28 : !pto.tile_buf<vec, 1x4096xui32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8192 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>
    pto.tsort32 ins(%27, %28 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x4096xui32, valid=?x?>) outs(%29 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsort32", postupdate = 0 : i64, tags = ["sort", "aligned"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsort32", postupdate = 0 : i64, tags = ["sort", "aligned"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %30 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c8192 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>
    pto.tmrgsort ins(%29, %c64_i32 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>, i32) outs(%30 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %31 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8192 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>
    pto.tmrgsort ins(%30, %c256_i32 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>, i32) outs(%31 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %32 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c8192 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>
    pto.tmrgsort ins(%31, %c1024_i32 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>, i32) outs(%32 : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 0 : i64, name = "template_tmrgsort_single_list", postupdate = 0 : i64, tags = ["sort", "merge", "single-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %33 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?, pad=3>
    %34 = pto.subview %32[%c0, %c0] sizes [1, 1024] : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3> -> !pto.tile_buf<vec, 1x1024xf32, pad=3>
    %35 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?, pad=3>
    %36 = pto.subview %32[%c0, %c4096] sizes [1, 1024] : !pto.tile_buf<vec, 1x8192xf32, valid=?x?, pad=3> -> !pto.tile_buf<vec, 1x1024xf32, pad=3>
    %37 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c2048 : !pto.tile_buf<vec, 1x2048xf32, valid=?x?>
    %38 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c2048 : !pto.tile_buf<vec, 1x2048xf32, valid=?x?, pad=3>
    pto.tmrgsort ins(%34, %36, %37 {exhausted = false} : !pto.tile_buf<vec, 1x1024xf32, pad=3>, !pto.tile_buf<vec, 1x1024xf32, pad=3>, !pto.tile_buf<vec, 1x2048xf32, valid=?x?>) outs(%38, %cst : !pto.tile_buf<vec, 1x2048xf32, valid=?x?, pad=3>, vector<4xi16>) {candidates = [{id = 1 : i64, loop_depth = 1 : i64, name = "template_tmrgsort_multi_list2", postupdate = 0 : i64, tags = ["sort", "merge", "multi-list"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 1 : i64, name = "template_tmrgsort_multi_list2", postupdate = 0 : i64, tags = ["sort", "merge", "multi-list"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %39 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?, pad=3>
    %40 = pto.subview %38[%c0, %c0] sizes [1, 1024] : !pto.tile_buf<vec, 1x2048xf32, valid=?x?, pad=3> -> !pto.tile_buf<vec, 1x1024xf32, pad=3>
    %41 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>
    pto.tgather ins(%40, {maskPattern = #pto.mask_pattern<P1010>} : !pto.tile_buf<vec, 1x1024xf32, pad=3>) outs(%41 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tgather_mask", postupdate = 0 : i64, tags = ["gather", "mask", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tgather_mask", postupdate = 0 : i64, tags = ["gather", "mask", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %42 = arith.minsi %21, %c512 : index
    pto.set_validshape %41, %c1, %42 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>
    %43 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %42 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>
    pto.tadds ins(%41, %c0_i32 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>, i32) outs(%43 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %44 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %5, %c0], sizes = [%c1, %c1, %c1, %c1, %42] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%43 : !pto.tile_buf<vec, 1x512xi32, valid=?x?, pad=3>) outs(%44 : !pto.partition_tensor_view<1x1x1x1x?xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
  }
  return
}
