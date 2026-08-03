// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qproj_dequant_rms_nope_rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: index, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4194304 = arith.constant 4194304 : index
  %c101440_i64 = arith.constant 101440 : i64
  %c101472_i64 = arith.constant 101472 : i64
  %c103520_i64 = arith.constant 103520 : i64
  %c0_i64 = arith.constant 0 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c34816_i64 = arith.constant 34816 : i64
  %c18432_i64 = arith.constant 18432 : i64
  %c68128_i64 = arith.constant 68128 : i64
  %c51200_i64 = arith.constant 51200 : i64
  %c67584_i64 = arith.constant 67584 : i64
  %c67616_i64 = arith.constant 67616 : i64
  %c3840_i64 = arith.constant 3840 : i64
  %c67872_i64 = arith.constant 67872 : i64
  %c84512_i64 = arith.constant 84512 : i64
  %c100896_i64 = arith.constant 100896 : i64
  %c100928_i64 = arith.constant 100928 : i64
  %c20224_i64 = arith.constant 20224 : i64
  %c101184_i64 = arith.constant 101184 : i64
  %c32768 = arith.constant 32768 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c128 = arith.constant 128 : index
  %c4 = arith.constant 4 : index
  %c0 = arith.constant 0 : index
  %c8 = arith.constant 8 : index
  %c2 = arith.constant 2 : index
  %c512 = arith.constant 512 : index
  %cst = arith.constant 0.001953125 : f32
  %cst_0 = arith.constant 9.99999997E-7 : f32
  %c448 = arith.constant 448 : index
  %0 = arith.muli %arg9, %c32768 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg9, %c32768], strides = [%0, %0, %0, %c32768, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %arg9, %c1], strides = [%arg9, %arg9, %arg9, %c1, %arg9] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = arith.muli %arg9, %c64 : index
  %4 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %arg9, %c64], strides = [%3, %3, %3, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = arith.muli %arg9, %c64 : index
  %6 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %arg9, %c64], strides = [%5, %5, %5, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = arith.muli %arg9, %c64 : index
  %8 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %arg9, %c64], strides = [%7, %7, %7, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %9 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c128, %c32768], strides = [%c4194304, %c4194304, %c4194304, %c32768, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %10 = pto.make_tensor_view %arg6, shape = [%c32768], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %11 = arith.index_cast %arg10 : i32 to index
  %12 = arith.muli %11, %c4 : index
  %13 = arith.divsi %arg9, %c8 : index
  %14 = scf.for %arg12 = %c0 to %13 step %c1 iter_args(%arg13 = %arg7) -> (index) {
    %15 = arith.muli %arg12, %c8 : index
    %16 = pto.alloc_tile addr = %c101440_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
    %17 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %15, %c0], sizes = [%c1, %c1, %c1, %c8, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%17 : !pto.partition_tensor_view<1x1x1x8x1xf32>) outs(%16 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %18 = pto.alloc_tile addr = %c101472_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
    %19 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %15, %c0], sizes = [%c1, %c1, %c1, %c8, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%19 : !pto.partition_tensor_view<1x1x1x8x64xf32>) outs(%18 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %20 = pto.alloc_tile addr = %c103520_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
    %21 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %15, %c0], sizes = [%c1, %c1, %c1, %c8, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x8x64xf32>) outs(%20 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %22 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xi32, valid=?x?>
    %23 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %15, %c0], sizes = [%c1, %c1, %c1, %c8, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x8x64xi32>) outs(%22 : !pto.tile_buf<vec, 8x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    scf.for %arg14 = %c0 to %c4 step %c2 {
      %24 = arith.addi %12, %arg14 : index
      %25 = arith.muli %24, %c512 : index
      %26 = arith.addi %arg14, %c1 : index
      %27 = arith.addi %12, %26 : index
      %28 = arith.muli %27, %c512 : index
      %29 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
      %30 = pto.partition_view %9, offsets = [%c0, %c0, %c0, %15, %25], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
      pto.tload ins(%30 : !pto.partition_tensor_view<1x1x1x8x512xi32>) outs(%29 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %31 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %32 = pto.partition_view %10, offsets = [%25], sizes = [%c512] : !pto.tensor_view<?xf32>
      pto.tload ins(%32 : !pto.partition_tensor_view<512xf32>) outs(%31 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %33 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>
      %34 = pto.partition_view %9, offsets = [%c0, %c0, %c0, %15, %28], sizes = [%c1, %c1, %c1, %c8, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
      pto.tload ins(%34 : !pto.partition_tensor_view<1x1x1x8x512xi32>) outs(%33 : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %35 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %36 = pto.partition_view %10, offsets = [%28], sizes = [%c512] : !pto.tensor_view<?xf32>
      pto.tload ins(%36 : !pto.partition_tensor_view<512xf32>) outs(%35 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %37 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %38 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tcvt ins(%29 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%38 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
      %39 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.trowexpandmul ins(%38, %16 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%39 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %40 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.tcolexpandmul ins(%39, %37 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %41 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.tmul ins(%40, %40 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %42 = pto.alloc_tile addr = %c51200_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.fusion_region {
        %93 = pto.alloc_tile addr = %c67584_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
        pto.trowsum ins(%41, %42 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} : 
      %43 = pto.alloc_tile addr = %c67584_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %44 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.tmuls ins(%43, %cst : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%93 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %45 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.tadds ins(%44, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%93 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %46 = pto.alloc_tile addr = %c51200_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %47 = pto.alloc_tile addr = %c67616_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.trsqrt ins(%45, %46 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%47 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], precisionType = #pto<rsqrt_precision default>, pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %48 = pto.alloc_tile addr = %c67616_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      %49 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>
      %50 = pto.subview %40[%c0, %c0] sizes [8, 448] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x448xf32>
      %51 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>
      pto.trowexpandmul ins(%50, %48 : !pto.tile_buf<vec, 8x448xf32>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%51 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %52 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
        pto.tcvt ins(%51 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x448xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>)
        pto.yield(%93) : (!pto.tile_buf<vec, 8x448xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
      %53 = pto.alloc_tile addr = %c3840_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %54 = pto.subview %40[%c0, %c448] sizes [8, 64] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x64xf32>
      %55 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.trowexpandmul ins(%54, %48 : !pto.tile_buf<vec, 8x64xf32>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%55 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %56 = pto.alloc_tile addr = %c51200_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      scf.for %arg15 = %c0 to %c8 step %c1 {
        %93 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %94 = pto.subview %55[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
        %95 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
        %96 = pto.subview %22[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
        %97 = pto.alloc_tile addr = %c67616_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
        %98 = pto.alloc_tile addr = %c67872_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        pto.tgather ins(%94, %96, %97 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%98 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %99 = pto.subview %56[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
        pto.fusion_region {
          pto.tmov ins(%98 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%99 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 20 : i64} : 
      }
      %57 = pto.alloc_tile addr = %c51200_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %58 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tmul ins(%55, %18 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %59 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c51200_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tmul ins(%57, %20 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %60 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tadd ins(%58, %59 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %61 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.tcvt ins(%60 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>)
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      %62 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %15, %25], sizes = [%c1, %c1, %c1, %c8, %c448] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%52 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>) outs(%62 : !pto.partition_tensor_view<1x1x1x8x448xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %63 = arith.addi %25, %c448 : index
      %64 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %15, %63], sizes = [%c1, %c1, %c1, %c8, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%61 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>) outs(%64 : !pto.partition_tensor_view<1x1x1x8x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %65 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %66 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.tcvt ins(%33 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x512xi32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>)
      %67 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.trowexpandmul ins(%66, %16 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%67 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %68 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.tcolexpandmul ins(%67, %65 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %69 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.tmul ins(%68, %68 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %70 = pto.alloc_tile addr = %c84512_i64 valid_row = %c8 valid_col = %c512 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      pto.fusion_region {
        %93 = pto.alloc_tile addr = %c100896_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
        pto.trowsum ins(%69, %70 : !pto.tile_buf<vec, 8x512xf32, valid=?x?>, !pto.tile_buf<vec, 8x512xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 12 : i64} : 
      %71 = pto.alloc_tile addr = %c100896_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %72 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.tmuls ins(%71, %cst : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%93 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %73 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.tadds ins(%72, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%93 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %74 = pto.alloc_tile addr = %c84512_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %75 = pto.alloc_tile addr = %c100928_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.trsqrt ins(%73, %74 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], precisionType = #pto<rsqrt_precision default>, pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %76 = pto.alloc_tile addr = %c100928_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      %77 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>
      %78 = pto.subview %68[%c0, %c0] sizes [8, 448] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x448xf32>
      %79 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>
      pto.trowexpandmul ins(%78, %76 : !pto.tile_buf<vec, 8x448xf32>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%79 : !pto.tile_buf<vec, 8x448xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %80 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c448 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
        pto.tcvt ins(%79 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x448xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>)
        pto.yield(%93) : (!pto.tile_buf<vec, 8x448xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
      %81 = pto.alloc_tile addr = %c20224_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %82 = pto.subview %68[%c0, %c448] sizes [8, 64] : !pto.tile_buf<vec, 8x512xf32, valid=?x?> -> !pto.tile_buf<vec, 8x64xf32>
      %83 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.trowexpandmul ins(%82, %76 : !pto.tile_buf<vec, 8x64xf32>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%83 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %84 = pto.alloc_tile addr = %c84512_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      scf.for %arg15 = %c0 to %c8 step %c1 {
        %93 = pto.alloc_tile addr = %c18432_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %94 = pto.subview %83[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
        %95 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
        %96 = pto.subview %22[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
        %97 = pto.alloc_tile addr = %c100928_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
        %98 = pto.alloc_tile addr = %c101184_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        pto.tgather ins(%94, %96, %97 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%98 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %99 = pto.subview %84[%arg15, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 8x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
        pto.fusion_region {
          pto.tmov ins(%98 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%99 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 21 : i64} : 
      }
      %85 = pto.alloc_tile addr = %c84512_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %86 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tmul ins(%83, %18 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %87 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c84512_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tmul ins(%85, %20 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %88 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
        pto.tadd ins(%86, %87 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>, !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %89 = pto.fusion_region {
        %93 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
        pto.tcvt ins(%88 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>) outs(%93 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>)
        pto.yield(%93) : (!pto.tile_buf<vec, 8x64xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
      %90 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %15, %28], sizes = [%c1, %c1, %c1, %c8, %c448] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%80 : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>) outs(%90 : !pto.partition_tensor_view<1x1x1x8x448xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %91 = arith.addi %28, %c448 : index
      %92 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %15, %91], sizes = [%c1, %c1, %c1, %c8, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%89 : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>) outs(%92 : !pto.partition_tensor_view<1x1x1x8x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
    scf.yield %15 : index
  }
  return
}

