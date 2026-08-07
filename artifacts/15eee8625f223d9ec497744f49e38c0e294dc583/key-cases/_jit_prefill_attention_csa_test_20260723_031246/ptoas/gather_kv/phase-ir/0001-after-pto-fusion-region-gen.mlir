// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @gather_kv(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c2097152 = arith.constant 2097152 : index
  %c65536 = arith.constant 65536 : index
  %c8388608 = arith.constant 8388608 : index
  %c0_i64 = arith.constant 0 : i64
  %c131072_i64 = arith.constant 131072 : i64
  %c49152 = arith.constant 49152 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c128 = arith.constant 128 : index
  %c16384 = arith.constant 16384 : index
  %c32 = arith.constant 32 : index
  %c4096 = arith.constant 4096 : index
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %c0 = arith.constant 0 : index
  %c384 = arith.constant 384 : index
  %cst = arith.constant 0.000000e+00 : bf16
  %c25165824 = arith.constant 25165824 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c49152, %c512], strides = [%c25165824, %c25165824, %c25165824, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c16384, %c512], strides = [%c8388608, %c8388608, %c8388608, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c32], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %5 = pto.make_tensor_view %arg5, shape = [%c1, %c1, %c1, %c4096, %c512], strides = [%c2097152, %c2097152, %c2097152, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
  %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
  %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
  %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
  %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
  %10 = arith.index_cast %arg6 : i32 to index
  %11 = arith.divsi %10, %c3 : index
  %12 = arith.muli %11, %c3 : index
  %13 = arith.subi %10, %12 : index
  %14 = arith.muli %11, %c4 : index
  %15 = arith.muli %13, %c128 : index
  scf.for %arg8 = %c0 to %c4 step %c1 {
    %16 = arith.addi %14, %arg8 : index
    %17 = arith.cmpi slt, %16, %c128 : index
    scf.if %17 {
      %18 = arith.muli %16, %c384 : index
      %19 = arith.addi %18, %15 : index
      %20 = pto.fusion_region {
        %22 = pto.alloc_tile addr = %c0_i64 valid_row = %c128 valid_col = %c512 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
        pto.texpands ins(%cst : bf16) outs(%22 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_bf16", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_bf16", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
        pto.yield(%22) : (!pto.tile_buf<vec, 128x512xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>
      scf.for %arg9 = %c0 to %c128 step %c1 {
        %22 = arith.addi %15, %arg9 : index
        %23 = arith.cmpi slt, %22, %c128 : index
        scf.if %23 {
          %24 = arith.muli %16, %c128 : index
          %25 = arith.addi %24, %22 : index
          %26 = pto.load_scalar %arg1[%25] : !pto.ptr<i32, gm> -> i32
          %27 = arith.index_cast %26 : i32 to index
          %28 = arith.cmpi sge, %27, %c0 : index
          scf.if %28 {
            %29 = arith.index_cast %26 : i32 to index
            %30 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
            %31 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %29, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
            pto.tload ins(%31 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%30 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
            %32 = pto.subview %20[%arg9, %c0] sizes [1, 512] valid [%c1, %c512] : !pto.tile_buf<vec, 128x512xbf16, valid=?x?> -> !pto.tile_buf<vec, 1x512xbf16>
            pto.fusion_region {
              pto.tmov ins(%30 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%32 : !pto.tile_buf<vec, 1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 1 : i64} :
          } else {
          }
        } else {
          %24 = arith.subi %22, %c128 : index
          %25 = arith.cmpi slt, %24, %c512 : index
          scf.if %25 {
            %26 = arith.muli %16, %c512 : index
            %27 = arith.addi %26, %24 : index
            %28 = pto.load_scalar %arg3[%27] : !pto.ptr<i32, gm> -> i32
            %29 = arith.index_cast %28 : i32 to index
            %30 = arith.cmpi sge, %29, %c0 : index
            scf.if %30 {
              %31 = arith.index_cast %28 : i32 to index
              %32 = arith.divsi %31, %c128 : index
              %33 = pto.load_scalar %arg4[%32] : !pto.ptr<i32, gm> -> i32
              %34 = arith.index_cast %33 : i32 to index
              %35 = arith.muli %34, %c128 : index
              %36 = arith.index_cast %28 : i32 to index
              %37 = arith.muli %32, %c128 : index
              %38 = arith.subi %36, %37 : index
              %39 = arith.addi %35, %38 : index
              %40 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
              %41 = pto.partition_view %5, offsets = [%c0, %c0, %c0, %39, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
              pto.tload ins(%41 : !pto.partition_tensor_view<1x1x1x1x512xbf16>) outs(%40 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
              %42 = pto.subview %20[%arg9, %c0] sizes [1, 512] valid [%c1, %c512] : !pto.tile_buf<vec, 128x512xbf16, valid=?x?> -> !pto.tile_buf<vec, 1x512xbf16>
              pto.fusion_region {
                pto.tmov ins(%40 : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 1x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_tmov", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop", "supports_partial_valid_shape"], tail = 0 : i64}}
                pto.yield() : () -> ()
              } {pto.fusion.group_id = 2 : i64} :
            } else {
            }
          } else {
          }
        }
      }
      %21 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %19, %c0], sizes = [%c1, %c1, %c1, %c128, %c512] : !pto.tensor_view<1x1x1x?x?xbf16>
      pto.tstore ins(%20 : !pto.tile_buf<vec, 128x512xbf16, valid=?x?>) outs(%21 : !pto.partition_tensor_view<1x1x1x128x512xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    } else {
    }
  }
  return
}
