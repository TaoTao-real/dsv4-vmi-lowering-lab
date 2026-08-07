// -----// IR Dump Before PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @rope(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xf32, #pto.address_space<gm>>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c262144 = arith.constant 262144 : index
    %c256_i64 = arith.constant 256 : i64
    %c32_i32 = arith.constant 32 : i32
    %c64_i64 = arith.constant 64 : i64
    %c16 = arith.constant 16 : index
    %c448 = arith.constant 448 : index
    %c512 = arith.constant 512 : index
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %c32 = arith.constant 32 : index
    %c2 = arith.constant 2 : index
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c4096 = arith.constant 4096 : index
    %c24704_i64 = arith.constant 24704 : i64
    %c16384_i64 = arith.constant 16384 : i64
    %c8192_i64 = arith.constant 8192 : i64
    %c0_i64 = arith.constant 0 : i64
    %c33024_i64 = arith.constant 33024 : i64
    %c24832_i64 = arith.constant 24832 : i64
    %c128_i64 = arith.constant 128 : i64
    %0 = arith.index_cast %arg4 : i32 to index
    %1 = arith.divsi %0, %c2 : index
    %2 = arith.muli %1, %c2 : index
    %3 = arith.subi %0, %2 : index
    %4 = arith.muli %3, %c64 : index
    pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
    %5 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
    %6 = pto.castptr %5 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %12 = pto.vdup %cst_1, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %13 = arith.muli %arg6, %c32 : index
      %14 = pto.addptr %6, %13 : <f32, ub> -> <f32, ub>
      pto.vsts %12, %14[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %7 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
    %8 = pto.castptr %7 : memref<1x32xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
    scf.for %arg6 = %c0 to %c32 step %c1 {
      %12 = arith.index_cast %arg6 : index to i32
      pto.store %12, %8[%arg6] : !pto.ptr<i32, ub>, i32
    } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
    pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
    %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
    %9 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
    %subview = memref.subview %9[0, 0] [1, 32] [1, 1] : memref<1x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1]>, #pto.address_space<vec>>
    %cast = memref.cast %subview : memref<32xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result = pto.vlds %cast[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %10 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %11 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
    %subview_2 = memref.subview %11[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_3 = memref.cast %subview_2 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %10, %cast_3[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %13[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %14 = pto.vmul %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %15 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_10 = memref.subview %15[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %14, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vmuls %result_6, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
      %14 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %13 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vmuls %result_6, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %13[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %14 = pto.vsub %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %15 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_10 = memref.subview %15[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %14, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vmuls %result_6, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %13[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %14 = pto.vsub %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %15 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_10 = memref.subview %15[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %14, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %12 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %12[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %13 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
      %14 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_7 = memref.subview %14[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %13, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    scf.for %arg6 = %c0 to %c4 step %c1 {
      %12 = arith.muli %1, %c4 : index
      %13 = arith.addi %12, %arg6 : index
      %14 = arith.divsi %13, %c8 : index
      %15 = arith.muli %14, %c8 : index
      %16 = arith.subi %13, %15 : index
      %17 = arith.muli %16, %c512 : index
      %18 = arith.addi %17, %c448 : index
      %19 = arith.muli %14, %c128 : index
      %20 = arith.addi %19, %4 : index
      scf.for %arg7 = %c0 to %c32 step %c16 {
        %21 = arith.muli %arg7, %c2 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %22 = arith.muli %3, %c262144 : index
        %23 = arith.muli %13, %c64 : index
        %24 = arith.addi %22, %23 : index
        %25 = arith.addi %24, %21 : index
        %26 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %27 = pto.addptr %26, %25 : <f32, gm> -> <f32, gm>
        %28 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %29 = pto.castptr %28 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %27, %29, %c0_i64, %c128_i64 nburst(%c64_i64, %c16384_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %30 = arith.muli %3, %c4096 : index
        %31 = arith.addi %30, %21 : index
        %32 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %33 = pto.addptr %32, %31 : <f32, gm> -> <f32, gm>
        %34 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %35 = pto.castptr %34 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %36 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        %37 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %36, %37, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %38 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %39 = pto.addptr %38, %31 : <f32, gm> -> <f32, gm>
        %40 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
        %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %42, %43, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %53 = arith.index_cast %arg8 : index to i64
          %54 = arith.muli %53, %c128_i64 : i64
          %55 = arith.addi %54, %c33024_i64 : i64
          %56 = arith.addi %54, %c24832_i64 : i64
          %57 = pto.pointer_cast(%55) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %58 = pto.castptr %57 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %59 = pto.pointer_cast(%56) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
          %subview_4 = memref.subview %59[0, 0] [1, 32] [1, 1] : memref<1x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1]>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
          %60 = pto.vgather2 %58, %result_6, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %61[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %60, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          %62 = arith.addi %54, %c16384_i64 : i64
          %63 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %subview_9 = memref.subview %63[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
          %cast_10 = memref.cast %subview_9 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_11 = pto.vlds %cast_10[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %64 = pto.pointer_cast(%62) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %subview_12 = memref.subview %64[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
          %cast_13 = memref.cast %subview_12 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %result_11, %cast_13[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %53 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_4 = memref.subview %53[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %54 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %54[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %55 = pto.vmul %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %56[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %55, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %53 = pto.pointer_cast(%c16384_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_4 = memref.subview %53[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %54 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %54[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %55 = pto.vmul %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %56[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %55, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %53 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_4 = memref.subview %53[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %54 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %54[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_9 = pto.vlds %cast_8[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %55 = pto.vadd %result_6, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_10 = memref.subview %56[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_11 = memref.cast %subview_10 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %55, %cast_11[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %53 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %subview_4 = memref.subview %53[%arg8, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %55 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
          %subview_7 = memref.subview %55[%arg8, 0] [1, 32] [1, 1] : memref<64x32xbf16, #pto.address_space<vec>> to memref<32xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %54, %cast_8[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %44 = arith.addi %18, %21 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %45 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
        %46 = pto.castptr %45 : memref<64x32xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %47 = arith.muli %20, %c4096 : index
        %48 = arith.addi %47, %44 : index
        %49 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %50 = pto.addptr %49, %48 : <bf16, gm> -> <bf16, gm>
        %51 = pto.addptr %46, %c0 : <bf16, ub> -> <bf16, ub>
        %52 = pto.addptr %50, %c0 : <bf16, gm> -> <bf16, gm>
        pto.mte_ub_gm %51, %52, %c64_i64 nburst(%c64_i64, %c64_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
    }
    pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
    return
  }
}
