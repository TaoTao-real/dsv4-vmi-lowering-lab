// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c262144 = arith.constant 262144 : index
  %c2097152 = arith.constant 2097152 : index
  %c8388608 = arith.constant 8388608 : index
  %c1024 = arith.constant 1024 : index
  %c5120 = arith.constant 5120 : index
  %c1310720 = arith.constant 1310720 : index
  %c65536_i64 = arith.constant 65536 : i64
  %c90880_i64 = arith.constant 90880 : i64
  %c66048_i64 = arith.constant 66048 : i64
  %c82432_i64 = arith.constant 82432 : i64
  %c82560_i64 = arith.constant 82560 : i64
  %c82688_i64 = arith.constant 82688 : i64
  %c2560 = arith.constant 2560 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c40 = arith.constant 40 : index
  %c8 = arith.constant 8 : index
  %c640 = arith.constant 640 : index
  %c5 = arith.constant 5 : index
  %c128 = arith.constant 128 : index
  %c16384 = arith.constant 16384 : index
  %c4 = arith.constant 4 : index
  %c32 = arith.constant 32 : index
  %c4096 = arith.constant 4096 : index
  %c23 = arith.constant 23 : index
  %c24 = arith.constant 24 : index
  %c0 = arith.constant 0 : index
  %c320 = arith.constant 320 : index
  %c2 = arith.constant 2 : index
  %cst = arith.constant 0.0441941731 : f32
  %c80 = arith.constant 80 : index
  %c16 = arith.constant 16 : index
  %cst_0 = arith.constant 0.000000e+00 : f32
  %cst_1 = arith.constant -3.000000e+38 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c2560, %c512], strides = [%c1310720, %c1310720, %c1310720, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c40], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8, %c640], strides = [%c5120, %c5120, %c5120, %c640, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8, %c5], strides = [%c40, %c40, %c40, %c5, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c8, %c128], strides = [%c1024, %c1024, %c1024, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c16384, %c512], strides = [%c8388608, %c8388608, %c8388608, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %8 = pto.make_tensor_view %arg8, shape = [%c1, %c1, %c1, %c8, %c512], strides = [%c4096, %c4096, %c4096, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %9 = pto.make_tensor_view %arg9, shape = [%c1, %c1, %c1, %c4, %c32], strides = [%c128, %c128, %c128, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %10 = pto.make_tensor_view %arg10, shape = [%c1, %c1, %c1, %c4096, %c512], strides = [%c2097152, %c2097152, %c2097152, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %11 = pto.make_tensor_view %arg11, shape = [%c1, %c1, %c1, %c512, %c512], strides = [%c262144, %c262144, %c262144, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %12 = pto.import_reserved_buffer{name = "qk_pv_v2c_slot_buffer", peer_func = @qk_pv_aic} -> i32
  %13 = pto.reserve_buffer{name = "qk_pv_c2v_slot_buffer", size = 65536, location = <vec>, auto = false, base = 0} -> i32
  %14 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, nosplit = true} (%13 : i32, %12 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %15 = arith.index_cast %arg12 : i32 to index
  %16 = arith.subi %c23, %15 : index
  %17 = arith.addi %16, %c40 : index
  %18 = arith.divsi %17, %c24 : index
  scf.for %arg14 = %c0 to %18 step %c1 {
    %19 = arith.muli %arg14, %c24 : index
    %20 = arith.addi %15, %19 : index
    %21 = pto.load_scalar %arg3[%20] : !pto.ptr<i32, gm> -> i32
    %22 = arith.index_cast %21 : i32 to index
    %23 = arith.divsi %22, %c5 : index
    %24 = arith.muli %23, %c5 : index
    %25 = arith.subi %22, %24 : index
    %26 = arith.muli %23, %c320 : index
    %27 = arith.muli %25, %c128 : index
    %28 = pto.alloc_tile addr = %c65536_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    %29 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %23, %27], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%29 : !pto.partition_tensor_view<1x1x1x1x128xf32>) outs(%28 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %30 = arith.muli %23, %c5 : index
    %31 = arith.addi %30, %25 : index
    %32 = pto.load_scalar %arg5[%31] : !pto.ptr<i32, gm> -> i32
    %33 = arith.index_cast %32 : i32 to index
    %34 = arith.cmpi sgt, %33, %c0 : index
    scf.if %34 {
      scf.for %arg15 = %c0 to %c2 step %c1 {
        %35 = pto.declare_tile -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tpop(%35, %14 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
        %36 = pto.fusion_region {
          %61 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.tmuls ins(%35, %cst : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, f32) outs(%61 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%61) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tfree(%14 : !pto.pipe) {split = 0}
        %37:3 = pto.fusion_region {
          %61 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.tcolexpandadd ins(%36, %28 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%61 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandadd", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandadd", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandadd", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %62 = pto.alloc_tile addr = %c66048_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %63 = pto.alloc_tile addr = %c82432_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
          pto.trowmax ins(%61, %62 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowmax", postupdate = 0 : i64, tags = ["reduction", "row"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %64 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.trowexpandsub ins(%61, %63 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) outs(%64 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandsub", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowexpandsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %65 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.texp ins(%64 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %66 = pto.alloc_tile addr = %c66048_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %67 = pto.alloc_tile addr = %c82560_i64 valid_row = %c32 valid_col = %c1 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>
          pto.trowsum ins(%65, %66 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %68 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>
          pto.tcvt ins(%65 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>)
          %69 = pto.alloc_tile addr = %c82688_i64 valid_row = %c32 valid_col = %c128 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tmov ins(%68 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>) outs(%69 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) {candidates = [{id = 8 : i64, loop_depth = 1 : i64, name = "template_tmov_nd2nz", postupdate = 1 : i64, tags = ["move", "ub", "ub", "nd2nz", "nz"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield(%63, %67, %69) : (!pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tpush(%37#2, %14 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %38 = arith.muli %arg15, %c2 : index
        %39 = arith.muli %38, %c80 : index
        %40 = arith.addi %26, %39 : index
        %41 = arith.muli %25, %c16 : index
        %42 = arith.addi %40, %41 : index
        %43 = pto.alloc_tile addr = %c82432_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %44 = pto.subview %37#0[%c0, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %45 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %42, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%44 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%45 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %46 = pto.alloc_tile addr = %c82560_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %47 = pto.subview %37#1[%c0, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %48 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %42, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%47 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%48 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %49 = arith.muli %arg15, %c2 : index
        %50 = arith.addi %49, %c1 : index
        %51 = arith.muli %50, %c80 : index
        %52 = arith.addi %26, %51 : index
        %53 = arith.muli %25, %c16 : index
        %54 = arith.addi %52, %53 : index
        %55 = pto.alloc_tile addr = %c82432_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %56 = pto.subview %37#0[%c16, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %57 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %54, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%56 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%57 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %58 = pto.alloc_tile addr = %c82560_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %59 = pto.subview %37#1[%c16, %c0] sizes [16, 1] : !pto.tile_buf<vec, 32x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 16x1xf32, blayout=col_major>
        %60 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %54, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%59 : !pto.tile_buf<vec, 16x1xf32, blayout=col_major>) outs(%60 : !pto.partition_tensor_view<1x1x1x16x1xf32>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tstore_dn", postupdate = 0 : i64, tags = ["store", "ub", "gm", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    } else {
      %35 = pto.alloc_tile addr = %c90880_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.texpands ins(%cst_0 : f32) outs(%35 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      scf.for %arg15 = %c0 to %c4 step %c1 {
        %36 = arith.muli %arg15, %c80 : index
        %37 = arith.addi %26, %36 : index
        %38 = arith.muli %25, %c16 : index
        %39 = arith.addi %37, %38 : index
        scf.for %arg16 = %c0 to %c16 step %c1 {
          %41 = arith.addi %39, %arg16 : index
          pto.store_scalar %cst_1, %arg1[%41] : !pto.ptr<f32, gm>, f32
          %42 = arith.addi %39, %arg16 : index
          pto.store_scalar %cst_0, %arg0[%42] : !pto.ptr<f32, gm>, f32
        }
        %40 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %39, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tstore ins(%35 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) outs(%40 : !pto.partition_tensor_view<1x1x1x16x512xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      }
    }
  }
  return
}
