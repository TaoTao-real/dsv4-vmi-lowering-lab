// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @scatter_softmax_pool(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16384 = arith.constant 16384 : index
  %c8 = arith.constant 8 : index
  %c8192 = arith.constant 8192 : index
  %c20480_i64 = arith.constant 20480 : i64
  %c24576_i64 = arith.constant 24576 : i64
  %c0_i64 = arith.constant 0 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c12288_i64 = arith.constant 12288 : i64
  %c16384_i64 = arith.constant 16384 : i64
  %c18432_i64 = arith.constant 18432 : i64
  %c260 = arith.constant 260 : index
  %c2048 = arith.constant 2048 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c512 = arith.constant 512 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c1024 = arith.constant 1024 : index
  %c4096 = arith.constant 4096 : index
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %c1536 = arith.constant 1536 : index
  %cst = arith.constant -3.40282347E+38 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %c532480 = arith.constant 532480 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c260, %c2048], strides = [%c532480, %c532480, %c532480, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c16, %c512], strides = [%c8192, %c8192, %c8192, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi64>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c16, %c1024], strides = [%c16384, %c16384, %c16384, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c16, %c1024], strides = [%c16384, %c16384, %c16384, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c4, %c1024], strides = [%c4096, %c4096, %c4096, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c4, %c4096], strides = [%c16384, %c16384, %c16384, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %8 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  %9 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
  scf.for %arg8 = %c0 to %c4 step %c1 {
    %10 = arith.muli %arg8, %c2 : index
    %11 = pto.load_scalar %arg2[%10] : !pto.ptr<i32, gm> -> i32
    %12 = arith.muli %arg8, %c2 : index
    %13 = pto.load_scalar %arg3[%12] : !pto.ptr<i64, gm> -> i64
    %14 = arith.muli %arg8, %c2 : index
    %15 = arith.index_cast %11 : i32 to index
    %16 = arith.remsi %15, %c4 : index
    %17 = arith.muli %arg8, %c2 : index
    %18 = arith.addi %17, %c1 : index
    %19 = pto.load_scalar %arg2[%18] : !pto.ptr<i32, gm> -> i32
    %20 = arith.muli %arg8, %c2 : index
    %21 = arith.addi %20, %c1 : index
    %22 = pto.load_scalar %arg3[%21] : !pto.ptr<i64, gm> -> i64
    %23 = arith.muli %arg8, %c2 : index
    %24 = arith.addi %23, %c1 : index
    %25 = arith.index_cast %19 : i32 to index
    %26 = arith.remsi %25, %c4 : index
    %27 = arith.index_cast %13 : i64 to index
    %28 = arith.cmpi sge, %27, %c0 : index
    scf.if %28 {
      %43 = arith.index_cast %13 : i64 to index
      %44 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %45 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %14, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%44 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %47 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %14, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%47 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%46 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %48 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %49 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %16, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%49 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%48 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %50 = pto.fusion_region {
        %53 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
        pto.tadd ins(%46, %48 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>, !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%53) : (!pto.tile_buf<vec, 1x1024xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %51 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%44 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%51 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c1024], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%50 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%52 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
    %29 = arith.index_cast %22 : i64 to index
    %30 = arith.cmpi sge, %29, %c0 : index
    scf.if %30 {
      %43 = arith.index_cast %22 : i64 to index
      %44 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %45 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%44 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %47 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%47 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%46 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %48 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %49 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %26, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%49 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) outs(%48 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %50 = pto.fusion_region {
        %53 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c1024 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
        pto.tadd ins(%46, %48 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>, !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%53) : (!pto.tile_buf<vec, 1x1024xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>
      %51 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c0], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%44 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%51 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c1024], sizes = [%c1, %c1, %c1, %c1, %c1024] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%50 : !pto.tile_buf<vec, 1x1024xf32, valid=?x?>) outs(%52 : !pto.partition_tensor_view<1x1x1x1x1024xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
    %31 = arith.muli %arg8, %c2 : index
    %32 = pto.load_scalar %arg2[%31] : !pto.ptr<i32, gm> -> i32
    %33 = arith.index_cast %32 : i32 to index
    %34 = arith.remsi %33, %c4 : index
    %35 = arith.subi %c4, %34 : index
    %36 = arith.index_cast %32 : i32 to index
    %37 = arith.addi %36, %35 : index
    %38 = arith.subi %37, %c1 : index
    %39 = arith.subi %38, %c4 : index
    %40 = arith.addi %39, %c1 : index
    %41 = arith.subi %40, %c4 : index
    %42 = arith.cmpi sge, %34, %c2 : index
    scf.if %42 {
      %43 = arith.addi %40, %c3 : index
      %44 = arith.divsi %43, %c4 : index
      %45 = arith.remsi %43, %c4 : index
      %46 = arith.muli %arg8, %c4096 : index
      %47 = arith.addi %46, %44 : index
      %48 = pto.load_scalar %arg7[%47] : !pto.ptr<i32, gm> -> i32
      %49 = arith.index_cast %48 : i32 to index
      %50 = arith.muli %49, %c4 : index
      %51 = arith.addi %50, %45 : index
      %52 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %53 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %51, %c1536], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%53 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%52 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %54 = pto.fusion_region {
        %60 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.tsub ins(%52, %52 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%60) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %55 = pto.fusion_region {
        %60 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.texp ins(%54 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%60) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %56 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %57 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %51, %c512], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%57 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%56 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %60 = arith.addi %41, %arg9 : index
        %61 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.texpands ins(%cst : f32) outs(%61 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %62 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%62 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %63 = arith.index_cast %32 : i32 to index
        %64 = arith.cmpi sge, %63, %c4 : index
        scf.if %64 {
          %74 = arith.divsi %60, %c4 : index
          %75 = arith.remsi %60, %c4 : index
          %76 = arith.muli %arg8, %c4096 : index
          %77 = arith.addi %76, %74 : index
          %78 = pto.load_scalar %arg7[%77] : !pto.ptr<i32, gm> -> i32
          %79 = arith.index_cast %78 : i32 to index
          %80 = arith.muli %79, %c4 : index
          %81 = arith.addi %80, %75 : index
          %82 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          %83 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %81, %c1024], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%83 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %84 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          %85 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %81, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%85 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%84 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        } else {
          pto.fusion_region {
            %74 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
            pto.tmov ins(%62 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 16 : i64} : 
          pto.fusion_region {
            %74 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
            pto.tmov ins(%61 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 17 : i64} : 
        }
        %65 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmax ins(%52, %9 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %66 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tsub ins(%52, %65 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %67 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.texp ins(%66 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %68 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tsub ins(%9, %65 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %69 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.texp ins(%68 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %70 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c18432_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%67, %55 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %74 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tadd ins(%70, %69 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 11 : i64} : 
        %71 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%56, %67 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %72 = pto.fusion_region {
          %74 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%8, %69 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%74) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %74 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tadd ins(%71, %72 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 14 : i64} : 
        %73 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %74 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmov ins(%73 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 15 : i64} : 
      }
      scf.for %arg9 = %c0 to %c3 step %c1 {
        %60 = arith.addi %40, %arg9 : index
        %61 = arith.divsi %60, %c4 : index
        %62 = arith.remsi %60, %c4 : index
        %63 = arith.muli %arg8, %c4096 : index
        %64 = arith.addi %63, %61 : index
        %65 = pto.load_scalar %arg7[%64] : !pto.ptr<i32, gm> -> i32
        %66 = arith.index_cast %65 : i32 to index
        %67 = arith.muli %66, %c4 : index
        %68 = arith.addi %67, %62 : index
        %69 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %70 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %68, %c1536], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%70 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%69 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %71 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %72 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %68, %c512], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%72 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%71 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %73 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmax ins(%52, %69 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %74 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tsub ins(%52, %73 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %75 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.texp ins(%74 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %76 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tsub ins(%69, %73 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 21 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %77 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.texp ins(%76 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 22 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %78 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c18432_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%75, %55 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 23 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %82 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tadd ins(%78, %77 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 24 : i64} : 
        %79 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c16384_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%56, %75 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 25 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        %80 = pto.fusion_region {
          %82 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmul ins(%71, %77 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%82) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 26 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tadd ins(%79, %80 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 27 : i64} : 
        %81 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.fusion_region {
          %82 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
          pto.tmov ins(%81 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 28 : i64} : 
      }
      %58 = pto.fusion_region {
        %60 = pto.alloc_tile addr = %c20480_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
        pto.tdiv ins(%56, %55 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>, !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%60) : (!pto.tile_buf<vec, 1x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %59 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg8, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%58 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%59 : !pto.partition_tensor_view<1x1x1x1x512xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}

