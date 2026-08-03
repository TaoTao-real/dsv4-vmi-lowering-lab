// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @rms_norm(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xbf16, #pto.address_space<gm>>, %arg2: memref<?xbf16, #pto.address_space<gm>>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c32768 = arith.constant 32768 : index
  %c8_i32 = arith.constant 8 : i32
  %cst = arith.constant 1.000000e+00 : f32
  %c128_i32 = arith.constant 128 : i32
  %c64 = arith.constant 64 : index
  %c8_i64 = arith.constant 8 : i64
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
  %1 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %2 = pto.castptr %1 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
  %3 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
  pto.vsts %3, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %16 = arith.muli %arg5, %c128 : index
    %17 = arith.addi %16, %c128 : index
    %18 = arith.muli %0, %c32768 : index
    %19 = arith.addi %18, %16 : index
    %20 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %21 = pto.addptr %20, %19 : <bf16, gm> -> <bf16, gm>
    %22 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %23 = pto.castptr %22 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %24 = pto.addptr %21, %c0 : <bf16, gm> -> <bf16, gm>
    %25 = pto.addptr %23, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %24, %25, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %26 = arith.addi %18, %17 : index
    %27 = pto.addptr %20, %26 : <bf16, gm> -> <bf16, gm>
    %28 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %29 = pto.castptr %28 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %30 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
    %31 = pto.addptr %29, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %30, %31, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    scf.for %arg6 = %c0 to %c8 step %c1 {
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %36 = arith.subi %c128, %arg7 : index
        %37 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %37[%arg6, %arg7] [1, %36] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %38 = pto.vcvt %result, %35 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %39 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %39[%arg6, %arg7] [1, %36] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %38, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
    } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    %32 = pto.fusion_region {
      %35 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      %36 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %37 = pto.castptr %36 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %38 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %39 = pto.castptr %38 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %40 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %41 = pto.castptr %40 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %42 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %43 = arith.muli %arg6, %c128 : index
        %44 = pto.vmi.vload %37[%43] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %45 = pto.vmi.vmul %44, %44, %42 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %45, %41[%43], %42 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      pto.yield(%35) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.fusion_region {
      %35 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %36 = pto.castptr %35 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %37 = pto.pointer_cast(%c16960_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %38 = pto.castptr %37 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %39 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<128xpred>
      %40 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %41 = arith.muli %arg6, %c128 : index
        %42 = pto.vmi.vload %36[%41] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %43 = pto.vmi.vcadd %42, %39 {reassoc} : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
        pto.vmi.vstore %43, %38[%arg6], %40 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
      } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 3 : i64} : 
    %33 = pto.fusion_region {
      %35 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %36 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %37 = pto.castptr %36 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %38 = pto.pointer_cast(%c16960_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %39 = pto.castptr %38 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %40 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %41 = pto.castptr %40 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %42 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      %43 = pto.vmi.vload %37[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %44 = pto.vmi.vload %39[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %45 = pto.vmi.vadd %43, %44, %42 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %45, %41[%c0], %42 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield(%35) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    scf.for %arg6 = %c0 to %c8 step %c1 {
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %36 = arith.subi %c128, %arg7 : index
        %37 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %37[%arg6, %arg7] [1, %36] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %38 = pto.vcvt %result, %35 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %39 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %39[%arg6, %arg7] [1, %36] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %38, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
    } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    %34 = pto.fusion_region {
      %35 = pto.alloc_tile addr = %c0_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      %36 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %37 = pto.castptr %36 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %38 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %39 = pto.castptr %38 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %40 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %41 = pto.castptr %40 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %42 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %43 = arith.muli %arg6, %c128 : index
        %44 = pto.vmi.vload %37[%43] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %45 = pto.vmi.vmul %44, %44, %42 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %45, %41[%43], %42 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      pto.yield(%35) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    pto.fusion_region {
      %35 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %36 = pto.castptr %35 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %37 = pto.pointer_cast(%c8192_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
      %38 = pto.castptr %37 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %39 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<128xpred>
      %40 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %41 = arith.muli %arg6, %c128 : index
        %42 = pto.vmi.vload %36[%41] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %43 = pto.vmi.vcadd %42, %39 {reassoc} : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
        pto.vmi.vstore %43, %38[%arg6], %40 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
      } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 6 : i64} : 
    pto.fusion_region {
      %35 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %36 = pto.castptr %35 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %37 = pto.pointer_cast(%c8192_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %38 = pto.castptr %37 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %39 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %40 = pto.castptr %39 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %41 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
      %42 = pto.vmi.vload %36[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %43 = pto.vmi.vload %38[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %44 = pto.vmi.vadd %42, %43, %41 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %44, %40[%c0], %41 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 7 : i64} : 
  }
  %5 = pto.fusion_region {
    %16 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %17 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %18 = pto.castptr %17 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %19 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %20 = pto.castptr %19 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %21 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<8xpred>
    %22 = pto.vmi.vload %18[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
    %23 = pto.vmi.vmuls %22, %cst_1, %21 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
    pto.vmi.vstore %23, %20[%c0], %21 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
    pto.yield(%16) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %6 = pto.fusion_region {
    %16 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %17 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %18 = pto.castptr %17 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %19 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %20 = pto.castptr %19 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %21 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
    %22 = pto.vmi.vload %18[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
    %23 = pto.vmi.vadds %22, %cst_0, %21 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
    pto.vmi.vstore %23, %20[%c0], %21 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
    pto.yield(%16) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
  %7 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %8 = pto.castptr %7 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %9 = pto.pointer_cast(%c8224_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
  %10 = pto.castptr %9 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %11 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trsqrt_with_tmp", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trsqrt"} : index -> !pto.vmi.mask<8xpred>
  %12 = pto.vmi.vload %8[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
  %13 = pto.vmi.vsqrt %12, %11 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
  %14 = pto.vmi.vbrc %cst : f32 -> !pto.vmi.vreg<8xf32>
  %15 = pto.vmi.vdiv %14, %13, %11 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
  pto.vmi.vstore %15, %10[%c0], %11 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
  scf.for %arg5 = %c0 to %c32 step %c2 {
    %16 = arith.muli %arg5, %c128 : index
    %17 = arith.addi %16, %c128 : index
    %18 = arith.muli %0, %c32768 : index
    %19 = arith.addi %18, %16 : index
    %20 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %21 = pto.addptr %20, %19 : <bf16, gm> -> <bf16, gm>
    %22 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %23 = pto.castptr %22 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %24 = pto.addptr %21, %c0 : <bf16, gm> -> <bf16, gm>
    %25 = pto.addptr %23, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %24, %25, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %26 = pto.castptr %arg2 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %27 = pto.addptr %26, %16 : <bf16, gm> -> <bf16, gm>
    %28 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
    %29 = pto.castptr %28 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    pto.mte_gm_ub %27, %29, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %30 = arith.addi %18, %17 : index
    %31 = pto.addptr %20, %30 : <bf16, gm> -> <bf16, gm>
    %32 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %33 = pto.castptr %32 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %34 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
    %35 = pto.addptr %33, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %34, %35, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %36 = pto.addptr %26, %17 : <bf16, gm> -> <bf16, gm>
    %37 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
    %38 = pto.castptr %37 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    pto.mte_gm_ub %36, %38, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    scf.for %arg6 = %c0 to %c8 step %c1 {
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %55 = arith.subi %c128, %arg7 : index
        %56 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %56[%arg6, %arg7] [1, %55] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %57 = pto.vcvt %result, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %58 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %58[%arg6, %arg7] [1, %55] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %57, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
    } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c128 step %c64 {
      %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
      %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
      %55 = arith.subi %c128, %arg6 : index
      %56 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %subview = memref.subview %56[0, %arg6] [1, %55] [1, 1] : memref<1x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
      %57 = pto.vcvt %result, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
      %58 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %subview_5 = memref.subview %58[0, %arg6] [1, %55] [1, 1] : memref<1x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %57, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    }
    scf.for %arg6 = %c0 to %c8 step %c1 {
      %54 = scf.for %arg7 = %c0 to %c128 step %c64 iter_args(%arg8 = %c128) -> (index) {
        %55 = arith.index_cast %arg8 : index to i32
        %mask_3, %scalar_out_4 = pto.plt_b32 %55 : i32 -> !pto.mask<b32>, i32
        %56 = arith.index_cast %scalar_out_4 : i32 to index
        %57 = arith.subi %c128, %arg7 : index
        %58 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview = memref.subview %58[%arg6, %arg7] [1, %57] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %59 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %59[%arg6, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_6 = pto.vlds %subview_5[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %60 = pto.vdup %result_6, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %61 = pto.vmul %result, %60, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %62 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_7 = memref.subview %62[%arg6, %arg7] [1, %57] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %61, %subview_7[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        scf.yield %56 : index
      }
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    %39 = pto.fusion_region {
      %54 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      %55 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %57 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %59 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %60 = pto.castptr %59 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %61 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
      %62 = pto.vmi.vload %58[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %63 = arith.muli %arg6, %c128 : index
        %64 = pto.vmi.vload %56[%63] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %65 = pto.vmi.vmul %64, %62, %61 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %65, %60[%63], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      pto.yield(%54) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %40 = pto.fusion_region {
      %54 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %55 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %57 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %59 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %60 = arith.muli %arg6, %c128 : index
        %61 = pto.vmi.vload %56[%60] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %62 = pto.vmi.vcvt %61 {saturate = "SAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
        pto.vmi.vstore %62, %58[%60], %59 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%54) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %41 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %42 = pto.castptr %41 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %43 = pto.castptr %arg1 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %44 = pto.addptr %43, %19 : <bf16, gm> -> <bf16, gm>
    %45 = pto.addptr %42, %c0 : <bf16, ub> -> <bf16, ub>
    %46 = pto.addptr %44, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %45, %46, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    scf.for %arg6 = %c0 to %c8 step %c1 {
      scf.for %arg7 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %55 = arith.subi %c128, %arg7 : index
        %56 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %56[%arg6, %arg7] [1, %55] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %57 = pto.vcvt %result, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %58 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %58[%arg6, %arg7] [1, %55] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %57, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
    } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    scf.for %arg6 = %c0 to %c128 step %c64 {
      %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
      %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
      %55 = arith.subi %c128, %arg6 : index
      %56 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %subview = memref.subview %56[0, %arg6] [1, %55] [1, 1] : memref<1x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
      %57 = pto.vcvt %result, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
      %58 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %subview_5 = memref.subview %58[0, %arg6] [1, %55] [1, 1] : memref<1x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %57, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    }
    scf.for %arg6 = %c0 to %c8 step %c1 {
      %54 = scf.for %arg7 = %c0 to %c128 step %c64 iter_args(%arg8 = %c128) -> (index) {
        %55 = arith.index_cast %arg8 : index to i32
        %mask_3, %scalar_out_4 = pto.plt_b32 %55 : i32 -> !pto.mask<b32>, i32
        %56 = arith.index_cast %scalar_out_4 : i32 to index
        %57 = arith.subi %c128, %arg7 : index
        %58 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview = memref.subview %58[%arg6, %arg7] [1, %57] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %59 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %59[%arg6, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_6 = pto.vlds %subview_5[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %60 = pto.vdup %result_6, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %61 = pto.vmul %result, %60, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %62 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %subview_7 = memref.subview %62[%arg6, %arg7] [1, %57] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %61, %subview_7[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        scf.yield %56 : index
      }
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    %47 = pto.fusion_region {
      %54 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
      %55 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %57 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %59 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %60 = pto.castptr %59 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %61 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
      %62 = pto.vmi.vload %58[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %63 = arith.muli %arg6, %c128 : index
        %64 = pto.vmi.vload %56[%63] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %65 = pto.vmi.vmul %64, %62, %61 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
        pto.vmi.vstore %65, %60[%63], %61 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      pto.yield(%54) : (!pto.tile_buf<vec, 8x128xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 8x128xf32, valid=?x?>
    %48 = pto.fusion_region {
      %54 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %55 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
      %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %57 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %58 = pto.castptr %57 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %59 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %60 = arith.muli %arg6, %c128 : index
        %61 = pto.vmi.vload %56[%60] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        %62 = pto.vmi.vcvt %61 {saturate = "SAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
        pto.vmi.vstore %62, %58[%60], %59 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%54) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
    %49 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
    %50 = pto.castptr %49 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %51 = pto.addptr %43, %30 : <bf16, gm> -> <bf16, gm>
    %52 = pto.addptr %50, %c0 : <bf16, ub> -> <bf16, ub>
    %53 = pto.addptr %51, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %52, %53, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
  }
  return
}

