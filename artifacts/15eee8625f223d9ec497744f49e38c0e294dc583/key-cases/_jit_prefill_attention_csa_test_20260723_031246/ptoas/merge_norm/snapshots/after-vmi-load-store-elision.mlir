// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @merge_norm(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xbf16, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xf32, #pto.address_space<gm>>, %arg4: memref<?xf32, #pto.address_space<gm>>, %arg5: memref<?xf32, #pto.address_space<gm>>, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c16_i32 = arith.constant 16 : i32
  %c4_i64 = arith.constant 4 : i64
  %c256_i64 = arith.constant 256 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c16_i64 = arith.constant 16 : i64
  %c896_i64 = arith.constant 896 : i64
  %c1_i64 = arith.constant 1 : i64
  %c8 = arith.constant 8 : index
  %cst = arith.constant 0.000000e+00 : bf16
  %cst_0 = arith.constant 0.000000e+00 : f32
  %c3 = arith.constant 3 : index
  %c48 = arith.constant 48 : index
  %c128 = arith.constant 128 : index
  %c16 = arith.constant 16 : index
  %c4 = arith.constant 4 : index
  %c0 = arith.constant 0 : index
  %c192 = arith.constant 192 : index
  %c512 = arith.constant 512 : index
  %c4096 = arith.constant 4096 : index
  %c1 = arith.constant 1 : index
  %c64 = arith.constant 64 : index
  %c33024_i64 = arith.constant 33024 : i64
  %c32960_i64 = arith.constant 32960 : i64
  %c32896_i64 = arith.constant 32896 : i64
  %c33088_i64 = arith.constant 33088 : i64
  %c32832_i64 = arith.constant 32832 : i64
  %c64_i64 = arith.constant 64 : i64
  %c0_i64 = arith.constant 0 : i64
  %c98752_i64 = arith.constant 98752 : i64
  %c65984_i64 = arith.constant 65984 : i64
  %c65920_i64 = arith.constant 65920 : i64
  %c65856_i64 = arith.constant 65856 : i64
  %c67776_i64 = arith.constant 67776 : i64
  %c1024_i64 = arith.constant 1024 : i64
  %0 = arith.index_cast %arg7 : i32 to index
  %1 = arith.muli %0, %c192 : index
  pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
  scf.for %arg9 = %c0 to %c4 step %c1 {
    %2 = arith.muli %arg9, %c16 : index
    %3 = arith.muli %0, %c64 : index
    %4 = arith.addi %3, %2 : index
    %5 = arith.cmpi slt, %0, %c128 : index
    pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
    scf.if %5 {
      %13 = arith.muli %arg9, %c48 : index
      %14 = arith.addi %1, %13 : index
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %15 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %16 = pto.addptr %15, %14 : <f32, gm> -> <f32, gm>
      %17 = pto.pointer_cast(%c65856_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %18 = pto.castptr %17 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %16, %18, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %19 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %20 = pto.addptr %19, %14 : <f32, gm> -> <f32, gm>
      %21 = pto.pointer_cast(%c65920_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %20, %22, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %23 = arith.muli %14, %c512 : index
      %24 = pto.castptr %arg4 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %25 = pto.addptr %24, %23 : <f32, gm> -> <f32, gm>
      %26 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
      %27 = pto.castptr %26 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %25, %27, %c0_i64, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      scf.for %arg10 = %c1 to %c3 step %c1 {
        %51 = arith.muli %arg10, %c16 : index
        %52 = arith.addi %14, %51 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %53 = pto.addptr %15, %52 : <f32, gm> -> <f32, gm>
        %54 = pto.pointer_cast(%c98752_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %55 = pto.castptr %54 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %53, %55, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %56 = pto.addptr %19, %52 : <f32, gm> -> <f32, gm>
        %57 = pto.pointer_cast(%c0_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %58 = pto.castptr %57 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %56, %58, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
        %59 = arith.muli %52, %c512 : index
        %60 = pto.addptr %24, %59 : <f32, gm> -> <f32, gm>
        %61 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %62 = pto.castptr %61 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %60, %62, %c0_i64, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %mask_35, %scalar_out_36 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %63 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_37 = memref.subview %63[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_38 = memref.cast %subview_37 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_39 = pto.vlds %cast_38[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %64 = pto.pointer_cast(%c98752_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_40 = memref.subview %64[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_41 = memref.cast %subview_40 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_42 = pto.vlds %cast_41[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %65 = pto.vmax %result_39, %result_42, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %66 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_43 = memref.subview %66[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_44 = memref.cast %subview_43 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %65, %cast_44[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %67 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_45 = memref.subview %67[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_46 = memref.cast %subview_45 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_47 = pto.vlds %cast_46[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %68 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_48 = memref.subview %68[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_49 = memref.cast %subview_48 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_50 = pto.vlds %cast_49[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %69 = pto.vsub %result_47, %result_50, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %70 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_51 = memref.subview %70[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_52 = memref.cast %subview_51 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %69, %cast_52[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %71 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_53 = memref.subview %71[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_54 = memref.cast %subview_53 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_55 = pto.vlds %cast_54[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %72 = pto.vexp %result_55, %mask_35 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %73 = pto.pointer_cast(%c32896_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_56 = memref.subview %73[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_57 = memref.cast %subview_56 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %72, %cast_57[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %74 = pto.pointer_cast(%c98752_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_58 = memref.subview %74[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_59 = memref.cast %subview_58 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_60 = pto.vlds %cast_59[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %75 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_61 = memref.subview %75[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_62 = memref.cast %subview_61 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_63 = pto.vlds %cast_62[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %76 = pto.vsub %result_60, %result_63, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %77 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_64 = memref.subview %77[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_65 = memref.cast %subview_64 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %76, %cast_65[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %78 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_66 = memref.subview %78[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_67 = memref.cast %subview_66 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_68 = pto.vlds %cast_67[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %79 = pto.vexp %result_68, %mask_35 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %80 = pto.pointer_cast(%c32960_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_69 = memref.subview %80[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_70 = memref.cast %subview_69 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %79, %cast_70[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %81 = pto.pointer_cast(%c32896_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_71 = memref.subview %81[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_72 = memref.cast %subview_71 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_73 = pto.vlds %cast_72[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %82 = pto.pointer_cast(%c65920_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_74 = memref.subview %82[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_75 = memref.cast %subview_74 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_76 = pto.vlds %cast_75[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %83 = pto.vmul %result_73, %result_76, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %84 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_77 = memref.subview %84[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_78 = memref.cast %subview_77 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %83, %cast_78[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %85 = pto.pointer_cast(%c32960_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_79 = memref.subview %85[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_80 = memref.cast %subview_79 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_81 = pto.vlds %cast_80[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %86 = pto.pointer_cast(%c0_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_82 = memref.subview %86[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_83 = memref.cast %subview_82 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_84 = pto.vlds %cast_83[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %87 = pto.vmul %result_81, %result_84, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %88 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_85 = memref.subview %88[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_86 = memref.cast %subview_85 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %87, %cast_86[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %89 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_87 = memref.subview %89[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_88 = memref.cast %subview_87 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_89 = pto.vlds %cast_88[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %90 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_90 = memref.subview %90[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_91 = memref.cast %subview_90 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_92 = pto.vlds %cast_91[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %91 = pto.vadd %result_89, %result_92, %mask_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %92 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_93 = memref.subview %92[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_94 = memref.cast %subview_93 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %91, %cast_94[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        pto.fusion_region {
          %97 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %98 = pto.castptr %97 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %99 = pto.pointer_cast(%c32896_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
          %100 = pto.castptr %99 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %101 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %102 = pto.castptr %101 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %103 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"} : index -> !pto.vmi.mask<512xpred>
          scf.for %arg11 = %c0 to %c16 step %c1 {
            %117 = pto.vmi.vload %100[%arg11] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
            %118 = pto.vmi.vbrc %117 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<512xf32>
            %119 = arith.muli %arg11, %c512 : index
            %120 = pto.vmi.vload %98[%119] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
            %121 = pto.vmi.vmul %120, %118, %103 : !pto.vmi.vreg<512xf32>, !pto.vmi.vreg<512xf32>, !pto.vmi.mask<512xpred> -> !pto.vmi.vreg<512xf32>
            pto.vmi.vstore %121, %102[%119], %103 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %104 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %105 = pto.castptr %104 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %106 = pto.pointer_cast(%c32960_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
          %107 = pto.castptr %106 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %108 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %109 = pto.castptr %108 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %110 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %111 = pto.castptr %110 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %112 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %113 = pto.castptr %112 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %114 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %115 = pto.castptr %114 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %116 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<512xpred>
          scf.for %arg11 = %c0 to %c16 step %c1 {
            %117 = pto.vmi.vload %107[%arg11] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
            %118 = pto.vmi.vbrc %117 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<512xf32>
            %119 = arith.muli %arg11, %c512 : index
            %120 = pto.vmi.vload %105[%119] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
            %121 = pto.vmi.vmul %120, %118, %103 : !pto.vmi.vreg<512xf32>, !pto.vmi.vreg<512xf32>, !pto.vmi.mask<512xpred> -> !pto.vmi.vreg<512xf32>
            pto.vmi.vstore %121, %109[%119], %103 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
            %122 = pto.vmi.vload %111[%119] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
            %123 = pto.vmi.vadd %122, %121, %116 : !pto.vmi.vreg<512xf32>, !pto.vmi.vreg<512xf32>, !pto.vmi.mask<512xpred> -> !pto.vmi.vreg<512xf32>
            pto.vmi.vstore %123, %115[%119], %116 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 1 : i64} :
        %93 = pto.pointer_cast(%c33024_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_95 = memref.subview %93[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_96 = memref.cast %subview_95 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_97 = pto.vlds %cast_96[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %94 = pto.pointer_cast(%c65920_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_98 = memref.subview %94[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_99 = memref.cast %subview_98 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %result_97, %cast_99[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %95 = pto.pointer_cast(%c32832_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_100 = memref.subview %95[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_101 = memref.cast %subview_100 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_102 = pto.vlds %cast_101[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %96 = pto.pointer_cast(%c65856_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_103 = memref.subview %96[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_104 = memref.cast %subview_103 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %result_102, %cast_104[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      %28 = pto.castptr %arg5 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %29 = pto.addptr %28, %2 : <f32, gm> -> <f32, gm>
      %30 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %31 = pto.castptr %30 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %29, %31, %c0_i64, %c64_i64 nburst(%c1_i64, %c4_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
      %32 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview = memref.subview %32[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast = memref.cast %subview : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %33 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_1 = memref.subview %33[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_2 = memref.cast %subview_1 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_3 = pto.vlds %cast_2[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %34 = pto.vsub %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %35 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_4 = memref.subview %35[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_5 = memref.cast %subview_4 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %34, %cast_5[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      %36 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_6 = memref.subview %36[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_7 = memref.cast %subview_6 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_8 = pto.vlds %cast_7[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %37 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_9 = memref.subview %37[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_10 = memref.cast %subview_9 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_11 = pto.vlds %cast_10[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %38 = pto.vadd %result_8, %result_11, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %39 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_12 = memref.subview %39[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_13 = memref.cast %subview_12 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %38, %cast_13[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %40 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_14 = memref.subview %40[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_15 = memref.cast %subview_14 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_16 = pto.vlds %cast_15[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %41 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_17 = memref.subview %41[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_18 = memref.cast %subview_17 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_19 = pto.vlds %cast_18[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %42 = pto.vsub %result_16, %result_19, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %43 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_20 = memref.subview %43[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_21 = memref.cast %subview_20 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %42, %cast_21[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %44 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %44[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_24 = pto.vlds %cast_23[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %45 = pto.vexp %result_24, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %46 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_25 = memref.subview %46[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_26 = memref.cast %subview_25 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %45, %cast_26[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %47 = pto.pointer_cast(%c65920_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_27 = memref.subview %47[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_28 = memref.cast %subview_27 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_29 = pto.vlds %cast_28[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %48 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_30 = memref.subview %48[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_31 = memref.cast %subview_30 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_32 = pto.vlds %cast_31[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %49 = pto.vadd %result_29, %result_32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %50 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_33 = memref.subview %50[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_34 = memref.cast %subview_33 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %49, %cast_34[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.fusion_region {
        %51 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %52 = pto.castptr %51 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %53 = pto.pointer_cast(%c64_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %54 = pto.castptr %53 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %55 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %56 = pto.castptr %55 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %57 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_trowexpanddiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"} : index -> !pto.vmi.mask<512xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %63 = pto.vmi.vload %54[%arg10] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
          %64 = pto.vmi.vbrc %63 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<512xf32>
          %65 = arith.muli %arg10, %c512 : index
          %66 = pto.vmi.vload %52[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
          %67 = pto.vmi.vdiv %66, %64, %57 : !pto.vmi.vreg<512xf32>, !pto.vmi.vreg<512xf32>, !pto.vmi.mask<512xpred> -> !pto.vmi.vreg<512xf32>
          pto.vmi.vstore %67, %56[%65], %57 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.candidate = "vmi_trowexpanddiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %58 = pto.pointer_cast(%c65984_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %59 = pto.castptr %58 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %60 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %61 = pto.castptr %60 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %62 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<512xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %63 = arith.muli %arg10, %c512 : index
          %64 = pto.vmi.vload %59[%63] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
          %65 = pto.vmi.vcvt %64 {rounding = "R", saturate = "NOSAT"} : !pto.vmi.vreg<512xf32> -> !pto.vmi.vreg<512xbf16>
          pto.vmi.vstore %65, %61[%63], %62 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 0 : i64} :
    } else {
      pto.fusion_region {
        %13 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %14 = pto.castptr %13 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %15 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<512xpred>
        %16 = pto.vmi.vbrc %cst_0 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<512xf32>
        %17 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %18 = pto.castptr %17 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %19 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_texpands_bf16", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<512xpred>
        %20 = pto.vmi.vbrc %cst {pto.tilelib.candidate = "vmi_texpands_bf16", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : bf16 -> !pto.vmi.vreg<512xbf16>
        %21 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %22 = pto.castptr %21 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %23 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %24 = pto.castptr %23 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %25 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %26 = arith.muli %arg10, %c512 : index
          pto.vmi.vstore %16, %14[%26], %15 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
          pto.vmi.vstore %20, %18[%26], %19 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
          pto.vmi.vstore %20, %24[%26], %25 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
    }
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    pto.barrier <PIPE_MTE3>
    %6 = pto.pointer_cast(%c67776_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
    %7 = pto.castptr %6 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %8 = arith.muli %4, %c64 : index
    %9 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %10 = pto.addptr %9, %8 : <f32, gm> -> <f32, gm>
    %11 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
    %12 = pto.addptr %10, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %11, %12, %c256_i64 nburst(%c16_i64, %c2048_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
    scf.for %arg10 = %c0 to %c16 step %c1 {
      %13 = arith.addi %2, %arg10 : index
      %14 = arith.divsi %13, %c8 : index
      %15 = arith.muli %14, %c128 : index
      %16 = arith.addi %15, %0 : index
      %17 = arith.muli %14, %c8 : index
      %18 = arith.subi %13, %17 : index
      %19 = arith.muli %18, %c512 : index
      %20 = arith.index_cast %arg10 : index to i64
      %21 = arith.muli %20, %c1024_i64 : i64
      %22 = arith.addi %21, %c64_i64 : i64
      pto.barrier <PIPE_MTE3>
      %23 = pto.pointer_cast(%22) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
      %24 = pto.castptr %23 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %25 = arith.muli %16, %c4096 : index
      %26 = arith.addi %25, %19 : index
      %27 = pto.castptr %arg1 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
      %28 = pto.addptr %27, %26 : <bf16, gm> -> <bf16, gm>
      %29 = pto.addptr %24, %c0 : <bf16, ub> -> <bf16, ub>
      %30 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
      pto.mte_ub_gm %29, %30, %c896_i64 nburst(%c1_i64, %c1024_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    }
    pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
    pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
  }
  pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
  pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
  return
}
