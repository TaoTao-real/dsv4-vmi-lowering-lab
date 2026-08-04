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
  scf.for %arg9 = %c0 to %c4 step %c1 {
    %2 = arith.muli %arg9, %c16 : index
    %3 = arith.muli %0, %c64 : index
    %4 = arith.addi %3, %2 : index
    %5 = arith.cmpi slt, %0, %c128 : index
    scf.if %5 {
      %13 = arith.muli %arg9, %c48 : index
      %14 = arith.addi %1, %13 : index
      %15 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %16 = pto.addptr %15, %14 : <f32, gm> -> <f32, gm>
      %17 = pto.pointer_cast(%c65856_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %18 = pto.castptr %17 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %16, %18, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      %19 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %20 = pto.addptr %19, %14 : <f32, gm> -> <f32, gm>
      %21 = pto.pointer_cast(%c65920_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %20, %22, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      %23 = arith.muli %14, %c512 : index
      %24 = pto.castptr %arg4 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %25 = pto.addptr %24, %23 : <f32, gm> -> <f32, gm>
      %26 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
      %27 = pto.castptr %26 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %25, %27, %c0_i64, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      scf.for %arg10 = %c1 to %c3 step %c1 {
        %32 = arith.muli %arg10, %c16 : index
        %33 = arith.addi %14, %32 : index
        %34 = pto.addptr %15, %33 : <f32, gm> -> <f32, gm>
        %35 = pto.pointer_cast(%c98752_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %36 = pto.castptr %35 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %34, %36, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %37 = pto.addptr %19, %33 : <f32, gm> -> <f32, gm>
        %38 = pto.pointer_cast(%c0_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %39 = pto.castptr %38 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %37, %39, %c0_i64, %c64_i64 nburst(%c1_i64, %c0_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_dn2dn", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %40 = arith.muli %33, %c512 : index
        %41 = pto.addptr %24, %40 : <f32, gm> -> <f32, gm>
        %42 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %43 = pto.castptr %42 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        pto.mte_gm_ub %41, %43, %c0_i64, %c2048_i64 nburst(%c16_i64, %c2048_i64, %c2048_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        %44 = pto.fusion_region {
          %49 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %50 = pto.castptr %49 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %51 = pto.pointer_cast(%c98752_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %52 = pto.castptr %51 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %53 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"} : index -> !pto.vmi.mask<16xpred>
          %56 = pto.vmi.vload %50[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
          %57 = pto.vmi.vload %52[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
          %58 = pto.vmi.vmax %56, %57, %55 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          pto.vmi.vstore %58, %54[%c0], %55 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
          %59 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %60 = pto.castptr %59 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %61 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %62 = pto.castptr %61 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %63 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %64 = pto.castptr %63 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %65 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<16xpred>
          %66 = pto.vmi.vsub %56, %58, %65 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          %67 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %68 = pto.castptr %67 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %69 = pto.pointer_cast(%c32896_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %70 = pto.castptr %69 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %71 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<16xpred>
          %72 = pto.vmi.vexp %66, %71 : !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          pto.vmi.vstore %72, %70[%c0], %71 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
          %73 = pto.pointer_cast(%c98752_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %74 = pto.castptr %73 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %75 = pto.pointer_cast(%c32832_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %76 = pto.castptr %75 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %77 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %78 = pto.castptr %77 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %79 = pto.vmi.vsub %57, %58, %65 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          %80 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %81 = pto.castptr %80 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %82 = pto.pointer_cast(%c32960_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %83 = pto.castptr %82 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %84 = pto.vmi.vexp %79, %71 : !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          pto.vmi.vstore %84, %83[%c0], %71 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
          %85 = pto.pointer_cast(%c32896_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %86 = pto.castptr %85 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %87 = pto.pointer_cast(%c65920_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %88 = pto.castptr %87 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %89 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %90 = pto.castptr %89 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %91 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<16xpred>
          %92 = pto.vmi.vload %88[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
          %93 = pto.vmi.vmul %72, %92, %91 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          pto.vmi.vstore %93, %90[%c0], %91 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
          %94 = pto.pointer_cast(%c32960_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %95 = pto.castptr %94 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %96 = pto.pointer_cast(%c0_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %97 = pto.castptr %96 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %98 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %99 = pto.castptr %98 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %100 = pto.vmi.vload %97[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
          %101 = pto.vmi.vmul %84, %100, %91 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          %102 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %103 = pto.castptr %102 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %104 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %105 = pto.castptr %104 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %106 = pto.pointer_cast(%c33024_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
          %107 = pto.castptr %106 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %108 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<16xpred>
          %109 = pto.vmi.vadd %93, %101, %108 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
          pto.vmi.vstore %109, %107[%c0], %108 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
          %110 = pto.pointer_cast(%c33024_i64) %c16, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, strided<[1, 16], offset: ?>, #pto.address_space<vec>>
          %111 = pto.bind_tile %110, %c16, %c1 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, strided<[1, 16], offset: ?>, #pto.address_space<vec>> -> memref<16x1xf32, strided<[1, 16], offset: ?>, #pto.address_space<vec>>
          scf.for %arg11 = %c0 to %c16 step %c1 {
            %119 = scf.for %arg12 = %c0 to %c512 step %c64 iter_args(%arg13 = %c512) -> (index) {
              %120 = arith.index_cast %arg13 : index to i32
              %mask_8, %scalar_out_9 = pto.plt_b32 %120 : i32 -> !pto.mask<b32>, i32
              %121 = arith.index_cast %scalar_out_9 : i32 to index
              %122 = arith.subi %c512, %arg12 : index
              %123 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
              %subview_10 = memref.subview %123[%arg11, %arg12] [1, %122] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              %result_11 = pto.vlds %subview_10[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
              %124 = pto.pointer_cast(%c32896_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
              %subview_12 = memref.subview %124[%arg11, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              %result_13 = pto.vlds %subview_12[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
              %125 = pto.vdup %result_13, %mask_8 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vmul %result_11, %125, %mask_8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
              %subview_14 = memref.subview %127[%arg11, %arg12] [1, %122] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              pto.vsts %126, %subview_14[%c0], %mask_8 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
              scf.yield %121 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg11 = %c0 to %c16 step %c1 {
            %119 = scf.for %arg12 = %c0 to %c512 step %c64 iter_args(%arg13 = %c512) -> (index) {
              %120 = arith.index_cast %arg13 : index to i32
              %mask_8, %scalar_out_9 = pto.plt_b32 %120 : i32 -> !pto.mask<b32>, i32
              %121 = arith.index_cast %scalar_out_9 : i32 to index
              %122 = arith.subi %c512, %arg12 : index
              %123 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
              %subview_10 = memref.subview %123[%arg11, %arg12] [1, %122] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              %result_11 = pto.vlds %subview_10[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
              %124 = pto.pointer_cast(%c32960_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
              %subview_12 = memref.subview %124[%arg11, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              %result_13 = pto.vlds %subview_12[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
              %125 = pto.vdup %result_13, %mask_8 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vmul %result_11, %125, %mask_8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
              %subview_14 = memref.subview %127[%arg11, %arg12] [1, %122] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
              pto.vsts %126, %subview_14[%c0], %mask_8 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
              scf.yield %121 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %112 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %113 = pto.castptr %112 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %114 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %115 = pto.castptr %114 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %116 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
          %117 = pto.castptr %116 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %118 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<512xpred>
          scf.for %arg11 = %c0 to %c16 step %c1 {
            %119 = arith.muli %arg11, %c512 : index
            %120 = pto.vmi.vload %113[%119] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
            %121 = pto.vmi.vload %115[%119] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
            %122 = pto.vmi.vadd %120, %121, %118 : !pto.vmi.vreg<512xf32>, !pto.vmi.vreg<512xf32>, !pto.vmi.mask<512xpred> -> !pto.vmi.vreg<512xf32>
            pto.vmi.vstore %122, %117[%119], %118 : !pto.vmi.vreg<512xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<512xpred>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.yield(%111) : (memref<16x1xf32, strided<[1, 16], offset: ?>, #pto.address_space<vec>>) -> ()
        } {pto.fusion.group_id = 1 : i64} : memref<16x1xf32, strided<[1, 16], offset: ?>, #pto.address_space<vec>>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.pointer_cast(%c33024_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview = memref.subview %45[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast = memref.cast %subview : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result = pto.vlds %cast[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %46 = pto.pointer_cast(%c65920_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_1 = memref.subview %46[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_2 = memref.cast %subview_1 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %result, %cast_2[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
        %47 = pto.pointer_cast(%c32832_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_3 = memref.subview %47[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_4 = memref.cast %subview_3 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_5 = pto.vlds %cast_4[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %48 = pto.pointer_cast(%c65856_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %subview_6 = memref.subview %48[0, 0] [1, 16] [1, 1] : memref<1x16xf32, #pto.address_space<vec>> to memref<16xf32, strided<[1]>, #pto.address_space<vec>>
        %cast_7 = memref.cast %subview_6 : memref<16xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %result_5, %cast_7[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      }
      %28 = pto.castptr %arg5 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %29 = pto.addptr %28, %2 : <f32, gm> -> <f32, gm>
      %30 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %31 = pto.castptr %30 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.mte_gm_ub %29, %31, %c0_i64, %c64_i64 nburst(%c1_i64, %c4_i64, %c64_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>, pto.tilelib.candidate = "template_tload_nd2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.fusion_region {
        %32 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %33 = pto.castptr %32 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %34 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %35 = pto.castptr %34 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %36 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %37 = pto.castptr %36 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %38 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<16xpred>
        %39 = pto.vmi.vload %33[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
        %40 = pto.vmi.vsub %39, %39, %38 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        pto.vmi.vstore %40, %37[%c0], %38 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
        %41 = pto.pointer_cast(%c33088_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %42 = pto.castptr %41 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %43 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %44 = pto.castptr %43 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %45 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %46 = pto.castptr %45 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %47 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<16xpred>
        %48 = pto.vmi.vload %44[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
        %49 = pto.vmi.vadd %40, %48, %47 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        %50 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %51 = pto.castptr %50 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %52 = pto.pointer_cast(%c65856_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %53 = pto.castptr %52 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %54 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %55 = pto.castptr %54 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %56 = pto.vmi.vsub %49, %39, %38 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        %57 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %58 = pto.castptr %57 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %59 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %60 = pto.castptr %59 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %61 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<16xpred>
        %62 = pto.vmi.vexp %56, %61 : !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        %63 = pto.pointer_cast(%c65920_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %64 = pto.castptr %63 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %65 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %66 = pto.castptr %65 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %67 = pto.pointer_cast(%c64_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %68 = pto.castptr %67 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %69 = pto.vmi.vload %64[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
        %70 = pto.vmi.vadd %69, %62, %47 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        pto.vmi.vstore %70, %68[%c0], %47 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %76 = scf.for %arg11 = %c0 to %c512 step %c64 iter_args(%arg12 = %c512) -> (index) {
            %77 = arith.index_cast %arg12 : index to i32
            %mask, %scalar_out = pto.plt_b32 %77 : i32 -> !pto.mask<b32>, i32
            %78 = arith.index_cast %scalar_out : i32 to index
            %79 = arith.subi %c512, %arg11 : index
            %80 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
            %subview = memref.subview %80[%arg10, %arg11] [1, %79] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %81 = pto.pointer_cast(%c64_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
            %subview_1 = memref.subview %81[%arg10, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result_2 = pto.vlds %subview_1[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %82 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vdiv %result, %82, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
            %subview_3 = memref.subview %84[%arg10, %arg11] [1, %79] [1, 1] : memref<16x512xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            pto.vsts %83, %subview_3[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
            scf.yield %78 : index
          }
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %71 = pto.pointer_cast(%c65984_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
        %72 = pto.castptr %71 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %73 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %74 = pto.castptr %73 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %75 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<512xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %76 = arith.muli %arg10, %c512 : index
          %77 = pto.vmi.vload %72[%76] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<512xf32>
          %78 = pto.vmi.vcvt %77 {saturate = "SAT"} : !pto.vmi.vreg<512xf32> -> !pto.vmi.vreg<512xbf16>
          pto.vmi.vstore %78, %74[%76], %75 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 0 : i64} :
    } else {
      %13 = pto.pointer_cast(%c65984_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xf32, #pto.address_space<vec>>
      %14 = pto.castptr %13 : memref<16x512xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %17 = scf.for %arg11 = %c0 to %c512 step %c64 iter_args(%arg12 = %c512) -> (index) {
          %18 = arith.index_cast %arg12 : index to i32
          %mask, %scalar_out = pto.plt_b32 %18 : i32 -> !pto.mask<b32>, i32
          %19 = arith.index_cast %scalar_out : i32 to index
          %20 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = arith.muli %arg10, %c512 : index
          %22 = arith.addi %21, %arg11 : index
          %23 = pto.addptr %14, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %20, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %19 : index
        }
      } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      %15 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
      %16 = pto.castptr %15 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %17 = scf.for %arg11 = %c0 to %c512 step %c128 iter_args(%arg12 = %c512) -> (index) {
          %18 = arith.index_cast %arg12 : index to i32
          %mask, %scalar_out = pto.plt_b16 %18 : i32 -> !pto.mask<b16>, i32
          %19 = arith.index_cast %scalar_out : i32 to index
          %20 = pto.vdup %cst, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
          %21 = arith.muli %arg10, %c512 : index
          %22 = arith.addi %21, %arg11 : index
          %23 = pto.addptr %16, %22 : <bf16, ub> -> <bf16, ub>
          pto.vsts %20, %23[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
          scf.yield %19 : index
        }
      } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      pto.fusion_region {
        %17 = pto.pointer_cast(%c33088_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %18 = pto.castptr %17 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %19 = pto.pointer_cast(%c64_i64) %c16, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x512xbf16, #pto.address_space<vec>>
        %20 = pto.castptr %19 : memref<16x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %21 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %22 = arith.muli %arg10, %c512 : index
          %23 = pto.vmi.vload %18[%22] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<512xbf16>
          pto.vmi.vstore %23, %20[%22], %21 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
    }
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
  }
  return
}
