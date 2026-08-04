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
      %50 = arith.addi %37, %arg12 : index
      %51 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%51 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %52 = pto.subview %29[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%51 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        %65 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %66 = pto.subview %30[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
      %53 = arith.index_cast %34 : i32 to index
      %54 = arith.cmpi sge, %53, %c7 : index
      scf.if %54 {
        %65 = arith.divsi %50, %c4 : index
        %66 = arith.muli %65, %c4 : index
        %67 = arith.subi %50, %66 : index
        %68 = pto.load_scalar %arg2[%65] : !pto.ptr<i32, gm> -> i32
        %69 = arith.index_cast %68 : i32 to index
        %70 = arith.cmpi sge, %69, %c0 : index
        scf.if %70 {
          %71 = arith.index_cast %68 : i32 to index
          %72 = arith.muli %71, %c4 : index
          %73 = arith.addi %72, %67 : index
          %74 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          %75 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %73, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%75 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %76 = pto.subview %29[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.fusion_region {
            pto.tmov ins(%74 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%76 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 4 : i64} :
          %77 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          %78 = arith.addi %28, %c256 : index
          %79 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %73, %78], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%79 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %80 = pto.subview %30[%arg12, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.fusion_region {
            pto.tmov ins(%77 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%80 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 5 : i64} :
        } else {
        }
      } else {
      }
      %55 = arith.addi %36, %arg12 : index
      %56 = arith.addi %arg12, %c4 : index
      %57 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%57 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %58 = pto.subview %9[%56, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%57 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%58 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        %65 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %66 = pto.subview %10[%56, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.tmov ins(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
      %59 = arith.divsi %55, %c4 : index
      %60 = arith.muli %59, %c4 : index
      %61 = arith.subi %55, %60 : index
      %62 = pto.load_scalar %arg2[%59] : !pto.ptr<i32, gm> -> i32
      %63 = arith.index_cast %62 : i32 to index
      %64 = arith.cmpi sge, %63, %c0 : index
      scf.if %64 {
        %65 = arith.index_cast %62 : i32 to index
        %66 = arith.muli %65, %c4 : index
        %67 = arith.addi %66, %61 : index
        %68 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %69 = arith.addi %28, %c128 : index
        %70 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %67, %69], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%70 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %71 = pto.subview %9[%56, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.fusion_region {
          pto.tmov ins(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 6 : i64} :
        %72 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %73 = arith.addi %28, %c384 : index
        %74 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %67, %73], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%74 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %75 = pto.subview %10[%56, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.fusion_region {
          pto.tmov ins(%72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 7 : i64} :
      } else {
      }
    }
    scf.for %arg12 = %c0 to %c128 step %c1 {
      %50 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
      %51 = arith.cmpi sle, %50, %34 : i32
      scf.if %51 {
        %52 = arith.index_cast %50 : i32 to index
        %53 = arith.cmpi sle, %37, %52 : index
        scf.if %53 {
          %54 = arith.index_cast %50 : i32 to index
          %55 = arith.remsi %54, %c4 : index
          %56 = arith.index_cast %50 : i32 to index
          %57 = arith.cmpi slt, %56, %36 : index
          scf.if %57 {
            %58 = arith.index_cast %50 : i32 to index
            %59 = arith.subi %58, %37 : index
            %60 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %61 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %55, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%61 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%60 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %62 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %63 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %arg12, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%63 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%62 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %64 = pto.fusion_region {
              %68 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
              pto.tadd ins(%62, %60 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
              pto.yield(%68) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
            } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %65 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %66 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg12, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%66 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %67 = pto.subview %29[%59, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.fusion_region {
              pto.tmov ins(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              %68 = pto.subview %30[%59, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
              pto.tmov ins(%64 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 9 : i64} :
          } else {
            %58 = arith.index_cast %50 : i32 to index
            %59 = arith.subi %58, %36 : index
            %60 = arith.addi %59, %c4 : index
            %61 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %62 = arith.addi %28, %c128 : index
            %63 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %55, %62], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%63 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%61 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %64 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %65 = arith.addi %28, %c128 : index
            %66 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %arg12, %65], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%66 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%64 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %67 = pto.fusion_region {
              %72 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
              pto.tadd ins(%64, %61 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
              pto.yield(%72) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
            } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %68 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            %69 = arith.addi %28, %c128 : index
            %70 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg12, %69], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
            pto.tload ins(%70 : !pto.partition_tensor_view<1x1x1x1x32xf32>) outs(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %71 = pto.subview %29[%60, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
            pto.fusion_region {
              pto.tmov ins(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              %72 = pto.subview %30[%60, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
              pto.tmov ins(%67 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 11 : i64} :
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
    pto.fusion_region {
      pto.tmov ins(%42 : !pto.tile_buf<vec, 1x32xf32>) outs(%43 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      %50 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      %51 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      %52 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      %53 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      %54 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tsub ins(%51, %53 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%54 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %55 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.texp ins(%54 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%55 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %56 = pto.subview %39[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%55 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      %57 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      %58 = pto.subview %29[%c7, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      %59 = pto.subview %40[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.tmov ins(%58 : !pto.tile_buf<vec, 1x32xf32>) outs(%59 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 0 : i64} :
    scf.for %arg12 = %c0 to %c7 step %c1 {
      %50 = arith.cmpi sge, %arg12, %c4 : index
      %51 = arith.index_cast %34 : i32 to index
      %52 = arith.cmpi sge, %51, %c7 : index
      %53 = arith.ori %50, %52 : i1
      scf.if %53 {
        %54 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %55 = pto.subview %38[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %56 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %57 = pto.subview %39[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %58 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %59 = pto.subview %40[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %60 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %61 = pto.subview %30[%arg12, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        %62 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %63 = pto.subview %29[%arg12, %c0] sizes [1, 32] : !pto.tile_buf<vec, 8x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
        pto.fusion_region {
          %64 = pto.alloc_tile addr = %c1408_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tmax ins(%55, %61 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%64 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %65 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tsub ins(%55, %64 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %66 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.texp ins(%65 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tsub ins(%61, %64 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %68 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.texp ins(%67 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %69 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tmul ins(%66, %57 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32>) outs(%69 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %70 = pto.alloc_tile addr = %c1664_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tadd ins(%69, %68 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %71 = pto.alloc_tile addr = %c1536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tmul ins(%59, %66 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %72 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tmul ins(%63, %68 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %73 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tadd ins(%71, %72 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %74 = pto.subview %38[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%64 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          %75 = pto.subview %39[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          %76 = pto.subview %40[%c0, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%73 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%76 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 12 : i64} :
      } else {
      }
    }
    %44 = pto.alloc_tile addr = %c1280_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %45 = pto.subview %40[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %46 = pto.alloc_tile addr = %c1152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %47 = pto.subview %39[%c0, %c0] sizes [1, 32] : !pto.tile_buf<vec, 1x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %48 = pto.fusion_region {
      %50 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tdiv ins(%45, %47 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xf32>) outs(%50 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%50) : (!pto.tile_buf<vec, 1x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %49 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %25, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%48 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%49 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
    %34 = pto.alloc_tile addr = %c1792_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%34 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %35 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %25, %28], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%34 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%35 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
