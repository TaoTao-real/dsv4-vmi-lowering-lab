// -----// IR Dump After PTOFusionRegionGen (pto-fusion-region-gen) //----- //
func.func @prefill_csa_sparse_idx_tile(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c4096_i32 = arith.constant 4096 : i32
  %c16384 = arith.constant 16384 : index
  %c0_i64 = arith.constant 0 : i64
  %c512_i64 = arith.constant 512 : i64
  %c128 = arith.constant 128 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %c-1_i32 = arith.constant -1 : i32
  %c4 = arith.constant 4 : index
  %c65536 = arith.constant 65536 : index
  %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %1 = pto.make_tensor_view %arg1, shape = [%c1, %c1, %c1, %c128, %c128], strides = [%c16384, %c16384, %c16384, %c128, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %2 = pto.make_tensor_view %arg2, shape = [%arg5], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %3 = pto.make_tensor_view %arg3, shape = [%c128], strides = [%c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?xi32>
  %4 = pto.make_tensor_view %arg4, shape = [%c1, %c1, %c1, %c128, %c512], strides = [%c65536, %c65536, %c65536, %c512, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xi32>
  %5 = arith.index_cast %arg6 : i32 to index
  %6 = arith.muli %5, %c2 : index
  scf.for %arg8 = %c0 to %c2 step %c1 {
    %7 = arith.addi %6, %arg8 : index
    %8:2 = pto.fusion_region {
      %12 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>
      pto.texpands ins(%c-1_i32 : i32) outs(%12 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_i32", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_i32", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      %13 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
      pto.texpands ins(%c-1_i32 : i32) outs(%13 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_i32", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}], pto.tilelib.impl = "vmi", pto.tilelib.selected_candidate = {id = 1000 : i64, loop_depth = 1 : i64, name = "vmi_texpands_i32", postupdate = 0 : i64, tags = ["vmi", "fusion_eligible", "single_logical_row_loop"], tail = 0 : i64}}
      pto.yield(%12, %13) : (!pto.tile_buf<vec, 1x128xi32, valid=?x?>, !pto.tile_buf<vec, 1x512xi32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x128xi32, valid=?x?>, !pto.tile_buf<vec, 1x512xi32, valid=?x?>
    %9 = arith.cmpi slt, %7, %c128 : index
    scf.if %9 {
      %12 = pto.load_scalar %arg2[%7] : !pto.ptr<i32, gm> -> i32
      %13 = arith.index_cast %12 : i32 to index
      %14 = arith.addi %13, %c1 : index
      %15 = arith.minsi %14, %c128 : index
      %16 = arith.index_cast %12 : i32 to index
      %17 = arith.subi %16, %15 : index
      %18 = arith.addi %17, %c1 : index
      scf.for %arg9 = %c0 to %c128 step %c1 {
        %22 = arith.index_cast %arg9 : index to i32
        %23 = arith.index_cast %22 : i32 to index
        %24 = arith.cmpi slt, %23, %15 : index
        scf.if %24 {
          %25 = arith.index_cast %22 : i32 to index
          %26 = arith.addi %18, %25 : index
          %27 = arith.divsi %26, %c128 : index
          %28 = pto.load_scalar %arg3[%27] : !pto.ptr<i32, gm> -> i32
          %29 = arith.index_cast %28 : i32 to index
          %30 = arith.cmpi sge, %29, %c0 : index
          scf.if %30 {
            %31 = arith.index_cast %28 : i32 to index
            %32 = arith.muli %31, %c128 : index
            %33 = arith.muli %27, %c128 : index
            %34 = arith.subi %26, %33 : index
            %35 = arith.addi %32, %34 : index
            %36 = arith.index_cast %35 : index to i32
            pto.tsetval ins(%arg9, %36 : index, i32) outs(%8#0 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>)
          }
        }
      }
      %19 = arith.index_cast %12 : i32 to index
      %20 = arith.addi %19, %c1 : index
      %21 = arith.divsi %20, %c4 : index
      scf.for %arg9 = %c0 to %c512 step %c1 {
        %22 = arith.index_cast %arg9 : index to i32
        %23 = arith.index_cast %22 : i32 to index
        %24 = arith.cmpi slt, %23, %21 : index
        scf.if %24 {
          %25 = arith.muli %7, %c512 : index
          %26 = arith.addi %25, %arg9 : index
          %27 = pto.load_scalar %arg4[%26] : !pto.ptr<i32, gm> -> i32
          %28 = arith.index_cast %27 : i32 to index
          %29 = arith.cmpi sge, %28, %c0 : index
          scf.if %29 {
            %30 = arith.cmpi slt, %27, %c4096_i32 : i32
            scf.if %30 {
              pto.tsetval ins(%arg9, %27 : index, i32) outs(%8#1 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>)
            }
          }
        }
      }
    }
    %10 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%8#0 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>) outs(%10 : !pto.partition_tensor_view<1x1x1x1x128xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %11 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%8#1 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) outs(%11 : !pto.partition_tensor_view<1x1x1x1x512xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
