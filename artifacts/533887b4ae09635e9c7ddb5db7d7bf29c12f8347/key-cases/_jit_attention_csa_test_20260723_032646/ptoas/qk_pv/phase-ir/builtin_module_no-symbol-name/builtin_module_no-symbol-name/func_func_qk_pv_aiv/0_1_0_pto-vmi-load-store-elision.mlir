// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @qk_pv_aiv(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xi32, #pto.address_space<gm>>, %arg4: memref<?xf32, #pto.address_space<gm>>, %arg5: memref<?xi32, #pto.address_space<gm>>, %arg6: memref<?xi32, #pto.address_space<gm>>, %arg7: memref<?xbf16, #pto.address_space<gm>>, %arg8: memref<?xi32, #pto.address_space<gm>>, %arg9: memref<?xi32, #pto.address_space<gm>>, %arg10: memref<?xbf16, #pto.address_space<gm>>, %arg11: memref<?xbf16, #pto.address_space<gm>>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c512_i64 = arith.constant 512 : i64
  %c1_i16 = arith.constant 1 : i16
  %c32_i16 = arith.constant 32 : i16
  %c64_i64 = arith.constant 64 : i64
  %c128_i64 = arith.constant 128 : i64
  %c1_i64 = arith.constant 1 : i64
  %c64 = arith.constant 64 : index
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
    %13 = arith.muli %8, %c640 : index
    %14 = arith.addi %13, %12 : index
    %15 = pto.castptr %arg4 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %16 = pto.addptr %15, %14 : <f32, gm> -> <f32, gm>
    %17 = pto.pointer_cast(%c65536_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
    %18 = pto.castptr %17 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %19 = pto.addptr %16, %c0 : <f32, gm> -> <f32, gm>
    %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %19, %20, %c0_i64, %c512_i64 nburst(%c1_i64, %c0_i64, %c512_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %21 = pto.load_scalar %arg5[%7] : memref<?xi32, #pto.address_space<gm>> -> i32
    %22 = arith.index_cast %21 : i32 to index
    %23 = arith.cmpi sgt, %22, %c0 : index
    scf.if %23 {
      scf.for %arg15 = %c0 to %c2 step %c1 {
        %24 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
        %25 = pto.bind_tile %24 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
        %26 = pto.materialize_tile %25, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tpop(%26, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
        %27 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %67 = pto.castptr %25 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %68 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %71 = arith.muli %arg16, %c128 : index
            %72 = pto.vmi.vload %67[%71] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %73 = pto.vmi.vmuls %72, %cst_1, %70 : !pto.vmi.vreg<128xf32>, f32, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %73, %69[%71], %70 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        pto.tfree(%0 : !pto.pipe) {split = 0}
        %28 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %67 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c65536_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %72 = pto.castptr %71 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %73 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"} : index -> !pto.vmi.mask<128xpred>
          %74 = pto.vmi.vload %70[%c0] {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %75 = arith.muli %arg16, %c128 : index
            %76 = pto.vmi.vload %68[%75] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %77 = pto.vmi.vadd %76, %74, %73 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %77, %72[%75], %73 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        %29 = pto.fusion_region {
          %66 = pto.pointer_cast(%c82432_i64) %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %67 = pto.bind_tile %66, %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>> -> memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %68 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%c82432_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : index -> !pto.vmi.mask<128xpred>
          %73 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : index -> !pto.vmi.mask<1xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %74 = arith.muli %arg16, %c128 : index
            %75 = pto.vmi.vload %69[%74] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %76 = pto.vmi.vcmax %75, %72 : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
            pto.vmi.vstore %76, %71[%arg16], %73 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
          pto.yield(%67) : (memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>) -> ()
        } {pto.fusion.group_id = 2 : i64} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
        %30 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %67 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c82432_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %72 = pto.castptr %71 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %73 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %74 = pto.vmi.vload %70[%arg16] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<1xf32>
            %75 = pto.vmi.vbrc %74 : !pto.vmi.vreg<1xf32> -> !pto.vmi.vreg<128xf32>
            %76 = arith.muli %arg16, %c128 : index
            %77 = pto.vmi.vload %68[%76] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %78 = pto.vmi.vsub %77, %75, %73 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %78, %72[%76], %73 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        %31 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
          %67 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %72 = arith.muli %arg16, %c128 : index
            %73 = pto.vmi.vload %68[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %74 = pto.vmi.vexp %73, %71 : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
            pto.vmi.vstore %74, %70[%72], %71 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xf32, valid=?x?>) -> ()
        } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
        %32 = pto.fusion_region {
          %66 = pto.pointer_cast(%c82560_i64) %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %67 = pto.bind_tile %66, %c32, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>> -> memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
          %68 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%c82560_i64) %c32, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<128xpred>
          %73 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %74 = arith.muli %arg16, %c128 : index
            %75 = pto.vmi.vload %69[%74] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %76 = pto.vmi.vcadd %75, %72 {reassoc} : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
            pto.vmi.vstore %76, %71[%arg16], %73 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.yield(%67) : (memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>) -> ()
        } {pto.fusion.group_id = 5 : i64} : memref<32x1xf32, strided<[1, 32], offset: ?>, #pto.address_space<vec>>
        %33 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>
          %67 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<32x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %71 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
          scf.for %arg16 = %c0 to %c32 step %c1 {
            %72 = arith.muli %arg16, %c128 : index
            %73 = pto.vmi.vload %68[%72] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
            %74 = pto.vmi.vcvt %73 {saturate = "SAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
            pto.vmi.vstore %74, %70[%72], %71 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xbf16, valid=?x?>) -> ()
        } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?>
        %34 = pto.fusion_region {
          %66 = pto.alloc_tile addr = %c82688_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          %67 = pto.pointer_cast(%c90880_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %69 = pto.pointer_cast(%c82688_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<32x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %71 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<128xpred>
          %72 = scf.for %arg16 = %c0 to %c32 step %c1 iter_args(%arg17 = %70) -> (!pto.ptr<bf16, ub>) {
            %73 = arith.muli %arg16, %c128 : index
            %74 = pto.vmi.vload %68[%73] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<128xbf16>
            %75 = pto.vmi.vstore %74, %arg17[%c0], %c32_i16, %c1_i16, %71 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred> -> !pto.ptr<bf16, ub>
            scf.yield %75 : !pto.ptr<bf16, ub>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          pto.yield(%66) : (!pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>) -> ()
        } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tpush(%34, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %35 = arith.muli %arg15, %c2 : index
        %36 = arith.muli %arg15, %c160 : index
        %37 = arith.addi %11, %36 : index
        %38 = arith.muli %10, %c16 : index
        %39 = arith.addi %37, %38 : index
        %40 = pto.pointer_cast(%c82432_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %43 = pto.addptr %42, %39 : <f32, gm> -> <f32, gm>
        %44 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
        %45 = pto.addptr %43, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %44, %45, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %46 = pto.pointer_cast(%c82560_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %47 = pto.castptr %46 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %48 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %49 = pto.addptr %48, %39 : <f32, gm> -> <f32, gm>
        %50 = pto.addptr %47, %c0 : <f32, ub> -> <f32, ub>
        %51 = pto.addptr %49, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %50, %51, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %52 = arith.addi %35, %c1 : index
        %53 = arith.muli %52, %c80 : index
        %54 = arith.addi %11, %53 : index
        %55 = arith.addi %54, %38 : index
        %56 = pto.pointer_cast(%c82496_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %57 = pto.castptr %56 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %58 = pto.addptr %42, %55 : <f32, gm> -> <f32, gm>
        %59 = pto.addptr %57, %c0 : <f32, ub> -> <f32, ub>
        %60 = pto.addptr %58, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %59, %60, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
        %61 = pto.pointer_cast(%c82624_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x1xf32, #pto.address_space<vec>>
        %62 = pto.castptr %61 : memref<32x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %63 = pto.addptr %48, %55 : <f32, gm> -> <f32, gm>
        %64 = pto.addptr %62, %c0 : <f32, ub> -> <f32, ub>
        %65 = pto.addptr %63, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %64, %65, %c64_i64 nburst(%c1_i64, %c128_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
      }
    } else {
      %24 = pto.pointer_cast(%c90880_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
      %25 = pto.castptr %24 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg15 = %c0 to %c16 step %c1 {
        %26 = scf.for %arg16 = %c0 to %c512 step %c64 iter_args(%arg17 = %c512) -> (index) {
          %27 = arith.index_cast %arg17 : index to i32
          %mask, %scalar_out = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
          %28 = arith.index_cast %scalar_out : i32 to index
          %29 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = arith.muli %arg15, %c512 : index
          %31 = arith.addi %30, %arg16 : index
          %32 = pto.addptr %25, %31 : <f32, ub> -> <f32, ub>
          pto.vsts %29, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %28 : index
        }
      } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      scf.for %arg15 = %c0 to %c4 step %c1 {
        %26 = arith.muli %arg15, %c80 : index
        %27 = arith.addi %11, %26 : index
        %28 = arith.muli %10, %c16 : index
        %29 = arith.addi %27, %28 : index
        scf.for %arg16 = %c0 to %c16 step %c1 {
          %37 = arith.addi %29, %arg16 : index
          pto.store_scalar %cst, %arg1[%37] : memref<?xf32, #pto.address_space<gm>>, f32
          pto.store_scalar %cst_0, %arg0[%37] : memref<?xf32, #pto.address_space<gm>>, f32
        }
        %30 = pto.pointer_cast(%c90880_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %31 = pto.castptr %30 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %32 = arith.muli %29, %c512 : index
        %33 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %34 = pto.addptr %33, %32 : <f32, gm> -> <f32, gm>
        %35 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
        %36 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
        pto.mte_ub_gm %35, %36, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
      }
    }
  }
  return
}

