// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_score_aiv(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c1048576 = arith.constant 1048576 : index
  %c262144 = arith.constant 262144 : index
  %c90368_i64 = arith.constant 90368 : i64
  %c90496_i64 = arith.constant 90496 : i64
  %c73984_i64 = arith.constant 73984 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c73728_i64 = arith.constant 73728 : i64
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c2048 = arith.constant 2048 : index
  %c64 = arith.constant 64 : index
  %c8192 = arith.constant 8192 : index
  %c127 = arith.constant 127 : index
  %c4 = arith.constant 4 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %c8 = arith.constant 8 : index
  %c32 = arith.constant 32 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant -3.40282347E+38 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%arg8], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c2048], strides = [%c262144, %c262144, %c262144, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c64], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = pto.reserve_buffer{name = "prefill_idx_score_c2v_slot_buffer", size = 65536, location = <vec>, auto = false, base = 0} -> i32
  %9 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, nosplit = true} (%8 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %10 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
  %11 = arith.index_cast %10 : i32 to index
  %12 = arith.addi %11, %c1 : index
  %13 = arith.divsi %12, %c4 : index
  %14 = arith.minsi %13, %c256 : index
  scf.for %arg9 = %c0 to %c8 step %c1 {
    %15 = arith.muli %arg9, %c32 : index
    %16 = arith.cmpi slt, %15, %14 : index
    scf.if %16 {
      %17 = arith.divsi %15, %c128 : index
      %18 = pto.load_scalar %arg2[%17] : !pto.ptr<i32, gm> -> i32
      %19 = arith.index_cast %18 : i32 to index
      %20 = arith.muli %19, %c128 : index
      %21 = arith.remsi %15, %c128 : index
      %22 = arith.addi %20, %21 : index
      %23 = pto.alloc_tile addr = %c90368_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
      %24 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %22, %c0], sizes = [%c1, %c1, %c1, %c32, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%24 : !pto.partition_tensor_view<1x1x1x32x1xf32>) outs(%23 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      scf.for %arg10 = %c0 to %c128 step %c1 {
        %25 = arith.muli %arg10, %c64 : index
        %26 = pto.alloc_tile addr = %c90496_i64 valid_row = %c64 valid_col = %c1 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>
        %27 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %25, %c0], sizes = [%c1, %c1, %c1, %c64, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%27 : !pto.partition_tensor_view<1x1x1x64x1xf32>) outs(%26 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %28 = pto.alloc_tile addr = %c90496_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %29 = pto.declare_tile -> !pto.tile_buf<vec, 32x64xi32, valid=?x?>
        pto.tpop(%29, %9 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>, !pto.pipe) {split = 0}
        %30 = pto.fusion_region {
          %46 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.tcvt ins(%29 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x64xi32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>)
          pto.yield(%46) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.tfree(%9 : !pto.pipe) {split = 0}
        %31 = pto.fusion_region {
          %46 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.trowexpandmul ins(%30, %23 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) outs(%46 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %47 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.tcolexpandmul ins(%46, %28 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%47 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %48 = pto.alloc_tile addr = %c65536_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.tmuls ins(%47, %cst : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, f32) outs(%48 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %49 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.tmax ins(%47, %48 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x64xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%49) : (!pto.tile_buf<vec, 32x64xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        %32 = pto.alloc_tile addr = %c73728_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        %33 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg10, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%33 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%32 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        pto.fusion_region {
          %46 = pto.alloc_tile addr = %c65536_i64 valid_row = %c32 valid_col = %c64 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
          pto.tcolexpandmul ins(%31, %32 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %47 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %48 = pto.alloc_tile addr = %c90496_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
          pto.trowsum ins(%46, %47 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%48 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 2 : i64} :
        %34 = pto.alloc_tile addr = %c90496_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %35 = pto.load_scalar %arg0[%arg10] : !pto.ptr<i32, gm> -> i32
        %36 = arith.index_cast %35 : i32 to index
        %37 = arith.addi %36, %c1 : index
        %38 = arith.divsi %37, %c4 : index
        %39 = arith.minsi %38, %c256 : index
        %40 = arith.cmpi slt, %15, %39 : index
        %41 = scf.if %40 -> (index) {
          %46 = arith.subi %39, %15 : index
          %47 = arith.minsi %46, %c32 : index
          scf.yield %47 : index
        } else {
          scf.yield %c0 : index
        }
        pto.set_validshape %34, %c1, %41 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        %42 = pto.alloc_tile addr = %c73984_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>
        pto.tfillpad ins(%34 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %43 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%43 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %44 = pto.alloc_tile addr = %c73984_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>
        pto.tmax ins(%42, %43 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%44 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %45 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %arg10, %15], sizes = [%c1, %c1, %c1, %c1, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%44 : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>) outs(%45 : !pto.partition_tensor_view<1x1x1x1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    } else {
    }
  }
  return
}
