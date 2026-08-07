// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @rmsnorm_rope(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xbf16, #pto.address_space<gm>>, %arg4: memref<?xbf16, #pto.address_space<gm>>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c16_i32 = arith.constant 16 : i32
    %c32_i32 = arith.constant 32 : i32
    %c4_i64 = arith.constant 4 : i64
    %c512_i64 = arith.constant 512 : i64
    %c1_i64 = arith.constant 1 : i64
    %cst = arith.constant -1.000000e+00 : f32
    %c64_i32 = arith.constant 64 : i32
    %c16_i64 = arith.constant 16 : i64
    %c1024 = arith.constant 1024 : index
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 5.000000e-01 : f32
    %cst_2 = arith.constant 1.000000e+00 : f32
    %cst_3 = arith.constant 9.99999997E-7 : f32
    %cst_4 = arith.constant 7.812500e-03 : f32
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %cst_5 = arith.constant 0.000000e+00 : f32
    %c128 = arith.constant 128 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %c4 = arith.constant 4 : index
    %c24896_i64 = arith.constant 24896 : i64
    %c24640_i64 = arith.constant 24640 : i64
    %c20544_i64 = arith.constant 20544 : i64
    %c16448_i64 = arith.constant 16448 : i64
    %c12288_i64 = arith.constant 12288 : i64
    %c0_i64 = arith.constant 0 : i64
    %c12352_i64 = arith.constant 12352 : i64
    %c4096_i64 = arith.constant 4096 : i64
    %c29248_i64 = arith.constant 29248 : i64
    %c25152_i64 = arith.constant 25152 : i64
    %c128_i64 = arith.constant 128 : i64
    %c256_i64 = arith.constant 256 : i64
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
    %0 = pto.pointer_cast(%c25152_i64) %c16, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x32xf32, #pto.address_space<vec>>
    %1 = pto.castptr %0 : memref<16x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %mask_35, %scalar_out_36 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %74 = pto.vdup %cst_5, %mask_35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %75 = arith.muli %arg5, %c32 : index
      %76 = pto.addptr %1, %75 : <f32, ub> -> <f32, ub>
      pto.vsts %74, %76[%c0], %mask_35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %2 = pto.pointer_cast(%c29248_i64) %c16, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x32xf32, #pto.address_space<vec>>
    %3 = pto.castptr %2 : memref<16x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %mask_35, %scalar_out_36 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %74 = pto.vdup %cst_5, %mask_35 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %75 = arith.muli %arg5, %c32 : index
      %76 = pto.addptr %3, %75 : <f32, ub> -> <f32, ub>
      pto.vsts %74, %76[%c0], %mask_35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %4 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %5 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %6 = pto.castptr %5 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %7 = pto.addptr %4, %c0 : <f32, gm> -> <f32, gm>
    %8 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %7, %8, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    scf.for %arg5 = %c0 to %c4 step %c1 {
      %mask_35, %scalar_out_36 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %74 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %subview_37 = memref.subview %74[%arg5, 0] [1, 32] [1, 1] : memref<4x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_38 = memref.cast %subview_37 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_39 = pto.vlds %cast_38[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %75 = pto.pointer_cast(%c25152_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %subview_40 = memref.subview %75[%arg5, 0] [1, 32] [1, 1] : memref<4x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_41 = memref.cast %subview_40 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_39, %cast_41[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    %9 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %10 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %11 = pto.castptr %10 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %12 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
    %13 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %12, %13, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
    scf.for %arg5 = %c0 to %c4 step %c1 {
      %mask_35, %scalar_out_36 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %74 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %subview_37 = memref.subview %74[%arg5, 0] [1, 32] [1, 1] : memref<4x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_38 = memref.cast %subview_37 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_39 = pto.vlds %cast_38[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %75 = pto.pointer_cast(%c29248_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %subview_40 = memref.subview %75[%arg5, 0] [1, 32] [1, 1] : memref<4x32xf32, #pto.address_space<vec>> to memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_41 = memref.cast %subview_40 : memref<32xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %result_39, %cast_41[%c0], %mask_35 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
    %14 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %15 = pto.castptr %14 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
    %16 = pto.vdup %cst_5, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %17 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
    pto.vsts %16, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
    scf.for %arg5 = %c0 to %c128 step %c64 {
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %74 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %75 = pto.addptr %74, %arg5 : <f32, gm> -> <f32, gm>
      %76 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.addptr %75, %c0 : <f32, gm> -> <f32, gm>
      %79 = pto.addptr %77, %c0 : <f32, ub> -> <f32, ub>
      pto.mte_gm_ub %78, %79, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.fusion_region {
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %84 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %85 = pto.castptr %84 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %86 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %87 = pto.castptr %86 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %88 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %89 = pto.castptr %88 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %90 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
        scf.for %arg6 = %c0 to %c16 step %c1 {
          %98 = arith.muli %arg6, %c64 : index
          %99 = pto.vmi.vload %85[%98] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          %100 = pto.vmi.vload %87[%98] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          %101 = pto.vmi.vmul %99, %100, %90 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %101, %89[%98], %90 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %91 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %92 = pto.castptr %91 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %93 = pto.pointer_cast(%c12288_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %94 = pto.castptr %93 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %95 = pto.vmi.create_mask %c1024 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1024xpred>
        %96 = pto.vmi.vload %92[%c0] {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1024xf32>
        %97 = pto.vmi.vcadd %96, %95 {group = 16 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum", reassoc} : !pto.vmi.vreg<1024xf32>, !pto.vmi.mask<1024xpred> -> !pto.vmi.vreg<16xf32>
        pto.vmi.vstore %97, %94[%c0], %c1 {group = 16 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 4 : i64} :
      %80 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_35 = memref.subview %80[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %81 = pto.pointer_cast(%c12288_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_38 = memref.subview %81[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_40 = pto.vlds %cast_39[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %82 = pto.vadd %result_37, %result_40, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %83 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %subview_41 = memref.subview %83[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_42 = memref.cast %subview_41 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %82, %cast_42[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    }
    %18 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview = memref.subview %18[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast = memref.cast %subview : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %19 = pto.vmuls %result, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %20 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_6 = memref.subview %20[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_7 = memref.cast %subview_6 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %19, %cast_7[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %21 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_8 = memref.subview %21[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_9 = memref.cast %subview_8 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_10 = pto.vlds %cast_9[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %22 = pto.vadds %result_10, %cst_3, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %23 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_11 = memref.subview %23[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_12 = memref.cast %subview_11 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %22, %cast_12[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %24 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_13 = memref.subview %24[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_14 = memref.cast %subview_13 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_15 = pto.vlds %cast_14[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %25 = pto.vsqrt %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %26 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_16 = memref.subview %26[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_17 = memref.cast %subview_16 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %25, %cast_17[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %27 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_18 = memref.subview %27[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_19 = memref.cast %subview_18 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_20 = pto.vlds %cast_19[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %28 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
    %29 = pto.vdiv %28, %result_20, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %30 = pto.pointer_cast(%c16448_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %subview_21 = memref.subview %30[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_22 = memref.cast %subview_21 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %29, %cast_22[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
    %31 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %32 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %33 = pto.castptr %32 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %34 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
    %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %34, %35, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %36 = pto.castptr %arg3 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %37 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %38 = pto.castptr %37 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %39 = pto.addptr %36, %c0 : <bf16, gm> -> <bf16, gm>
    %40 = pto.addptr %38, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %39, %40, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
    %mask_23, %scalar_out_24 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
    %41 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
    %42 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %subview_25 = memref.subview %42[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
    %cast_26 = memref.cast %subview_25 : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_27 = pto.vlds %cast_26[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
    %43 = pto.vcvt %result_27, %41 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
    %44 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_28 = memref.subview %44[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_29 = memref.cast %subview_28 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %43, %cast_29[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %45 = pto.fusion_region {
      %74 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %75 = pto.castptr %74 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %76 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %79 = pto.castptr %78 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %80 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %90 = pto.vmi.vload %77[%arg5] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %91 = pto.vmi.vbrc %90 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<64xf32>
        %92 = arith.muli %arg5, %c64 : index
        %93 = pto.vmi.vload %75[%92] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %94 = pto.vmi.vmul %93, %91, %80 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %94, %79[%92], %80 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      %81 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %82 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %83 = pto.castptr %82 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %84 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %85 = pto.castptr %84 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %86 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %87 = pto.castptr %86 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %88 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
      %89 = pto.vmi.vload %85[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %90 = arith.muli %arg5, %c64 : index
        %91 = pto.vmi.vload %83[%90] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %92 = pto.vmi.vmul %91, %89, %88 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %92, %87[%90], %88 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      pto.yield(%81) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %74 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_35 = memref.subview %74[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %75 = pto.vcvt %result_37, %mask_23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
      %76 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
      %subview_38 = memref.subview %76[%arg5, 0] [1, 64] [1, 1] : memref<16x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<64xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %75, %cast_39[%c0], %mask_23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
    %46 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %47 = pto.castptr %46 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %48 = pto.castptr %arg4 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %49 = pto.addptr %47, %c0 : <bf16, ub> -> <bf16, ub>
    %50 = pto.addptr %48, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %49, %50, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
    %51 = pto.addptr %31, %c64 : <f32, gm> -> <f32, gm>
    %52 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %53 = pto.castptr %52 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %54 = pto.addptr %51, %c0 : <f32, gm> -> <f32, gm>
    %55 = pto.addptr %53, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %54, %55, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %56 = pto.addptr %36, %c64 : <bf16, gm> -> <bf16, gm>
    %57 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %58 = pto.castptr %57 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %59 = pto.addptr %56, %c0 : <bf16, gm> -> <bf16, gm>
    %60 = pto.addptr %58, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %59, %60, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
    %61 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %subview_30 = memref.subview %61[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
    %cast_31 = memref.cast %subview_30 : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_32 = pto.vlds %cast_31[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
    %62 = pto.vcvt %result_32, %41 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
    %63 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_33 = memref.subview %63[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_34 = memref.cast %subview_33 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %62, %cast_34[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
    %64:2 = pto.fusion_region {
      %74 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %75 = pto.castptr %74 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %76 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %79 = pto.castptr %78 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %80 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"} : index -> !pto.vmi.mask<64xpred>
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %82 = pto.bind_tile %81, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %83 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.vmi.vload %86[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %88 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %89 = pto.castptr %88 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %90 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %96 = pto.vmi.vload %77[%arg5] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
        %97 = pto.vmi.vbrc %96 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<64xf32>
        %98 = arith.muli %arg5, %c64 : index
        %99 = pto.vmi.vload %75[%98] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %100 = pto.vmi.vmul %99, %97, %80 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %100, %79[%98], %80 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %101 = arith.muli %arg5, %c64 : index
        %102 = pto.vmi.vload %84[%101] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %103 = pto.vmi.vmul %102, %87, %90 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %103, %89[%101], %90 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %91 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %92 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %93 = pto.castptr %92 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %94 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<64xpred>
      %95 = pto.vmi.vbrc %cst_2 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %96 = arith.muli %arg5, %c64 : index
        pto.vmi.vstore %95, %93[%96], %94 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      pto.yield(%82, %91) : (memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
    %65 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %66 = pto.castptr %65 : memref<1x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %74 = arith.index_cast %arg5 : index to i32
      pto.store %74, %66[%arg5] : !pto.ptr<i32, ub>, i32
    } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
    pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
    %67:3 = pto.fusion_region {
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %74 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %75 = pto.castptr %74 : memref<1x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
      %76 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<64xpred>
      %79 = pto.vmi.vload %75[%c0] : !pto.ptr<i32, ub> -> !pto.vmi.vreg<64xi32>
      %80 = pto.vmi.vcvt %79 {rounding = "A"} : !pto.vmi.vreg<64xi32> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %80, %77[%c0], %78 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      %81 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
      %88 = pto.vmi.vload %84[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %89 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %90 = pto.castptr %89 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %91 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %92 = pto.castptr %91 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %93 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %82[%150] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %152 = pto.vmi.vmul %151, %88, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %152, %86[%150], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %153 = arith.muli %arg5, %c64 : index
        %154 = pto.vmi.vload %90[%153] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %155 = pto.vmi.vmuls %154, %cst_1, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %155, %92[%153], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %94 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %95 = pto.castptr %94 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %96 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
      %97 = pto.castptr %96 : memref<16x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %95[%150] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %152 = pto.vmi.vcvt %151 {rounding = "Z", saturate = "NOSAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xi32>
        pto.vmi.vstore %152, %97[%150], %78 : !pto.vmi.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      %98 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
      %99 = pto.castptr %98 : memref<16x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
      %100 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %101 = pto.castptr %100 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %102 = pto.pointer_cast(%c16448_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %103 = pto.bind_tile %102, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %104 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %105 = pto.castptr %104 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %106 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
      %107 = pto.castptr %106 : memref<16x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %99[%150] : !pto.ptr<i32, ub> -> !pto.vmi.vreg<64xi32>
        %152 = pto.vmi.vcvt %151 {rounding = "A"} : !pto.vmi.vreg<64xi32> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %152, %101[%150], %78 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %153 = arith.muli %arg5, %c64 : index
        %154 = pto.vmi.vload %105[%153] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %155 = pto.vmi.vcvt %154 {rounding = "A", saturate = "NOSAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xi32>
        pto.vmi.vstore %155, %107[%153], %78 : !pto.vmi.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %108 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %112 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %113 = pto.castptr %112 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %114 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %115 = pto.castptr %114 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %116 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %117 = pto.castptr %116 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %118 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
      %119 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %120 = pto.castptr %119 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %121 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %122 = pto.castptr %121 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %123 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<64xpred>
      %124 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %125 = pto.castptr %124 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %126 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %127 = pto.castptr %126 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %128 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %129 = pto.castptr %128 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %130 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %131 = pto.castptr %130 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %132 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %133 = pto.castptr %132 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %109[%150] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %152 = pto.vmi.vmuls %151, %cst_0, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %152, %111[%150], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %153 = arith.muli %arg5, %c64 : index
        %154 = pto.vmi.vload %113[%153] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %155 = pto.vmi.vload %115[%153] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %156 = pto.vmi.vsub %154, %155, %118 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %156, %117[%153], %118 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %157 = arith.muli %arg5, %c64 : index
        %158 = pto.vmi.vload %120[%157] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %159 = pto.vmi.vadds %158, %cst_2, %123 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %159, %122[%157], %123 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %160 = arith.muli %arg5, %c64 : index
        %161 = pto.vmi.vload %125[%160] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %162 = pto.vmi.vmuls %161, %cst_0, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %162, %127[%160], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %163 = arith.muli %arg5, %c64 : index
        %164 = pto.vmi.vload %129[%163] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %165 = pto.vmi.vload %131[%163] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %166 = pto.vmi.vsub %164, %165, %118 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %166, %133[%163], %118 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %134 = pto.pointer_cast(%c0_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %135 = pto.bind_tile %134, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %136 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %137 = pto.castptr %136 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %138 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
      %139 = pto.castptr %138 : memref<16x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
      %140 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %141 = pto.castptr %140 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %142 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %143 = pto.castptr %142 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %137[%150] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %152 = pto.vmi.vcvt %151 {rounding = "A", saturate = "NOSAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xi32>
        pto.vmi.vstore %152, %139[%150], %78 : !pto.vmi.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.vmi.mask<64xpred>
        %153 = arith.muli %arg5, %c64 : index
        %154 = pto.vmi.vload %141[%153] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %155 = pto.vmi.vmuls %154, %cst_0, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %155, %143[%153], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %144 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %145 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %146 = pto.castptr %145 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %147 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %148 = pto.castptr %147 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %149 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %150 = arith.muli %arg5, %c64 : index
        %151 = pto.vmi.vload %146[%150] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %152 = pto.vmi.vadds %151, %cst, %149 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %152, %148[%150], %149 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      pto.yield(%103, %135, %144) : (memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %74 = arith.index_cast %arg5 : index to i64
      %75 = arith.muli %74, %c128_i64 : i64
      %76 = arith.addi %75, %c25152_i64 : i64
      %77 = arith.muli %74, %c256_i64 : i64
      %78 = arith.addi %77, %c16448_i64 : i64
      %79 = pto.pointer_cast(%76) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %80 = pto.castptr %79 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %81 = pto.pointer_cast(%78) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_35 = memref.subview %81[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %82 = pto.vgather2 %80, %result_37, %mask_23 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %83 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_38 = memref.subview %83[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %82, %cast_39[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %84 = arith.addi %77, %c20544_i64 : i64
      pto.fusion_region {
        %85 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %86 = pto.castptr %85 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %87 = pto.pointer_cast(%84) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %88 = pto.castptr %87 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %89 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %90 = pto.vmi.vload %86[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %90, %88[%c0], %89 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 5 : i64} :
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %74 = arith.index_cast %arg5 : index to i64
      %75 = arith.muli %74, %c128_i64 : i64
      %76 = arith.addi %75, %c29248_i64 : i64
      %77 = arith.muli %74, %c256_i64 : i64
      %78 = arith.addi %77, %c16448_i64 : i64
      %79 = pto.pointer_cast(%76) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %80 = pto.castptr %79 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %81 = pto.pointer_cast(%78) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_35 = memref.subview %81[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %82 = pto.vgather2 %80, %result_37, %mask_23 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %83 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_38 = memref.subview %83[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %82, %cast_39[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %84 = arith.addi %77, %c25152_i64 : i64
      pto.fusion_region {
        %85 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %86 = pto.castptr %85 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %87 = pto.pointer_cast(%84) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %88 = pto.castptr %87 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %89 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %90 = pto.vmi.vload %86[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %90, %88[%c0], %89 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 6 : i64} :
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %74 = arith.index_cast %arg5 : index to i64
      %75 = arith.muli %74, %c256_i64 : i64
      %76 = arith.addi %75, %c4096_i64 : i64
      %77 = pto.pointer_cast(%76) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %78 = pto.castptr %77 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %79 = pto.pointer_cast(%75) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_35 = memref.subview %79[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %80 = pto.vgather2 %78, %result_37, %mask_23 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %81 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_38 = memref.subview %81[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %80, %cast_39[%c0], %mask_23 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %82 = arith.addi %75, %c16448_i64 : i64
      pto.fusion_region {
        %83 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %84 = pto.castptr %83 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %85 = pto.pointer_cast(%82) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %86 = pto.castptr %85 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %87 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %88 = pto.vmi.vload %84[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %88, %86[%c0], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 7 : i64} :
    }
    %68 = pto.fusion_region {
      %74 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %75 = pto.castptr %74 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %76 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %77 = pto.castptr %76 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %78 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %79 = pto.castptr %78 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %80 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
      %81 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %88 = pto.castptr %87 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %89 = pto.pointer_cast(%c25152_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %90 = pto.castptr %89 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %91 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %92 = pto.castptr %91 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %101 = arith.muli %arg5, %c64 : index
        %102 = pto.vmi.vload %75[%101] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %103 = pto.vmi.vload %77[%101] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %104 = pto.vmi.vmul %102, %103, %80 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %104, %79[%101], %80 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %105 = arith.muli %arg5, %c64 : index
        %106 = pto.vmi.vload %82[%105] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %107 = pto.vmi.vload %84[%105] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %108 = pto.vmi.vmul %106, %107, %80 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %108, %86[%105], %80 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %109 = arith.muli %arg5, %c64 : index
        %110 = pto.vmi.vload %88[%109] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %111 = pto.vmi.vload %90[%109] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %112 = pto.vmi.vmul %110, %111, %80 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %112, %92[%109], %80 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %93 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %94 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %95 = pto.castptr %94 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %96 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %97 = pto.castptr %96 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %98 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %99 = pto.castptr %98 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %100 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %101 = arith.muli %arg5, %c64 : index
        %102 = pto.vmi.vload %95[%101] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %103 = pto.vmi.vload %97[%101] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %104 = pto.vmi.vadd %102, %103, %100 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %104, %99[%101], %100 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      pto.yield(%93) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %74 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_35 = memref.subview %74[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_36 = memref.cast %subview_35 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_37 = pto.vlds %cast_36[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %75 = pto.vcvt %result_37, %mask_23 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
      %76 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
      %subview_38 = memref.subview %76[%arg5, 0] [1, 64] [1, 1] : memref<16x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_39 = memref.cast %subview_38 : memref<64xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %75, %cast_39[%c0], %mask_23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
    %69 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %70 = pto.castptr %69 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %71 = pto.addptr %48, %c64 : <bf16, gm> -> <bf16, gm>
    %72 = pto.addptr %70, %c0 : <bf16, ub> -> <bf16, ub>
    %73 = pto.addptr %71, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %72, %73, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
    pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
    return
  }
}
