// -----// IR Dump Before PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
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
    %30 = pto.addptr %24, %c12 : <f32, gm> -> <f32, gm>
    %31 = pto.pointer_cast(%c3264_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %32 = pto.castptr %31 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %33 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
    %34 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %33, %34, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %35 = pto.addptr %24, %c16 : <f32, gm> -> <f32, gm>
    %36 = pto.pointer_cast(%c3520_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %37 = pto.castptr %36 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %38 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
    %39 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %38, %39, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %40 = pto.addptr %24, %c20 : <f32, gm> -> <f32, gm>
    %41 = pto.pointer_cast(%c3776_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %42 = pto.castptr %41 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %43 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
    %44 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %43, %44, %c0_i64, %c16_i64 nburst(%c1_i64, %c0_i64, %c32_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.vmul %result, %110, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %112[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %111, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %110 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %110[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %109, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2496_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %111[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %110, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.vmul %result, %110, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %112[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %111, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %110 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %110[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %109, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3264_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %111[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %110, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.vmul %result, %110, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %112[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %111, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %110 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %110[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %109, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3520_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %111[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %110, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.vmul %result, %110, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %112[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %111, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %110 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %110[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %109, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3776_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %110 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %111 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %111[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %110, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    %45 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %46 = pto.castptr %45 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %46, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %47 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %48 = pto.castptr %47 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %48, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %49 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %50 = pto.castptr %49 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %50, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %51 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %52 = pto.castptr %51 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %52, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %53 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %54 = pto.castptr %53 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %55 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %56 = pto.castptr %55 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %108 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %54, %109 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %111 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.vsel %111, %108, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %113 = pto.vmax %108, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %114 = pto.addptr %56, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %113, %114[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %57 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %58 = pto.castptr %57 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %59 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %60 = pto.castptr %59 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %108 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %58, %109 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %111 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.vsel %111, %108, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %113 = pto.vmax %108, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %114 = pto.addptr %60, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %113, %114[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %61 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %62 = pto.castptr %61 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %63 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %64 = pto.castptr %63 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %108 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %62, %109 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %111 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.vsel %111, %108, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %113 = pto.vmax %108, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %114 = pto.addptr %64, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %113, %114[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %65 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %66 = pto.castptr %65 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %67 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %68 = pto.castptr %67 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %108 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %66, %109 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %111 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.vsel %111, %108, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %113 = pto.vmax %108, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %114 = pto.addptr %68, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %113, %114[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %69:4 = pto.fusion_region {
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %112 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %113 = pto.castptr %112 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %114 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vmi.vload %111[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %188 = pto.vmi.vbrc %187 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %189 = arith.muli %arg8, %c8 : index
        %190 = pto.vmi.vload %109[%189] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %191 = pto.vmi.vsub %190, %188, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %191, %113[%189], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      %115 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %116 = pto.castptr %115 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %117 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %118 = pto.castptr %117 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %119 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %116[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vexp %188, %119 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %118[%187], %119 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      %120 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %121 = pto.castptr %120 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %122 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %123 = pto.castptr %122 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %124 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %125 = pto.castptr %124 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vmi.vload %123[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %188 = pto.vmi.vbrc %187 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %189 = arith.muli %arg8, %c8 : index
        %190 = pto.vmi.vload %121[%189] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %191 = pto.vmi.vsub %190, %188, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %191, %125[%189], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      %126 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %127 = pto.castptr %126 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %128 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %129 = pto.castptr %128 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %127[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vexp %188, %119 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %129[%187], %119 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      %130 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %131 = pto.castptr %130 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %132 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %133 = pto.castptr %132 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %134 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %135 = pto.castptr %134 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vmi.vload %133[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %188 = pto.vmi.vbrc %187 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %189 = arith.muli %arg8, %c8 : index
        %190 = pto.vmi.vload %131[%189] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %191 = pto.vmi.vsub %190, %188, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %191, %135[%189], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      %136 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %137 = pto.castptr %136 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %138 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %139 = pto.castptr %138 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %137[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vexp %188, %119 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %139[%187], %119 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      %140 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %141 = pto.castptr %140 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %142 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %143 = pto.castptr %142 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %144 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %145 = pto.castptr %144 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vmi.vload %143[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %188 = pto.vmi.vbrc %187 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %189 = arith.muli %arg8, %c8 : index
        %190 = pto.vmi.vload %141[%189] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %191 = pto.vmi.vsub %190, %188, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %191, %145[%189], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      %146 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %147 = pto.castptr %146 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %148 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %149 = pto.castptr %148 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %147[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vexp %188, %119 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %149[%187], %119 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      %150 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %151 = pto.castptr %150 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %152 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %153 = pto.castptr %152 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %188 = arith.muli %arg8, %c8 : index
        %189 = pto.addptr %151, %188 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %189[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %190 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.vadd %187, %190, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %192 = pto.addptr %153, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %191, %192[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %154 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %155 = pto.castptr %154 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %156 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %157 = pto.castptr %156 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %188 = arith.muli %arg8, %c8 : index
        %189 = pto.addptr %155, %188 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %189[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %190 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.vadd %187, %190, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %192 = pto.addptr %157, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %191, %192[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %188 = arith.muli %arg8, %c8 : index
        %189 = pto.addptr %159, %188 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %189[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %190 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.vadd %187, %190, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %192 = pto.addptr %161, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %191, %192[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %162 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %165 = pto.castptr %164 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %188 = arith.muli %arg8, %c8 : index
        %189 = pto.addptr %163, %188 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %189[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %190 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.vadd %187, %190, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %192 = pto.addptr %165, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %191, %192[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %187 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %187[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %188 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %188[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %189 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %190 = pto.vdiv %result, %189, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_10 = memref.subview %191[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %190, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %166 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %167 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %168 = pto.castptr %167 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %169 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %170 = pto.castptr %169 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %171 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %168[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vadds %188, %cst_1, %171 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %170[%187], %171 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %187 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %187[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %188 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %188[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %189 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %190 = pto.vdiv %result, %189, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_10 = memref.subview %191[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %190, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %172 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %173 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %174 = pto.castptr %173 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %175 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %176 = pto.castptr %175 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %174[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vadds %188, %cst_1, %171 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %176[%187], %171 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %187 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %187[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %188 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %188[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %189 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %190 = pto.vdiv %result, %189, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_10 = memref.subview %191[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %190, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %177 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %178 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %179 = pto.castptr %178 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %180 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %181 = pto.castptr %180 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %179[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vadds %188, %cst_1, %171 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %181[%187], %171 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %187 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %187[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %188 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %188[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %189 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %190 = pto.vdiv %result, %189, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %191 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_10 = memref.subview %191[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %190, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %182 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %183 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %184 = pto.castptr %183 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %185 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %186 = pto.castptr %185 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %187 = arith.muli %arg8, %c8 : index
        %188 = pto.vmi.vload %184[%187] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %189 = pto.vmi.vadds %188, %cst_1, %171 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %189, %186[%187], %171 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%166, %172, %177, %182) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %70 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %71 = pto.castptr %70 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %71, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %72 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %73 = pto.castptr %72 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %73, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %74 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %75 = pto.castptr %74 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %75, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %76 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %77 = pto.castptr %76 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %77, %109 : <f32, ub> -> <f32, ub>
      pto.vsts %108, %110[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %108 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %108[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %109 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %109[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %78:4 = pto.fusion_region {
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %112 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %113 = pto.castptr %112 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %114 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %109[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %111[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vadd %162, %163, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %113[%161], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %115 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %116 = pto.castptr %115 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %117 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %118 = pto.castptr %117 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %119 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %120 = pto.castptr %119 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %116[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %118[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vadd %162, %163, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %120[%161], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %121 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %122 = pto.castptr %121 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %123 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %124 = pto.castptr %123 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %125 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %126 = pto.castptr %125 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %122[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %124[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vadd %162, %163, %114 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %126[%161], %114 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %127 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %128 = pto.castptr %127 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %129 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %130 = pto.castptr %129 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %131 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %128[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vadds %162, %cst_1, %131 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %163, %130[%161], %131 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      %132 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %133 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %134 = pto.castptr %133 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %135 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %136 = pto.castptr %135 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %137 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %138 = pto.castptr %137 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %139 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %134[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %136[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vdiv %162, %163, %139 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %138[%161], %139 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %140 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %141 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %142 = pto.castptr %141 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %143 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %144 = pto.castptr %143 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %145 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %146 = pto.castptr %145 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %142[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %144[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vdiv %162, %163, %139 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %146[%161], %139 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %147 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %148 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %149 = pto.castptr %148 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %150 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %151 = pto.castptr %150 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %152 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %153 = pto.castptr %152 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %149[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %151[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vdiv %162, %163, %139 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %153[%161], %139 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %154 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %155 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %156 = pto.castptr %155 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %157 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %158 = pto.castptr %157 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %161 = arith.muli %arg8, %c8 : index
        %162 = pto.vmi.vload %156[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %163 = pto.vmi.vload %158[%161] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %164 = pto.vmi.vdiv %162, %163, %139 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %164, %160[%161], %139 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield(%132, %140, %147, %154) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>, !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    scf.for %arg8 = %c0 to %c18 step %c2 {
      %108 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %112 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %113 = arith.muli %arg9, %c8 : index
        %114 = pto.addptr %109, %113 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %114[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %115 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %116 = pto.vadd %112, %115, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %117 = pto.addptr %111, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %116, %117[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %112 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %113 = pto.castptr %112 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %114 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %115 = pto.castptr %114 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %116 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %117 = pto.vmi.vload %113[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %118 = pto.vmi.vadds %117, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %118, %115[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %119 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %120 = pto.castptr %119 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %121 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %122 = pto.castptr %121 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %120, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %122, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %123 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %124 = pto.castptr %123 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %125 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %126 = pto.castptr %125 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %127 = pto.vmi.vload %124[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %128 = pto.vmi.vadds %127, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %128, %126[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %129 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %130 = pto.castptr %129 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %131 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %132 = pto.castptr %131 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %130, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %132, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %133 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %134 = pto.castptr %133 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %135 = pto.pointer_cast(%c3776_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %136 = pto.castptr %135 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %137 = pto.vmi.vload %134[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %138 = pto.vmi.vadds %137, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %138, %136[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %139 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %140 = pto.castptr %139 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %141 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %142 = pto.castptr %141 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %140, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %142, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %143 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %144 = pto.castptr %143 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %145 = pto.pointer_cast(%c4032_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %146 = pto.castptr %145 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %147 = pto.vmi.vload %144[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %148 = pto.vmi.vadds %147, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %148, %146[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c3776_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c4032_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %149 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %150 = pto.castptr %149 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %151 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %152 = pto.castptr %151 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %153 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %154 = pto.castptr %153 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %155 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %150[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %152[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %154[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %156 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %157 = pto.castptr %156 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %158 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %160 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %157[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %159[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %161[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %162 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %164 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %165 = pto.castptr %164 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %166 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %167 = pto.castptr %166 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %163[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %165[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %167[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %168 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %169 = pto.castptr %168 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %170 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %171 = pto.castptr %170 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %169[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vadds %284, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %285, %171[%283], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %172 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %173 = pto.castptr %172 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %174 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %175 = pto.castptr %174 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %176 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %177 = pto.castptr %176 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %178 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %173[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %175[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %177[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %179 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %180 = pto.castptr %179 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %181 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %182 = pto.castptr %181 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %183 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %184 = pto.castptr %183 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %180[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %182[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %184[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %185 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %186 = pto.castptr %185 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %187 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %188 = pto.castptr %187 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %189 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %190 = pto.castptr %189 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %186[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %188[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %190[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %191 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %192 = pto.castptr %191 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %193 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %194 = pto.castptr %193 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %195 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %196 = pto.castptr %195 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %192[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %194[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %196[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %197 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %198 = pto.castptr %197 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %199 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %200 = pto.castptr %199 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %198, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %200, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %201 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %202 = pto.castptr %201 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %203 = pto.pointer_cast(%c256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.vmi.vload %202[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %206 = pto.vmi.vadds %205, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %206, %204[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %207 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %210 = pto.castptr %209 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %208, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %210, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %211 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %212 = pto.castptr %211 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %213 = pto.pointer_cast(%c512_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %214 = pto.castptr %213 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %215 = pto.vmi.vload %212[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %216 = pto.vmi.vadds %215, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %216, %214[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %217 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %218 = pto.castptr %217 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %219 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %220 = pto.castptr %219 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %218, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %220, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %221 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %222 = pto.castptr %221 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %223 = pto.pointer_cast(%c768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %224 = pto.castptr %223 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %225 = pto.vmi.vload %222[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %226 = pto.vmi.vadds %225, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %226, %224[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        %227 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %228 = pto.castptr %227 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %229 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %230 = pto.castptr %229 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %284 = arith.muli %arg9, %c8 : index
          %285 = pto.addptr %228, %284 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %285[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %286 = pto.vcadd %result, %mask_6 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.vadd %283, %286, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %288 = pto.addptr %230, %arg9 : <f32, ub> -> <f32, ub>
          pto.vsts %287, %288[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %231 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %232 = pto.castptr %231 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %233 = pto.pointer_cast(%c1024_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %234 = pto.castptr %233 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %235 = pto.vmi.vload %232[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %236 = pto.vmi.vadds %235, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %236, %234[%c0], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c256_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c512_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c768_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %mask_6, %scalar_out_7 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %283 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview = memref.subview %283[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %284 = pto.pointer_cast(%c1024_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_8 = memref.subview %284[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %subview_8[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %285 = pto.vdup %result_9, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %286 = pto.vdiv %result, %285, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %287 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %287[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %286, %cast_11[%c0], %mask_6 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %237 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %238 = pto.castptr %237 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %239 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %240 = pto.castptr %239 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %241 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %242 = pto.castptr %241 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %238[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %240[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %242[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %243 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %244 = pto.castptr %243 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %245 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %246 = pto.castptr %245 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %247 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %248 = pto.castptr %247 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %244[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %246[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %248[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %249 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %250 = pto.castptr %249 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %251 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %252 = pto.castptr %251 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %253 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %254 = pto.castptr %253 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %250[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %252[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vadd %284, %285, %155 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %254[%283], %155 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %255 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %256 = pto.castptr %255 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %257 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %258 = pto.castptr %257 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %256[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vadds %284, %cst_1, %116 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %285, %258[%283], %116 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %259 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %260 = pto.castptr %259 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %261 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %262 = pto.castptr %261 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %263 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %264 = pto.castptr %263 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %260[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %262[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %264[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %265 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %266 = pto.castptr %265 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %267 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %268 = pto.castptr %267 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %269 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %270 = pto.castptr %269 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %266[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %268[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %270[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %271 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %272 = pto.castptr %271 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %273 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %274 = pto.castptr %273 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %275 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %276 = pto.castptr %275 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %272[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %274[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %276[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %277 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %278 = pto.castptr %277 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %279 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %280 = pto.castptr %279 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %281 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %282 = pto.castptr %281 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %283 = arith.muli %arg9, %c8 : index
          %284 = pto.vmi.vload %278[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %285 = pto.vmi.vload %280[%283] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %286 = pto.vmi.vdiv %284, %285, %178 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %286, %282[%283], %178 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
    }
    %79 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %80 = pto.castptr %79 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %81 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %82 = pto.castptr %81 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %108 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %109 = arith.muli %arg8, %c8 : index
      %110 = pto.addptr %80, %109 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %111 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %112 = pto.vadd %108, %111, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %113 = pto.addptr %82, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %112, %113[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    pto.fusion_region {
      %108 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c1536_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %112 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %113 = pto.vmi.vload %109[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %114 = pto.vmi.vadds %113, %cst_1, %112 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %114, %111[%c0], %112 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      %115 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %116 = pto.castptr %115 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %117 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %118 = pto.castptr %117 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %194 = arith.muli %arg8, %c8 : index
        %195 = pto.addptr %116, %194 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %195[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %196 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.vadd %193, %196, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %198 = pto.addptr %118, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %197, %198[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %119 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %120 = pto.castptr %119 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %121 = pto.pointer_cast(%c2496_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %122 = pto.castptr %121 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %123 = pto.vmi.vload %120[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %124 = pto.vmi.vadds %123, %cst_1, %112 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %124, %122[%c0], %112 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      %125 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %126 = pto.castptr %125 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %127 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %128 = pto.castptr %127 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %194 = arith.muli %arg8, %c8 : index
        %195 = pto.addptr %126, %194 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %195[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %196 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.vadd %193, %196, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %198 = pto.addptr %128, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %197, %198[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %129 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %130 = pto.castptr %129 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %131 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %132 = pto.castptr %131 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %133 = pto.vmi.vload %130[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %134 = pto.vmi.vadds %133, %cst_1, %112 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %134, %132[%c0], %112 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      %135 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %136 = pto.castptr %135 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %137 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %138 = pto.castptr %137 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %194 = arith.muli %arg8, %c8 : index
        %195 = pto.addptr %136, %194 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %195[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %196 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.vadd %193, %196, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %198 = pto.addptr %138, %arg8 : <f32, ub> -> <f32, ub>
        pto.vsts %197, %198[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      %139 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %140 = pto.castptr %139 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %141 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %142 = pto.castptr %141 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %143 = pto.vmi.vload %140[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %144 = pto.vmi.vadds %143, %cst_1, %112 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %144, %142[%c0], %112 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %193 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %193[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %194 = pto.pointer_cast(%c1536_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %194[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %195 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %196 = pto.vdiv %result, %195, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %197[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %196, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %193 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %193[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %194 = pto.pointer_cast(%c2496_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %194[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %195 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %196 = pto.vdiv %result, %195, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %197[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %196, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %193 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %193[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %194 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %194[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %195 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %196 = pto.vdiv %result, %195, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %197[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %196, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %193 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %193[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %194 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %194[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %195 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %196 = pto.vdiv %result, %195, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %197 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %197[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %196, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %145 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %146 = pto.castptr %145 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %147 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %148 = pto.castptr %147 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %149 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %150 = pto.castptr %149 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %151 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %146[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %148[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vadd %194, %195, %151 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %150[%193], %151 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %152 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %153 = pto.castptr %152 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %154 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %155 = pto.castptr %154 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %156 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %157 = pto.castptr %156 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %153[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %155[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vadd %194, %195, %151 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %157[%193], %151 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %159[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %161[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vadd %194, %195, %151 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %163[%193], %151 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      %164 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %165 = pto.castptr %164 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %166 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %167 = pto.castptr %166 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %165[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vadds %194, %cst_1, %112 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %195, %167[%193], %112 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      %168 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %169 = pto.castptr %168 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %170 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %171 = pto.castptr %170 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %172 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %173 = pto.castptr %172 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %174 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %169[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %171[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vdiv %194, %195, %174 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %173[%193], %174 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %175 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %176 = pto.castptr %175 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %177 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %178 = pto.castptr %177 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %179 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %180 = pto.castptr %179 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %176[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %178[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vdiv %194, %195, %174 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %180[%193], %174 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %181 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %182 = pto.castptr %181 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %183 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %184 = pto.castptr %183 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %185 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %186 = pto.castptr %185 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %182[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %184[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vdiv %194, %195, %174 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %186[%193], %174 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      %187 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %188 = pto.castptr %187 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %189 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %190 = pto.castptr %189 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %191 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %192 = pto.castptr %191 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %193 = arith.muli %arg8, %c8 : index
        %194 = pto.vmi.vload %188[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %195 = pto.vmi.vload %190[%193] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %196 = pto.vmi.vdiv %194, %195, %174 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %196, %192[%193], %174 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 2 : i64} :
    %83 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %84 = pto.castptr %83 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %85 = arith.muli %0, %c128 : index
    %86 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %87 = pto.addptr %86, %85 : <f32, gm> -> <f32, gm>
    %88 = pto.addptr %84, %c0 : <f32, ub> -> <f32, ub>
    %89 = pto.addptr %87, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %88, %89, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %90 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %91 = pto.castptr %90 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %92 = arith.addi %85, %c4 : index
    %93 = pto.addptr %86, %92 : <f32, gm> -> <f32, gm>
    %94 = pto.addptr %91, %c0 : <f32, ub> -> <f32, ub>
    %95 = pto.addptr %93, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %94, %95, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %96 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = arith.addi %85, %c8 : index
    %99 = pto.addptr %86, %98 : <f32, gm> -> <f32, gm>
    %100 = pto.addptr %97, %c0 : <f32, ub> -> <f32, ub>
    %101 = pto.addptr %99, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %100, %101, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %102 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %103 = pto.castptr %102 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %104 = arith.addi %85, %c12 : index
    %105 = pto.addptr %86, %104 : <f32, gm> -> <f32, gm>
    %106 = pto.addptr %103, %c0 : <f32, ub> -> <f32, ub>
    %107 = pto.addptr %105, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %106, %107, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    return
  }
}
