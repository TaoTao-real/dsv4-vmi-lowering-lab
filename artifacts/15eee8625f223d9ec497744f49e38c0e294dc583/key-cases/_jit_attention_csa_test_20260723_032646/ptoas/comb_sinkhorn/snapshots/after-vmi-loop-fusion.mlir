// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @comb_sinkhorn(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xf32, #pto.address_space<gm>>, %arg4: f32, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c128 = arith.constant 128 : index
    %c256 = arith.constant 256 : index
    %c4_i32 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %c64_i64 = arith.constant 64 : i64
    %cst = arith.constant 0.000000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %cst_0 = arith.constant -3.40282347E+38 : f32
    %c20 = arith.constant 20 : index
    %c12 = arith.constant 12 : index
    %c16_i64 = arith.constant 16 : i64
    %c128_i64 = arith.constant 128 : i64
    %c8_i64 = arith.constant 8 : i64
    %c32_i64 = arith.constant 32 : i64
    %c1_i64 = arith.constant 1 : i64
    %c2 = arith.constant 2 : index
    %c18 = arith.constant 18 : index
    %cst_1 = arith.constant 9.99999997E-7 : f32
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c1280_i64 = arith.constant 1280 : i64
    %c0_i64 = arith.constant 0 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %c768_i64 = arith.constant 768 : i64
    %c512_i64 = arith.constant 512 : i64
    %c256_i64 = arith.constant 256 : i64
    %c4288_i64 = arith.constant 4288 : i64
    %c4032_i64 = arith.constant 4032 : i64
    %c1920_i64 = arith.constant 1920 : i64
    %c1888_i64 = arith.constant 1888 : i64
    %c1856_i64 = arith.constant 1856 : i64
    %c1824_i64 = arith.constant 1824 : i64
    %c1792_i64 = arith.constant 1792 : i64
    %c1536_i64 = arith.constant 1536 : i64
    %c3776_i64 = arith.constant 3776 : i64
    %c3520_i64 = arith.constant 3520 : i64
    %c3264_i64 = arith.constant 3264 : i64
    %c2496_i64 = arith.constant 2496 : i64
    %c3008_i64 = arith.constant 3008 : i64
    %c2752_i64 = arith.constant 2752 : i64
    %c2240_i64 = arith.constant 2240 : i64
    %c1984_i64 = arith.constant 1984 : i64
    %c1952_i64 = arith.constant 1952 : i64
    %0 = arith.index_cast %arg6 : i32 to index
    %1 = arith.muli %0, %c8 : index
    %2 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %3 = pto.addptr %2, %1 : <f32, gm> -> <f32, gm>
    %4 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %5 = pto.castptr %4 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    pto.mte_gm_ub %3, %5, %c0_i64, %c32_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %6 = arith.muli %0, %c256 : index
    %7 = arith.addi %6, %c8 : index
    %8 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %9 = pto.addptr %8, %7 : <f32, gm> -> <f32, gm>
    %10 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %11 = pto.castptr %10 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    pto.mte_gm_ub %9, %11, %c0_i64, %c16_i64 nburst(%c8_i64, %c128_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    %12 = arith.addi %6, %c12 : index
    %13 = pto.addptr %8, %12 : <f32, gm> -> <f32, gm>
    %14 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %15 = pto.castptr %14 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    pto.mte_gm_ub %13, %15, %c0_i64, %c16_i64 nburst(%c8_i64, %c128_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %16 = arith.addi %6, %c16 : index
    %17 = pto.addptr %8, %16 : <f32, gm> -> <f32, gm>
    %18 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %19 = pto.castptr %18 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    pto.mte_gm_ub %17, %19, %c0_i64, %c16_i64 nburst(%c8_i64, %c128_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %20 = arith.addi %6, %c20 : index
    %21 = pto.addptr %8, %20 : <f32, gm> -> <f32, gm>
    %22 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %23 = pto.castptr %22 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    pto.mte_gm_ub %21, %23, %c0_i64, %c16_i64 nburst(%c8_i64, %c128_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %24 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %25 = pto.addptr %24, %c8 : <f32, gm> -> <f32, gm>
    %26 = pto.pointer_cast(%c2496_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %27 = pto.castptr %26 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %28 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
    %29 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %28, %29, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
    %30 = pto.addptr %24, %c12 : <f32, gm> -> <f32, gm>
    %31 = pto.pointer_cast(%c3264_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %32 = pto.castptr %31 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %33 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
    %34 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %33, %34, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
    %35 = pto.addptr %24, %c16 : <f32, gm> -> <f32, gm>
    %36 = pto.pointer_cast(%c3520_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %37 = pto.castptr %36 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %38 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
    %39 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %38, %39, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
    %40 = pto.addptr %24, %c20 : <f32, gm> -> <f32, gm>
    %41 = pto.pointer_cast(%c3776_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %42 = pto.castptr %41 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %43 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
    %44 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %43, %44, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vmul %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vmuls %result_27, %arg4, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2496_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vmul %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vmuls %result_27, %arg4, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3264_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vmul %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vmuls %result_27, %arg4, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3520_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vmul %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vmuls %result_27, %arg4, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3776_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    %45 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %46 = pto.castptr %45 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst_0, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %46, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %47 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %48 = pto.castptr %47 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst_0, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %48, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %49 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %50 = pto.castptr %49 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst_0, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %50, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %51 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %52 = pto.castptr %51 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst_0, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %52, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %53 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %54 = pto.castptr %53 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %55 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %56 = pto.castptr %55 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %54, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcmax %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vsel %149, %146, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.vmax %146, %150, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %152 = pto.addptr %56, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %151, %152[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %57 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %58 = pto.castptr %57 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %59 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %60 = pto.castptr %59 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %58, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcmax %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vsel %149, %146, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.vmax %146, %150, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %152 = pto.addptr %60, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %151, %152[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %61 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %62 = pto.castptr %61 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %63 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %64 = pto.castptr %63 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %62, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcmax %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vsel %149, %146, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.vmax %146, %150, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %152 = pto.addptr %64, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %151, %152[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %65 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %66 = pto.castptr %65 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %67 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %68 = pto.castptr %67 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %66, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcmax %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vsel %149, %146, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.vmax %146, %150, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %152 = pto.addptr %68, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %151, %152[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vsub %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vexp %result_27, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vsub %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vexp %result_27, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vsub %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vexp %result_27, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vsub %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vexp %result_27, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
    %69 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %70 = pto.castptr %69 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %71 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %72 = pto.castptr %71 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %70, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %72, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %73 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %74 = pto.castptr %73 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %75 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %76 = pto.castptr %75 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %74, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %76, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %77 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %78 = pto.castptr %77 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %79 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %80 = pto.castptr %79 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %78, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %80, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %81 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %82 = pto.castptr %81 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %83 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %84 = pto.castptr %83 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %82, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %84, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %subview_28[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_29, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_27, %148, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_31[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    %85 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %86 = pto.castptr %85 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %86, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %87 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %88 = pto.castptr %87 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %88, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %89 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %90 = pto.castptr %89 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %90, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %91 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %92 = pto.castptr %91 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.vdup %cst, %mask_23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %92, %147 : <f32, ub> -> <f32, ub>
      pto.vsts %146, %148[%c0], %mask_23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_27, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_30 = pto.vlds %cast_29[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_27, %result_30, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_31 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_32 = memref.cast %subview_31 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_32[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    scf.for %arg8 = %c0 to %c18 step %c2 {
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %147 = pto.castptr %146 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %148 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %149 = pto.castptr %148 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_65, %scalar_out_66 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %147, %203 : <f32, ub> -> <f32, ub>
        %result_67 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_67, %mask_65 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %149, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %150 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %150[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %cast_26[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %151 = pto.vadds %result_27, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %152 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %152[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %151, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %153 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %154 = pto.castptr %153 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %155 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %156 = pto.castptr %155 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %154, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %156, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %157 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %157[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_32 = pto.vlds %cast_31[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %158 = pto.vadds %result_32, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_33 = memref.subview %159[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_34 = memref.cast %subview_33 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %158, %cast_34[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %160 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %161, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %163, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %164 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_35 = memref.subview %164[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %165 = pto.vadds %result_37, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %166 = pto.pointer_cast(%c3776_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_38 = memref.subview %166[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %165, %cast_39[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %167 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %168 = pto.castptr %167 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %169 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %170 = pto.castptr %169 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %168, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %170, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %171 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_40 = memref.subview %171[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_41 = memref.cast %subview_40 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_42 = pto.vlds %cast_41[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %172 = pto.vadds %result_42, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %173 = pto.pointer_cast(%c4032_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_43 = memref.subview %173[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_44 = memref.cast %subview_43 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %172, %cast_44[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3776_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.vadds %result_67, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %204 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %204[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %203, %cast_69[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %174 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %175 = pto.castptr %174 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %176 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %177 = pto.castptr %176 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %175, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %177, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %178 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_45 = memref.subview %178[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_46 = memref.cast %subview_45 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_47 = pto.vlds %cast_46[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %179 = pto.vadds %result_47, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %180 = pto.pointer_cast(%c256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_48 = memref.subview %180[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_49 = memref.cast %subview_48 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %179, %cast_49[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %181 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %182 = pto.castptr %181 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %183 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %184 = pto.castptr %183 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %182, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %184, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %185 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_50 = memref.subview %185[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_51 = memref.cast %subview_50 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_52 = pto.vlds %cast_51[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %186 = pto.vadds %result_52, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %187 = pto.pointer_cast(%c512_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_53 = memref.subview %187[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_54 = memref.cast %subview_53 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %186, %cast_54[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %188 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %189 = pto.castptr %188 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %190 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %191 = pto.castptr %190 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %189, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %191, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %192 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_55 = memref.subview %192[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_56 = memref.cast %subview_55 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_57 = pto.vlds %cast_56[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %193 = pto.vadds %result_57, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %194 = pto.pointer_cast(%c768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_58 = memref.subview %194[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_59 = memref.cast %subview_58 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %193, %cast_59[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %195 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %196 = pto.castptr %195 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %197 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %198 = pto.castptr %197 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %196, %203 : <f32, ub> -> <f32, ub>
        %result_65 = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result_65, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %198, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %199 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_60 = memref.subview %199[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_61 = memref.cast %subview_60 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_62 = pto.vlds %cast_61[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %200 = pto.vadds %result_62, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %201 = pto.pointer_cast(%c1024_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_63 = memref.subview %201[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_64 = memref.cast %subview_63 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %200, %cast_64[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c256_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c512_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c768_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1024_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_69 = pto.vlds %subview_68[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_69, %mask_23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result_67, %204, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_70 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_71 = memref.cast %subview_70 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_71[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vadd %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.vadds %result_67, %cst_1, %mask_23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %204 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %204[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %203, %cast_69[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_65 = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_66 = memref.cast %subview_65 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_67 = pto.vlds %cast_66[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_68 = memref.subview %203[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_69 = memref.cast %subview_68 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_70 = pto.vlds %cast_69[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdiv %result_67, %result_70, %mask_23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %205[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %204, %cast_72[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    }
    %93 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %94 = pto.castptr %93 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %95 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_23, %scalar_out_24 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %94, %147 : <f32, ub> -> <f32, ub>
      %result_25 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_25, %mask_23 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %96, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
    %97 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview = memref.subview %97[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %98 = pto.vadds %result, %cst_1, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %99 = pto.pointer_cast(%c1536_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_6 = memref.subview %99[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %98, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %100 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %101 = pto.castptr %100 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %102 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %103 = pto.castptr %102 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %101, %147 : <f32, ub> -> <f32, ub>
      %result_23 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_23, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %103, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %104 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_8 = memref.subview %104[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_10 = pto.vlds %cast_9[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %105 = pto.vadds %result_10, %cst_1, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %106 = pto.pointer_cast(%c2496_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_11 = memref.subview %106[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_12 = memref.cast %subview_11 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %105, %cast_12[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %107 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %108 = pto.castptr %107 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %109 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %110 = pto.castptr %109 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %108, %147 : <f32, ub> -> <f32, ub>
      %result_23 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_23, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %110, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %111 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_13 = memref.subview %111[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_14 = memref.cast %subview_13 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_15 = pto.vlds %cast_14[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %112 = pto.vadds %result_15, %cst_1, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %113 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_16 = memref.subview %113[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_17 = memref.cast %subview_16 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %112, %cast_17[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %114 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %115 = pto.castptr %114 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %116 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %117 = pto.castptr %116 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %147 = arith.muli %arg8, %c8 : index
      %148 = pto.addptr %115, %147 : <f32, ub> -> <f32, ub>
      %result_23 = pto.vlds %148[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %149 = pto.vcadd %result_23, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.vadd %146, %149, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %151 = pto.addptr %117, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %150, %151[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %118 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_18 = memref.subview %118[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_19 = memref.cast %subview_18 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_20 = pto.vlds %cast_19[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %119 = pto.vadds %result_20, %cst_1, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %120 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_21 = memref.subview %120[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_22 = memref.cast %subview_21 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %119, %cast_22[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %subview_26[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_27, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_25, %148, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_29[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2496_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %subview_26[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_27, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_25, %148, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_29[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %subview_26[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_27, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_25, %148, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_29[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_27 = pto.vlds %subview_26[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdup %result_27, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.vdiv %result_25, %148, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %150 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_28 = memref.subview %150[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_29 = memref.cast %subview_28 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %149, %cast_29[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vadd %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.vadds %result_25, %cst_1, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %148 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %148[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %147, %cast_27[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_23 = memref.subview %146[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_24 = memref.cast %subview_23 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_25 = pto.vlds %cast_24[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %147 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_26 = memref.subview %147[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_27 = memref.cast %subview_26 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_28 = pto.vlds %cast_27[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %148 = pto.vdiv %result_25, %result_28, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %149 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_29 = memref.subview %149[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_30 = memref.cast %subview_29 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %148, %cast_30[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    %121 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %122 = pto.castptr %121 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %123 = arith.muli %0, %c128 : index
    %124 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %125 = pto.addptr %124, %123 : <f32, gm> -> <f32, gm>
    %126 = pto.addptr %122, %c0 : <f32, ub> -> <f32, ub>
    %127 = pto.addptr %125, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %126, %127, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    pto.barrier <PIPE_MTE3>
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
    %128 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %129 = pto.castptr %128 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %130 = arith.addi %123, %c4 : index
    %131 = pto.addptr %124, %130 : <f32, gm> -> <f32, gm>
    %132 = pto.addptr %129, %c0 : <f32, ub> -> <f32, ub>
    %133 = pto.addptr %131, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %132, %133, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    pto.barrier <PIPE_MTE3>
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
    %134 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %135 = pto.castptr %134 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %136 = arith.addi %123, %c8 : index
    %137 = pto.addptr %124, %136 : <f32, gm> -> <f32, gm>
    %138 = pto.addptr %135, %c0 : <f32, ub> -> <f32, ub>
    %139 = pto.addptr %137, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %138, %139, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    pto.barrier <PIPE_MTE3>
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
    %140 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %141 = pto.castptr %140 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %142 = arith.addi %123, %c12 : index
    %143 = pto.addptr %124, %142 : <f32, gm> -> <f32, gm>
    %144 = pto.addptr %141, %c0 : <f32, ub> -> <f32, ub>
    %145 = pto.addptr %143, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %144, %145, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
    return
  }
}
