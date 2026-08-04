// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @scatter_softmax_pool_0(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i64, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16384 = arith.constant 16384 : index
  %c1024 = arith.constant 1024 : index
  %c8 = arith.constant 8 : index
  %c2048 = arith.constant 2048 : index
  %c4608_i64 = arith.constant 4608 : i64
  %c5632_i64 = arith.constant 5632 : i64
  %c0_i64 = arith.constant 0 : i64
  %c1024_i64 = arith.constant 1024 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c3072_i64 = arith.constant 3072 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c4352_i64 = arith.constant 4352 : i64
  %c260 = arith.constant 260 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c128 = arith.constant 128 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c256 = arith.constant 256 : index
  %c4096 = arith.constant 4096 : index
  %c0 = arith.constant 0 : index
  %c64 = arith.constant 64 : index
  %c3 = arith.constant 3 : index
  %c384 = arith.constant 384 : index
  %cst = arith.constant -3.40282347E+38 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %c133120 = arith.constant 133120 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c260, %c512], strides = [%c133120, %c133120, %c133120, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c16, %c128], strides = [%c2048, %c2048, %c2048, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi64>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c16, %c256], strides = [%c4096, %c4096, %c4096, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c16, %c256], strides = [%c4096, %c4096, %c4096, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c4, %c256], strides = [%c1024, %c1024, %c1024, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c4, %c4096], strides = [%c16384, %c16384, %c16384, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %9 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
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
      %44 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %45 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %14, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%44 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %47 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %14, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%47 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%46 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %48 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %49 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %16, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%49 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%48 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %50 = pto.fusion_region {
        %53 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.tadd ins(%46, %48 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%53) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %51 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%44 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%51 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c256], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%50 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%52 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
    %29 = arith.index_cast %22 : i64 to index
    %30 = arith.cmpi sge, %29, %c0 : index
    scf.if %30 {
      %43 = arith.index_cast %22 : i64 to index
      %44 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %45 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%45 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%44 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %46 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %47 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %24, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%47 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%46 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %48 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %49 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %26, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%49 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%48 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %50 = pto.fusion_region {
        %53 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.tadd ins(%46, %48 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%53) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %51 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%44 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%51 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %52 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %43, %c256], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tstore ins(%50 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%52 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
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
      scf.for %arg9 = %c0 to %c2 step %c1 {
        %43 = arith.muli %arg9, %c64 : index
        %44 = arith.addi %40, %c3 : index
        %45 = arith.divsi %44, %c4 : index
        %46 = arith.remsi %44, %c4 : index
        %47 = arith.muli %arg8, %c4096 : index
        %48 = arith.addi %47, %45 : index
        %49 = pto.load_scalar %arg7[%48] : !pto.ptr<i32, gm> -> i32
        %50 = arith.index_cast %49 : i32 to index
        %51 = arith.muli %50, %c4 : index
        %52 = arith.addi %51, %46 : index
        %53 = arith.addi %43, %c384 : index
        %54 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %55 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %52, %53], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%55 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %56 = pto.fusion_region {
          %62 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.tsub ins(%54, %54 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %63 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.texp ins(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%63) : (!pto.tile_buf<vec, 1x64xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %58 = arith.addi %43, %c128 : index
        %59 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %52, %58], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%59 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%57 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        scf.for %arg10 = %c0 to %c4 step %c1 {
          %62 = arith.addi %41, %arg10 : index
          %63 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.texpands ins(%cst : f32) outs(%63 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          %64 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.texpands ins(%cst_0 : f32) outs(%64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          %65 = arith.index_cast %32 : i32 to index
          %66 = arith.cmpi sge, %65, %c4 : index
          scf.if %66 {
            %67 = arith.divsi %62, %c4 : index
            %68 = arith.remsi %62, %c4 : index
            %69 = arith.muli %arg8, %c4096 : index
            %70 = arith.addi %69, %67 : index
            %71 = pto.load_scalar %arg7[%70] : !pto.ptr<i32, gm> -> i32
            %72 = arith.index_cast %71 : i32 to index
            %73 = arith.muli %72, %c4 : index
            %74 = arith.addi %73, %68 : index
            %75 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            %76 = arith.addi %43, %c256 : index
            %77 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %74, %76], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%77 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%75 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %78 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            %79 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %74, %43], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%79 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%78 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          } else {
            pto.fusion_region {
              %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
              pto.tmov ins(%64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              %68 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
              pto.tmov ins(%63 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 5 : i64} :
          }
          pto.fusion_region {
            %67 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmax ins(%54, %9 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %68 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tsub ins(%54, %67 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %69 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.texp ins(%68 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%69 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %70 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tsub ins(%9, %67 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %71 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.texp ins(%70 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %72 = pto.alloc_tile addr = %c4352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%69, %56 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %73 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tadd ins(%72, %71 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %74 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%57, %69 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %75 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%8, %71 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %76 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tadd ins(%74, %75 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%76 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %77 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            %78 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmov ins(%77 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 4 : i64} :
        }
        scf.for %arg10 = %c0 to %c3 step %c1 {
          %62 = arith.addi %40, %arg10 : index
          %63 = arith.divsi %62, %c4 : index
          %64 = arith.remsi %62, %c4 : index
          %65 = arith.muli %arg8, %c4096 : index
          %66 = arith.addi %65, %63 : index
          %67 = pto.load_scalar %arg7[%66] : !pto.ptr<i32, gm> -> i32
          %68 = arith.index_cast %67 : i32 to index
          %69 = arith.muli %68, %c4 : index
          %70 = arith.addi %69, %64 : index
          %71 = arith.addi %43, %c384 : index
          %72 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          %73 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %70, %71], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%73 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %74 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          %75 = arith.addi %43, %c128 : index
          %76 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %70, %75], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%76 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%74 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          pto.fusion_region {
            %77 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmax ins(%54, %72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%77 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %78 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tsub ins(%54, %77 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %79 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.texp ins(%78 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%79 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %80 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tsub ins(%72, %77 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%80 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %81 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.texp ins(%80 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%81 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %82 = pto.alloc_tile addr = %c4352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%79, %56 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %83 = pto.alloc_tile addr = %c5632_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tadd ins(%82, %81 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%83 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %84 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%57, %79 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%84 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %85 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmul ins(%74, %81 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%85 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %86 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tadd ins(%84, %85 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%86 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            %87 = pto.alloc_tile addr = %c3072_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            %88 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
            pto.tmov ins(%87 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%88 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 6 : i64} :
        }
        %60 = pto.fusion_region {
          %62 = pto.alloc_tile addr = %c4608_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.tdiv ins(%57, %56 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%62) : (!pto.tile_buf<vec, 1x64xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %61 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg8, %43], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%60 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%61 : !pto.partition_tensor_view<1x1x1x1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    } else {
    }
  }
  return
}
