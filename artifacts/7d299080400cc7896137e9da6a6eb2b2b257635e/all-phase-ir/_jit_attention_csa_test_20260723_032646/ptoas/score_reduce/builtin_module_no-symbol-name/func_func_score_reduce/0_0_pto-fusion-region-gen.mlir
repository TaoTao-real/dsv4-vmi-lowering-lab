// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @score_reduce(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c2097152 = arith.constant 2097152 : index
  %c1024 = arith.constant 1024 : index
  %c198656_i64 = arith.constant 198656 : i64
  %c198912_i64 = arith.constant 198912 : i64
  %c33792_i64 = arith.constant 33792 : i64
  %c0_i64 = arith.constant 0 : i64
  %c132608_i64 = arith.constant 132608 : i64
  %c512_i64 = arith.constant 512 : i64
  %c1024_i64 = arith.constant 1024 : i64
  %c99328_i64 = arith.constant 99328 : i64
  %c99840_i64 = arith.constant 99840 : i64
  %c198144_i64 = arith.constant 198144 : i64
  %c4 = arith.constant 4 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c512 = arith.constant 512 : index
  %c16 = arith.constant 16 : index
  %c64 = arith.constant 64 : index
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c256 = arith.constant 256 : index
  %c32768 = arith.constant 32768 : index
  %c8192 = arith.constant 8192 : index
  %c127 = arith.constant 127 : index
  %c128 = arith.constant 128 : index
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant -3.40282347E+38 : f32
  %0 = pto.make_tensor_view %arg0, shape = [%c4], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c4, %c2], strides = [%c8, %c8, %c8, %c2, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c512, %c1], strides = [%c512, %c512, %c512, %c1, %c512] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c16, %c64], strides = [%c1024, %c1024, %c1024, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8, %c4096], strides = [%c32768, %c32768, %c32768, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c256], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c32768, %c64], strides = [%c2097152, %c2097152, %c2097152, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c8192, %c1], strides = [%c8192, %c8192, %c8192, %c1, %c8192] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = arith.index_cast %arg8 : i32 to index
  %9 = arith.divsi %8, %c4 : index
  %10 = arith.muli %9, %c4 : index
  %11 = arith.subi %8, %10 : index
  %12 = arith.divsi %9, %c2 : index
  %13 = arith.muli %12, %c2 : index
  %14 = arith.subi %9, %13 : index
  %15 = pto.load_scalar %arg0[%12] : !pto.ptr<i32, gm> -> i32
  %16 = arith.index_cast %15 : i32 to index
  %17 = arith.divsi %16, %c4 : index
  %18 = arith.muli %12, %c2 : index
  %19 = arith.addi %18, %14 : index
  %20 = pto.load_scalar %arg1[%19] : !pto.ptr<i32, gm> -> i32
  %21 = arith.index_cast %20 : i32 to index
  %22 = arith.addi %21, %c1 : index
  %23 = arith.divsi %22, %c4 : index
  %24 = arith.minsi %17, %23 : index
  %25 = arith.minsi %24, %c4096 : index
  %26 = arith.addi %25, %c127 : index
  %27 = arith.divsi %26, %c128 : index
  %28 = arith.muli %12, %c2 : index
  %29 = arith.muli %12, %c128 : index
  %30 = pto.alloc_tile addr = %c198656_i64 valid_row = %c64 valid_col = %c1 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>
  %31 = arith.muli %14, %c64 : index
  %32 = arith.addi %29, %31 : index
  %33 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %32, %c0], sizes = [%c1, %c1, %c1, %c64, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%33 : !pto.partition_tensor_view<1x1x1x64x1xf32>) outs(%30 : !pto.tile_buf<vec, 64x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %34 = pto.alloc_tile addr = %c198656_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %35 = pto.alloc_tile addr = %c198912_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %36 = arith.addi %28, %14 : index
  %37 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %36, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%37 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%35 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %38 = pto.alloc_tile addr = %c198912_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %39 = arith.subi %27, %11 : index
  %40 = arith.addi %39, %c3 : index
  %41 = arith.divsi %40, %c4 : index
  %42 = arith.divsi %41, %c2 : index
  %43 = arith.muli %42, %c2 : index
  scf.for %arg10 = %c0 to %43 step %c2 {
    %46 = arith.muli %arg10, %c4 : index
    %47 = arith.addi %11, %46 : index
    %48 = arith.muli %47, %c128 : index
    %49 = arith.subi %25, %48 : index
    %50 = arith.minsi %49, %c128 : index
    %51 = arith.muli %9, %c4096 : index
    %52 = arith.addi %51, %48 : index
    %53 = arith.muli %12, %c64 : index
    %54 = arith.addi %53, %47 : index
    %55 = pto.load_scalar %arg5[%54] : !pto.ptr<i32, gm> -> i32
    %56 = arith.index_cast %55 : i32 to index
    %57 = arith.muli %56, %c128 : index
    %58 = arith.muli %arg10, %c4 : index
    %59 = arith.addi %58, %c4 : index
    %60 = arith.addi %11, %59 : index
    %61 = arith.muli %60, %c128 : index
    %62 = arith.subi %25, %61 : index
    %63 = arith.minsi %62, %c128 : index
    %64 = arith.muli %9, %c4096 : index
    %65 = arith.addi %64, %61 : index
    %66 = arith.muli %12, %c64 : index
    %67 = arith.addi %66, %60 : index
    %68 = pto.load_scalar %arg5[%67] : !pto.ptr<i32, gm> -> i32
    %69 = arith.index_cast %68 : i32 to index
    %70 = arith.muli %69, %c128 : index
    %71 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>
    %72 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %52, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%72 : !pto.partition_tensor_view<1x1x1x128x64xi32>) outs(%71 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %73 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %74 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %57, %c0], sizes = [%c1, %c1, %c1, %c128, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%74 : !pto.partition_tensor_view<1x1x1x128x1xf32>) outs(%73 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %75 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>
    %76 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %65, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%76 : !pto.partition_tensor_view<1x1x1x128x64xi32>) outs(%75 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %77 = pto.alloc_tile addr = %c512_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %78 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %70, %c0], sizes = [%c1, %c1, %c1, %c128, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%78 : !pto.partition_tensor_view<1x1x1x128x1xf32>) outs(%77 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %79 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
    pto.tcvt ins(%71 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) outs(%79 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>)
    pto.fusion_region {
      %95 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%79, %34 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%95 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %96 = pto.alloc_tile addr = %c1024_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%96 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %97 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tmax ins(%95, %96 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x64xf32, valid=?x?>) outs(%97 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %98 = pto.alloc_tile addr = %c1024_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%97, %38 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%98 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %99 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<vec, 128x128xf32, valid=?x?>
      %100 = pto.alloc_tile addr = %c99328_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%98, %99 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x128xf32, valid=?x?>) outs(%100 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %101 = pto.alloc_tile addr = %c99328_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %102 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %103 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      pto.tmul ins(%101, %102 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%103 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 0 : i64} :
    %80 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %81 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.set_validshape %81, %c1, %50 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    %82 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    pto.tfillpad ins(%81 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%82 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %83 = pto.alloc_tile addr = %c1024_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%83 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %84 = pto.fusion_region {
      %95 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
      pto.tmax ins(%82, %83 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%95 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%95) : (!pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    %85 = arith.addi %28, %14 : index
    %86 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %85, %48], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%84 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) outs(%86 : !pto.partition_tensor_view<1x1x1x1x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %87 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
    pto.tcvt ins(%75 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) outs(%87 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>)
    pto.fusion_region {
      %95 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%87, %34 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%95 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %96 = pto.alloc_tile addr = %c99840_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%96 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %97 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tmax ins(%95, %96 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x64xf32, valid=?x?>) outs(%97 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %98 = pto.alloc_tile addr = %c99840_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%97, %38 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%98 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %99 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<vec, 128x128xf32, valid=?x?>
      %100 = pto.alloc_tile addr = %c198144_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%98, %99 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x128xf32, valid=?x?>) outs(%100 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %101 = pto.alloc_tile addr = %c198144_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %102 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %103 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      pto.tmul ins(%101, %102 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%103 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 2 : i64} :
    %88 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %89 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.set_validshape %89, %c1, %63 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    %90 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    pto.tfillpad ins(%89 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%90 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %91 = pto.alloc_tile addr = %c99840_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%91 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %92 = pto.fusion_region {
      %95 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
      pto.tmax ins(%90, %91 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%95 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%95) : (!pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    %93 = arith.addi %28, %14 : index
    %94 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %93, %61], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%92 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) outs(%94 : !pto.partition_tensor_view<1x1x1x1x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  %44 = arith.subi %41, %43 : index
  %45 = arith.cmpi eq, %44, %c1 : index
  scf.if %45 {
    %46 = arith.muli %43, %c4 : index
    %47 = arith.addi %11, %46 : index
    %48 = arith.muli %47, %c128 : index
    %49 = arith.subi %25, %48 : index
    %50 = arith.minsi %49, %c128 : index
    %51 = arith.muli %9, %c4096 : index
    %52 = arith.addi %51, %48 : index
    %53 = arith.muli %12, %c64 : index
    %54 = arith.addi %53, %47 : index
    %55 = pto.load_scalar %arg5[%54] : !pto.ptr<i32, gm> -> i32
    %56 = arith.index_cast %55 : i32 to index
    %57 = arith.muli %56, %c128 : index
    %58 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>
    %59 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %52, %c0], sizes = [%c1, %c1, %c1, %c128, %c64] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tload ins(%59 : !pto.partition_tensor_view<1x1x1x128x64xi32>) outs(%58 : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %60 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %61 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %57, %c0], sizes = [%c1, %c1, %c1, %c128, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%61 : !pto.partition_tensor_view<1x1x1x128x1xf32>) outs(%60 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %62 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
    pto.tcvt ins(%58 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode NONE>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 128x64xi32, valid=?x?>) outs(%62 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>)
    pto.fusion_region {
      %70 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%62, %34 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %71 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%71 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %72 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tmax ins(%70, %71 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x64xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %73 = pto.alloc_tile addr = %c132608_i64 valid_row = %c128 valid_col = %c64 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>
      pto.tcolexpandmul ins(%72, %38 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %74 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c128 : !pto.tile_buf<vec, 128x128xf32, valid=?x?>
      %75 = pto.alloc_tile addr = %c512_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
      pto.trowsum ins(%73, %74 : !pto.tile_buf<vec, 128x64xf32, valid=?x?>, !pto.tile_buf<vec, 128x128xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowsum", postupdate = 0 : i64, tags = ["reduction", "row", "sum"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_trowsum", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %76 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %77 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      %78 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
      pto.tmul ins(%76, %77 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 4 : i64} :
    %63 = pto.alloc_tile addr = %c33792_i64 valid_row = %c128 valid_col = %c1 : !pto.tile_buf<vec, 128x1xf32, valid=?x?, blayout=col_major>
    %64 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.set_validshape %64, %c1, %50 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    %65 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    pto.tfillpad ins(%64 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tfillpad", postupdate = 0 : i64, tags = ["fillpad"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %66 = pto.alloc_tile addr = %c132608_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>
    pto.texpands ins(%cst_0 : f32) outs(%66 : !pto.tile_buf<vec, 1x128xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %67 = pto.fusion_region {
      %70 = pto.alloc_tile addr = %c33792_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
      pto.tmax ins(%65, %66 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 1x128xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%70) : (!pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>
    %68 = arith.addi %28, %14 : index
    %69 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %68, %48], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%67 : !pto.tile_buf<vec, 1x128xf32, valid=?x?, pad=3>) outs(%69 : !pto.partition_tensor_view<1x1x1x1x128xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
  }
  return
}
