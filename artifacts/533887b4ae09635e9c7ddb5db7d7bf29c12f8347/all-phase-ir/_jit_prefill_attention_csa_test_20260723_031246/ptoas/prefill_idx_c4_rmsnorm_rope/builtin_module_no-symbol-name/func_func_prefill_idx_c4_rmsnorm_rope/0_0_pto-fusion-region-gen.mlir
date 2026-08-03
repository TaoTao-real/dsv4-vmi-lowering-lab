// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4096 = arith.constant 4096 : index
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
  %c128 = arith.constant 128 : index
  %c16 = arith.constant 16 : index
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c-3 = arith.constant -3 : index
  %cst_0 = arith.constant 7.812500e-03 : f32
  %cst_1 = arith.constant 9.99999997E-7 : f32
  %cst_2 = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_3 = arith.constant 5.000000e-01 : f32
  %cst_4 = arith.constant 2.000000e+00 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16384, %c64], strides = [%c1048576, %c1048576, %c1048576, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c32, %c128], strides = [%c4096, %c4096, %c4096, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c1, %c128], strides = [%c128, %c128, %c128, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c32, %c128], strides = [%c4096, %c4096, %c4096, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %7 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  %8 = pto.alloc_tile addr = %c29248_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  %9 = arith.index_cast %arg8 : i32 to index
  %10 = arith.muli %9, %c16 : index
  %11 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%11 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %12 = pto.alloc_tile addr = %c29248_i64 valid_row = %c16 valid_col = %c32 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%12 : !pto.tile_buf<vec, 16x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %13 = scf.for %arg10 = %c0 to %c16 step %c1 iter_args(%arg11 = %arg7) -> (i32) {
    %67 = arith.addi %10, %arg10 : index
    %68 = pto.load_scalar %arg0[%67] : !pto.ptr<i32, gm> -> i32
    %69 = arith.index_cast %68 : i32 to index
    %70 = arith.cmpi sge, %69, %c0 : index
    scf.if %70 {
      %71 = pto.load_scalar %arg1[%67] : !pto.ptr<i32, gm> -> i32
      %72 = arith.index_cast %71 : i32 to index
      %73 = arith.addi %72, %c-3 : index
      %74 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
      %75 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %73, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%75 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%74 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %76 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tcvt ins(%74 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%76 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
      %77 = pto.subview %11[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%76 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%77 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 18 : i64} : 
      %78 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>
      %79 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %73, %c0], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tload ins(%79 : !pto.partition_tensor_view<1x1x1x1x32xbf16>) outs(%78 : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %80 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
      pto.tcvt ins(%78 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xbf16, valid=?x?>) outs(%80 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
      %81 = pto.subview %12[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
      pto.fusion_region {
        pto.tmov ins(%80 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%81 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 19 : i64} : 
    } else {
    }
    scf.yield %68 : i32
  }
  %14 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%14 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  scf.for %arg10 = %c0 to %c128 step %c64 {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %68 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %arg10], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%68 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %69 = pto.fusion_region {
      %72 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.tmul ins(%67, %67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%72) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %70 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c128 : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
    pto.fusion_region {
      %72 = pto.alloc_tile addr = %c12288_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%69, %70 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x128xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
    %71 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %72 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tadd ins(%14, %71 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
  }
  %15 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmuls ins(%14, %cst_0 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 1x16xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tadds ins(%15, %cst_1 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
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
  %23 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %24 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %c0], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%23 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %25 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
  %26 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tload ins(%26 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%25 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %27 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%25 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%27 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %28 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.trowexpandmul ins(%23, %22 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%28 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %29 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%28, %27 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %30 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    pto.tcvt ins(%29 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>)
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
  %31 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %10, %c0], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tstore ins(%30 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>) outs(%31 : !pto.partition_tensor_view<1x1x1x16x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %32 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %33 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %10, %c64], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%33 : !pto.partition_tensor_view<1x1x1x16x64xf32>) outs(%32 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %34 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
  %35 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %c0, %c64], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tload ins(%35 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) outs(%34 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%34 {candidates = [{id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 20 : i64, loop_depth = 2 : i64, name = "template_tcvt_bf16_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>) outs(%36 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %37 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.trowexpandmul ins(%32, %22 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%37 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %38 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%37, %36 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.texpands ins(%cst_2 : f32) outs(%39 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %40 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%40 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %41 = pto.alloc_tile addr = %c12352_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%40 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%41 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %42 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%39, %41 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %43 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%42, %cst_3 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %44 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%43 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%44 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %45 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tcvt ins(%44 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xi32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>)
  %46 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%45 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %47 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%45, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %48 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%42, %47 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %49 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadds ins(%42, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %50 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%48, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %51 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%49, %50 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %52 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%51 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %53 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%48, %cst_4 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %54 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tsubs ins(%53, %cst_2 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%54 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tsubs", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %55 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %67 = pto.alloc_tile addr = %c25152_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %68 = pto.subview %11[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %69 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %70 = pto.subview %46[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %71 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %72 = pto.alloc_tile addr = %c24896_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%68, %70, %71 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %73 = pto.subview %55[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
  }
  %56 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %57 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %67 = pto.alloc_tile addr = %c29248_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    %68 = pto.subview %12[%arg10, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 16x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
    %69 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %70 = pto.subview %46[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %71 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %72 = pto.alloc_tile addr = %c24896_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%68, %70, %71 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %73 = pto.subview %57[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 24 : i64} : 
  }
  %58 = pto.alloc_tile addr = %c25152_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %59 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg10 = %c0 to %c16 step %c1 {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %68 = pto.subview %38[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    %69 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %70 = pto.subview %52[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %71 = pto.alloc_tile addr = %c29248_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %72 = pto.alloc_tile addr = %c24640_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%68, %70, %71 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %73 = pto.subview %59[%arg10, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%72 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 25 : i64} : 
  }
  %60 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %61 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%38, %56 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %62 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%60, %54 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %63 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmul ins(%62, %58 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %64 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadd ins(%61, %63 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %65 = pto.fusion_region {
    %67 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    pto.tcvt ins(%64 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>)
    pto.yield(%67) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
  %66 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %10, %c64], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
  pto.tstore ins(%65 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>) outs(%66 : !pto.partition_tensor_view<1x1x1x16x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  return
}

