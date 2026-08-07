// -----// IR Dump After InsertTemplateAttributes (pto-insert-template-attributes) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c8192 = arith.constant 8192 : index
    %c24832_i64 = arith.constant 24832 : i64
    %c33024_i64 = arith.constant 33024 : i64
    %c0_i64 = arith.constant 0 : i64
    %c8192_i64 = arith.constant 8192 : i64
    %c16384_i64 = arith.constant 16384 : i64
    %c24576_i64 = arith.constant 24576 : i64
    %c24704_i64 = arith.constant 24704 : i64
    %c1024 = arith.constant 1024 : index
    %c4096 = arith.constant 4096 : index
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %c64 = arith.constant 64 : index
    %c2 = arith.constant 2 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 1.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c512 = arith.constant 512 : index
    %c448 = arith.constant 448 : index
    %c16 = arith.constant 16 : index
    %c4194304 = arith.constant 4194304 : index
    %0 = pto.make_tensor_view %arg0, shape = [%c1, %c1, %c1, %c1024, %c4096], strides = [%c4194304, %c4194304, %c4194304, %c4096, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xbf16>
    %1 = pto.make_tensor_view %arg1, shape = [%c128, %c64, %c64], strides = [%c4096, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<?x?x?xf32>
    %2 = pto.make_tensor_view %arg2, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
    %3 = pto.make_tensor_view %arg3, shape = [%c1, %c1, %c1, %c128, %c64], strides = [%c8192, %c8192, %c8192, %c64, %c1] {layout = #pto.layout<nd>} : !pto.tensor_view<1x1x1x?x?xf32>
    %4 = arith.index_cast %arg4 : i32 to index
    %5 = arith.divsi %4, %c2 : index
    %6 = arith.muli %5, %c2 : index
    %7 = arith.subi %4, %6 : index
    %8 = arith.muli %7, %c64 : index
    %9 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.texpands ins(%cst : f32) outs(%9 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_texpands", postupdate = 0 : i64, tags = ["elementwise", "scalar", "fill"], tail = 0 : i64}]}
    %10 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
    pto.tci ins(%c0_i32 : i32) outs(%10 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 1 : i64, name = "template_tci", postupdate = 0 : i64, tags = [], tail = 0 : i64}], descending = false}
    %11 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
    pto.tcvt ins(%10 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%11 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>)
    %12 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tcolexpandmul ins(%9, %11 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%12 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcolexpandmul", postupdate = 0 : i64, tags = ["column_expand", "binary"], tail = 0 : i64}]}
    %13 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%12, %cst_0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%13 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}]}
    %14 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>
    pto.tcvt ins(%13 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], rmode = #pto<round_mode TRUNC>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%14 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>)
    %15 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tcvt ins(%14 {candidates = [{id = 1 : i64, loop_depth = 2 : i64, name = "template_tcvt_i32_to_f32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xi32, valid=?x?>) outs(%15 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>)
    %16 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%15, %cst_1 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%16 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}]}
    %17 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tsub ins(%12, %16 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%17 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}]}
    %18 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tadds ins(%12, %cst : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%18 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadds", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}]}
    %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tmuls ins(%17, %cst_1 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, f32) outs(%19 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmuls", postupdate = 0 : i64, tags = ["elementwise", "scalar"], tail = 0 : i64}]}
    %20 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    pto.tsub ins(%18, %19 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%20 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tsub", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}]}
    %21 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>
    pto.tcvt ins(%20 {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_i32", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], rmode = #pto<round_mode ROUND>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%21 : !pto.tile_buf<vec, 64x32xi32, valid=?x?>)
    scf.for %arg6 = %c0 to %c4 step %c1 {
      %22 = arith.muli %5, %c4 : index
      %23 = arith.addi %22, %arg6 : index
      %24 = arith.divsi %23, %c8 : index
      %25 = arith.muli %24, %c8 : index
      %26 = arith.subi %23, %25 : index
      %27 = arith.muli %26, %c512 : index
      %28 = arith.addi %27, %c448 : index
      %29 = arith.muli %24, %c128 : index
      %30 = arith.addi %29, %8 : index
      scf.for %arg7 = %c0 to %c32 step %c16 {
        %31 = arith.muli %arg7, %c2 : index
        %32 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %33 = pto.partition_view %1, offsets = [%8, %23, %31], sizes = [%c64, %c1, %c32] : !pto.tensor_view<?x?x?xf32>
        pto.tload ins(%33 : !pto.partition_tensor_view<64x1x32xf32>) outs(%32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>}
        %34 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %35 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %36 = pto.partition_view %2, offsets = [%c0, %c0, %c0, %8, %31], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%36 : !pto.partition_tensor_view<1x1x1x64x32xf32>) outs(%35 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>}
        %37 = pto.alloc_tile addr = %c8192_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %38 = pto.partition_view %3, offsets = [%c0, %c0, %c0, %8, %31], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xf32>
        pto.tload ins(%38 : !pto.partition_tensor_view<1x1x1x64x32xf32>) outs(%37 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tload_nd2nd", postupdate = 0 : i64, tags = ["load", "gm", "ub", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>}
        %39 = pto.alloc_tile addr = %c16384_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %47 = pto.alloc_tile addr = %c33024_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          %48 = pto.subview %34[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          %49 = pto.alloc_tile addr = %c24832_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
          %50 = pto.subview %21[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xi32, valid=?x?> -> !pto.tile_buf<vec, 1x32xi32>
          %51 = pto.alloc_tile addr = %c24576_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
          %52 = pto.alloc_tile addr = %c24704_i64 valid_row = %c1 valid_col = %c32 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.tgather ins(%48, %50, %51 : !pto.tile_buf<vec, 1x32xf32>, !pto.tile_buf<vec, 1x32xi32>, !pto.tile_buf<vec, 1x32xi32, valid=?x?>) outs(%52 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tgather_index", postupdate = 0 : i64, tags = ["gather", "index", "hard_boundary"], tail = 0 : i64}]}
          %53 = pto.subview %39[%arg8, %c0] sizes [1, 32] valid [%c1, %c32] : !pto.tile_buf<vec, 64x32xf32, valid=?x?> -> !pto.tile_buf<vec, 1x32xf32>
          pto.tmov ins(%52 : !pto.tile_buf<vec, 1x32xf32, valid=?x?>) outs(%53 : !pto.tile_buf<vec, 1x32xf32>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmov_basic", postupdate = 0 : i64, tags = ["move", "ub", "ub"], tail = 0 : i64}]}
        }
        %40 = pto.alloc_tile addr = %c16384_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %41 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tmul ins(%34, %35 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%41 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}]}
        %42 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tmul ins(%40, %37 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%42 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tmul", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}]}
        %43 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        pto.tadd ins(%41, %42 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%43 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) {candidates = [{id = 0 : i64, loop_depth = 2 : i64, name = "template_tadd", postupdate = 0 : i64, tags = ["elementwise", "binary"], tail = 0 : i64}]}
        %44 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
        pto.tcvt ins(%43 {candidates = [{id = 6 : i64, loop_depth = 2 : i64, name = "template_tcvt_f32_to_bf16", postupdate = 0 : i64, tags = ["convert", "rowwise"], tail = 0 : i64}], rmode = #pto<round_mode RINT>, satmode = #pto<saturation_mode OFF>} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>) outs(%44 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>)
        %45 = arith.addi %28, %31 : index
        %46 = pto.partition_view %0, offsets = [%c0, %c0, %c0, %30, %45], sizes = [%c1, %c1, %c1, %c64, %c32] : !pto.tensor_view<1x1x1x?x?xbf16>
        pto.tstore ins(%44 : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>) outs(%46 : !pto.partition_tensor_view<1x1x1x64x32xbf16>) {candidates = [{id = 0 : i64, loop_depth = 3 : i64, name = "template_tstore_nd", postupdate = 0 : i64, tags = ["store", "ub", "gm", "nd"], tail = 0 : i64}], layout = #pto.layout<nd>}
      }
    }
    return
  }
}
