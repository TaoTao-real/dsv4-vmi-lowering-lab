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
      %24 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tcvt ins(%22 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
      %25 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%24, %21 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %26 = arith.muli %arg10, %c16 : index
      %27 = arith.addi %26, %10 : index
      %28 = pto.load_scalar %arg3[%27] : !pto.ptr<f32, gm> -> f32
      %29 = arith.addi %10, %c4 : index
      %30 = arith.muli %arg10, %c16 : index
      %31 = arith.addi %30, %29 : index
      %32 = pto.load_scalar %arg3[%31] : !pto.ptr<f32, gm> -> f32
      %33 = arith.addi %10, %c8 : index
      %34 = arith.muli %arg10, %c16 : index
      %35 = arith.addi %34, %33 : index
      %36 = pto.load_scalar %arg3[%35] : !pto.ptr<f32, gm> -> f32
      %37 = arith.addi %10, %c12 : index
      %38 = arith.muli %arg10, %c16 : index
      %39 = arith.addi %38, %37 : index
      %40 = pto.load_scalar %arg3[%39] : !pto.ptr<f32, gm> -> f32
      %41 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %42 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%42 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%41 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %43 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %44 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%44 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%43 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %45 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %46 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%46 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%45 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %47 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %48 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%48 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%47 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %49 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%41, %28 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %50 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%25, %49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %51 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%43, %32 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %52 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%50, %51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %53 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%45, %36 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %54 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%52, %53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %55 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%47, %40 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %56 = pto.fusion_region {
        %59 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%54, %55 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%59) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %57 = arith.muli %10, %c4096 : index
      %58 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg10, %57], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%58 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
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
      %26 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tcvt ins(%23 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
      %27 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%26, %22 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %28 = arith.addi %arg10, %c1 : index
      %29 = arith.muli %28, %c16 : index
      %30 = arith.addi %29, %10 : index
      %31 = pto.load_scalar %arg3[%30] : !pto.ptr<f32, gm> -> f32
      %32 = arith.addi %arg10, %c1 : index
      %33 = arith.addi %10, %c4 : index
      %34 = arith.muli %32, %c16 : index
      %35 = arith.addi %34, %33 : index
      %36 = pto.load_scalar %arg3[%35] : !pto.ptr<f32, gm> -> f32
      %37 = arith.addi %arg10, %c1 : index
      %38 = arith.addi %10, %c8 : index
      %39 = arith.muli %37, %c16 : index
      %40 = arith.addi %39, %38 : index
      %41 = pto.load_scalar %arg3[%40] : !pto.ptr<f32, gm> -> f32
      %42 = arith.addi %arg10, %c1 : index
      %43 = arith.addi %10, %c12 : index
      %44 = arith.muli %42, %c16 : index
      %45 = arith.addi %44, %43 : index
      %46 = pto.load_scalar %arg3[%45] : !pto.ptr<f32, gm> -> f32
      %47 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %48 = arith.addi %arg10, %c1 : index
      %49 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %48, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%49 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%47 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %50 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %51 = arith.addi %arg10, %c1 : index
      %52 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %51, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%52 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%50 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %53 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %54 = arith.addi %arg10, %c1 : index
      %55 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %54, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%55 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %56 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %57 = arith.addi %arg10, %c1 : index
      %58 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %57, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%58 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%56 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %59 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%47, %31 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %60 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%27, %59 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %61 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%50, %36 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %62 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%60, %61 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %63 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%53, %41 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %64 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%62, %63 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %65 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c98304_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%56, %46 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %66 = pto.fusion_region {
        %70 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%64, %65 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%70) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %67 = arith.addi %arg10, %c1 : index
      %68 = arith.muli %10, %c4096 : index
      %69 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %67, %68], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%66 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%69 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
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
      %22 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      pto.tcvt ins(%20 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x4096xbf16, valid=?x?>) outs(%22 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>)
      %23 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%22, %19 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %24 = arith.muli %12, %c16 : index
      %25 = arith.addi %24, %10 : index
      %26 = pto.load_scalar %arg3[%25] : !pto.ptr<f32, gm> -> f32
      %27 = arith.addi %10, %c4 : index
      %28 = arith.muli %12, %c16 : index
      %29 = arith.addi %28, %27 : index
      %30 = pto.load_scalar %arg3[%29] : !pto.ptr<f32, gm> -> f32
      %31 = arith.addi %10, %c8 : index
      %32 = arith.muli %12, %c16 : index
      %33 = arith.addi %32, %31 : index
      %34 = pto.load_scalar %arg3[%33] : !pto.ptr<f32, gm> -> f32
      %35 = arith.addi %10, %c12 : index
      %36 = arith.muli %12, %c16 : index
      %37 = arith.addi %36, %35 : index
      %38 = pto.load_scalar %arg3[%37] : !pto.ptr<f32, gm> -> f32
      %39 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %40 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%40 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%39 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %41 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %42 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c4096], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%42 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%41 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %43 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %44 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c8192], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%44 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%43 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %45 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %46 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %12, %c12288], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%46 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) outs(%45 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %47 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%39, %26 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %48 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%23, %47 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %49 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%41, %30 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 21 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %50 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c147456_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%48, %49 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 22 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %51 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%43, %34 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 23 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %52 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%50, %51 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 24 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %53 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tmuls ins(%45, %38 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 25 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %54 = pto.fusion_region {
        %57 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.tadd ins(%52, %53 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>, !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%57) : (!pto.tile_buf<vec, 1x4096xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 26 : i64} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
      %55 = arith.muli %10, %c4096 : index
      %56 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %12, %55], sizes = [%c1, %c1, %c1, %c1, %c4096] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%54 : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>) outs(%56 : !pto.partition_tensor_view<1x1x1x1x4096xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  } else {
  }
  return
}

