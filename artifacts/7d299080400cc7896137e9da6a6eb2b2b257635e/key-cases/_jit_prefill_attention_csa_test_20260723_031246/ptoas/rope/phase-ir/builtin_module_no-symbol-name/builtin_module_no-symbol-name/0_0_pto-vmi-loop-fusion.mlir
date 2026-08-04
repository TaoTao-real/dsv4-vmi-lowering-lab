// -----// IR Dump Before PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @rope(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xf32, #pto.address_space<gm>>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c262144 = arith.constant 262144 : index
    %c32_i32 = arith.constant 32 : i32
    %c256_i64 = arith.constant 256 : i64
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
    %5 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
    %6 = pto.castptr %5 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %mask_4, %scalar_out_5 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %13 = pto.vdup %cst_1, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %14 = arith.muli %arg6, %c32 : index
      %15 = pto.addptr %6, %14 : <f32, ub> -> <f32, ub>
      pto.vsts %13, %15[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %7 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
    %8 = pto.castptr %7 : memref<1x32xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
    scf.for %arg6 = %c0 to %c32 step %c1 {
      %13 = arith.index_cast %arg6 : index to i32
      pto.store %13, %8[%arg6] : !pto.ptr<i32, ub>, i32
    } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
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
    %12 = pto.fusion_region {
      %13 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %14 = pto.castptr %13 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %15 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %16 = pto.castptr %15 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %17 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %18 = pto.castptr %17 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %19 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<32xpred>
      %20 = pto.vmi.vload %16[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %14[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vmul %54, %20, %19 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %55, %18[%53], %19 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      %21 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %23 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %24 = pto.castptr %23 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %25 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %22[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vmuls %54, %cst_0, %25 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %55, %24[%53], %25 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %subview_4 = memref.subview %53[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %54 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        %55 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
        %subview_7 = memref.subview %55[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %54, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
        %subview_4 = memref.subview %53[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
        %54 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %55 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %subview_7 = memref.subview %55[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %54, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      %26 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %27 = pto.castptr %26 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %28 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %29 = pto.castptr %28 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %27[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vmuls %54, %cst, %25 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %55, %29[%53], %25 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      %30 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %31 = pto.castptr %30 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %32 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %33 = pto.castptr %32 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %34 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %35 = pto.castptr %34 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %36 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %31[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vload %33[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %56 = pto.vmi.vsub %54, %55, %36 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %56, %35[%53], %36 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      %37 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %38 = pto.castptr %37 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %39 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %40 = pto.castptr %39 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %41 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %38[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vadds %54, %cst_1, %41 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %55, %40[%53], %41 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      %42 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %43 = pto.castptr %42 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %44 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %45 = pto.castptr %44 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %43[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vmuls %54, %cst, %25 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %55, %45[%53], %25 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      %46 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %47 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %48 = pto.castptr %47 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %49 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %50 = pto.castptr %49 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %51 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %52 = pto.castptr %51 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %53 = arith.muli %arg6, %c32 : index
        %54 = pto.vmi.vload %48[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %55 = pto.vmi.vload %50[%53] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %56 = pto.vmi.vsub %54, %55, %36 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %56, %52[%53], %36 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      pto.yield(%46) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %13 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %13[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %14 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
      %15 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_7 = memref.subview %15[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %14, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c4 step %c1 {
      %13 = arith.muli %1, %c4 : index
      %14 = arith.addi %13, %arg6 : index
      %15 = arith.divsi %14, %c8 : index
      %16 = arith.muli %15, %c8 : index
      %17 = arith.subi %14, %16 : index
      %18 = arith.muli %17, %c512 : index
      %19 = arith.addi %18, %c448 : index
      %20 = arith.muli %15, %c128 : index
      %21 = arith.addi %20, %4 : index
      scf.for %arg7 = %c0 to %c32 step %c16 {
        %22 = arith.muli %arg7, %c2 : index
        %23 = arith.muli %3, %c262144 : index
        %24 = arith.muli %14, %c64 : index
        %25 = arith.addi %23, %24 : index
        %26 = arith.addi %25, %22 : index
        %27 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %28 = pto.addptr %27, %26 : <f32, gm> -> <f32, gm>
        %29 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %30 = pto.castptr %29 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %28, %30, %c0_i64, %c128_i64 nburst(%c64_i64, %c16384_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %31 = arith.muli %3, %c4096 : index
        %32 = arith.addi %31, %22 : index
        %33 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %34 = pto.addptr %33, %32 : <f32, gm> -> <f32, gm>
        %35 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %36 = pto.castptr %35 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %37 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
        %38 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %37, %38, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %39 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %40 = pto.addptr %39, %32 : <f32, gm> -> <f32, gm>
        %41 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %42 = pto.castptr %41 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %43 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
        %44 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %43, %44, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %55 = arith.index_cast %arg8 : index to i64
          %56 = arith.muli %55, %c128_i64 : i64
          %57 = arith.addi %56, %c33024_i64 : i64
          %58 = arith.addi %56, %c24832_i64 : i64
          %59 = pto.pointer_cast(%57) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %60 = pto.castptr %59 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %61 = pto.pointer_cast(%58) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
          %subview_4 = memref.subview %61[0, 0] [1, 32] [1, 1] : memref<1x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1]>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
          %62 = pto.vgather2 %60, %result_6, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %63[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %62, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          %64 = arith.addi %56, %c16384_i64 : i64
          pto.fusion_region {
            %65 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
            %66 = pto.castptr %65 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %67 = pto.pointer_cast(%64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
            %68 = pto.castptr %67 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %69 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
            %70 = pto.vmi.vload %66[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %70, %68[%c0], %69 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 2 : i64} :
        }
        %45 = pto.fusion_region {
          %55 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %56 = pto.castptr %55 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %57 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %58 = pto.castptr %57 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %59 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %60 = pto.castptr %59 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %61 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %81 = arith.muli %arg8, %c32 : index
            %82 = pto.vmi.vload %56[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %83 = pto.vmi.vload %58[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %84 = pto.vmi.vmul %82, %83, %61 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %84, %60[%81], %61 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %62 = pto.pointer_cast(%c16384_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %63 = pto.castptr %62 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %64 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %65 = pto.castptr %64 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %66 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %67 = pto.castptr %66 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %81 = arith.muli %arg8, %c32 : index
            %82 = pto.vmi.vload %63[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %83 = pto.vmi.vload %65[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %84 = pto.vmi.vmul %82, %83, %61 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %84, %67[%81], %61 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %68 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %73 = pto.castptr %72 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %74 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %81 = arith.muli %arg8, %c32 : index
            %82 = pto.vmi.vload %69[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %83 = pto.vmi.vload %71[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %84 = pto.vmi.vadd %82, %83, %74 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %84, %73[%81], %74 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          %75 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
          %76 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %77 = pto.castptr %76 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %78 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
          %79 = pto.castptr %78 : memref<64x32xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %80 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %81 = arith.muli %arg8, %c32 : index
            %82 = pto.vmi.vload %77[%81] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %83 = pto.vmi.vcvt %82 {saturate = "SAT"} : !pto.vmi.vreg<32xf32> -> !pto.vmi.vreg<32xbf16>
            pto.vmi.vstore %83, %79[%81], %80 : !pto.vmi.vreg<32xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          pto.yield(%75) : (!pto.tile_buf<vec, 64x32xbf16, valid=?x?>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
        %46 = arith.addi %19, %22 : index
        %47 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
        %48 = pto.castptr %47 : memref<64x32xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %49 = arith.muli %21, %c4096 : index
        %50 = arith.addi %49, %46 : index
        %51 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %52 = pto.addptr %51, %50 : <bf16, gm> -> <bf16, gm>
        %53 = pto.addptr %48, %c0 : <bf16, ub> -> <bf16, ub>
        %54 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
        pto.mte_ub_gm %53, %54, %c64_i64 nburst(%c64_i64, %c64_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
      }
    }
    return
  }
}
