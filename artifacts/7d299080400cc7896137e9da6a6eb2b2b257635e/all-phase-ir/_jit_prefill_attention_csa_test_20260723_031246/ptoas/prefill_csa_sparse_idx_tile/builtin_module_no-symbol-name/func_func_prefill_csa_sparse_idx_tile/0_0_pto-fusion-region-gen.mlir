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
    %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>
    pto.texpands ins(%c-1_i32 : i32) outs(%8 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %9 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c512 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
    pto.texpands ins(%c-1_i32 : i32) outs(%9 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}], pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}, pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback"}
    %10 = arith.cmpi slt, %7, %c128 : index
    scf.if %10 {
      %13 = pto.load_scalar %arg2[%7] : !pto.ptr<i32, gm> -> i32
      %14 = arith.index_cast %13 : i32 to index
      %15 = arith.addi %14, %c1 : index
      %16 = arith.minsi %15, %c128 : index
      %17 = arith.index_cast %13 : i32 to index
      %18 = arith.subi %17, %16 : index
      %19 = arith.addi %18, %c1 : index
      scf.for %arg9 = %c0 to %c128 step %c1 {
        %23 = arith.index_cast %arg9 : index to i32
        %24 = arith.index_cast %23 : i32 to index
        %25 = arith.cmpi slt, %24, %16 : index
        scf.if %25 {
          %26 = arith.index_cast %23 : i32 to index
          %27 = arith.addi %19, %26 : index
          %28 = arith.divsi %27, %c128 : index
          %29 = pto.load_scalar %arg3[%28] : !pto.ptr<i32, gm> -> i32
          %30 = arith.index_cast %29 : i32 to index
          %31 = arith.cmpi sge, %30, %c0 : index
          scf.if %31 {
            %32 = arith.index_cast %29 : i32 to index
            %33 = arith.muli %32, %c128 : index
            %34 = arith.muli %28, %c128 : index
            %35 = arith.subi %27, %34 : index
            %36 = arith.addi %33, %35 : index
            %37 = arith.index_cast %36 : index to i32
            pto.tsetval ins(%arg9, %37 : index, i32) outs(%8 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>)
          }
        }
      }
      %20 = arith.index_cast %13 : i32 to index
      %21 = arith.addi %20, %c1 : index
      %22 = arith.divsi %21, %c4 : index
      scf.for %arg9 = %c0 to %c512 step %c1 {
        %23 = arith.index_cast %arg9 : index to i32
        %24 = arith.index_cast %23 : i32 to index
        %25 = arith.cmpi slt, %24, %22 : index
        scf.if %25 {
          %26 = arith.muli %7, %c512 : index
          %27 = arith.addi %26, %arg9 : index
          %28 = pto.load_scalar %arg4[%27] : !pto.ptr<i32, gm> -> i32
          %29 = arith.index_cast %28 : i32 to index
          %30 = arith.cmpi sge, %29, %c0 : index
          scf.if %30 {
            %31 = arith.cmpi slt, %28, %c4096_i32 : i32
            scf.if %31 {
              pto.tsetval ins(%arg9, %28 : index, i32) outs(%9 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>)
            }
          }
        }
      }
    }
    %11 = pto.partition_view %1, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c128] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%8 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>) outs(%11 : !pto.partition_tensor_view<1x1x1x1x128xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
    %12 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %7, %c0], sizes = [%c1, %c1, %c1, %c1, %c512] : !pto.tensor_view<1x1x1x?x?xi32>
    pto.tstore ins(%9 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>) outs(%12 : !pto.partition_tensor_view<1x1x1x1x512xi32>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>, pto.tilelib.impl = "ptodsl", pto.tilelib.selected_candidate = {id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}, pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback"}
  }
  return
}
