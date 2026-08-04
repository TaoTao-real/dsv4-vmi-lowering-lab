// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c8192 = arith.constant 8192 : index
  %c24832_i64 = arith.constant 24832 : i64
  %c33024_i64 = arith.constant 33024 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c24576_i64 = arith.constant 24576 : i64
  %c24704_i64 = arith.constant 24704 : i64
  %c1024 = arith.constant 1024 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c64 = arith.constant 64 : index
  %c2 = arith.constant 2 : index
  %c32 = arith.constant 32 : index
  %cst = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_0 = arith.constant 5.000000e-01 : f32
  %cst_1 = arith.constant 2.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c4 = arith.constant 4 : index
  %c8 = arith.constant 8 : index
  %c512 = arith.constant 512 : index
  %c448 = arith.constant 448 : index
  %c16 = arith.constant 16 : index
  %c4194304 = arith.constant 4194304 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1024, %c4096], strides = [%c4194304, %c4194304, %c4194304, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c128, %c64, %c64], strides = [%c4096, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.index_cast %arg4 : i32 to index
  %5 = arith.divsi %4, %c2 : index
  %6 = arith.muli %5, %c2 : index
  %7 = arith.subi %4, %6 : index
  %8 = arith.muli %7, %c64 : index
  %9 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%9 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %10 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%10 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  pto.tcvt ins(%10 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%11 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
  %12 = pto.fusion_region {
    %14 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%9, %11 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %15 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%14, %cst_0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%15 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %16 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>
    pto.tcvt ins(%15 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>)
    %17 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tcvt ins(%16 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xi32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>)
    %18 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%17, %cst_1 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%18 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tsub ins(%14, %18 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%19 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %20 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tadds ins(%14, %cst : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%20 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %21 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%19, %cst_1 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%21 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %22 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tsub ins(%20, %21 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%22 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%22) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
  %13 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>
  pto.tcvt ins(%12 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%13 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>)
  scf.for %arg6 = %c0 to %c4 step %c1 {
    %14 = arith.muli %5, %c4 : index
    %15 = arith.addi %14, %arg6 : index
    %16 = arith.divsi %15, %c8 : index
    %17 = arith.muli %16, %c8 : index
    %18 = arith.subi %15, %17 : index
    %19 = arith.muli %18, %c512 : index
    %20 = arith.addi %19, %c448 : index
    %21 = arith.muli %16, %c128 : index
    %22 = arith.addi %21, %8 : index
    scf.for %arg7 = %c0 to %c32 step %c16 {
      %23 = arith.muli %arg7, %c2 : index
      %24 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %25 = pto.partition_view %1, offsets = [%8, %15, %23], sizes = [%c64, %c1, %c32] : !pto.tensor_view<?x?x?xf32>
      pto.tload ins(%25 : !pto.partition_tensor_view<64x1x32xf32>) outs(%24 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %26 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %27 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %28 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %8, %23], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%28 : !pto.partition_tensor_view<1x1x1x64x32xf32>) outs(%27 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %29 = pto.alloc_tile addr = %c8192_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %30 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %8, %23], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%30 : !pto.partition_tensor_view<1x1x1x64x32xf32>) outs(%29 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %31 = pto.alloc_tile addr = %c16384_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %36 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %37 = pto.subview %26[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %38 = pto.alloc_tile addr = %c24832_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
        %39 = pto.subview %13[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xi32, valid=?x?> -> !pto.tile_buf<vec, 1x32xi32>
        %40 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
        %41 = pto.alloc_tile addr = %c24704_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tgather ins(%37, %39, %40 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xi32>, !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%41 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %42 = pto.subview %31[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.fusion_region {
          pto.tmov ins(%41 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 2 : i64} :
      }
      %32 = pto.alloc_tile addr = %c16384_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %33 = pto.fusion_region {
        %36 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tmul ins(%26, %27 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %37 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tmul ins(%32, %29 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%37 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %38 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tadd ins(%36, %37 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%38 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %39 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
        pto.tcvt ins(%38 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%39 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>)
        pto.yield(%39) : (!pto.tile_buf<vec, 64x32xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
      %34 = arith.addi %20, %23 : index
      %35 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %22, %34], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%33 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>) outs(%35 : !pto.partition_tensor_view<1x1x1x64x32xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
  }
  return
}
