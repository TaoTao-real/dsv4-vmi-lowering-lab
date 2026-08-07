// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32768 = arith.constant 32768 : index
  %c1024 = arith.constant 1024 : index
  %c133120 = arith.constant 133120 : index
  %c1792_i64 = arith.constant 1792 : i64
  %c0_i64 = arith.constant 0 : i64
  %c1024_i64 = arith.constant 1024 : i64
  %c1152_i64 = arith.constant 1152 : i64
  %c1280_i64 = arith.constant 1280 : i64
  %c1408_i64 = arith.constant 1408 : i64
  %c1536_i64 = arith.constant 1536 : i64
  %c1664_i64 = arith.constant 1664 : i64
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c4096 = arith.constant 4096 : index
  %c260 = arith.constant 260 : index
  %c512 = arith.constant 512 : index
  %c4 = arith.constant 4 : index
  %c256 = arith.constant 256 : index
  %c128 = arith.constant 128 : index
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c-3 = arith.constant -3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant -3.40282347E+38 : f32
  %c7 = arith.constant 7 : index
  %c384 = arith.constant 384 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c4096], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c260, %c512], strides = [%c133120, %c133120, %c133120, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%arg9], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c4, %c256], strides = [%c1024, %c1024, %c1024, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c128, %c256], strides = [%c32768, %c32768, %c32768, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c128, %c256], strides = [%c32768, %c32768, %c32768, %c256, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = pto.make_tensor_view %arg8, shape = [%c1, %c1, %c1, %c32, %c128], strides = [%c4096, %c4096, %c4096, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %9 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %11 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %13 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %15 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %17 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %19 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %20 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %21 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %22 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %23 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
  %24 = arith.index_cast %arg10 : i32 to index
  %25 = arith.divsi %24, %c4 : index
  %26 = arith.muli %25, %c4 : index
  %27 = arith.subi %24, %26 : index
  %28 = arith.muli %27, %c32 : index
  %29 = pto.alloc_tile addr = %c1792_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %30 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c32 : !pto.tile_buf<vec, 8x32xf32, valid=?x?>
  %31 = pto.load_scalar %arg0[%25] : !pto.ptr<i32, gm> -> i32
  %32 = arith.index_cast %31 : i32 to index
  %33 = arith.cmpi sge, %32, %c0 : index
  scf.if %33 {
    %34 = pto.load_scalar %arg1[%25] : !pto.ptr<i32, gm> -> i32
    %35 = arith.index_cast %34 : i32 to index
    %36 = arith.addi %35, %c-3 : index
    %37 = arith.subi %36, %c4 : index
    scf.for %arg12 = %c0 to %c4 step %c1 {
      %60 = arith.addi %37, %arg12 : index
      %61 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%61 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %62 = pto.subview %29[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%61 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %63 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst_0 : f32) outs(%63 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %64 = pto.subview %30[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%63 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %65 = arith.index_cast %34 : i32 to index
      %66 = arith.cmpi sge, %65, %c7 : index
      scf.if %66 {
        %79 = arith.divsi %60, %c4 : index
        %80 = arith.muli %79, %c4 : index
        %81 = arith.subi %60, %80 : index
        %82 = pto.load_scalar %arg2[%79] : !pto.ptr<i32, gm> -> i32
        %83 = arith.index_cast %82 : i32 to index
        %84 = arith.cmpi sge, %83, %c0 : index
        scf.if %84 {
          %85 = arith.index_cast %82 : i32 to index
          %86 = arith.muli %85, %c4 : index
          %87 = arith.addi %86, %81 : index
          %88 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          %89 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %87, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%89 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%88 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %90 = pto.subview %29[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%88 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%90 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          %91 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          %92 = arith.addi %28, %c256 : index
          %93 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %87, %92], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%93 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%91 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %94 = pto.subview %30[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%91 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%94 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        } else {
        }
      } else {
      }
      %67 = arith.addi %36, %arg12 : index
      %68 = arith.addi %arg12, %c4 : index
      %69 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%69 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %70 = pto.subview %9[%68, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%69 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %71 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst_0 : f32) outs(%71 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %72 = pto.subview %10[%68, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%71 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %73 = arith.divsi %67, %c4 : index
      %74 = arith.muli %73, %c4 : index
      %75 = arith.subi %67, %74 : index
      %76 = pto.load_scalar %arg2[%73] : !pto.ptr<i32, gm> -> i32
      %77 = arith.index_cast %76 : i32 to index
      %78 = arith.cmpi sge, %77, %c0 : index
      scf.if %78 {
        %79 = arith.index_cast %76 : i32 to index
        %80 = arith.muli %79, %c4 : index
        %81 = arith.addi %80, %75 : index
        %82 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %83 = arith.addi %28, %c128 : index
        %84 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %81, %83], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%84 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%82 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %85 = pto.subview %9[%68, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%82 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%85 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %86 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %87 = arith.addi %28, %c384 : index
        %88 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %81, %87], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%88 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%86 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %89 = pto.subview %10[%68, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%86 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%89 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      } else {
      }
    }
    scf.for %arg12 = %c0 to %c128 step %c1 {
      %60 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
      %61 = arith.cmpi sle, %60, %34 : i32
      scf.if %61 {
        %62 = arith.index_cast %60 : i32 to index
        %63 = arith.cmpi sle, %37, %62 : index
        scf.if %63 {
          %64 = arith.index_cast %60 : i32 to index
          %65 = arith.remsi %64, %c4 : index
          %66 = arith.index_cast %60 : i32 to index
          %67 = arith.cmpi slt, %66, %36 : index
          scf.if %67 {
            %68 = arith.index_cast %60 : i32 to index
            %69 = arith.subi %68, %37 : index
            %70 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %71 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %65, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%71 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %72 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %73 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %arg12, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%73 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %74 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.tadd ins(%72, %70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
            %75 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %76 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg12, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%76 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%75 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %77 = pto.subview %29[%69, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.tmov ins(%75 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%77 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
            %78 = pto.subview %30[%69, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.tmov ins(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          } else {
            %68 = arith.index_cast %60 : i32 to index
            %69 = arith.subi %68, %36 : index
            %70 = arith.addi %69, %c4 : index
            %71 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %72 = arith.addi %28, %c128 : index
            %73 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %65, %72], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%73 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%71 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %74 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %75 = arith.addi %28, %c128 : index
            %76 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %arg12, %75], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%76 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %77 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.tadd ins(%74, %71 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
            %78 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %79 = arith.addi %28, %c128 : index
            %80 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg12, %79], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%80 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%78 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %81 = pto.subview %29[%70, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.tmov ins(%78 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%81 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
            %82 = pto.subview %30[%70, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.tmov ins(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          }
        } else {
        }
      } else {
      }
    }
    %38 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %39 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %40 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %41 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %42 = pto.subview %30[%c7, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %43 = pto.subview %38[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    pto.tmov ins(%42 : !pto.tile_buf<vec, 1x32xf32>) outs(%43 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %44 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %45 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %46 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %47 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %48 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.tsub ins(%45, %47 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%48 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %49 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.texp ins(%48 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %50 = pto.subview %39[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    pto.tmov ins(%49 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%50 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %51 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %52 = pto.subview %29[%c7, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %53 = pto.subview %40[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    pto.tmov ins(%52 : !pto.tile_buf<vec, 1x32xf32>) outs(%53 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    scf.for %arg12 = %c0 to %c7 step %c1 {
      %60 = arith.cmpi sge, %arg12, %c4 : index
      %61 = arith.index_cast %34 : i32 to index
      %62 = arith.cmpi sge, %61, %c7 : index
      %63 = arith.ori %60, %62 : i1
      scf.if %63 {
        %64 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %65 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %66 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %67 = pto.subview %39[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %68 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %69 = pto.subview %40[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %70 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %71 = pto.subview %30[%arg12, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %72 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %73 = pto.subview %29[%arg12, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %74 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tmax ins(%65, %71 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %75 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tsub ins(%65, %74 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %76 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.texp ins(%75 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%76 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %77 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tsub ins(%71, %74 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %78 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.texp ins(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %79 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tmul ins(%76, %67 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32>) outs(%79 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %80 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tadd ins(%79, %78 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%80 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %81 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tmul ins(%69, %76 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%81 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %82 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tmul ins(%73, %78 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %83 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.tadd ins(%81, %82 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%83 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %84 = pto.subview %38[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%84 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %85 = pto.subview %39[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%80 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%85 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %86 = pto.subview %40[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%83 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%86 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      } else {
      }
    }
    %54 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %55 = pto.subview %40[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %56 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %57 = pto.subview %39[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %58 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.tdiv ins(%55, %57 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%58 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %59 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %25, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%58 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%59 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
    %34 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%34 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %35 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %25, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%34 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%35 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
