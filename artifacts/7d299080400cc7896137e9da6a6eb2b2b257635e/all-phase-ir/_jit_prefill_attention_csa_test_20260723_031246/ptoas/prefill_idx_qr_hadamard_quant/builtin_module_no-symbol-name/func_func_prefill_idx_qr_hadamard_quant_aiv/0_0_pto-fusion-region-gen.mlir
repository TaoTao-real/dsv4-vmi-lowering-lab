// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_idx_qr_hadamard_quant_aiv(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16384 = arith.constant 16384 : index
  %c524288 = arith.constant 524288 : index
  %c40960_i64 = arith.constant 40960 : i64
  %c73728_i64 = arith.constant 73728 : i64
  %c81920_i64 = arith.constant 81920 : i64
  %c32768_i64 = arith.constant 32768 : i64
  %c8192 = arith.constant 8192 : index
  %c128 = arith.constant 128 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c256 = arith.constant 256 : index
  %c0 = arith.constant 0 : index
  %cst = arith.constant 9.99999974E-5 : f32
  %c32 = arith.constant 32 : index
  %cst_0 = arith.constant 1.270000e+02 : f32
  %c1048576 = arith.constant 1048576 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi8>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c8192, %c128], strides = [%c1048576, %c1048576, %c1048576, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c8192, %c64], strides = [%c524288, %c524288, %c524288, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %5 = pto.import_reserved_buffer{name = "prefill_idx_qr_hadamard_quant_v2c_slot_buffer", peer_func = @prefill_idx_qr_hadamard_quant_aic} -> i32
  %6 = pto.reserve_buffer{name = "prefill_idx_qr_hadamard_quant_c2v_slot_buffer", size = 32768, location = <vec>, auto = false, base = 0} -> i32
  %7 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 8192, slot_num = 4, nosplit = true} (%6 : i32, %5 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %8 = arith.index_cast %arg5 : i32 to index
  %9 = arith.muli %8, %c256 : index
  scf.for %arg7 = %c0 to %c256 step %c64 {
    %10 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<vec, 64x64xf32, valid=?x?>
    %11 = arith.addi %9, %arg7 : index
    %12 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %11, %c0], sizes = [%c1, %c1, %c1, %c64, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%12 : !pto.partition_tensor_view<1x1x1x64x64xf32>) outs(%10 : !pto.tile_buf<vec, 64x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %13 = pto.fusion_region {
      %22 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?>
      pto.tcvt ins(%10 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x64xf32, valid=?x?>) outs(%22 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?>)
      %23 = pto.alloc_tile addr = %c73728_i64 valid_row = %c64 valid_col = %c64 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
      pto.tmov ins(%22 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 8 : i64, loop_depth = 1 : i64, name = "template_tmov_nd2nz", postupdate = 1 : i64, tags = ["move", "ub", "ub", "nd2nz", "nz"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield(%23) : (!pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
    pto.tpush(%13, %7 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
    %14 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%14 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    scf.for %arg8 = %c0 to %c128 step %c32 {
      %22 = pto.declare_tile -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.tpop(%22, %7 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
      %23 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.tneg ins(%22 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%23 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tneg", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %24 = pto.fusion_region {
        %28 = pto.alloc_tile addr = %c32768_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tmax ins(%22, %23 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%28 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%28) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.tfree(%7 : !pto.pipe) {split = 0}
      %25 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c128 : !pto.tile_buf<vec, 64x128xf32, valid=?x?>
      %26 = pto.alloc_tile addr = %c73728_i64 valid_row = %c64 valid_col = %c1 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>
      pto.trowmax ins(%24, %25 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x128xf32, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %27 = pto.alloc_tile addr = %c73728_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      pto.fusion_region {
        %28 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        pto.tmax ins(%14, %27 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%28 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
    }
    %15 = pto.alloc_tile addr = %c40960_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%15 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %16 = pto.fusion_region {
      %22 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      pto.tdiv ins(%15, %14 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%22 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%22) : (!pto.tile_buf<vec, 1x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %17 = pto.alloc_tile addr = %c40960_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.trecip ins(%16 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trecip", postupdate = 0 : i64, tags = ["elementwise", "reciprocal"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trecip", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    %18 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c1 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>
    %19 = arith.addi %9, %arg7 : index
    %20 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %19, %c0], sizes = [%c1, %c1, %c1, %c64, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%18 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>) outs(%20 : !pto.partition_tensor_view<1x1x1x64x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %21 = pto.alloc_tile addr = %c32768_i64 valid_row = %c64 valid_col = %c1 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>
    scf.for %arg8 = %c0 to %c128 step %c32 {
      %22 = pto.declare_tile -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.tpop(%22, %7 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
      %23 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.trowexpandmul ins(%22, %21 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>) outs(%23 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      pto.tfree(%7 : !pto.pipe) {split = 0}
      %24 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>
      pto.tcvt ins(%23 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%24 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>)
      %25 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf16, valid=?x?>
      pto.tcvt ins(%24 {candidates = [{id = 38 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 38 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xi32, valid=?x?>) outs(%25 : !pto.tile_buf<vec, 64x32xf16, valid=?x?>)
      %26 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi8, valid=?x?>
      pto.tcvt ins(%25 {candidates = [{id = 19 : i64, loop_depth = 2 : i64, name = "template_tcvt_f16_to_si8", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 19 : i64, loop_depth = 2 : i64, name = "template_tcvt_f16_to_si8", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf16, valid=?x?>) outs(%26 : !pto.tile_buf<vec, 64x32xi8, valid=?x?>)
      %27 = arith.addi %9, %arg7 : index
      %28 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %27, %arg8], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xi8>
      pto.tstore ins(%26 : !pto.tile_buf<vec, 64x32xi8, valid=?x?>) outs(%28 : !pto.partition_tensor_view<1x1x1x64x32xi8>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
  }
  return
}
