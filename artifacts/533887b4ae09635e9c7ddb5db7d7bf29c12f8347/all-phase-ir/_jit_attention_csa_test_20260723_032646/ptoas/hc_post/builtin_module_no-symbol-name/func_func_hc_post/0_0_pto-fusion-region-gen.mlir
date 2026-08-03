// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_post(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: index, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c128 = arith.constant 128 : index
  %c32768 = arith.constant 32768 : index
  %c147456_i64 = arith.constant 147456 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c131072_i64 = arith.constant 131072 : i64
  %c0_i64 = arith.constant 0 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c49152_i64 = arith.constant 49152 : i64
  %c81920_i64 = arith.constant 81920 : i64
  %c98304_i64 = arith.constant 98304 : i64
  %c114688_i64 = arith.constant 114688 : i64
  %c16384 = arith.constant 16384 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c16 = arith.constant 16 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %c8192 = arith.constant 8192 : index
  %c12 = arith.constant 12 : index
  %c12288 = arith.constant 12288 : index
  %0 = arith.muli %arg5, %c16384 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg5, %c16384], strides = [%0, %0, %0, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = arith.muli %arg6, %c4 : index
  %3 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %arg6, %c4], strides = [%2, %2, %2, %c4, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8, %c16], strides = [%c128, %c128, %c128, %c16, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = arith.muli %arg5, %c16384 : index
  %7 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %arg5, %c16384], strides = [%6, %6, %6, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = arith.index_cast %arg7 : i32 to index
  %9 = arith.divsi %8, %c4 : index
  %10 = arith.remsi %8, %c4 : index
  %11 = arith.muli %9, %c4 : index
  %12 = arith.addi %11, %c4 : index
  scf.for %arg9 = %11 to %12 step %c2 {
    %16 = arith.muli %arg9, %c4 : index
    %17 = arith.addi %16, %10 : index
    %18 = pto.load_scalar %arg1[%17] : !pto.ptr<f32, gm> -> f32
    %19 = arith.addi %arg9, %c1 : index
    %20 = arith.muli %19, %c4 : index
    %21 = arith.addi %20, %10 : index
    %22 = pto.load_scalar %arg1[%21] : !pto.ptr<f32, gm> -> f32
    %23 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
    %24 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %arg9, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%23 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %25 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
    %26 = arith.addi %arg9, %c1 : index
    %27 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %26, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%25 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %28 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    pto.tcvt ins(%23 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%28 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
    %29 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%28, %18 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %30 = arith.muli %arg9, %c16 : index
    %31 = arith.addi %30, %10 : index
    %32 = pto.load_scalar %arg3[%31] : !pto.ptr<f32, gm> -> f32
    %33 = arith.addi %10, %c4 : index
    %34 = arith.muli %arg9, %c16 : index
    %35 = arith.addi %34, %33 : index
    %36 = pto.load_scalar %arg3[%35] : !pto.ptr<f32, gm> -> f32
    %37 = arith.addi %10, %c8 : index
    %38 = arith.muli %arg9, %c16 : index
    %39 = arith.addi %38, %37 : index
    %40 = pto.load_scalar %arg3[%39] : !pto.ptr<f32, gm> -> f32
    %41 = arith.addi %10, %c12 : index
    %42 = arith.muli %arg9, %c16 : index
    %43 = arith.addi %42, %41 : index
    %44 = pto.load_scalar %arg3[%43] : !pto.ptr<f32, gm> -> f32
    %45 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %46 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg9, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%46 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%45 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %47 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %48 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg9, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%48 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%47 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %49 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %50 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg9, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%50 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %51 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %52 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg9, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%52 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %53 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%45, %32 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %54 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%29, %53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %55 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%47, %36 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %56 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%54, %55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %57 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%49, %40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %58 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%56, %57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %59 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%51, %44 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %60 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%58, %59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %61 = arith.muli %10, %c4096 : index
    %62 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg9, %61], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%60 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%62 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %63 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    pto.tcvt ins(%25 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
    %64 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%63, %22 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %65 = arith.addi %arg9, %c1 : index
    %66 = arith.muli %65, %c16 : index
    %67 = arith.addi %66, %10 : index
    %68 = pto.load_scalar %arg3[%67] : !pto.ptr<f32, gm> -> f32
    %69 = arith.addi %arg9, %c1 : index
    %70 = arith.addi %10, %c4 : index
    %71 = arith.muli %69, %c16 : index
    %72 = arith.addi %71, %70 : index
    %73 = pto.load_scalar %arg3[%72] : !pto.ptr<f32, gm> -> f32
    %74 = arith.addi %arg9, %c1 : index
    %75 = arith.addi %10, %c8 : index
    %76 = arith.muli %74, %c16 : index
    %77 = arith.addi %76, %75 : index
    %78 = pto.load_scalar %arg3[%77] : !pto.ptr<f32, gm> -> f32
    %79 = arith.addi %arg9, %c1 : index
    %80 = arith.addi %10, %c12 : index
    %81 = arith.muli %79, %c16 : index
    %82 = arith.addi %81, %80 : index
    %83 = pto.load_scalar %arg3[%82] : !pto.ptr<f32, gm> -> f32
    %84 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %85 = arith.addi %arg9, %c1 : index
    %86 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %85, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%86 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%84 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %87 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %88 = arith.addi %arg9, %c1 : index
    %89 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %88, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%89 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%87 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %90 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %91 = arith.addi %arg9, %c1 : index
    %92 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %91, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%92 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%90 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %93 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %94 = arith.addi %arg9, %c1 : index
    %95 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %94, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%95 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%93 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %96 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%84, %68 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %97 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%64, %96 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %98 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%87, %73 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %99 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%97, %98 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %100 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%90, %78 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %101 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%99, %100 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %102 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%93, %83 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %103 = pto.fusion_region {
      %107 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%101, %102 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%107 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%107) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %104 = arith.addi %arg9, %c1 : index
    %105 = arith.muli %10, %c4096 : index
    %106 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %104, %105], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%103 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%106 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %13 = arith.subi %11, %12 : index
  %14 = arith.addi %13, %c4 : index
  %15 = arith.cmpi eq, %14, %c1 : index
  scf.if %15 {
    %16 = arith.muli %12, %c4 : index
    %17 = arith.addi %16, %10 : index
    %18 = pto.load_scalar %arg1[%17] : !pto.ptr<f32, gm> -> f32
    %19 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
    %20 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%20 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%19 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %21 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    pto.tcvt ins(%19 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%21 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
    %22 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%21, %18 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %23 = arith.muli %12, %c16 : index
    %24 = arith.addi %23, %10 : index
    %25 = pto.load_scalar %arg3[%24] : !pto.ptr<f32, gm> -> f32
    %26 = arith.addi %10, %c4 : index
    %27 = arith.muli %12, %c16 : index
    %28 = arith.addi %27, %26 : index
    %29 = pto.load_scalar %arg3[%28] : !pto.ptr<f32, gm> -> f32
    %30 = arith.addi %10, %c8 : index
    %31 = arith.muli %12, %c16 : index
    %32 = arith.addi %31, %30 : index
    %33 = pto.load_scalar %arg3[%32] : !pto.ptr<f32, gm> -> f32
    %34 = arith.addi %10, %c12 : index
    %35 = arith.muli %12, %c16 : index
    %36 = arith.addi %35, %34 : index
    %37 = pto.load_scalar %arg3[%36] : !pto.ptr<f32, gm> -> f32
    %38 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %39 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%39 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%38 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %40 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %41 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%41 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %42 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %43 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%43 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%42 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %44 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %45 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%44 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %46 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%38, %25 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %47 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%22, %46 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %48 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%40, %29 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 21 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %49 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%47, %48 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 22 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %50 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%42, %33 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 23 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %51 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%49, %50 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 24 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %52 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tmuls ins(%44, %37 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 25 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %53 = pto.fusion_region {
      %56 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tadd ins(%51, %52 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 26 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
    %54 = arith.muli %10, %c4096 : index
    %55 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %12, %54], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%55 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
  }
  return
}

