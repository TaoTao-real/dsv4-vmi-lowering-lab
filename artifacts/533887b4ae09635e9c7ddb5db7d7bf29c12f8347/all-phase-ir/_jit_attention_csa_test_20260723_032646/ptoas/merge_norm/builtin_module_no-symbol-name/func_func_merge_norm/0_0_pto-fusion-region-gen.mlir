// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c262144 = arith.constant 262144 : index
  %c1310720 = arith.constant 1310720 : index
  %c70784_i64 = arith.constant 70784 : i64
  %c70848_i64 = arith.constant 70848 : i64
  %c70912_i64 = arith.constant 70912 : i64
  %c0_i64 = arith.constant 0 : i64
  %c64_i64 = arith.constant 64 : i64
  %c128_i64 = arith.constant 128 : i64
  %c65664_i64 = arith.constant 65664 : i64
  %c32896_i64 = arith.constant 32896 : i64
  %c69760_i64 = arith.constant 69760 : i64
  %c70016_i64 = arith.constant 70016 : i64
  %c70272_i64 = arith.constant 70272 : i64
  %c72704_i64 = arith.constant 72704 : i64
  %c70528_i64 = arith.constant 70528 : i64
  %c2560 = arith.constant 2560 : index
  %c1 = arith.constant 1 : index
  %c512 = arith.constant 512 : index
  %c64 = arith.constant 64 : index
  %c8 = arith.constant 8 : index
  %c4096 = arith.constant 4096 : index
  %c4 = arith.constant 4 : index
  %c16 = arith.constant 16 : index
  %c80 = arith.constant 80 : index
  %c0 = arith.constant 0 : index
  %c5 = arith.constant 5 : index
  %cst = arith.constant 1.000000e+00 : f32
  %c0_i32 = arith.constant 0 : i32
  %cst_0 = arith.constant 5.000000e-01 : f32
  %cst_1 = arith.constant 2.000000e+00 : f32
  %c448 = arith.constant 448 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c2560, %c1], strides = [%c2560, %c2560, %c2560, %c1, %c2560] {layout = #pto.layout<dn>} : !pto.tensor_view<1x1x1x?x?xf32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c2560, %c512], strides = [%c1310720, %c1310720, %c1310720, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %3 = pto.make_tensor_view %arg3, shape = [%c64], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c8, %c64], strides = [%c512, %c512, %c512, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c8, %c64], strides = [%c512, %c512, %c512, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c64, %c4096], strides = [%c262144, %c262144, %c262144, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %7 = arith.index_cast %arg7 : i32 to index
  %8 = arith.divsi %7, %c4 : index
  %9 = arith.muli %8, %c4 : index
  %10 = arith.subi %7, %9 : index
  %11 = arith.muli %10, %c16 : index
  %12 = arith.muli %7, %c80 : index
  %13 = pto.alloc_tile addr = %c70784_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %14 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%14 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%13 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %15 = pto.alloc_tile addr = %c70848_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %16 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%16 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%15 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %17 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
  %18 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %12, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%18 : !pto.partition_tensor_view<1x1x1x16x512xf32>) outs(%17 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  scf.for %arg9 = %c1 to %c5 step %c1 {
    %66 = arith.muli %arg9, %c16 : index
    %67 = arith.addi %12, %66 : index
    %68 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %69 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %67, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%69 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%68 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %70 = pto.alloc_tile addr = %c64_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %71 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %67, %c0], sizes = [%c1, %c1, %c1, %c16, %c1] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%71 : !pto.partition_tensor_view<1x1x1x16x1xf32>) outs(%70 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) {candidates = [{id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}], layout = #pto.layout<dn>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 3 : i64, name = "template_tload_dn2dn", postupdate = 0 : i64, tags = ["load", "gm", "ub", "dn"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %72 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
    %73 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %67, %c0], sizes = [%c1, %c1, %c1, %c16, %c512] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tload ins(%73 : !pto.partition_tensor_view<1x1x1x16x512xf32>) outs(%72 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %74 = pto.alloc_tile addr = %c70784_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %75 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tmax ins(%74, %75 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 17 : i64} : 
    %76 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %77 = pto.alloc_tile addr = %c70784_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %78 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tsub ins(%77, %78 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 18 : i64} : 
    %79 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %80 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c69760_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.texp ins(%80 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 19 : i64} : 
    %81 = pto.alloc_tile addr = %c69760_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %82 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %83 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tsub ins(%82, %83 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 20 : i64} : 
    %84 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %85 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c70016_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.texp ins(%85 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
    %86 = pto.alloc_tile addr = %c70016_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %87 = pto.alloc_tile addr = %c69760_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %88 = pto.alloc_tile addr = %c70848_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tmul ins(%87, %88 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
    %89 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %90 = pto.alloc_tile addr = %c70016_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %91 = pto.alloc_tile addr = %c64_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c70272_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tmul ins(%90, %91 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
    %92 = pto.alloc_tile addr = %c70272_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %93 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %94 = pto.alloc_tile addr = %c70272_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c70272_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.tadd ins(%93, %94 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 24 : i64} : 
    %95 = pto.alloc_tile addr = %c70272_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %96 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
    pto.trowexpandmul ins(%17, %81 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%96 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %97 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
    pto.trowexpandmul ins(%72, %86 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%97 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpandmul", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    pto.fusion_region {
      %105 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.tadd ins(%96, %97 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x512xf32, valid=?x?>) outs(%105 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 25 : i64} : 
    %98 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %99 = pto.alloc_tile addr = %c70848_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %100 = pto.treshape %95 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %101 = pto.treshape %99 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %valid_row, %valid_col = pto.get_validshape %95 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    pto.set_validshape %100, %valid_col, %valid_row : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %valid_row_2, %valid_col_3 = pto.get_validshape %99 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    pto.set_validshape %101, %valid_col_3, %valid_row_2 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmov ins(%100 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%101 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %102 = pto.alloc_tile addr = %c70784_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    %103 = pto.treshape %98 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %104 = pto.treshape %102 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major> -> !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %valid_row_4, %valid_col_5 = pto.get_validshape %98 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    pto.set_validshape %103, %valid_col_5, %valid_row_4 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %valid_row_6, %valid_col_7 = pto.get_validshape %102 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
    pto.set_validshape %104, %valid_col_7, %valid_row_6 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tmov ins(%103 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%104 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  }
  %19 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %20 = pto.partition_view %3, offsets = [%11], sizes = [%c16] : !pto.tensor_view<?xf32>
  pto.tload ins(%20 : !pto.partition_tensor_view<16xf32>) outs(%19 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %21 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %22 = pto.alloc_tile addr = %c70784_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %23 = pto.alloc_tile addr = %c70784_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %66 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tsub ins(%22, %23 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 0 : i64} : 
  %24 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %25 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %26 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %66 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tadd ins(%25, %26 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 1 : i64} : 
  %27 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %28 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %29 = pto.alloc_tile addr = %c70784_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %66 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tsub ins(%28, %29 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 2 : i64} : 
  %30 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %31 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %66 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.texp ins(%31 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 3 : i64} : 
  %32 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %33 = pto.alloc_tile addr = %c70848_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  %34 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %66 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c16 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    pto.tadd ins(%33, %34 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>, !pto.tile_buf<vec, 1x16xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x16xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 4 : i64} : 
  %35 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c1 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
  %36 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
  pto.trowexpanddiv ins(%17, %35 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>) outs(%36 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpanddiv", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}], precisionType = #pto<div_precision default>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_trowexpanddiv", postupdate = 0 : i64, tags = ["row_expand", "binary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %37 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
  %38 = pto.subview %36[%c0, %c0] sizes [16, 512] : !pto.tile_buf<vec, 16x512xf32, valid=?x?> -> !pto.tile_buf<vec, 16x512xf32>
  %39 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c128_i64 valid_row = %c16 valid_col = %c512 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
    pto.tcvt ins(%38 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x512xf32>) outs(%66 : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>)
    pto.yield(%66) : (!pto.tile_buf<vec, 16x512xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x512xbf16, valid=?x?>
  %40 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.texpands ins(%cst : f32) outs(%40 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
  %41 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
  pto.tci ins(%c0_i32 : i32) outs(%41 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %42 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  pto.tcvt ins(%41 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>)
  %43 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%40, %42 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %44 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%43, %cst_0 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %45 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%44 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%45 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %46 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.tcvt ins(%45 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xi32, valid=?x?>) outs(%46 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>)
  %47 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%46, %cst_1 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %48 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%43, %47 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %49 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadds ins(%43, %cst : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadds", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %50 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tmuls ins(%48, %cst_1 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, f32) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmuls", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %51 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tsub ins(%49, %50 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %52 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>
  pto.tcvt ins(%51 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 16x64xi32, valid=?x?>)
  %53 = pto.alloc_tile addr = %c72704_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %54 = pto.subview %38[%c0, %c448] sizes [16, 64] : !pto.tile_buf<vec, 16x512xf32> -> !pto.tile_buf<vec, 16x64xf32>
  %55 = pto.alloc_tile addr = %c69760_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %56 = pto.partition_view %4, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%56 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%55 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %57 = pto.alloc_tile addr = %c70016_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
  %58 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %8, %c0], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xf32>
  pto.tload ins(%58 : !pto.partition_tensor_view<1x1x1x1x64xf32>) outs(%57 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %59 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg9 = %c0 to %c16 step %c1 {
    %66 = pto.alloc_tile addr = %c70912_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    %67 = pto.subview %54[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32> -> !pto.tile_buf<vec, 1x64xf32>
    %68 = pto.alloc_tile addr = %c32896_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %69 = pto.subview %52[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xi32, valid=?x?> -> !pto.tile_buf<vec, 1x64xi32>
    %70 = pto.alloc_tile addr = %c70272_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xi32, valid=?x?>
    %71 = pto.alloc_tile addr = %c70528_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
    pto.tgather ins(%67, %69, %70 : !pto.tile_buf<vec, 1x64xf32>, !pto.tile_buf<vec, 1x64xi32>, !pto.tile_buf<vec, 1x64xi32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %72 = pto.subview %59[%arg9, %c0] sizes [1, 64] valid [%c1, %c64] : !pto.tile_buf<vec, 16x64xf32, valid=?x?> -> !pto.tile_buf<vec, 1x64xf32>
    pto.fusion_region {
      pto.tmov ins(%71 : !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x64xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 26 : i64} : 
  }
  %60 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %61 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  pto.textract ins(%36, %c0, %c448 : !pto.tile_buf<vec, 16x512xf32, valid=?x?>, index, index) outs(%61 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_textract_vec2vec_nd", postupdate = 0 : i64, tags = ["move", "extract", "ub"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_textract_vec2vec_nd", postupdate = 0 : i64, tags = ["move", "extract", "ub"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  %62 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%61, %55 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %63 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tcolexpandmul ins(%60, %57 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 1x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcolexpandmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %64 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.tadd ins(%62, %63 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %65 = pto.fusion_region {
    %66 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    pto.tcvt ins(%64 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tcvt", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}, rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>)
    pto.yield(%66) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
  scf.for %arg9 = %c0 to %c16 step %c1 {
    %66 = arith.addi %11, %arg9 : index
    %67 = arith.divsi %66, %c8 : index
    %68 = arith.muli %67, %c8 : index
    %69 = arith.subi %66, %68 : index
    %70 = arith.muli %67, %c8 : index
    %71 = arith.addi %70, %8 : index
    %72 = arith.muli %69, %c512 : index
    %73 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c448 : !pto.tile_buf<vec, 1x448xbf16, valid=?x?>
    %74 = pto.subview %39[%arg9, %c0] sizes [1, 448] : !pto.tile_buf<vec, 16x512xbf16, valid=?x?> -> !pto.tile_buf<vec, 1x448xbf16>
    %75 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %71, %72], sizes = [%c1, %c1, %c1, %c1, %c448] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%74 : !pto.tile_buf<vec, 1x448xbf16>) outs(%75 : !pto.partition_tensor_view<1x1x1x1x448xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %76 = pto.alloc_tile addr = %c70912_i64 valid_row = %c1 valid_col = %c64 : !pto.tile_buf<vec, 1x64xbf16, valid=?x?>
    %77 = pto.subview %65[%arg9, %c0] sizes [1, 64] : !pto.tile_buf<vec, 16x64xbf16, valid=?x?> -> !pto.tile_buf<vec, 1x64xbf16>
    %78 = arith.addi %72, %c448 : index
    %79 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %71, %78], sizes = [%c1, %c1, %c1, %c1, %c64] : !pto.tensor_view<1x1x1x?x?xbf16>
    pto.tstore ins(%77 : !pto.tile_buf<vec, 1x64xbf16>) outs(%79 : !pto.partition_tensor_view<1x1x1x1x64xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}

