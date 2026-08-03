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
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vmul %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %160[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %159, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2496_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %161[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %160, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vmul %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %160[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %159, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3264_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %161[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %160, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vmul %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %160[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %159, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3520_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %161[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %160, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vmul %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.vmuls %result, %arg4, %mask_4 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %160[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %159, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3776_i64) %c1, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1536_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vadd %result, %result_8, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %161[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %160, %cast_10[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    %45 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %46 = pto.castptr %45 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %46, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %47 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %48 = pto.castptr %47 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %48, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %49 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %50 = pto.castptr %49 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %50, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %51 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %52 = pto.castptr %51 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %52, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c4 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %53 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %54 = pto.castptr %53 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %55 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %56 = pto.castptr %55 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %54, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vsel %161, %158, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.vmax %158, %162, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %164 = pto.addptr %56, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %163, %164[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %57 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %58 = pto.castptr %57 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %59 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %60 = pto.castptr %59 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %58, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vsel %161, %158, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.vmax %158, %162, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %164 = pto.addptr %60, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %163, %164[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %61 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %62 = pto.castptr %61 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %63 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %64 = pto.castptr %63 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %62, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vsel %161, %158, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.vmax %158, %162, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %164 = pto.addptr %64, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %163, %164[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %65 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %66 = pto.castptr %65 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %67 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %68 = pto.castptr %67 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %66, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcmax %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vsel %161, %158, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.vmax %158, %162, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %164 = pto.addptr %68, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %163, %164[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
    %69 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = pto.vmi.vload %162[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %167 = pto.vmi.vbrc %166 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %168 = arith.muli %arg8, %c8 : index
        %169 = pto.vmi.vload %160[%168] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %170 = pto.vmi.vsub %169, %167, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %170, %164[%168], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %70 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vexp %165, %163 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %71 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = pto.vmi.vload %162[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %167 = pto.vmi.vbrc %166 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %168 = arith.muli %arg8, %c8 : index
        %169 = pto.vmi.vload %160[%168] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %170 = pto.vmi.vsub %169, %167, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %170, %164[%168], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %72 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vexp %165, %163 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %73 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = pto.vmi.vload %162[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %167 = pto.vmi.vbrc %166 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %168 = arith.muli %arg8, %c8 : index
        %169 = pto.vmi.vload %160[%168] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %170 = pto.vmi.vsub %169, %167, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %170, %164[%168], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %74 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vexp %165, %163 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %75 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1920_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = pto.vmi.vload %162[%arg8] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %167 = pto.vmi.vbrc %166 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<8xf32>
        %168 = arith.muli %arg8, %c8 : index
        %169 = pto.vmi.vload %160[%168] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %170 = pto.vmi.vsub %169, %167, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %170, %164[%168], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %76 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vexp %165, %163 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %77 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %78 = pto.castptr %77 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %79 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %80 = pto.castptr %79 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %78, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %80, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %81 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %82 = pto.castptr %81 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %83 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %84 = pto.castptr %83 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %82, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %84, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %85 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %86 = pto.castptr %85 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %87 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %88 = pto.castptr %87 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %86, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %88, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    %89 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %90 = pto.castptr %89 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %91 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %92 = pto.castptr %91 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %90, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %92, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1952_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    %93 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    %94 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1856_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    %95 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1888_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    %96 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>) -> ()
    } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
    %97 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %98, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %99 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %100, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %101 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %102 = pto.castptr %101 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %102, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %103 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %104 = pto.castptr %103 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %104, %159 : <f32, ub> -> <f32, ub>
      pto.vsts %158, %160[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<min>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result, %cast_7[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
    %105 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %106 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %107 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %108 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %109 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vdiv %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %110 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vdiv %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %111 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vdiv %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %112 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vdiv %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    scf.for %arg8 = %c0 to %c18 step %c2 {
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %159, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %161, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 32 : i64} : 
      %162 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %165 = pto.castptr %164 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %163, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %165, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 33 : i64} : 
      %166 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %167 = pto.castptr %166 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %168 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %169 = pto.castptr %168 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %167, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %169, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c3776_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 34 : i64} : 
      %170 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %171 = pto.castptr %170 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %172 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %173 = pto.castptr %172 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %171, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %173, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c4032_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 35 : i64} : 
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c3776_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %174 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 36 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %175 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c4288_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 37 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %176 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4288_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 38 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %177 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %208 = arith.muli %arg9, %c8 : index
          %209 = pto.vmi.vload %204[%208] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %210 = pto.vmi.vadds %209, %cst_1, %207 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %210, %206[%208], %207 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 39 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %178 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vdiv %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 40 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %179 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c3264_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vdiv %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 41 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %180 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c3520_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vdiv %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 42 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %181 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c3776_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c4032_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vdiv %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 43 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %182 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %183 = pto.castptr %182 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %184 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %185 = pto.castptr %184 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %183, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %185, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 44 : i64} : 
      %186 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %187 = pto.castptr %186 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %188 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %189 = pto.castptr %188 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %187, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %189, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c512_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 45 : i64} : 
      %190 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %191 = pto.castptr %190 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %192 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %193 = pto.castptr %192 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %191, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %193, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 46 : i64} : 
      %194 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %195 = pto.castptr %194 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %196 = pto.pointer_cast(%c1824_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %197 = pto.castptr %196 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %202 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %203 = arith.muli %arg9, %c8 : index
        %204 = pto.addptr %195, %203 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %204[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %205 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.vadd %202, %205, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %207 = pto.addptr %197, %arg9 : <f32, ub> -> <f32, ub>
        pto.vsts %206, %207[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.fusion_region {
        %202 = pto.pointer_cast(%c1824_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c1024_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        %207 = pto.vmi.vload %203[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %208 = pto.vmi.vadds %207, %cst_1, %206 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %208, %205[%c0], %206 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 47 : i64} : 
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c256_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c3264_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c512_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c3520_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c768_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %202 = pto.pointer_cast(%c3776_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview = memref.subview %202[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %203 = pto.pointer_cast(%c1024_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %203[%arg9, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %204 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %205 = pto.vdiv %result, %204, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %206 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %subview_8 = memref.subview %206[%arg9, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %205, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      %198 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c1024_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 48 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %199 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c1280_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 49 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %200 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c1024_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c1280_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %208 = pto.castptr %207 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %209 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %210 = arith.muli %arg9, %c8 : index
          %211 = pto.vmi.vload %204[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vload %206[%210] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %213 = pto.vmi.vadd %211, %212, %209 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %213, %208[%210], %209 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 50 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %201 = pto.fusion_region {
        %202 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        %203 = pto.pointer_cast(%c1024_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %204 = pto.castptr %203 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %205 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %206 = pto.castptr %205 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %207 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %208 = arith.muli %arg9, %c8 : index
          %209 = pto.vmi.vload %204[%208] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %210 = pto.vmi.vadds %209, %cst_1, %207 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %210, %206[%208], %207 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.yield(%202) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
      } {pto.fusion.group_id = 51 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.fusion_region {
        %202 = pto.pointer_cast(%c0_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %207 = pto.castptr %206 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %208 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %209 = arith.muli %arg9, %c8 : index
          %210 = pto.vmi.vload %203[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %211 = pto.vmi.vload %205[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vdiv %210, %211, %208 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %212, %207[%209], %208 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 52 : i64} : 
      pto.fusion_region {
        %202 = pto.pointer_cast(%c256_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %207 = pto.castptr %206 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %208 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %209 = arith.muli %arg9, %c8 : index
          %210 = pto.vmi.vload %203[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %211 = pto.vmi.vload %205[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vdiv %210, %211, %208 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %212, %207[%209], %208 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 53 : i64} : 
      pto.fusion_region {
        %202 = pto.pointer_cast(%c512_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %207 = pto.castptr %206 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %208 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %209 = arith.muli %arg9, %c8 : index
          %210 = pto.vmi.vload %203[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %211 = pto.vmi.vload %205[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vdiv %210, %211, %208 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %212, %207[%209], %208 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 54 : i64} : 
      pto.fusion_region {
        %202 = pto.pointer_cast(%c768_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %203 = pto.castptr %202 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %204 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %205 = pto.castptr %204 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %206 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
        %207 = pto.castptr %206 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %208 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
        scf.for %arg9 = %c0 to %c8 step %c1 {
          %209 = arith.muli %arg9, %c8 : index
          %210 = pto.vmi.vload %203[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %211 = pto.vmi.vload %205[%209] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
          %212 = pto.vmi.vdiv %210, %211, %208 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
          pto.vmi.vstore %212, %207[%209], %208 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 55 : i64} : 
    }
    %113 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %114 = pto.castptr %113 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %115 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %116 = pto.castptr %115 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %114, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %116, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    pto.fusion_region {
      %158 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1536_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %163 = pto.vmi.vload %159[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %164 = pto.vmi.vadds %163, %cst_1, %162 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %164, %161[%c0], %162 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 20 : i64} : 
    %117 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %118 = pto.castptr %117 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %119 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %120 = pto.castptr %119 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %118, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %120, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    pto.fusion_region {
      %158 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c2496_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %163 = pto.vmi.vload %159[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %164 = pto.vmi.vadds %163, %cst_1, %162 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %164, %161[%c0], %162 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
    %121 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %122 = pto.castptr %121 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %123 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %124 = pto.castptr %123 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %122, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %124, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    pto.fusion_region {
      %158 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c3264_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %163 = pto.vmi.vload %159[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %164 = pto.vmi.vadds %163, %cst_1, %162 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %164, %161[%c0], %162 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
    %125 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %126 = pto.castptr %125 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %127 = pto.pointer_cast(%c1792_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
    %128 = pto.castptr %127 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %158 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %159 = arith.muli %arg8, %c8 : index
      %160 = pto.addptr %126, %159 : <f32, ub> -> <f32, ub>
      %result = pto.vlds %160[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
      %161 = pto.vcadd %result, %mask_4 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.vadd %158, %161, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %163 = pto.addptr %128, %arg8 : <f32, ub> -> <f32, ub>
      pto.vsts %162, %163[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
    pto.fusion_region {
      %158 = pto.pointer_cast(%c1792_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c3520_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %163 = pto.vmi.vload %159[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %164 = pto.vmi.vadds %163, %cst_1, %162 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %164, %161[%c0], %162 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c1536_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c2496_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3264_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    scf.for %arg8 = %c0 to %c8 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview = memref.subview %158[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %159 = pto.pointer_cast(%c3520_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %159[%arg8, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_7 = pto.vlds %subview_6[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %160 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %161 = pto.vdiv %result, %160, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %162 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %subview_8 = memref.subview %162[%arg8, 0] [1, 8] [1, 1] : memref<8x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %161, %cast_9[%c0], %mask_4 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
    %129 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 24 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %130 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 25 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %131 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c2496_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %164 = pto.castptr %163 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %165 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %166 = arith.muli %arg8, %c8 : index
        %167 = pto.vmi.vload %160[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vload %162[%166] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %169 = pto.vmi.vadd %167, %168, %165 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %169, %164[%166], %165 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 26 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    %132 = pto.fusion_region {
      %158 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %159 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %160 = pto.castptr %159 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %161 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %162 = pto.castptr %161 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %163 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %164 = arith.muli %arg8, %c8 : index
        %165 = pto.vmi.vload %160[%164] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %166 = pto.vmi.vadds %165, %cst_1, %163 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %166, %162[%164], %163 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%158) : (!pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>) -> ()
    } {pto.fusion.group_id = 27 : i64} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
    pto.fusion_region {
      %158 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %165 = arith.muli %arg8, %c8 : index
        %166 = pto.vmi.vload %159[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %167 = pto.vmi.vload %161[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vdiv %166, %167, %164 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %168, %163[%165], %164 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 28 : i64} : 
    pto.fusion_region {
      %158 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %165 = arith.muli %arg8, %c8 : index
        %166 = pto.vmi.vload %159[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %167 = pto.vmi.vload %161[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vdiv %166, %167, %164 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %168, %163[%165], %164 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 29 : i64} : 
    pto.fusion_region {
      %158 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %165 = arith.muli %arg8, %c8 : index
        %166 = pto.vmi.vload %159[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %167 = pto.vmi.vload %161[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vdiv %166, %167, %164 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %168, %163[%165], %164 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 30 : i64} : 
    pto.fusion_region {
      %158 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %159 = pto.castptr %158 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %160 = pto.pointer_cast(%c1536_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %161 = pto.castptr %160 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %162 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
      %163 = pto.castptr %162 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %164 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<8xpred>
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %165 = arith.muli %arg8, %c8 : index
        %166 = pto.vmi.vload %159[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %167 = pto.vmi.vload %161[%165] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %168 = pto.vmi.vdiv %166, %167, %164 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %168, %163[%165], %164 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 31 : i64} : 
    %133 = pto.pointer_cast(%c1984_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %134 = pto.castptr %133 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %135 = arith.muli %0, %c128 : index
    %136 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %137 = pto.addptr %136, %135 : <f32, gm> -> <f32, gm>
    %138 = pto.addptr %134, %c0 : <f32, ub> -> <f32, ub>
    %139 = pto.addptr %137, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %138, %139, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %140 = pto.pointer_cast(%c2240_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %141 = pto.castptr %140 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %142 = arith.addi %135, %c4 : index
    %143 = pto.addptr %136, %142 : <f32, gm> -> <f32, gm>
    %144 = pto.addptr %141, %c0 : <f32, ub> -> <f32, ub>
    %145 = pto.addptr %143, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %144, %145, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %146 = pto.pointer_cast(%c2752_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %147 = pto.castptr %146 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %148 = arith.addi %135, %c8 : index
    %149 = pto.addptr %136, %148 : <f32, gm> -> <f32, gm>
    %150 = pto.addptr %147, %c0 : <f32, ub> -> <f32, ub>
    %151 = pto.addptr %149, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %150, %151, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    %152 = pto.pointer_cast(%c3008_i64) %c8, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<zero>, compact=#pto.compact_mode<null>>} : memref<8x8xf32, #pto.address_space<vec>>
    %153 = pto.castptr %152 : memref<8x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %154 = arith.addi %135, %c12 : index
    %155 = pto.addptr %136, %154 : <f32, gm> -> <f32, gm>
    %156 = pto.addptr %153, %c0 : <f32, ub> -> <f32, ub>
    %157 = pto.addptr %155, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %156, %157, %c16_i64 nburst(%c8_i64, %c32_i64, %c64_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    return
  }
}

