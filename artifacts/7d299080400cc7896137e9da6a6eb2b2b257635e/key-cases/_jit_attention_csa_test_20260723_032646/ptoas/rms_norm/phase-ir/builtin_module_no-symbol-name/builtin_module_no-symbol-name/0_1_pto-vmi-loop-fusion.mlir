// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
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
      %15 = arith.muli %arg5, %c128 : index
      %16 = arith.addi %15, %c128 : index
      %17 = arith.muli %0, %c32768 : index
      %18 = arith.addi %17, %15 : index
      %19 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
      %20 = pto.addptr %19, %18 : <bf16, gm> -> <bf16, gm>
      %21 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %23 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
      %24 = pto.addptr %22, %c0 : <bf16, ub> -> <bf16, ub>
      pto.mte_gm_ub %23, %24, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      %25 = arith.addi %17, %16 : index
      %26 = pto.addptr %19, %25 : <bf16, gm> -> <bf16, gm>
      %27 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %28 = pto.castptr %27 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %29 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
      %30 = pto.addptr %28, %c0 : <bf16, ub> -> <bf16, ub>
      pto.mte_gm_ub %29, %30, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      scf.for %arg6 = %c0 to %c8 step %c1 {
        scf.for %arg7 = %c0 to %c128 step %c64 {
          %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %31 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %32 = arith.subi %c128, %arg7 : index
          %33 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
          %subview = memref.subview %33[%arg6, %arg7] [1, %32] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
          %34 = pto.vcvt %result, %31 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %35 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview_5 = memref.subview %35[%arg6, %arg7] [1, %32] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %34, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        }
      } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.fusion_region {
        %31 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %32 = pto.castptr %31 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %33 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %34 = pto.castptr %33 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %35 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %36 = pto.castptr %35 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %37 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<128xpred>
        %38 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %39 = pto.castptr %38 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %40 = pto.pointer_cast(%c16960_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<128xpred>
        %43 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %73 = arith.muli %arg6, %c128 : index
          %74 = pto.vmi.vload %32[%73] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %75 = pto.vmi.vload %34[%73] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %76 = pto.vmi.vmul %74, %75, %37 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
          pto.vmi.vstore %76, %36[%73], %37 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          %77 = arith.muli %arg6, %c128 : index
          %78 = pto.vmi.vload %39[%77] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %79 = pto.vmi.vcadd %78, %42 {reassoc} : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
          pto.vmi.vstore %79, %41[%arg6], %43 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %44 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %45 = pto.castptr %44 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %46 = pto.pointer_cast(%c16960_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %47 = pto.castptr %46 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %48 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %49 = pto.castptr %48 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %50 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<8xpred>
        %51 = pto.vmi.vload %45[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %52 = pto.vmi.vload %47[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %53 = pto.vmi.vadd %51, %52, %50 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %53, %49[%c0], %50 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          scf.for %arg7 = %c0 to %c128 step %c64 {
            %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %74 = arith.subi %c128, %arg7 : index
            %75 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
            %subview = memref.subview %75[%arg6, %arg7] [1, %74] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
            %76 = pto.vcvt %result, %73 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %77 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
            %subview_5 = memref.subview %77[%arg6, %arg7] [1, %74] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            pto.vsts %76, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %54 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %55 = pto.castptr %54 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %56 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %57 = pto.castptr %56 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %58 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %59 = pto.castptr %58 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %60 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %61 = pto.castptr %60 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %62 = pto.pointer_cast(%c8192_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
        %63 = pto.castptr %62 : memref<8x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %73 = arith.muli %arg6, %c128 : index
          %74 = pto.vmi.vload %55[%73] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %75 = pto.vmi.vload %57[%73] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %76 = pto.vmi.vmul %74, %75, %37 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
          pto.vmi.vstore %76, %59[%73], %37 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
          %77 = arith.muli %arg6, %c128 : index
          %78 = pto.vmi.vload %61[%77] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %79 = pto.vmi.vcadd %78, %42 {reassoc} : !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<1xf32>
          pto.vmi.vstore %79, %63[%arg6], %43 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %64 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %65 = pto.castptr %64 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %66 = pto.pointer_cast(%c8192_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %67 = pto.castptr %66 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %68 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
        %69 = pto.castptr %68 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %70 = pto.vmi.vload %65[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %71 = pto.vmi.vload %67[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
        %72 = pto.vmi.vadd %70, %71, %50 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
        pto.vmi.vstore %72, %69[%c0], %50 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 1 : i64} :
    }
    %5 = pto.fusion_region {
      %15 = pto.pointer_cast(%c8256_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %16 = pto.castptr %15 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %17 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %18 = pto.castptr %17 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %19 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<8xpred>
      %20 = pto.vmi.vload %16[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %21 = pto.vmi.vmuls %20, %cst_1, %19 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %21, %18[%c0], %19 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      %22 = pto.alloc_tile addr = %c8768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %23 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %24 = pto.castptr %23 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %25 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
      %26 = pto.castptr %25 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %27 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<8xpred>
      %28 = pto.vmi.vload %24[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
      %29 = pto.vmi.vadds %28, %cst_0, %27 : !pto.vmi.vreg<8xf32>, f32, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
      pto.vmi.vstore %29, %26[%c0], %27 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
      pto.yield(%22) : (!pto.tile_buf<vec, 1x8xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 0 : i64} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
    %6 = pto.pointer_cast(%c8768_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %7 = pto.castptr %6 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %8 = pto.pointer_cast(%c8224_i64) %c1, %c8 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x8xf32, #pto.address_space<vec>>
    %9 = pto.castptr %8 : memref<1x8xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %10 = pto.vmi.create_mask %c8 {pto.tilelib.candidate = "vmi_trsqrt_with_tmp", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trsqrt"} : index -> !pto.vmi.mask<8xpred>
    %11 = pto.vmi.vload %7[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<8xf32>
    %12 = pto.vmi.vsqrt %11, %10 : !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
    %13 = pto.vmi.vbrc %cst : f32 -> !pto.vmi.vreg<8xf32>
    %14 = pto.vmi.vdiv %13, %12, %10 : !pto.vmi.vreg<8xf32>, !pto.vmi.vreg<8xf32>, !pto.vmi.mask<8xpred> -> !pto.vmi.vreg<8xf32>
    pto.vmi.vstore %14, %9[%c0], %10 : !pto.vmi.vreg<8xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<8xpred>
    scf.for %arg5 = %c0 to %c32 step %c2 {
      %15 = arith.muli %arg5, %c128 : index
      %16 = arith.addi %15, %c128 : index
      %17 = arith.muli %0, %c32768 : index
      %18 = arith.addi %17, %15 : index
      %19 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
      %20 = pto.addptr %19, %18 : <bf16, gm> -> <bf16, gm>
      %21 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %23 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
      %24 = pto.addptr %22, %c0 : <bf16, ub> -> <bf16, ub>
      pto.mte_gm_ub %23, %24, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      %25 = pto.castptr %arg2 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
      %26 = pto.addptr %25, %15 : <bf16, gm> -> <bf16, gm>
      %27 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %28 = pto.castptr %27 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      pto.mte_gm_ub %26, %28, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      %29 = arith.addi %17, %16 : index
      %30 = pto.addptr %19, %29 : <bf16, gm> -> <bf16, gm>
      %31 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %32 = pto.castptr %31 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %33 = pto.addptr %30, %c0 : <bf16, gm> -> <bf16, gm>
      %34 = pto.addptr %32, %c0 : <bf16, ub> -> <bf16, ub>
      pto.mte_gm_ub %33, %34, %c0_i64, %c256_i64 nburst(%c8_i64, %c8192_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      %35 = pto.addptr %25, %16 : <bf16, gm> -> <bf16, gm>
      %36 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
      %37 = pto.castptr %36 : memref<1x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      pto.mte_gm_ub %35, %37, %c0_i64, %c256_i64 nburst(%c1_i64, %c2_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
      scf.for %arg6 = %c0 to %c8 step %c1 {
        scf.for %arg7 = %c0 to %c128 step %c64 {
          %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %52 = arith.subi %c128, %arg7 : index
          %53 = pto.pointer_cast(%c0_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
          %subview = memref.subview %53[%arg6, %arg7] [1, %52] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
          %54 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %55 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview_5 = memref.subview %55[%arg6, %arg7] [1, %52] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %54, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        }
      } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %52 = arith.subi %c128, %arg6 : index
        %53 = pto.pointer_cast(%c8256_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %53[0, %arg6] [1, %52] [1, 1] : memref<1x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %54 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %55 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %55[0, %arg6] [1, %52] [1, 1] : memref<1x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %54, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %51 = scf.for %arg7 = %c0 to %c128 step %c64 iter_args(%arg8 = %c128) -> (index) {
          %52 = arith.index_cast %arg8 : index to i32
          %mask_3, %scalar_out_4 = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
          %53 = arith.index_cast %scalar_out_4 : i32 to index
          %54 = arith.subi %c128, %arg7 : index
          %55 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview = memref.subview %55[%arg6, %arg7] [1, %54] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %56 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_5 = memref.subview %56[%arg6, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %subview_5[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %57 = pto.vdup %result_6, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmul %result, %57, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %59[%arg6, %arg7] [1, %54] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %58, %subview_7[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          scf.yield %53 : index
        }
      } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      %38 = pto.fusion_region {
        %51 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %52 = pto.castptr %51 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %53 = pto.pointer_cast(%c0_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
        %54 = pto.castptr %53 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %55 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %57 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
        %58 = pto.vmi.vload %54[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %65 = arith.muli %arg6, %c128 : index
          %66 = pto.vmi.vload %52[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %67 = pto.vmi.vmul %66, %58, %57 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
          pto.vmi.vstore %67, %56[%65], %57 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %59 = pto.alloc_tile addr = %c8768_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        %60 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %61 = pto.castptr %60 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %62 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %63 = pto.castptr %62 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %64 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %65 = arith.muli %arg6, %c128 : index
          %66 = pto.vmi.vload %61[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %67 = pto.vmi.vcvt %66 {saturate = "SAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
          pto.vmi.vstore %67, %63[%65], %64 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.yield(%59) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %39 = pto.pointer_cast(%c8768_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %40 = pto.castptr %39 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %41 = pto.castptr %arg1 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
      %42 = pto.addptr %41, %18 : <bf16, gm> -> <bf16, gm>
      %43 = pto.addptr %40, %c0 : <bf16, ub> -> <bf16, ub>
      %44 = pto.addptr %42, %c0 : <bf16, gm> -> <bf16, gm>
      pto.mte_ub_gm %43, %44, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
      scf.for %arg6 = %c0 to %c8 step %c1 {
        scf.for %arg7 = %c0 to %c128 step %c64 {
          %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
          %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %52 = arith.subi %c128, %arg7 : index
          %53 = pto.pointer_cast(%c4096_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
          %subview = memref.subview %53[%arg6, %arg7] [1, %52] [1, 1] : memref<8x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
          %54 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %55 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview_5 = memref.subview %55[%arg6, %arg7] [1, %52] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %54, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        }
      } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      scf.for %arg6 = %c0 to %c128 step %c64 {
        %mask_3, %scalar_out_4 = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %52 = arith.subi %c128, %arg6 : index
        %53 = pto.pointer_cast(%c8512_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xbf16, #pto.address_space<vec>>
        %subview = memref.subview %53[0, %arg6] [1, %52] [1, 1] : memref<1x128xbf16, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %subview[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
        %54 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %55 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
        %subview_5 = memref.subview %55[0, %arg6] [1, %52] [1, 1] : memref<1x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %54, %subview_5[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
      scf.for %arg6 = %c0 to %c8 step %c1 {
        %51 = scf.for %arg7 = %c0 to %c128 step %c64 iter_args(%arg8 = %c128) -> (index) {
          %52 = arith.index_cast %arg8 : index to i32
          %mask_3, %scalar_out_4 = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
          %53 = arith.index_cast %scalar_out_4 : i32 to index
          %54 = arith.subi %c128, %arg7 : index
          %55 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview = memref.subview %55[%arg6, %arg7] [1, %54] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %56 = pto.pointer_cast(%c8224_i64) %c8, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x1xf32, #pto.address_space<vec>>
          %subview_5 = memref.subview %56[%arg6, 0] [1, 1] [1, 1] : memref<8x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_6 = pto.vlds %subview_5[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %57 = pto.vdup %result_6, %mask_3 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmul %result, %57, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
          %subview_7 = memref.subview %59[%arg6, %arg7] [1, %54] [1, 1] : memref<8x128xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %58, %subview_7[%c0], %mask_3 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          scf.yield %53 : index
        }
      } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      %45 = pto.fusion_region {
        %51 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %52 = pto.castptr %51 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %53 = pto.pointer_cast(%c4096_i64) %c1, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x128xf32, #pto.address_space<vec>>
        %54 = pto.castptr %53 : memref<1x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %55 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %56 = pto.castptr %55 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %57 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<128xpred>
        %58 = pto.vmi.vload %54[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %65 = arith.muli %arg6, %c128 : index
          %66 = pto.vmi.vload %52[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %67 = pto.vmi.vmul %66, %58, %57 : !pto.vmi.vreg<128xf32>, !pto.vmi.vreg<128xf32>, !pto.vmi.mask<128xpred> -> !pto.vmi.vreg<128xf32>
          pto.vmi.vstore %67, %56[%65], %57 : !pto.vmi.vreg<128xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<128xpred>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %59 = pto.alloc_tile addr = %c12864_i64 valid_row = %c8 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
        %60 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xf32, #pto.address_space<vec>>
        %61 = pto.castptr %60 : memref<8x128xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %62 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
        %63 = pto.castptr %62 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %64 = pto.vmi.create_mask %c128 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<128xpred>
        scf.for %arg6 = %c0 to %c8 step %c1 {
          %65 = arith.muli %arg6, %c128 : index
          %66 = pto.vmi.vload %61[%65] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<128xf32>
          %67 = pto.vmi.vcvt %66 {saturate = "SAT"} : !pto.vmi.vreg<128xf32> -> !pto.vmi.vreg<128xbf16>
          pto.vmi.vstore %67, %63[%65], %64 : !pto.vmi.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<128xpred>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.yield(%59) : (!pto.tile_buf<vec, 8x128xbf16, valid=?x?>) -> ()
      } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 8x128xbf16, valid=?x?>
      %46 = pto.pointer_cast(%c12864_i64) %c8, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<8x128xbf16, #pto.address_space<vec>>
      %47 = pto.castptr %46 : memref<8x128xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %48 = pto.addptr %41, %29 : <bf16, gm> -> <bf16, gm>
      %49 = pto.addptr %47, %c0 : <bf16, ub> -> <bf16, ub>
      %50 = pto.addptr %48, %c0 : <bf16, gm> -> <bf16, gm>
      pto.mte_ub_gm %49, %50, %c256_i64 nburst(%c8_i64, %c256_i64, %c8192_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    }
    return
  }
}
