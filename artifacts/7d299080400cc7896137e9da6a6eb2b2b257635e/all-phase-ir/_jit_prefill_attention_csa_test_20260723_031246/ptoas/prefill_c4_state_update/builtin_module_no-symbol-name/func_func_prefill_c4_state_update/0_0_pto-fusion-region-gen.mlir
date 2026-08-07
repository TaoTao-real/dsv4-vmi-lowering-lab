// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_c4_state_update(%arg0: !pto.ptr<i64, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c131072 = arith.constant 131072 : index
  %c4096 = arith.constant 4096 : index
  %c532480 = arith.constant 532480 : index
  %c16384 = arith.constant 16384 : index
  %c128_i64 = arith.constant 128 : i64
  %c256_i64 = arith.constant 256 : i64
  %c0_i64 = arith.constant 0 : i64
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c512 = arith.constant 512 : index
  %c260 = arith.constant 260 : index
  %c2048 = arith.constant 2048 : index
  %c4 = arith.constant 4 : index
  %c1024 = arith.constant 1024 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c128], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi64>
  %1 = pto.make_tensor_view %arg1, shape = [%arg7], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c32, %c512], strides = [%c16384, %c16384, %c16384, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c260, %c2048], strides = [%c532480, %c532480, %c532480, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c4, %c1024], strides = [%c4096, %c4096, %c4096, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c128, %c1024], strides = [%c131072, %c131072, %c131072, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c128, %c1024], strides = [%c131072, %c131072, %c131072, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = arith.index_cast %arg8 : i32 to index
  %8 = arith.cmpi slt, %7, %c128 : index
  scf.if %8 {
    %9 = pto.load_scalar %arg0[%7] : !pto.ptr<i64, gm> -> i64
    %10 = arith.index_cast %9 : i64 to index
    %11 = arith.cmpi sge, %10, %c0 : index
    scf.if %11 {
      %12 = arith.index_cast %9 : i64 to index
      %13 = pto.load_scalar %arg1[%7] : !pto.ptr<i32, gm> -> i32
      %14 = arith.index_cast %13 : i32 to index
      %15 = arith.remsi %14, %c4 : index
      %16 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      %17 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%17 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%16 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %18 = pto.fusion_region {
        %19 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tmuls ins(%16, %cst : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, f32) outs(%19 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%19) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      scf.for %arg10 = %c0 to %c32 step %c1 {
        %19 = arith.muli %arg10, %c32 : index
        %20 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %21 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %15, %19], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%20 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %22 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %23 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %7, %19], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%22 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %24 = pto.fusion_region {
          %31 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tadd ins(%22, %18 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%31) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %25 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %12, %19], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%24 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%25 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %27 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %7, %19], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%26 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %28 = pto.fusion_region {
          %31 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tadd ins(%26, %20 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %32 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tadd ins(%31, %18 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%32) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %29 = arith.addi %19, %c1024 : index
        %30 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %12, %29], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%28 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%30 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    } else {
    }
  } else {
  }
  return
}
