// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c25152_i64 = arith.constant 25152 : i64
  %c29248_i64 = arith.constant 29248 : i64
  %c0_i64 = arith.constant 0 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c12352_i64 = arith.constant 12352 : i64
  %c12288_i64 = arith.constant 12288 : i64
  %c16448_i64 = arith.constant 16448 : i64
  %c20544_i64 = arith.constant 20544 : i64
  %c24640_i64 = arith.constant 24640 : i64
  %c24896_i64 = arith.constant 24896 : i64
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c16384 = arith.constant 16384 : index
  %c64 = arith.constant 64 : index
  %c512 = arith.constant 512 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c-3 = arith.constant -3 : index
  %c128 = arith.constant 128 : index
  %cst_0 = arith.constant 0.001953125 : f32
  %cst_1 = arith.constant 9.99999997E-7 : f32
  %c448 = arith.constant 448 : index
  %cst_2 = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_3 = arith.constant 5.000000e-01 : f32
  %cst_4 = arith.constant 2.000000e+00 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c32, %c512], strides = [%c16384, %c16384, %c16384, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c32, %c512], strides = [%c16384, %c16384, %c16384, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c1, %c512], strides = [%c512, %c512, %c512, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %7 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  %8 = pto.alloc_tile addr = %c29248_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  %9 = arith.index_cast %arg8 : i32 to index
  %10 = arith.muli %9, %c16 : index
  %11 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%11 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %12 = pto.alloc_tile addr = %c29248_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%12 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %13 = scf.for %arg10 = %c0 to %c16 step %c1 iter_args(%arg11 = %arg7) -> (i32) {
    %57 = arith.addi %10, %arg10 : index
    %58 = pto.load_scalar %arg0[%57] : !pto.ptr<i32, gm> -> i32
    %59 = arith.index_cast %58 : i32 to index
    %60 = arith.cmpi sge, %59, %c0 : index
    scf.if %60 {
      %61 = pto.load_scalar %arg1[%57] : !pto.ptr<i32, gm> -> i32
      %62 = arith.index_cast %61 : i32 to index
      %63 = arith.addi %62, %c-3 : index
      %64 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
      %65 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %63, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%65 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%64 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %66 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tcvt ins(%64 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
      %67 = pto.subview %11[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%66 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 15 : i64} : 
      %68 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
      %69 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %63, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%69 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%68 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %70 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tcvt ins(%68 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
      %71 = pto.subview %12[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%70 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 16 : i64} : 
    } else {
    }
    scf.yield %58 : i32
  }
  %14 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%14 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg10 = %c0 to %c512 step %c64 {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %58 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %arg10], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%58 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %59 = pto.fusion_region {
      %62 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.tmul ins(%57, %57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%62) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %60 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.fusion_region {
      %62 = pto.alloc_tile addr = %c12288_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%59, %60 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 18 : i64} : 
    %61 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %62 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tadd ins(%14, %61 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 19 : i64} : 
  }
  %15 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmuls ins(%14, %cst_0 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 1x16xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tadds ins(%15, %cst_1 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 1 : i64} : 
  %16 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %17 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %18 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.tsqrt ins(%17 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%18 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsqrt", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsqrt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsqrt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %19 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %20 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %21 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.trecip ins(%20 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%21 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
  %22 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  scf.for %arg10 = %c0 to %c448 step %c64 {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %58 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %arg10], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%58 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %59 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
    %60 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %c0, %arg10], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tload ins(%60 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%59 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %61 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tcvt ins(%59 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%61 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
    %62 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.trowexpandmul ins(%57, %22 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%62 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %63 = pto.fusion_region {
      %65 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%62, %61 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%65) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %64 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %10, %arg10], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%63 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%64 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %23 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %24 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %c448], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%23 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %25 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
  %26 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %c0, %c448], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tload ins(%26 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%25 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %27 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%25 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %28 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.trowexpandmul ins(%23, %22 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%28 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %29 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%28, %27 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %30 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.texpands ins(%cst_2 : f32) outs(%30 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %31 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%31 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %32 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%31 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%32 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %33 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%30, %32 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %34 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%33, %cst_3 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %35 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%34 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%35 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %36 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tcvt ins(%35 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xi32, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>)
  %37 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%36 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%37 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %38 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%36, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %39 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%33, %38 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %40 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadds ins(%33, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %41 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%39, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %42 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%40, %41 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %43 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%42 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %44 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%39, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %45 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tsubs ins(%44, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%45 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %46 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %57 = pto.alloc_tile addr = %c25152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %58 = pto.subview %11[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %59 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %60 = pto.subview %37[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %61 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %62 = pto.alloc_tile addr = %c24896_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%58, %60, %61 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %63 = pto.subview %46[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
  }
  %47 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %48 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %57 = pto.alloc_tile addr = %c29248_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %58 = pto.subview %12[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %59 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %60 = pto.subview %37[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %61 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %62 = pto.alloc_tile addr = %c24896_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%58, %60, %61 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %63 = pto.subview %48[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
  }
  %49 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %50 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %58 = pto.subview %29[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    %59 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %60 = pto.subview %43[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %61 = pto.alloc_tile addr = %c29248_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %62 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%58, %60, %61 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %63 = pto.subview %50[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%62 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
  }
  %51 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %52 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%29, %47 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %53 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%51, %45 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %54 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%53, %49 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %55 = pto.fusion_region {
    %57 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadd ins(%52, %54 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%57) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %56 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %10, %c448], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tstore ins(%55 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%56 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

