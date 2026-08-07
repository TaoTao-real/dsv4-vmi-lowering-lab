// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @rms_norm(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xbf16, #pto.address_space<gm>>, %arg2: memref<?xbf16, #pto.address_space<gm>>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32768 = arith.constant 32768 : index
  %c8_i32 = arith.constant 8 : i32
  %cst = arith.constant 1.000000e+00 : f32
  %c8_i64 = arith.constant 8 : i64
  %c1024 = arith.constant 1024 : index
  %c256_i64 = arith.constant 256 : i64
  %c2_i64 = arith.constant 2 : i64
  %c1_i64 = arith.constant 1 : i64
  %cst_0 = arith.constant 9.99999997E-7 : f32
  %cst_1 = arith.constant 2.44140625E-4 : f32
  %c128 = arith.constant 128 : index
  %c2 = arith.constant 2 : index
  %c32 = arith.constant 32 : index
  %c0 = arith.constant 0 : index
  %cst_2 = arith.constant 0.000000e+00 : f32
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %c8512_i64 = arith.constant 8512 : i64
  %c8224_i64 = arith.constant 8224 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c0_i64 = arith.constant 0 : i64
  %c16960_i64 = arith.constant 16960 : i64
  %c8768_i64 = arith.constant 8768 : i64
  %c4096_i64 = arith.constant 4096 : i64
  %c12864_i64 = arith.constant 12864 : i64
  %c8256_i64 = arith.constant 8256 : i64
  %0 = arith.index_cast %arg3 : i32 to index
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
  %1 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %2 = pto.castptr %1 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
  %3 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
  pto.vsts %3, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %21 = arith.muli %arg5, %c128 : index
    %22 = arith.addi %21, %c128 : index
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    %23 = arith.muli %0, %c32768 : index
    %24 = arith.addi %23, %21 : index
    %25 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %26 = pto.addptr %25, %24 : <bf16, gm> -> <bf16, gm>
    %27 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %28 = pto.castptr %27 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %29 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
    %30 = pto.addptr %28, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %29, %30, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
    %31 = arith.addi %23, %22 : index
    %32 = pto.addptr %25, %31 : <bf16, gm> -> <bf16, gm>
    %33 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %34 = pto.castptr %33 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %35 = pto.addptr %32, %c0 : <bf16, gm> -> <bf16, gm>
    %36 = pto.addptr %34, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %35, %36, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
    %37 = pto.fusion_region {
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %42 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %43 = pto.castptr %42 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %44 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %45 = pto.castptr %44 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %46 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %82 = arith.muli %arg6, %c128 : index
        %83 = pto.vmi.vload %43[%82] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
        %84 = pto.vmi.vcvt %83 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %84, %45[%82], %46 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %47 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %48 = pto.castptr %47 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %49 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %50 = pto.castptr %49 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %51 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %52 = pto.castptr %51 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %53 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %82 = arith.muli %arg6, %c128 : index
        %83 = pto.vmi.vload %48[%82] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %84 = pto.vmi.vmul %83, %83, %53 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %84, %52[%82], %53 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      %54 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %55 = pto.castptr %54 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %56 = pto.pointer_cast(%c16960_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %57 = pto.castptr %56 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %58 = pto.vmi.create_mask %c1024 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1024xpred>
      %59 = pto.vmi.vload %55[%c0] {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1024xf32>
      %60 = pto.vmi.vcadd %59, %58 {group = 8 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum", reassoc} : !pto.vmi.vreg<1024xf32>, !pto.vmi.mask<1024xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %60, %57[%c0], %c1 {group = 8 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>
      %61 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %62 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_19 = memref.subview %62[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %63 = pto.pointer_cast(%c16960_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %63[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_24 = pto.vlds %cast_23[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %64 = pto.vadd %result_21, %result_24, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %65 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %65[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %64, %cast_26[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %66 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %67 = pto.castptr %66 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %68 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %69 = pto.castptr %68 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %82 = arith.muli %arg6, %c128 : index
        %83 = pto.vmi.vload %67[%82] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
        %84 = pto.vmi.vcvt %83 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %84, %69[%82], %46 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %70 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %71 = pto.castptr %70 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %72 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %73 = pto.castptr %72 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %74 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %75 = pto.castptr %74 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %82 = arith.muli %arg6, %c128 : index
        %83 = pto.vmi.vload %71[%82] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %84 = pto.vmi.vmul %83, %83, %53 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %84, %75[%82], %53 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      %76 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.pointer_cast(%c8192_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %79 = pto.castptr %78 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %80 = pto.vmi.vload %77[%c0] {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1024xf32>
      %81 = pto.vmi.vcadd %80, %58 {group = 8 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum", reassoc} : !pto.vmi.vreg<1024xf32>, !pto.vmi.mask<1024xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %81, %79[%c0], %c1 {group = 8 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>
      pto.yield(%61) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %38 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_11 = memref.subview %38[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_12 = memref.cast %subview_11 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_13 = pto.vlds %cast_12[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %39 = pto.pointer_cast(%c8192_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_14 = memref.subview %39[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_15 = memref.cast %subview_14 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_16 = pto.vlds %cast_15[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %40 = pto.vadd %result_13, %result_16, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %41 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %subview_17 = memref.subview %41[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_18 = memref.cast %subview_17 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %40, %cast_18[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  }
  %5 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %subview = memref.subview %5[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
  %cast = memref.cast %subview : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
  %6 = pto.vmuls %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %7 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %subview_3 = memref.subview %7[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_4 = memref.cast %subview_3 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  pto.vsts %6, %cast_4[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
  %8 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %subview_5 = memref.subview %8[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_6 = memref.cast %subview_5 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  %result_7 = pto.vlds %cast_6[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
  %9 = pto.vadds %result_7, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %10 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %subview_8 = memref.subview %10[0, 0] [1, 8] [1, 1] : memref<1x8xf32, #pto.address_space<vec>> to memref<8xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_9 = memref.cast %subview_8 : memref<8xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  pto.vsts %9, %cast_9[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  %11 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %12 = pto.castptr %11 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %13 = pto.pointer_cast(%c8224_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %14 = pto.castptr %13 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %15 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
  %result_10 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
  %16 = pto.vsqrt %result_10, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
  %17 = pto.vmuls %16, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %18 = pto.vadds %17, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %19 = pto.vdiv %18, %16, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
  %20 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
  pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %21 = arith.muli %arg5, %c128 : index
    %22 = arith.addi %21, %c128 : index
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
    %23 = arith.muli %0, %c32768 : index
    %24 = arith.addi %23, %21 : index
    %25 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %26 = pto.addptr %25, %24 : <bf16, gm> -> <bf16, gm>
    %27 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %28 = pto.castptr %27 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %29 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
    %30 = pto.addptr %28, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %29, %30, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
    %31 = pto.castptr %arg2 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %32 = pto.addptr %31, %21 : <bf16, gm> -> <bf16, gm>
    %33 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
    %34 = pto.castptr %33 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    pto.mte_gm_ub %32, %34, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
    %35 = arith.addi %23, %22 : index
    %36 = pto.addptr %25, %35 : <bf16, gm> -> <bf16, gm>
    %37 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %38 = pto.castptr %37 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %39 = pto.addptr %36, %c0 : <bf16, gm> -> <bf16, gm>
    %40 = pto.addptr %38, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %39, %40, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
    %41 = pto.addptr %31, %22 : <bf16, gm> -> <bf16, gm>
    %42 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
    %43 = pto.castptr %42 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    pto.mte_gm_ub %41, %43, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
    %44 = pto.fusion_region {
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      %57 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %59 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %60 = pto.castptr %59 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %61 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = arith.muli %arg6, %c128 : index
        %88 = pto.vmi.vload %58[%87] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
        %89 = pto.vmi.vcvt %88 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %89, %60[%87], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %62 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %63 = pto.castptr %62 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %64 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %65 = pto.castptr %64 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %66 = pto.vmi.vload %63[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
      %67 = pto.vmi.vcvt %66 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
      pto.vmi.vstore %67, %65[%c0], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      %68 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %69 = pto.castptr %68 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %70 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %71 = pto.castptr %70 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %72 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %73 = pto.castptr %72 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %74 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"} : index -> !pto.vmi.mask<128xpred>
      %75 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %76 = pto.castptr %75 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %77 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %78 = pto.castptr %77 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %79 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %80 = pto.castptr %79 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %81 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = pto.vmi.vload %71[%arg6] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %88 = pto.vmi.vbrc %87 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<128xf32>
        %89 = arith.muli %arg6, %c128 : index
        %90 = pto.vmi.vload %69[%89] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %91 = pto.vmi.vmul %90, %88, %74 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        %92 = pto.vmi.vmul %91, %67, %81 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %92, %80[%89], %81 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %82 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %83 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = arith.muli %arg6, %c128 : index
        %88 = pto.vmi.vload %84[%87] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %89 = pto.vmi.vcvt %88 {rounding = "R", saturate = "NOSAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
        pto.vmi.vstore %89, %86[%87], %61 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%82) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    pto.barrier <PIPE_MTE3>
    %45 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %46 = pto.castptr %45 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %47 = pto.castptr %arg1 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %48 = pto.addptr %47, %24 : <bf16, gm> -> <bf16, gm>
    %49 = pto.addptr %46, %c0 : <bf16, ub> -> <bf16, ub>
    %50 = pto.addptr %48, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %49, %50, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    %51 = pto.fusion_region {
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      %57 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %59 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %60 = pto.castptr %59 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %61 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = arith.muli %arg6, %c128 : index
        %88 = pto.vmi.vload %58[%87] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
        %89 = pto.vmi.vcvt %88 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %89, %60[%87], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
      %62 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %63 = pto.castptr %62 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %64 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %65 = pto.castptr %64 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %66 = pto.vmi.vload %63[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
      %67 = pto.vmi.vcvt %66 : !pto.vmi.vreg<128xbf16> -> !pto.vmi.vreg<128xf32>
      pto.vmi.vstore %67, %65[%c0], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      %68 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %69 = pto.castptr %68 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %70 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %71 = pto.castptr %70 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %72 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %73 = pto.castptr %72 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %74 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"} : index -> !pto.vmi.mask<128xpred>
      %75 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %76 = pto.castptr %75 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %77 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %78 = pto.castptr %77 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %79 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %80 = pto.castptr %79 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %81 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = pto.vmi.vload %71[%arg6] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %88 = pto.vmi.vbrc %87 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<128xf32>
        %89 = arith.muli %arg6, %c128 : index
        %90 = pto.vmi.vload %69[%89] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %91 = pto.vmi.vmul %90, %88, %74 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        %92 = pto.vmi.vmul %91, %67, %81 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %92, %80[%89], %81 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      %82 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %83 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %87 = arith.muli %arg6, %c128 : index
        %88 = pto.vmi.vload %84[%87] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %89 = pto.vmi.vcvt %88 {rounding = "R", saturate = "NOSAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
        pto.vmi.vstore %89, %86[%87], %61 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%82) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    pto.barrier <PIPE_MTE3>
    %52 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %53 = pto.castptr %52 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %54 = pto.addptr %47, %35 : <bf16, gm> -> <bf16, gm>
    %55 = pto.addptr %53, %c0 : <bf16, ub> -> <bf16, ub>
    %56 = pto.addptr %54, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %55, %56, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
  }
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
  pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
  return
}
