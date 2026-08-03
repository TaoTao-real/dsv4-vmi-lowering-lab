// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @rmsnorm_rope_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>, %arg8: !pto.ptr<i64, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c2097152 = arith.constant 2097152 : index
  %c8192 = arith.constant 8192 : index
  %c27200_i64 = arith.constant 27200 : i64
  %c0_i64 = arith.constant 0 : i64
  %c6144_i64 = arith.constant 6144 : i64
  %c14400_i64 = arith.constant 14400 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c14336_i64 = arith.constant 14336 : i64
  %c18496_i64 = arith.constant 18496 : i64
  %c22592_i64 = arith.constant 22592 : i64
  %c26688_i64 = arith.constant 26688 : i64
  %c26944_i64 = arith.constant 26944 : i64
  %c4 = arith.constant 4 : index
  %c32 = arith.constant 32 : index
  %c1 = arith.constant 1 : index
  %c16 = arith.constant 16 : index
  %c512 = arith.constant 512 : index
  %c4096 = arith.constant 4096 : index
  %c8 = arith.constant 8 : index
  %c2 = arith.constant 2 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c64 = arith.constant 64 : index
  %c128 = arith.constant 128 : index
  %cst_0 = arith.constant 0.001953125 : f32
  %cst_1 = arith.constant 9.99999997E-7 : f32
  %c448 = arith.constant 448 : index
  %cst_2 = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_3 = arith.constant 5.000000e-01 : f32
  %cst_4 = arith.constant 2.000000e+00 : f32
  %c3 = arith.constant 3 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c16, %c512], strides = [%c8192, %c8192, %c8192, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16, %c512], strides = [%c8192, %c8192, %c8192, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c1, %c512], strides = [%c512, %c512, %c512, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c4096, %c512], strides = [%c2097152, %c2097152, %c2097152, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c8, %c512], strides = [%c4096, %c4096, %c4096, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %8 = pto.make_tensor_view %arg8, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi64>
  %9 = pto.alloc_tile addr = %c27200_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%9 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%10 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %11 = pto.alloc_tile addr = %c6144_i64 valid_row = %c4 valid_col = %c32 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>
  %12 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c4, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x4x32xf32>) outs(%11 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %13 = pto.subview %9[%c0, %c0] sizes [4, 32] valid [%c4, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 4x32xf32>
  pto.fusion_region {
    pto.tmov ins(%11 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>) outs(%13 : !pto.tile_buf<vec, 4x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 0 : i64} : 
  %14 = pto.alloc_tile addr = %c6144_i64 valid_row = %c4 valid_col = %c32 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>
  %15 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c4, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%15 : !pto.partition_tensor_view<1x1x1x4x32xf32>) outs(%14 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %16 = pto.subview %10[%c0, %c0] sizes [4, 32] valid [%c4, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 4x32xf32>
  pto.fusion_region {
    pto.tmov ins(%14 : !pto.tile_buf<vec, 4x32xf32, valid=?x?>) outs(%16 : !pto.tile_buf<vec, 4x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 1 : i64} : 
  %17 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%17 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg9 = %c0 to %c512 step %c64 {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %61 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %arg9], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%61 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %62 = pto.fusion_region {
      %65 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.tmul ins(%60, %60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%65) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %63 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.fusion_region {
      %65 = pto.alloc_tile addr = %c14336_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%62, %63 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 18 : i64} : 
    %64 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %65 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tadd ins(%17, %64 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 19 : i64} : 
  }
  %18 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmuls ins(%17, %cst_0 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 1x16xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tadds ins(%18, %cst_1 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 3 : i64} : 
  %19 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %20 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %21 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.tsqrt ins(%20 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%21 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsqrt", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsqrt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsqrt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %22 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %23 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %24 = pto.alloc_tile addr = %c18496_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.trecip ins(%23 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %25 = pto.alloc_tile addr = %c18496_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  scf.for %arg9 = %c0 to %c448 step %c64 {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %61 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %arg9], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%61 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %62 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
    %63 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c0, %arg9], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%63 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%62 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %64 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tcvt ins(%62 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
    %65 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.trowexpandmul ins(%60, %25 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%65 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %66 = pto.fusion_region {
      %68 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%65, %64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%68) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %67 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %c0, %arg9], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %26 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %27 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %c0, %c448], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%26 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %28 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
  %29 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %c0, %c448], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tload ins(%29 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%28 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %30 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%28 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%30 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %31 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.trowexpandmul ins(%26, %25 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%31 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %32 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%31, %30 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %33 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.texpands ins(%cst_2 : f32) outs(%33 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %34 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%34 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %35 = pto.alloc_tile addr = %c14400_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%34 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%35 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %36 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%33, %35 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %37 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%36, %cst_3 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %38 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%37 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%38 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %39 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tcvt ins(%38 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xi32, valid=?x?>) outs(%39 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>)
  %40 = pto.alloc_tile addr = %c18496_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%39 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%40 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %41 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%39, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %42 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%36, %41 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %43 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadds ins(%36, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %44 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c22592_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%42, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %45 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%43, %44 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %46 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%45 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %47 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%42, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %48 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tsubs ins(%47, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%48 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %49 = pto.alloc_tile addr = %c22592_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg9 = %c0 to %c16 step %c1 {
    %60 = pto.alloc_tile addr = %c27200_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %61 = pto.subview %9[%arg9, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %62 = pto.alloc_tile addr = %c18496_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %63 = pto.subview %40[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %64 = pto.alloc_tile addr = %c26688_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %65 = pto.alloc_tile addr = %c26944_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%61, %63, %64 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %66 = pto.subview %49[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
  }
  %50 = pto.alloc_tile addr = %c22592_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %51 = pto.alloc_tile addr = %c27200_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg9 = %c0 to %c16 step %c1 {
    %60 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %61 = pto.subview %10[%arg9, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %62 = pto.alloc_tile addr = %c18496_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %63 = pto.subview %40[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %64 = pto.alloc_tile addr = %c26688_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %65 = pto.alloc_tile addr = %c26944_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%61, %63, %64 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %66 = pto.subview %51[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
  }
  %52 = pto.alloc_tile addr = %c27200_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %53 = pto.alloc_tile addr = %c18496_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg9 = %c0 to %c16 step %c1 {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %61 = pto.subview %32[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    %62 = pto.alloc_tile addr = %c2048_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %63 = pto.subview %46[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %64 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %65 = pto.alloc_tile addr = %c26688_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%61, %63, %64 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %66 = pto.subview %53[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%65 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
  }
  %54 = pto.alloc_tile addr = %c18496_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %55 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%32, %50 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %56 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%54, %48 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %57 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%56, %52 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %58 = pto.fusion_region {
    %60 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadd ins(%55, %57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%60) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %59 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %c0, %c448], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%58 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%59 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  scf.for %arg9 = %c0 to %c4 step %c1 {
    %60 = arith.muli %arg9, %c2 : index
    %61 = pto.load_scalar %arg7[%60] : !pto.ptr<i32, gm> -> i32
    %62 = arith.index_cast %61 : i32 to index
    %63 = arith.remsi %62, %c4 : index
    %64 = arith.cmpi sge, %63, %c2 : index
    scf.if %64 {
      %65 = arith.subi %c3, %63 : index
      %66 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>
      %67 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %arg9, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%67 : !pto.partition_tensor_view<1x1x1x1x512xf32>) outs(%66 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %68 = arith.muli %arg9, %c2 : index
      %69 = arith.addi %68, %65 : index
      %70 = pto.load_scalar %arg8[%69] : !pto.ptr<i64, gm> -> i64
      %71 = arith.index_cast %70 : i64 to index
      %72 = arith.cmpi sge, %71, %c0 : index
      scf.if %72 {
        %73 = arith.index_cast %70 : i64 to index
        %74 = arith.muli %arg9, %c2 : index
        %75 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %74, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%66 : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%75 : !pto.partition_tensor_view<1x1x1x1x512xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %76 = pto.fusion_region {
          %78 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
          pto.tcvt ins(%66 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x512xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>)
          pto.yield(%78) : (!pto.tile_buf<vec, 1x512xbf16, valid=?x?>) -> ()
        } {pto.fusion.group_id = 24 : i64} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
        %77 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %73, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
        pto.tstore ins(%76 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%77 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      } else {
      }
    } else {
    }
  }
  return
}

