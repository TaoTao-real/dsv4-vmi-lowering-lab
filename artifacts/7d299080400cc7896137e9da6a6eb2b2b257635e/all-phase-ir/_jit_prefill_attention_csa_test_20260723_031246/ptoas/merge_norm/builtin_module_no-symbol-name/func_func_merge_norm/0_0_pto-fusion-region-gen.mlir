// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4194304 = arith.constant 4194304 : index
  %c65856_i64 = arith.constant 65856 : i64
  %c65920_i64 = arith.constant 65920 : i64
  %c65984_i64 = arith.constant 65984 : i64
  %c98752_i64 = arith.constant 98752 : i64
  %c0_i64 = arith.constant 0 : i64
  %c64_i64 = arith.constant 64 : i64
  %c32832_i64 = arith.constant 32832 : i64
  %c33088_i64 = arith.constant 33088 : i64
  %c32896_i64 = arith.constant 32896 : i64
  %c32960_i64 = arith.constant 32960 : i64
  %c33024_i64 = arith.constant 33024 : i64
  %c67776_i64 = arith.constant 67776 : i64
  %c8192 = arith.constant 8192 : index
  %c64 = arith.constant 64 : index
  %c1 = arith.constant 1 : index
  %c1024 = arith.constant 1024 : index
  %c4096 = arith.constant 4096 : index
  %c512 = arith.constant 512 : index
  %c192 = arith.constant 192 : index
  %c0 = arith.constant 0 : index
  %c4 = arith.constant 4 : index
  %c16 = arith.constant 16 : index
  %c128 = arith.constant 128 : index
  %c48 = arith.constant 48 : index
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant 0.000000e+00 : bf16
  %c448 = arith.constant 448 : index
  %c8 = arith.constant 8 : index
  %c524288 = arith.constant 524288 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c8192, %c64], strides = [%c524288, %c524288, %c524288, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1024, %c4096], strides = [%c4194304, %c4194304, %c4194304, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %arg6, %c1], strides = [%arg6, %arg6, %arg6, %c1, %arg6] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %arg6, %c1], strides = [%arg6, %arg6, %arg6, %c1, %arg6] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = arith.muli %arg6, %c512 : index
  %5 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %arg6, %c512], strides = [%4, %4, %4, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg5, shape = [%c64], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %7 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
  %8 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
  %9 = arith.index_cast %arg7 : i32 to index
  %10 = arith.muli %9, %c192 : index
  scf.for %arg9 = %c0 to %c4 step %c1 {
    %11 = arith.muli %arg9, %c16 : index
    %12 = arith.muli %9, %c64 : index
    %13 = arith.addi %12, %11 : index
    %14 = arith.cmpi slt, %9, %c128 : index
    scf.if %14 {
      %18 = arith.muli %arg9, %c48 : index
      %19 = arith.addi %10, %18 : index
      %20 = pto.alloc_tile addr = %c65856_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      %21 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %19, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%21 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%20 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %22 = pto.alloc_tile addr = %c65920_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      %23 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %19, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%23 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%22 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %24 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      %25 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %19, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
      pto.tload ins(%25 : !pto.partition_tensor_view<1x1x1x16x512xf32>) outs(%24 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      scf.for %arg10 = %c1 to %c3 step %c1 {
        %31 = arith.muli %arg10, %c16 : index
        %32 = arith.addi %19, %31 : index
        %33 = pto.alloc_tile addr = %c98752_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %34 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %32, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%34 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%33 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %35 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %36 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %32, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%36 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%35 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %37 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        %38 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %32, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%38 : !pto.partition_tensor_view<1x1x1x16x512xf32>) outs(%37 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %39 = pto.alloc_tile addr = %c65856_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %40 = pto.alloc_tile addr = %c98752_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %41 = pto.fusion_region {
          %49 = pto.alloc_tile addr = %c32832_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tmax ins(%39, %40 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%49 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %50 = pto.alloc_tile addr = %c32832_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %51 = pto.alloc_tile addr = %c65856_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %52 = pto.alloc_tile addr = %c32832_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %53 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tsub ins(%51, %52 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %54 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %55 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %56 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.texp ins(%55 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %57 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %58 = pto.alloc_tile addr = %c98752_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %59 = pto.alloc_tile addr = %c32832_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %60 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tsub ins(%58, %59 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%60 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %61 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %62 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %63 = pto.alloc_tile addr = %c32960_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.texp ins(%62 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %64 = pto.alloc_tile addr = %c32960_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %65 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %66 = pto.alloc_tile addr = %c65920_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %67 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tmul ins(%65, %66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%67 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %68 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %69 = pto.alloc_tile addr = %c32960_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %70 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %71 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tmul ins(%69, %70 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %72 = pto.alloc_tile addr = %c33024_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %73 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %74 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          %75 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
          pto.tadd ins(%73, %74 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%75 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %76 = pto.alloc_tile addr = %c33024_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
          %77 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
          pto.trowexpandmul ins(%24, %57 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%77 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          %78 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
          pto.trowexpandmul ins(%37, %64 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%78 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
          %79 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
          pto.tadd ins(%77, %78 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x512xf32, valid=?x?>) outs(%79 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          pto.yield(%76) : (!pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %42 = pto.alloc_tile addr = %c32832_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %43 = pto.alloc_tile addr = %c65920_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %44 = pto.treshape %41 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %45 = pto.treshape %43 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %valid_row, %valid_col = pto.get_validshape %41 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        pto.set_validshape %44, %valid_col, %valid_row : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %valid_row_1, %valid_col_2 = pto.get_validshape %43 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        pto.set_validshape %45, %valid_col_2, %valid_row_1 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tmov ins(%44 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %46 = pto.alloc_tile addr = %c65856_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %47 = pto.treshape %42 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %48 = pto.treshape %46 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %valid_row_3, %valid_col_4 = pto.get_validshape %42 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        pto.set_validshape %47, %valid_col_4, %valid_row_3 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %valid_row_5, %valid_col_6 = pto.get_validshape %46 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        pto.set_validshape %48, %valid_col_6, %valid_row_5 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tmov ins(%47 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%48 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      }
      %26 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %27 = pto.partition_view %6, offsets = [%11], sizes = [%c16] : !pto.tensor_view<?xf32>
      pto.tload ins(%27 : !pto.partition_tensor_view<16xf32>) outs(%26 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
      %28 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      %29 = pto.alloc_tile addr = %c65856_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %30 = pto.alloc_tile addr = %c65856_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.fusion_region {
        %31 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tsub ins(%29, %30 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%31 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %32 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %33 = pto.alloc_tile addr = %c33088_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %34 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %35 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tadd ins(%33, %34 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%35 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %36 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %37 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %38 = pto.alloc_tile addr = %c65856_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %39 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tsub ins(%37, %38 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%39 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %40 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %41 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %42 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.texp ins(%41 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %43 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %44 = pto.alloc_tile addr = %c65920_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %45 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        %46 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
        pto.tadd ins(%44, %45 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        %47 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
        %48 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        pto.trowexpanddiv ins(%24, %47 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%48 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpanddiv", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], precisionType = #pto<div_precision default>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpanddiv", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %49 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        %50 = pto.subview %48[%c0, %c0] sizes [16, 512] : !pto.tile_buf<vec, 16x512xf32, valid=?x?> -> !pto.tile_buf<vec, 16x512xf32>
        %51 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
        pto.tcvt ins(%50 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x512xf32>) outs(%51 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>)
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 0 : i64} :
    } else {
      %18 = pto.alloc_tile addr = %c65984_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%18 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %19 = pto.alloc_tile addr = %c33088_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
      pto.texpands ins(%cst_0 : bf16) outs(%19 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      pto.fusion_region {
        %20 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
        pto.tmov ins(%19 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>) outs(%20 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
    }
    %15 = pto.alloc_tile addr = %c67776_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %16 = pto.subview %8[%c0, %c448] sizes [16, 64] : !pto.tile_buf<vec, 16x512xf32, valid=?x?> -> !pto.tile_buf<vec, 16x64xf32>
    %17 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %13, %c0], sizes = [%c1, %c1, %c1, %c16, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%16 : !pto.tile_buf<vec, 16x64xf32>) outs(%17 : !pto.partition_tensor_view<1x1x1x16x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    scf.for %arg10 = %c0 to %c16 step %c1 {
      %18 = arith.addi %11, %arg10 : index
      %19 = arith.divsi %18, %c8 : index
      %20 = arith.muli %19, %c128 : index
      %21 = arith.addi %20, %9 : index
      %22 = arith.muli %19, %c8 : index
      %23 = arith.subi %18, %22 : index
      %24 = arith.muli %23, %c512 : index
      %25 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c448 : !pto.tile_buf<vec, 1x448xbf16, valid=?x?>
      %26 = pto.subview %7[%arg10, %c0] sizes [1, 448] : !pto.tile_buf<vec, 16x512xbf16, valid=?x?> -> !pto.tile_buf<vec, 1x448xbf16>
      %27 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %21, %24], sizes = [%c1, %c1, %c1, %c1, %c448] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%26 : !pto.tile_buf<vec, 1x448xbf16>) outs(%27 : !pto.partition_tensor_view<1x1x1x1x448xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    }
  }
  return
}
