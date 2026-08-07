// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @qk_pv_aiv(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xi32, #pto.address_space<gm>>, %arg4: memref<?xf32, #pto.address_space<gm>>, %arg5: memref<?xi32, #pto.address_space<gm>>, %arg6: memref<?xi32, #pto.address_space<gm>>, %arg7: memref<?xbf16, #pto.address_space<gm>>, %arg8: memref<?xi32, #pto.address_space<gm>>, %arg9: memref<?xi32, #pto.address_space<gm>>, %arg10: memref<?xbf16, #pto.address_space<gm>>, %arg11: memref<?xbf16, #pto.address_space<gm>>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c512_i64 = arith.constant 512 : i64
  %c1_i16 = arith.constant 1 : i16
  %c32_i16 = arith.constant 32 : i16
  %c4096 = arith.constant 4096 : index
  %c64_i64 = arith.constant 64 : i64
  %c128_i64 = arith.constant 128 : i64
  %c1_i64 = arith.constant 1 : i64
  %c0_i64 = arith.constant 0 : i64
  %c2048_i64 = arith.constant 2048 : i64
  %c16_i64 = arith.constant 16 : i64
  %cst = arith.constant -3.000000e+38 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %c16 = arith.constant 16 : index
  %c80 = arith.constant 80 : index
  %cst_1 = arith.constant 0.0441941731 : f32
  %c2 = arith.constant 2 : index
  %c320 = arith.constant 320 : index
  %c0 = arith.constant 0 : index
  %c24 = arith.constant 24 : index
  %c32 = arith.constant 32 : index
  %c4 = arith.constant 4 : index
  %c128 = arith.constant 128 : index
  %c5 = arith.constant 5 : index
  %c640 = arith.constant 640 : index
  %c512 = arith.constant 512 : index
  %c1 = arith.constant 1 : index
  %c82688_i64 = arith.constant 82688 : i64
  %c82560_i64 = arith.constant 82560 : i64
  %c82432_i64 = arith.constant 82432 : i64
  %c90880_i64 = arith.constant 90880 : i64
  %c65536_i64 = arith.constant 65536 : i64
  %c0_i32 = arith.constant 0 : i32
  %c63 = arith.constant 63 : index
  %c160 = arith.constant 160 : index
  %c82496_i64 = arith.constant 82496 : i64
  %c82624_i64 = arith.constant 82624 : i64
  %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
  %1 = arith.index_cast %arg12 : i32 to index
  %2 = arith.subi %c63, %1 : index
  %3 = arith.divsi %2, %c24 : index
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.set_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
  pto.set_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
  pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
  scf.for %arg14 = %c0 to %3 step %c1 {
    %4 = arith.muli %arg14, %c24 : index
    %5 = arith.addi %1, %4 : index
    %6 = pto.load_scalar %arg3[%5] : memref<?xi32, #pto.address_space<gm>> -> i32
    %7 = arith.index_cast %6 : i32 to index
    %8 = arith.divsi %7, %c5 : index
    %9 = arith.muli %8, %c5 : index
    %10 = arith.subi %7, %9 : index
    %11 = arith.muli %8, %c320 : index
    %12 = arith.muli %10, %c128 : index
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    %13 = arith.muli %8, %c640 : index
    %14 = arith.addi %13, %12 : index
    %15 = pto.castptr %arg4 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %16 = pto.addptr %15, %14 : <f32, gm> -> <f32, gm>
    %17 = pto.pointer_cast(%c65536_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
    %18 = pto.castptr %17 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %19 = pto.addptr %16, %c0 : <f32, gm> -> <f32, gm>
    %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %19, %20, %c0_i64, %c512_i64 nburst(%c1_i64, %c0_i64, %c512_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    %21 = pto.load_scalar %arg5[%7] : memref<?xi32, #pto.address_space<gm>> -> i32
    %22 = arith.index_cast %21 : i32 to index
    %23 = arith.cmpi sgt, %22, %c0 : index
    pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
    scf.if %23 {
      scf.for %arg15 = %c0 to %c2 step %c1 {
        %24 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
        %25 = pto.bind_tile %24 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
        %26 = pto.materialize_tile %25, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
        pto.tpop(%26, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
        %27 = pto.fusion_region {
          %60 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
          %61 = pto.castptr %25 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %62 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %63 = pto.castptr %62 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %64 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %65 = arith.muli %arg16, %c128 : index
            %66 = pto.vmi.vload %61[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %67 = pto.vmi.vmuls %66, %cst_1, %64 : !pto.vmi.vreg<128xf32>, f32, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %67, %63[%65], %64 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
          pto.yield(%60) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tfree(%0 : !pto.pipe) {split = 0}
        %28:3 = pto.fusion_region {
          %60 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %61 = pto.castptr %60 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %62 = pto.pointer_cast(%c65536_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
          %63 = pto.castptr %62 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %64 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %65 = pto.castptr %64 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %66 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"} : index -> !pto.vmi.mask<128xpred>
          %67 = pto.vmi.vload %63[%c0] {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %110 = arith.muli %arg16, %c128 : index
            %111 = pto.vmi.vload %61[%110] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %112 = pto.vmi.vadd %111, %67, %66 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %112, %65[%110], %66 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"}
          %68 = pto.pointer_cast(%c82432_i64) %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %69 = pto.bind_tile %68, %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>> -> memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %70 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.pointer_cast(%c82432_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %73 = pto.castptr %72 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %74 = pto.vmi.create_mask %c4096 {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : index -> !pto.vmi.mask<4096xpred>
          %75 = pto.vmi.vload %71[%c0] {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<4096xf32>
          %76 = pto.vmi.vcmax %75, %74 {group = 32 : i64, pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : !pto.vmi.vreg<4096xf32>, !pto.vmi.mask<4096xpred> -> !pto.vmi.vreg<32xf32>
          pto.vmi.vstore %76, %73[%c0], %c1 {group = 32 : i64, pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>
          %77 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %78 = pto.castptr %77 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %79 = pto.pointer_cast(%c82432_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %80 = pto.castptr %79 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %81 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %82 = pto.castptr %81 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %83 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<128xpred>
          %84 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %85 = pto.castptr %84 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %86 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %87 = pto.castptr %86 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %88 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %110 = pto.vmi.vload %80[%arg16] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
            %111 = pto.vmi.vbrc %110 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<128xf32>
            %112 = arith.muli %arg16, %c128 : index
            %113 = pto.vmi.vload %78[%112] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %114 = pto.vmi.vsub %113, %111, %83 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            %115 = pto.vmi.vexp %114, %88 : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %115, %87[%112], %88 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %89 = pto.pointer_cast(%c82560_i64) %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %90 = pto.bind_tile %89, %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>> -> memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %91 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %92 = pto.castptr %91 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %93 = pto.pointer_cast(%c82560_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %94 = pto.castptr %93 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %95 = pto.vmi.create_mask %c4096 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<4096xpred>
          %96 = pto.vmi.vload %92[%c0] {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<4096xf32>
          %97 = pto.vmi.vcadd %96, %95 {group = 32 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum", reassoc} : !pto.vmi.vreg<4096xf32>, !pto.vmi.mask<4096xpred> -> !pto.vmi.vreg<32xf32>
          pto.vmi.vstore %97, %94[%c0], %c1 {group = 32 : i64, pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>
          %98 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %99 = pto.castptr %98 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %100 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %101 = pto.castptr %100 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %102 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %110 = arith.muli %arg16, %c128 : index
            %111 = pto.vmi.vload %99[%110] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %112 = pto.vmi.vcvt %111 {rounding = "R", saturate = "NOSAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
            pto.vmi.vstore %112, %101[%110], %102 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %103 = pto.alloc_tile addr = %c82688_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          %104 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %105 = pto.castptr %104 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %106 = pto.pointer_cast(%c82688_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %107 = pto.castptr %106 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %108 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<128xpred>
          %109 = scf.for %arg16 = %c0 to %c32 step %c1 iter_args(%arg17 = %107) -> (!pto.ptr<bf16, ub>) {
            %110 = arith.muli %arg16, %c128 : index
            %111 = pto.vmi.vload %105[%110] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
            %112 = pto.vmi.vstore %111, %arg17[%c0], %c32_i16, %c1_i16, %108 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred> -> !pto.ptr<bf16, ub>
            scf.yield %112 : !pto.ptr<bf16, ub>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          pto.yield(%69, %90, %103) : (memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>, memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) -> ()
        } {pto.fusion.group_id = 1 : i64} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>, memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tpush(%28#2, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %29 = arith.muli %arg15, %c2 : index
        %30 = arith.muli %arg15, %c160 : index
        %31 = arith.addi %11, %30 : index
        %32 = arith.muli %10, %c16 : index
        %33 = arith.addi %31, %32 : index
        pto.barrier <PIPE_MTE3>
        %34 = pto.pointer_cast(%c82432_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %35 = pto.castptr %34 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %36 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %37 = pto.addptr %36, %33 : <f32, gm> -> <f32, gm>
        %38 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
        %39 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %38, %39, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %40 = pto.pointer_cast(%c82560_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %43 = pto.addptr %42, %33 : <f32, gm> -> <f32, gm>
        %44 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
        %45 = pto.addptr %43, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %44, %45, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %46 = arith.addi %29, %c1 : index
        %47 = arith.muli %46, %c80 : index
        %48 = arith.addi %11, %47 : index
        %49 = arith.addi %48, %32 : index
        pto.barrier <PIPE_MTE3>
        %50 = pto.pointer_cast(%c82496_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %51 = pto.castptr %50 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %52 = pto.addptr %36, %49 : <f32, gm> -> <f32, gm>
        %53 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
        %54 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %53, %54, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %55 = pto.pointer_cast(%c82624_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %56 = pto.castptr %55 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %57 = pto.addptr %42, %49 : <f32, gm> -> <f32, gm>
        %58 = pto.addptr %56, %c0 : <f32, ub> -> <f32, ub>
        %59 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %58, %59, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
      }
    } else {
      %24 = pto.fusion_region {
        %25 = pto.alloc_tile addr = %c90880_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
        %26 = pto.pointer_cast(%c90880_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %27 = pto.castptr %26 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %28 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<512xpred>
        %29 = pto.vmi.vbrc %cst_0 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<512xf32>
        scf.for %arg15 = %c0 to %c16 step %c1 {
          %30 = arith.muli %arg15, %c512 : index
          pto.vmi.vstore %29, %27[%30], %28 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        pto.yield(%25) : (!pto.tile_buf<vec, 16x512xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      scf.for %arg15 = %c0 to %c4 step %c1 {
        %25 = arith.muli %arg15, %c80 : index
        %26 = arith.addi %11, %25 : index
        %27 = arith.muli %10, %c16 : index
        %28 = arith.addi %26, %27 : index
        scf.for %arg16 = %c0 to %c16 step %c1 {
          %36 = arith.addi %28, %arg16 : index
          pto.store_scalar %cst, %arg1[%36] : memref<?xf32, #pto.address_space<gm>>, f32
          pto.store_scalar %cst_0, %arg0[%36] : memref<?xf32, #pto.address_space<gm>>, f32
        }
        pto.barrier <PIPE_MTE3>
        %29 = pto.pointer_cast(%c90880_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %30 = pto.castptr %29 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %31 = arith.muli %28, %c512 : index
        %32 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %33 = pto.addptr %32, %31 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
        %35 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %34, %35, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
      }
    }
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.set_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
    pto.set_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
  }
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
  pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
  pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
  return
}
