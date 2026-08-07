// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @hc_post_prefill(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: index, %arg6: index, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c2048 = arith.constant 2048 : index
  %c524288 = arith.constant 524288 : index
  %c131072_i64 = arith.constant 131072 : i64
  %c114688_i64 = arith.constant 114688 : i64
  %c147456_i64 = arith.constant 147456 : i64
  %c0_i64 = arith.constant 0 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c49152_i64 = arith.constant 49152 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c81920_i64 = arith.constant 81920 : i64
  %c98304_i64 = arith.constant 98304 : i64
  %c16384 = arith.constant 16384 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %c128 = arith.constant 128 : index
  %c4096 = arith.constant 4096 : index
  %c16 = arith.constant 16 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %c8 = arith.constant 8 : index
  %c8192 = arith.constant 8192 : index
  %c12 = arith.constant 12 : index
  %c12288 = arith.constant 12288 : index
  %0 = arith.muli %arg6, %c16384 : index
  %1 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %arg6, %c16384], strides = [%0, %0, %0, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = arith.muli %arg7, %c4 : index
  %3 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %arg7, %c4], strides = [%2, %2, %2, %c4, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c4096], strides = [%c524288, %c524288, %c524288, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c128, %c16], strides = [%c2048, %c2048, %c2048, %c16, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = arith.muli %arg6, %c16384 : index
  %7 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %arg6, %c16384], strides = [%6, %6, %6, %c16384, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = arith.index_cast %arg8 : i32 to index
  %9 = arith.divsi %8, %c4 : index
  %10 = arith.remsi %8, %c4 : index
  %11 = arith.muli %9, %c4 : index
  %12 = arith.addi %11, %c4 : index
  scf.for %arg10 = %11 to %12 step %c2 {
    %16 = arith.cmpi slt, %arg10, %arg5 : index
    scf.if %16 {
      %19 = arith.muli %arg10, %c4 : index
      %20 = arith.addi %19, %10 : index
      %21 = pto.load_scalar %arg1[%20] : !pto.ptr<f32, gm> -> f32
      %22 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
      %23 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %arg10, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%22 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %24 = pto.fusion_region {
        %51 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tcvt ins(%22 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
        %52 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%51, %21 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%52 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%52) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %25 = arith.muli %arg10, %c16 : index
      %26 = arith.addi %25, %10 : index
      %27 = pto.load_scalar %arg3[%26] : !pto.ptr<f32, gm> -> f32
      %28 = arith.addi %10, %c4 : index
      %29 = arith.muli %arg10, %c16 : index
      %30 = arith.addi %29, %28 : index
      %31 = pto.load_scalar %arg3[%30] : !pto.ptr<f32, gm> -> f32
      %32 = arith.addi %10, %c8 : index
      %33 = arith.muli %arg10, %c16 : index
      %34 = arith.addi %33, %32 : index
      %35 = pto.load_scalar %arg3[%34] : !pto.ptr<f32, gm> -> f32
      %36 = arith.addi %10, %c12 : index
      %37 = arith.muli %arg10, %c16 : index
      %38 = arith.addi %37, %36 : index
      %39 = pto.load_scalar %arg3[%38] : !pto.ptr<f32, gm> -> f32
      %40 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %41 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%41 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %42 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %43 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%43 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%42 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %44 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %45 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%44 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %47 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%47 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%46 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %48 = pto.fusion_region {
        %51 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%40, %27 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %52 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%24, %51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %53 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%42, %31 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %54 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%52, %53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %55 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%44, %35 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %56 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%54, %55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %57 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%46, %39 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %58 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%56, %57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%58 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%58) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %49 = arith.muli %10, %c4096 : index
      %50 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg10, %49], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%48 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%50 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
    %17 = arith.addi %arg10, %c1 : index
    %18 = arith.cmpi slt, %17, %arg5 : index
    scf.if %18 {
      %19 = arith.addi %arg10, %c1 : index
      %20 = arith.muli %19, %c4 : index
      %21 = arith.addi %20, %10 : index
      %22 = pto.load_scalar %arg1[%21] : !pto.ptr<f32, gm> -> f32
      %23 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
      %24 = arith.addi %arg10, %c1 : index
      %25 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%25 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%23 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %26 = pto.fusion_region {
        %62 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tcvt ins(%23 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
        %63 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%62, %22 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%63 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%63) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %27 = arith.addi %arg10, %c1 : index
      %28 = arith.muli %27, %c16 : index
      %29 = arith.addi %28, %10 : index
      %30 = pto.load_scalar %arg3[%29] : !pto.ptr<f32, gm> -> f32
      %31 = arith.addi %arg10, %c1 : index
      %32 = arith.addi %10, %c4 : index
      %33 = arith.muli %31, %c16 : index
      %34 = arith.addi %33, %32 : index
      %35 = pto.load_scalar %arg3[%34] : !pto.ptr<f32, gm> -> f32
      %36 = arith.addi %arg10, %c1 : index
      %37 = arith.addi %10, %c8 : index
      %38 = arith.muli %36, %c16 : index
      %39 = arith.addi %38, %37 : index
      %40 = pto.load_scalar %arg3[%39] : !pto.ptr<f32, gm> -> f32
      %41 = arith.addi %arg10, %c1 : index
      %42 = arith.addi %10, %c12 : index
      %43 = arith.muli %41, %c16 : index
      %44 = arith.addi %43, %42 : index
      %45 = pto.load_scalar %arg3[%44] : !pto.ptr<f32, gm> -> f32
      %46 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %47 = arith.addi %arg10, %c1 : index
      %48 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %47, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%48 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%46 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %49 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %50 = arith.addi %arg10, %c1 : index
      %51 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %50, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%51 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %53 = arith.addi %arg10, %c1 : index
      %54 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %53, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%54 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%52 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %55 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %56 = arith.addi %arg10, %c1 : index
      %57 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %56, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%57 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %58 = pto.fusion_region {
        %62 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%46, %30 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%62 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %63 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%26, %62 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %64 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%49, %35 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%64 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %65 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%63, %64 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %66 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%52, %40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%66 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %67 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%65, %66 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %68 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%55, %45 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%68 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %69 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%67, %68 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%69 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%69) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %59 = arith.addi %arg10, %c1 : index
      %60 = arith.muli %10, %c4096 : index
      %61 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %59, %60], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%58 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%61 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  %13 = arith.subi %11, %12 : index
  %14 = arith.addi %13, %c4 : index
  %15 = arith.cmpi eq, %14, %c1 : index
  scf.if %15 {
    %16 = arith.cmpi slt, %12, %arg5 : index
    scf.if %16 {
      %17 = arith.muli %12, %c4 : index
      %18 = arith.addi %17, %10 : index
      %19 = pto.load_scalar %arg1[%18] : !pto.ptr<f32, gm> -> f32
      %20 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>
      %21 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x1x4096xbf16>) outs(%20 : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %22 = pto.fusion_region {
        %49 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tcvt ins(%20 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
        %50 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%49, %19 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%50 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%50) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
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
      %38 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %39 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%39 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%38 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %40 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %41 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%41 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %42 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %43 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%43 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%42 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %44 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %45 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%44 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.fusion_region {
        %49 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%38, %25 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %50 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%22, %49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%50 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %51 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%40, %29 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %52 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%50, %51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %53 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%42, %33 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %54 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%52, %53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %55 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%44, %37 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %56 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%54, %55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%56) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %47 = arith.muli %10, %c4096 : index
      %48 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %12, %47], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%46 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%48 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  } else {
  }
  return
}
