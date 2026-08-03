// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
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
      %19 = pto.vdup %cst_1, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %20 = arith.muli %arg6, %c32 : index
      %21 = pto.addptr %6, %20 : <f32, ub> -> <f32, ub>
      pto.vsts %19, %21[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %7 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
    %8 = pto.castptr %7 : memref<1x32xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
    scf.for %arg6 = %c0 to %c32 step %c1 {
      %19 = arith.index_cast %arg6 : index to i32
      pto.store %19, %8[%arg6] : !pto.ptr<i32, ub>, i32
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
      %19 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %25 = pto.castptr %24 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %26 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<32xpred>
      %27 = pto.vmi.vload %23[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %28 = arith.muli %arg6, %c32 : index
        %29 = pto.vmi.vload %21[%28] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %30 = pto.vmi.vmul %29, %27, %26 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %30, %25[%28], %26 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    %13 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %25 = arith.muli %arg6, %c32 : index
        %26 = pto.vmi.vload %21[%25] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %27 = pto.vmi.vmuls %26, %cst_0, %24 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %27, %23[%25], %24 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %19 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %19[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %20 = pto.vcvt %result_6, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
      %21 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_7 = memref.subview %21[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %20, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %19 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_4 = memref.subview %19[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %20 = pto.vcvt %result_6, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %21 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_7 = memref.subview %21[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %20, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    %14 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %25 = arith.muli %arg6, %c32 : index
        %26 = pto.vmi.vload %21[%25] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %27 = pto.vmi.vmuls %26, %cst, %24 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %27, %23[%25], %24 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    %15 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %25 = pto.castptr %24 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %26 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %27 = arith.muli %arg6, %c32 : index
        %28 = pto.vmi.vload %21[%27] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %29 = pto.vmi.vload %23[%27] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %30 = pto.vmi.vsub %28, %29, %26 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %30, %25[%27], %26 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    %16 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %25 = arith.muli %arg6, %c32 : index
        %26 = pto.vmi.vload %21[%25] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %27 = pto.vmi.vadds %26, %cst_1, %24 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %27, %23[%25], %24 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    %17 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %25 = arith.muli %arg6, %c32 : index
        %26 = pto.vmi.vload %21[%25] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %27 = pto.vmi.vmuls %26, %cst, %24 : !pto.vmi.vreg<32xf32>, f32, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %27, %23[%25], %24 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    %18 = pto.fusion_region {
      %19 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      %20 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %21 = pto.castptr %20 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %22 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %25 = pto.castptr %24 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %26 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %27 = arith.muli %arg6, %c32 : index
        %28 = pto.vmi.vload %21[%27] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %29 = pto.vmi.vload %23[%27] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        %30 = pto.vmi.vsub %28, %29, %26 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %30, %25[%27], %26 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      pto.yield(%19) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
    scf.for %arg6 = %c0 to %c64 step %c1 {
      %19 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %19[%arg6, 0] [1, 32] [1, 1] : memref<64x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_6 = pto.vlds %cast_5[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %20 = pto.vcvt %result_6, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
      %21 = pto.pointer_cast(%c24832_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xi32, #pto.address_space<vec>>
      %subview_7 = memref.subview %21[%arg6, 0] [1, 32] [1, 1] : memref<64x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_8 = memref.cast %subview_7 : memref<32xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %20, %cast_8[%c0], %mask : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c4 step %c1 {
      %19 = arith.muli %1, %c4 : index
      %20 = arith.addi %19, %arg6 : index
      %21 = arith.divsi %20, %c8 : index
      %22 = arith.muli %21, %c8 : index
      %23 = arith.subi %20, %22 : index
      %24 = arith.muli %23, %c512 : index
      %25 = arith.addi %24, %c448 : index
      %26 = arith.muli %21, %c128 : index
      %27 = arith.addi %26, %4 : index
      scf.for %arg7 = %c0 to %c32 step %c16 {
        %28 = arith.muli %arg7, %c2 : index
        %29 = arith.muli %3, %c262144 : index
        %30 = arith.muli %20, %c64 : index
        %31 = arith.addi %29, %30 : index
        %32 = arith.addi %31, %28 : index
        %33 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %34 = pto.addptr %33, %32 : <f32, gm> -> <f32, gm>
        %35 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %36 = pto.castptr %35 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %34, %36, %c0_i64, %c128_i64 nburst(%c64_i64, %c16384_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %37 = arith.muli %3, %c4096 : index
        %38 = arith.addi %37, %28 : index
        %39 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %40 = pto.addptr %39, %38 : <f32, gm> -> <f32, gm>
        %41 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %42 = pto.castptr %41 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %43 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
        %44 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %43, %44, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %45 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %46 = pto.addptr %45, %38 : <f32, gm> -> <f32, gm>
        %47 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
        %48 = pto.castptr %47 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %49 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
        %50 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %49, %50, %c0_i64, %c128_i64 nburst(%c64_i64, %c256_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        scf.for %arg8 = %c0 to %c64 step %c1 {
          %64 = arith.index_cast %arg8 : index to i64
          %65 = arith.muli %64, %c128_i64 : i64
          %66 = arith.addi %65, %c33024_i64 : i64
          %67 = arith.addi %65, %c24832_i64 : i64
          %68 = pto.pointer_cast(%66) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%67) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xi32, #pto.address_space<vec>>
          %subview_4 = memref.subview %70[0, 0] [1, 32] [1, 1] : memref<1x32xi32, #pto.address_space<vec>> to memref<32xi32, strided<[1]>, #pto.address_space<vec>>
          %cast_5 = memref.cast %subview_4 : memref<32xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %cast_5[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
          %71 = pto.vgather2 %69, %result_6, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %72[0, 0] [1, 32] [1, 1] : memref<1x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1]>, #pto.address_space<vec>>
          %cast_8 = memref.cast %subview_7 : memref<32xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %71, %cast_8[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          %73 = arith.addi %65, %c16384_i64 : i64
          pto.fusion_region {
            %74 = pto.pointer_cast(%c24704_i64) %c1, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
            %75 = pto.castptr %74 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %76 = pto.pointer_cast(%73) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
            %77 = pto.castptr %76 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %78 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
            %79 = pto.vmi.vload %75[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %79, %77[%c0], %78 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 11 : i64} : 
        }
        %51 = pto.fusion_region {
          %64 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          %65 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %66 = pto.castptr %65 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %67 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %72 = arith.muli %arg8, %c32 : index
            %73 = pto.vmi.vload %66[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %74 = pto.vmi.vload %68[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %75 = pto.vmi.vmul %73, %74, %71 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %75, %70[%72], %71 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          pto.yield(%64) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %52 = pto.fusion_region {
          %64 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          %65 = pto.pointer_cast(%c16384_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %66 = pto.castptr %65 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %67 = pto.pointer_cast(%c8192_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %72 = arith.muli %arg8, %c32 : index
            %73 = pto.vmi.vload %66[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %74 = pto.vmi.vload %68[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %75 = pto.vmi.vmul %73, %74, %71 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %75, %70[%72], %71 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          pto.yield(%64) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %53 = pto.fusion_region {
          %64 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          %65 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %66 = pto.castptr %65 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %67 = pto.pointer_cast(%c0_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %72 = arith.muli %arg8, %c32 : index
            %73 = pto.vmi.vload %66[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %74 = pto.vmi.vload %68[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %75 = pto.vmi.vadd %73, %74, %71 : !pto.vmi.vreg<32xf32>, !pto.vmi.vreg<32xf32>, !pto.vmi.mask<32xpred> -> !pto.vmi.vreg<32xf32>
            pto.vmi.vstore %75, %70[%72], %71 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.yield(%64) : (!pto.tile_buf<vec, 64x32xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
        %54 = pto.fusion_region {
          %64 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
          %65 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, #pto.address_space<vec>>
          %66 = pto.castptr %65 : memref<64x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %67 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<64x32xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %69 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<32xpred>
          scf.for %arg8 = %c0 to %c64 step %c1 {
            %70 = arith.muli %arg8, %c32 : index
            %71 = pto.vmi.vload %66[%70] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
            %72 = pto.vmi.vcvt %71 {saturate = "SAT"} : !pto.vmi.vreg<32xf32> -> !pto.vmi.vreg<32xbf16>
            pto.vmi.vstore %72, %68[%70], %69 : !pto.vmi.vreg<32xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<32xpred>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          pto.yield(%64) : (!pto.tile_buf<vec, 64x32xbf16, valid=?x?>) -> ()
        } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
        %55 = arith.addi %25, %28 : index
        %56 = pto.pointer_cast(%c33024_i64) %c64, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xbf16, #pto.address_space<vec>>
        %57 = pto.castptr %56 : memref<64x32xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %58 = arith.muli %27, %c4096 : index
        %59 = arith.addi %58, %55 : index
        %60 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %61 = pto.addptr %60, %59 : <bf16, gm> -> <bf16, gm>
        %62 = pto.addptr %57, %c0 : <bf16, ub> -> <bf16, ub>
        %63 = pto.addptr %61, %c0 : <bf16, gm> -> <bf16, gm>
        pto.mte_ub_gm %62, %63, %c64_i64 nburst(%c64_i64, %c64_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
      }
    }
    return
  }
}

