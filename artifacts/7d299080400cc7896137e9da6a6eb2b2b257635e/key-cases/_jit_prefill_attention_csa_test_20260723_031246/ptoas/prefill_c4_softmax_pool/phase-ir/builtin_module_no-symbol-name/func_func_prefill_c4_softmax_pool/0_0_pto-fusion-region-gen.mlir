// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_c4_softmax_pool(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: !pto.ptr<f32, gm>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16384 = arith.constant 16384 : index
  %c131072 = arith.constant 131072 : index
  %c532480 = arith.constant 532480 : index
  %c14336_i64 = arith.constant 14336 : i64
  %c0_i64 = arith.constant 0 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c9216_i64 = arith.constant 9216 : i64
  %c10240_i64 = arith.constant 10240 : i64
  %c11264_i64 = arith.constant 11264 : i64
  %c12288_i64 = arith.constant 12288 : i64
  %c13312_i64 = arith.constant 13312 : i64
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c4096 = arith.constant 4096 : index
  %c260 = arith.constant 260 : index
  %c2048 = arith.constant 2048 : index
  %c4 = arith.constant 4 : index
  %c1024 = arith.constant 1024 : index
  %c128 = arith.constant 128 : index
  %c512 = arith.constant 512 : index
  %c2 = arith.constant 2 : index
  %c256 = arith.constant 256 : index
  %c8 = arith.constant 8 : index
  %c0 = arith.constant 0 : index
  %c-3 = arith.constant -3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant -3.40282347E+38 : f32
  %c7 = arith.constant 7 : index
  %c1536 = arith.constant 1536 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c1, %c32], strides = [%c32, %c32, %c32, %c32, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c4096], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c260, %c2048], strides = [%c532480, %c532480, %c532480, %c2048, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %4 = pto.make_tensor_view %arg4, shape = [%arg9], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c4, %c1024], strides = [%c4096, %c4096, %c4096, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %6 = pto.make_tensor_view %arg6, shape = [%c1, %c1, %c1, %c128, %c1024], strides = [%c131072, %c131072, %c131072, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %7 = pto.make_tensor_view %arg7, shape = [%c1, %c1, %c1, %c128, %c1024], strides = [%c131072, %c131072, %c131072, %c1024, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %8 = pto.make_tensor_view %arg8, shape = [%c1, %c1, %c1, %c32, %c512], strides = [%c16384, %c16384, %c16384, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
  %9 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %11 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %13 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %14 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %15 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %17 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %19 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  %20 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  %21 = pto.alloc_tile addr = %c10240_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
  %22 = arith.index_cast %arg10 : i32 to index
  %23 = arith.divsi %22, %c2 : index
  %24 = arith.muli %23, %c2 : index
  %25 = arith.subi %22, %24 : index
  %26 = arith.muli %25, %c256 : index
  %27 = pto.alloc_tile addr = %c14336_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %28 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c256 : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
  %29 = pto.load_scalar %arg0[%23] : !pto.ptr<i32, gm> -> i32
  %30 = arith.index_cast %29 : i32 to index
  %31 = arith.cmpi sge, %30, %c0 : index
  scf.if %31 {
    %32 = pto.load_scalar %arg1[%23] : !pto.ptr<i32, gm> -> i32
    %33 = arith.index_cast %32 : i32 to index
    %34 = arith.addi %33, %c-3 : index
    %35 = arith.subi %34, %c4 : index
    scf.for %arg12 = %c0 to %c4 step %c1 {
      %48 = arith.addi %35, %arg12 : index
      %49 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%49 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %50 = pto.subview %27[%arg12, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      pto.fusion_region {
        pto.tmov ins(%49 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%50 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        %63 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %64 = pto.subview %28[%arg12, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        pto.tmov ins(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
      %51 = arith.index_cast %32 : i32 to index
      %52 = arith.cmpi sge, %51, %c7 : index
      scf.if %52 {
        %63 = arith.divsi %48, %c4 : index
        %64 = arith.muli %63, %c4 : index
        %65 = arith.subi %48, %64 : index
        %66 = pto.load_scalar %arg2[%63] : !pto.ptr<i32, gm> -> i32
        %67 = arith.index_cast %66 : i32 to index
        %68 = arith.cmpi sge, %67, %c0 : index
        scf.if %68 {
          %69 = arith.index_cast %66 : i32 to index
          %70 = arith.muli %69, %c4 : index
          %71 = arith.addi %70, %65 : index
          %72 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %73 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %71, %26], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%73 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%72 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %74 = pto.subview %27[%arg12, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.fusion_region {
            pto.tmov ins(%72 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 4 : i64} :
          %75 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %76 = arith.addi %26, %c1024 : index
          %77 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %71, %76], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%77 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%75 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %78 = pto.subview %28[%arg12, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.fusion_region {
            pto.tmov ins(%75 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%78 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 5 : i64} :
        } else {
        }
      } else {
      }
      %53 = arith.addi %34, %arg12 : index
      %54 = arith.addi %arg12, %c4 : index
      %55 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.texpands ins(%cst : f32) outs(%55 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
      %56 = pto.subview %9[%54, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      pto.fusion_region {
        pto.tmov ins(%55 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%56 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        %63 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        pto.texpands ins(%cst_0 : f32) outs(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
        %64 = pto.subview %10[%54, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        pto.tmov ins(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
      %57 = arith.divsi %53, %c4 : index
      %58 = arith.muli %57, %c4 : index
      %59 = arith.subi %53, %58 : index
      %60 = pto.load_scalar %arg2[%57] : !pto.ptr<i32, gm> -> i32
      %61 = arith.index_cast %60 : i32 to index
      %62 = arith.cmpi sge, %61, %c0 : index
      scf.if %62 {
        %63 = arith.index_cast %60 : i32 to index
        %64 = arith.muli %63, %c4 : index
        %65 = arith.addi %64, %59 : index
        %66 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %67 = arith.addi %26, %c512 : index
        %68 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %65, %67], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%68 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%66 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %69 = pto.subview %9[%54, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        pto.fusion_region {
          pto.tmov ins(%66 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%69 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 6 : i64} :
        %70 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %71 = arith.addi %26, %c1536 : index
        %72 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %65, %71], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%72 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%70 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
        %73 = pto.subview %10[%54, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        pto.fusion_region {
          pto.tmov ins(%70 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 7 : i64} :
      } else {
      }
    }
    scf.for %arg12 = %c0 to %c128 step %c1 {
      %48 = pto.load_scalar %arg4[%arg12] : !pto.ptr<i32, gm> -> i32
      %49 = arith.cmpi sle, %48, %32 : i32
      scf.if %49 {
        %50 = arith.index_cast %48 : i32 to index
        %51 = arith.cmpi sle, %35, %50 : index
        scf.if %51 {
          %52 = arith.index_cast %48 : i32 to index
          %53 = arith.cmpi slt, %52, %34 : index
          %54:2 = scf.if %53 -> (index, index) {
            %65 = arith.index_cast %48 : i32 to index
            %66 = arith.subi %65, %35 : index
            scf.yield %26, %66 : index, index
          } else {
            %65 = arith.index_cast %48 : i32 to index
            %66 = arith.subi %65, %34 : index
            %67 = arith.addi %66, %c4 : index
            %68 = arith.addi %26, %c512 : index
            scf.yield %68, %67 : index, index
          }
          %55 = arith.index_cast %48 : i32 to index
          %56 = arith.remsi %55, %c4 : index
          %57 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %58 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %56, %54#0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%58 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%57 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %59 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %60 = pto.partition_view %6, offsets = [%c0, %c0, %c0, %arg12, %54#0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%60 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%59 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %61 = pto.fusion_region {
            %65 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.tadd ins(%59, %57 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
            pto.yield(%65) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %62 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %63 = pto.partition_view %7, offsets = [%c0, %c0, %c0, %arg12, %54#0], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
          pto.tload ins(%63 : !pto.partition_tensor_view<1x1x1x1x256xf32>) outs(%62 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
          %64 = pto.subview %27[%54#1, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.fusion_region {
            pto.tmov ins(%62 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            %65 = pto.subview %28[%54#1, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
            pto.tmov ins(%61 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 9 : i64} :
        } else {
        }
      } else {
      }
    }
    %36 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %37 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %38 = pto.alloc_tile addr = %c10240_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %40 = pto.subview %28[%c7, %c0] sizes [1, 256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
    %41 = pto.subview %36[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
    pto.fusion_region {
      pto.tmov ins(%40 : !pto.tile_buf<vec, 1x256xf32>) outs(%41 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      %48 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %49 = pto.subview %36[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      %50 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %51 = pto.subview %36[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      %52 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.tsub ins(%49, %51 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32>) outs(%52 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %53 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.texp ins(%52 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %54 = pto.subview %37[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      pto.tmov ins(%53 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%54 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      %55 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %56 = pto.subview %27[%c7, %c0] sizes [1, 256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      %57 = pto.subview %38[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
      pto.tmov ins(%56 : !pto.tile_buf<vec, 1x256xf32>) outs(%57 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 0 : i64} :
    scf.for %arg12 = %c0 to %c7 step %c1 {
      %48 = arith.cmpi sge, %arg12, %c4 : index
      %49 = arith.index_cast %32 : i32 to index
      %50 = arith.cmpi sge, %49, %c7 : index
      %51 = arith.ori %48, %50 : i1
      scf.if %51 {
        %52 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %53 = pto.subview %36[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        %54 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %55 = pto.subview %37[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        %56 = pto.alloc_tile addr = %c10240_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %57 = pto.subview %38[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        %58 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %59 = pto.subview %28[%arg12, %c0] sizes [1, 256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        %60 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %61 = pto.subview %27[%arg12, %c0] sizes [1, 256] : !pto.tile_buf<vec, 8x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
        pto.fusion_region {
          %62 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tmax ins(%53, %59 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32>) outs(%62 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmax", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmax", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %63 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tsub ins(%53, %62 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %64 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.texp ins(%63 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%64 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %65 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tsub ins(%59, %62 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%65 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tsub", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %66 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.texp ins(%65 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%66 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texp", postupdate = 0 : i64, tags = ["elementwise", "unary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texp_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %67 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tmul ins(%64, %55 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32>) outs(%67 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %68 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tadd ins(%67, %66 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%68 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %69 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tmul ins(%57, %64 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%69 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %70 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tmul ins(%61, %66 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%70 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmul", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %71 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.tadd ins(%69, %70 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>, !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%71 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tadd_block64", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
          %72 = pto.subview %36[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.tmov ins(%62 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%72 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          %73 = pto.subview %37[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.tmov ins(%68 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%73 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          %74 = pto.subview %38[%c0, %c0] sizes [1, 256] valid [%c1, %c256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
          pto.tmov ins(%71 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%74 : !pto.tile_buf<vec, 1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 10 : i64} :
      } else {
      }
    }
    %42 = pto.alloc_tile addr = %c10240_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %43 = pto.subview %38[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
    %44 = pto.alloc_tile addr = %c9216_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %45 = pto.subview %37[%c0, %c0] sizes [1, 256] : !pto.tile_buf<vec, 1x256xf32, valid=?x?> -> !pto.tile_buf<vec, 1x256xf32>
    %46 = pto.fusion_region {
      %48 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.tdiv ins(%43, %45 : !pto.tile_buf<vec, 1x256xf32>, !pto.tile_buf<vec, 1x256xf32>) outs(%48 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tdiv", postupdate = 0 : i64, tags = [], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tdiv", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%48) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %47 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %23, %26], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%46 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%47 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  } else {
    %32 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%32 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %33 = pto.partition_view %8, offsets = [%c0, %c0, %c0, %23, %26], sizes = [%c1, %c1, %c1, %c1, %c256] : !pto.tensor_view<1x1x1x?x?xf32>
    pto.tstore ins(%32 : !pto.tile_buf<vec, 1x256xf32, valid=?x?>) outs(%33 : !pto.partition_tensor_view<1x1x1x1x256xf32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
