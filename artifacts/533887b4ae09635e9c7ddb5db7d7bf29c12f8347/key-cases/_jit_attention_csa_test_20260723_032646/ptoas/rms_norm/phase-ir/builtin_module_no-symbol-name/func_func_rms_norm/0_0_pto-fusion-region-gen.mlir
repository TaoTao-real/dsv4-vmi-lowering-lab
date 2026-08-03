// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @rms_norm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c8256_i64 = arith.constant 8256 : i64
  %c12864_i64 = arith.constant 12864 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c8768_i64 = arith.constant 8768 : i64
  %c16960_i64 = arith.constant 16960 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c8224_i64 = arith.constant 8224 : i64
  %c8512_i64 = arith.constant 8512 : i64
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c2 = arith.constant 2 : index
  %c128 = arith.constant 128 : index
  %cst_0 = arith.constant 2.44140625E-4 : f32
  %cst_1 = arith.constant 9.99999997E-7 : f32
  %c32768 = arith.constant 32768 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%c4096], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xbf16>
  %3 = arith.index_cast %arg3 : i32 to index
  %4 = arith.muli %3, %c8 : index
  %5 = pto.alloc_tile addr = %c8256_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%5 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %11 = arith.muli %arg5, %c128 : index
    %12 = arith.muli %arg5, %c128 : index
    %13 = arith.addi %12, %c128 : index
    %14 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %15 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %11], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) outs(%14 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %16 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %17 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %13], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%17 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) outs(%16 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %18 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tcvt ins(%14 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
    %19 = pto.fusion_region {
      %27 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.tmul ins(%18, %18 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%27) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %20 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.fusion_region {
      %27 = pto.alloc_tile addr = %c16960_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%19, %20 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 3 : i64} : 
    %21 = pto.alloc_tile addr = %c16960_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %22 = pto.fusion_region {
      %27 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%5, %21 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%27) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tcvt ins(%16 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
    %24 = pto.fusion_region {
      %27 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.tmul ins(%23, %23 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%27) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %25 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.fusion_region {
      %27 = pto.alloc_tile addr = %c8192_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%24, %25 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 6 : i64} : 
    %26 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.fusion_region {
      %27 = pto.alloc_tile addr = %c8256_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.tadd ins(%22, %26 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 7 : i64} : 
  }
  %6 = pto.fusion_region {
    %11 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tmuls ins(%5, %cst_0 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%11 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%11) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %7 = pto.fusion_region {
    %11 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    pto.tadds ins(%6, %cst_1 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, f32) outs(%11 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%11) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %8 = pto.alloc_tile addr = %c12864_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %9 = pto.alloc_tile addr = %c8224_i64 valid_row = %c1 valid_col = %c8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  pto.trsqrt ins(%7, %8 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>, !pto.tile_buf<vec, 1x8xf32, valid=?x?>) outs(%9 : !pto.tile_buf<vec, 1x8xf32, valid=?x?>) {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], precisionType = #pto<rsqrt_precision default>, pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trsqrt_with_tmp", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %10 = pto.alloc_tile addr = %c8224_i64 valid_row = %c8 valid_col = %c1 : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %11 = arith.muli %arg5, %c128 : index
    %12 = arith.muli %arg5, %c128 : index
    %13 = arith.addi %12, %c128 : index
    %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %15 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %11], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) outs(%14 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %16 = pto.alloc_tile addr = %c8256_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>
    %17 = pto.partition_view %2, offsets = [%11], sizes = [%c128] : !pto.tensor_view<?xbf16>
    pto.tload ins(%17 : !pto.partition_tensor_view<128xbf16>) outs(%16 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %18 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %19 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %4, %13], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%19 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) outs(%18 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %20 = pto.alloc_tile addr = %c8512_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>
    %21 = pto.partition_view %2, offsets = [%13], sizes = [%c128] : !pto.tensor_view<?xbf16>
    pto.tload ins(%21 : !pto.partition_tensor_view<128xbf16>) outs(%20 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %22 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tcvt ins(%14 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%22 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
    %23 = pto.alloc_tile addr = %c8256_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>
    %24 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.tcvt ins(%23 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>)
    %25 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.trowexpandmul ins(%22, %10 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%25 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %26 = pto.fusion_region {
      %36 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.tcolexpandmul ins(%25, %24 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%36) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %27 = pto.fusion_region {
      %36 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      pto.tcvt ins(%26 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>)
      pto.yield(%36) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %28 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %11], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%27 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%28 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %29 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.tcvt ins(%18 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%29 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>)
    %30 = pto.alloc_tile addr = %c8512_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>
    %31 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.tcvt ins(%30 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x128xbf16, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>)
    %32 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.trowexpandmul ins(%29, %10 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>) outs(%32 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %33 = pto.fusion_region {
      %36 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      pto.tcolexpandmul ins(%32, %31 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%36) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %34 = pto.fusion_region {
      %36 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      pto.tcvt ins(%33 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>)
      pto.yield(%36) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %35 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %4, %13], sizes = [%c1, %c1, %c1, %c8, %c128] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%34 : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>) outs(%35 : !pto.partition_tensor_view<1x1x1x8x128xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}

