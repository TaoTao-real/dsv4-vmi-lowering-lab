// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @rmsnorm_rope(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xbf16, #pto.address_space<gm>>, %arg4: memref<?xbf16, #pto.address_space<gm>>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c16_i32 = arith.constant 16 : i32
    %c32_i32 = arith.constant 32 : i32
    %c4_i64 = arith.constant 4 : i64
    %c512_i64 = arith.constant 512 : i64
    %c1_i64 = arith.constant 1 : i64
    %c64_i32 = arith.constant 64 : i32
    %c16_i64 = arith.constant 16 : i64
    %cst = arith.constant 2.000000e+00 : f32
    %cst_0 = arith.constant 5.000000e-01 : f32
    %cst_1 = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 9.99999997E-7 : f32
    %cst_3 = arith.constant 7.812500e-03 : f32
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %cst_4 = arith.constant 0.000000e+00 : f32
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
    %0 = pto.pointer_cast(%c25152_i64) %c16, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x32xf32, #pto.address_space<vec>>
    %1 = pto.castptr %0 : memref<16x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %mask_19, %scalar_out_20 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %81 = pto.vdup %cst_4, %mask_19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %82 = arith.muli %arg5, %c32 : index
      %83 = pto.addptr %1, %82 : <f32, ub> -> <f32, ub>
      pto.vsts %81, %83[%c0], %mask_19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %2 = pto.pointer_cast(%c29248_i64) %c16, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x32xf32, #pto.address_space<vec>>
    %3 = pto.castptr %2 : memref<16x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %mask_19, %scalar_out_20 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
      %81 = pto.vdup %cst_4, %mask_19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %82 = arith.muli %arg5, %c32 : index
      %83 = pto.addptr %3, %82 : <f32, ub> -> <f32, ub>
      pto.vsts %81, %83[%c0], %mask_19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %4 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %5 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %6 = pto.castptr %5 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %7 = pto.addptr %4, %c0 : <f32, gm> -> <f32, gm>
    %8 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %7, %8, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.fusion_region {
      %81 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c25152_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg5 = %c0 to %c4 step %c1 {
        %86 = arith.muli %arg5, %c32 : index
        %87 = pto.vmi.vload %82[%86] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %87, %84[%86], %85 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 0 : i64} :
    %9 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %10 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %11 = pto.castptr %10 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %12 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
    %13 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %12, %13, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    pto.fusion_region {
      %81 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c29248_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
      scf.for %arg5 = %c0 to %c4 step %c1 {
        %86 = arith.muli %arg5, %c32 : index
        %87 = pto.vmi.vload %82[%86] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
        pto.vmi.vstore %87, %84[%86], %85 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
      } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 1 : i64} :
    %14 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %15 = pto.castptr %14 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
    %16 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %17 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
    pto.vsts %16, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    scf.for %arg5 = %c0 to %c128 step %c64 {
      %81 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %82 = pto.addptr %81, %arg5 : <f32, gm> -> <f32, gm>
      %83 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.addptr %82, %c0 : <f32, gm> -> <f32, gm>
      %86 = pto.addptr %84, %c0 : <f32, ub> -> <f32, ub>
      pto.mte_gm_ub %85, %86, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
      pto.fusion_region {
        %87 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %88 = pto.castptr %87 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %89 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %90 = pto.castptr %89 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %91 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %92 = pto.castptr %91 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %93 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
        %94 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %95 = pto.castptr %94 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %96 = pto.pointer_cast(%c12288_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
        %97 = pto.castptr %96 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %98 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<64xpred>
        %99 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
        scf.for %arg6 = %c0 to %c16 step %c1 {
          %110 = arith.muli %arg6, %c64 : index
          %111 = pto.vmi.vload %88[%110] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          %112 = pto.vmi.vload %90[%110] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          %113 = pto.vmi.vmul %111, %112, %93 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %113, %92[%110], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          %114 = arith.muli %arg6, %c64 : index
          %115 = pto.vmi.vload %95[%114] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          %116 = pto.vmi.vcadd %115, %98 {reassoc} : !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<1xf32>
          pto.vmi.vstore %116, %97[%arg6], %99 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %100 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %101 = pto.castptr %100 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %102 = pto.pointer_cast(%c12288_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %103 = pto.castptr %102 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %104 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
        %105 = pto.castptr %104 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %106 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<16xpred>
        %107 = pto.vmi.vload %101[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
        %108 = pto.vmi.vload %103[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
        %109 = pto.vmi.vadd %107, %108, %106 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
        pto.vmi.vstore %109, %105[%c0], %106 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 7 : i64} :
    }
    pto.fusion_region {
      %81 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<16xpred>
      %86 = pto.vmi.vload %82[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
      %87 = pto.vmi.vmuls %86, %cst_3, %85 : !pto.vmi.vreg<16xf32>, f32, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
      pto.vmi.vstore %87, %84[%c0], %85 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
      %88 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %89 = pto.castptr %88 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %90 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %91 = pto.castptr %90 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %92 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<16xpred>
      %93 = pto.vmi.vload %89[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
      %94 = pto.vmi.vadds %93, %cst_2, %92 : !pto.vmi.vreg<16xf32>, f32, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
      pto.vmi.vstore %94, %91[%c0], %92 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 2 : i64} :
    %18 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %19 = pto.castptr %18 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %20 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %21 = pto.castptr %20 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %22 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tsqrt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsqrt"} : index -> !pto.vmi.mask<16xpred>
    %23 = pto.vmi.vload %19[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
    %24 = pto.vmi.vsqrt %23, %22 : !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
    pto.vmi.vstore %24, %21[%c0], %22 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
    %25 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %26 = pto.castptr %25 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %27 = pto.pointer_cast(%c16448_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %28 = pto.castptr %27 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %29 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"} : index -> !pto.vmi.mask<16xpred>
    %30 = pto.vmi.vload %26[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
    %31 = pto.vmi.vbrc %cst_1 : f32 -> !pto.vmi.vreg<16xf32>
    %32 = pto.vmi.vdiv %31, %30, %29 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
    pto.vmi.vstore %32, %28[%c0], %29 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
    %33 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %34 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %35 = pto.castptr %34 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %36 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
    %37 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %36, %37, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %38 = pto.castptr %arg3 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %39 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %40 = pto.castptr %39 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %41 = pto.addptr %38, %c0 : <bf16, gm> -> <bf16, gm>
    %42 = pto.addptr %40, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %41, %42, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %mask_5, %scalar_out_6 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
    %43 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
    %44 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %subview = memref.subview %44[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
    %cast = memref.cast %subview : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result = pto.vlds %cast[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
    %45 = pto.vcvt %result, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
    %46 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_7 = memref.subview %46[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_8 = memref.cast %subview_7 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %45, %cast_8[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_19 = memref.subview %81[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %82 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %82[%arg5, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_23 = pto.vlds %subview_22[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %83 = pto.vdup %result_23, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %84 = pto.vmul %result_21, %83, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %85 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_24 = memref.subview %85[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_25 = memref.cast %subview_24 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %84, %cast_25[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    %47 = pto.fusion_region {
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
      %88 = pto.vmi.vload %84[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %95 = arith.muli %arg5, %c64 : index
        %96 = pto.vmi.vload %82[%95] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %97 = pto.vmi.vmul %96, %88, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %97, %86[%95], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      %89 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %90 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %91 = pto.castptr %90 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %92 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
      %93 = pto.castptr %92 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %94 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %95 = arith.muli %arg5, %c64 : index
        %96 = pto.vmi.vload %91[%95] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %97 = pto.vmi.vcvt %96 {saturate = "SAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xbf16>
        pto.vmi.vstore %97, %93[%95], %94 : !pto.vmi.vreg<64xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%89) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 3 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    %48 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %49 = pto.castptr %48 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %50 = pto.castptr %arg4 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
    %51 = pto.addptr %49, %c0 : <bf16, ub> -> <bf16, ub>
    %52 = pto.addptr %50, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %51, %52, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    %53 = pto.addptr %33, %c64 : <f32, gm> -> <f32, gm>
    %54 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %55 = pto.castptr %54 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %56 = pto.addptr %53, %c0 : <f32, gm> -> <f32, gm>
    %57 = pto.addptr %55, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %56, %57, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %58 = pto.addptr %38, %c64 : <bf16, gm> -> <bf16, gm>
    %59 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %60 = pto.castptr %59 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %61 = pto.addptr %58, %c0 : <bf16, gm> -> <bf16, gm>
    %62 = pto.addptr %60, %c0 : <bf16, ub> -> <bf16, ub>
    pto.mte_gm_ub %61, %62, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
    %63 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
    %subview_9 = memref.subview %63[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
    %cast_10 = memref.cast %subview_9 : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_11 = pto.vlds %cast_10[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
    %64 = pto.vcvt %result_11, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
    %65 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_12 = memref.subview %65[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_13 = memref.cast %subview_12 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %64, %cast_13[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_19 = memref.subview %81[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %82 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %82[%arg5, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_23 = pto.vlds %subview_22[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %83 = pto.vdup %result_23, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %84 = pto.vmul %result_21, %83, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %85 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_24 = memref.subview %85[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_25 = memref.cast %subview_24 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %84, %cast_25[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
    %66 = pto.fusion_region {
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %82 = pto.bind_tile %81, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %83 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %88 = pto.castptr %87 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %89 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
      %90 = pto.vmi.vload %86[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %91 = arith.muli %arg5, %c64 : index
        %92 = pto.vmi.vload %84[%91] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %93 = pto.vmi.vmul %92, %90, %89 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %93, %88[%91], %89 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      pto.yield(%82) : (memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>) -> ()
    } {pto.fusion.group_id = 4 : i64} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
    %67 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %68 = pto.castptr %67 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = pto.vdup %cst_1, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %82 = arith.muli %arg5, %c64 : index
      %83 = pto.addptr %68, %82 : <f32, ub> -> <f32, ub>
      pto.vsts %81, %83[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
    %69 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %70 = pto.castptr %69 : memref<1x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
    scf.for %arg5 = %c0 to %c64 step %c1 {
      %81 = arith.index_cast %arg5 : index to i32
      pto.store %81, %70[%arg5] : !pto.ptr<i32, ub>, i32
    } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
    %71 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %subview_14 = memref.subview %71[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
    %cast_15 = memref.cast %subview_14 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_16 = pto.vlds %cast_15[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %72 = pto.vcvt %result_16, %mask_5 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %73 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_17 = memref.subview %73[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_18 = memref.cast %subview_17 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %72, %cast_18[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %74:3 = pto.fusion_region {
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
        %129 = arith.muli %arg5, %c64 : index
        %130 = pto.vmi.vload %82[%129] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %131 = pto.vmi.vmul %130, %88, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %131, %86[%129], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %132 = arith.muli %arg5, %c64 : index
        %133 = pto.vmi.vload %90[%132] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %134 = pto.vmi.vmuls %133, %cst_0, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %134, %92[%132], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %subview_19 = memref.subview %129[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %130 = pto.vcvt %result_21, %mask_5 {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        %131 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
        %subview_22 = memref.subview %131[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %130, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
        %subview_19 = memref.subview %129[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
        %130 = pto.vcvt %result_21, %mask_5 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %131 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %subview_22 = memref.subview %131[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %130, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      %94 = pto.pointer_cast(%c16448_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %95 = pto.bind_tile %94, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %subview_19 = memref.subview %129[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %130 = pto.vcvt %result_21, %mask_5 {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        %131 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
        %subview_22 = memref.subview %131[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %130, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      %96 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %97 = pto.castptr %96 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %98 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %99 = pto.castptr %98 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %100 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %101 = pto.castptr %100 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %102 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %103 = pto.castptr %102 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %104 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %105 = pto.castptr %104 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %106 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
      %107 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %108 = pto.castptr %107 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %109 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %110 = pto.castptr %109 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %111 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<64xpred>
      %112 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %113 = pto.castptr %112 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %114 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %115 = pto.castptr %114 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %116 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %117 = pto.castptr %116 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %118 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %119 = pto.castptr %118 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %120 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %121 = pto.castptr %120 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = arith.muli %arg5, %c64 : index
        %130 = pto.vmi.vload %97[%129] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %131 = pto.vmi.vmuls %130, %cst, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %131, %99[%129], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %132 = arith.muli %arg5, %c64 : index
        %133 = pto.vmi.vload %101[%132] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %134 = pto.vmi.vload %103[%132] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %135 = pto.vmi.vsub %133, %134, %106 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %135, %105[%132], %106 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %136 = arith.muli %arg5, %c64 : index
        %137 = pto.vmi.vload %108[%136] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %138 = pto.vmi.vadds %137, %cst_1, %111 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %138, %110[%136], %111 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %139 = arith.muli %arg5, %c64 : index
        %140 = pto.vmi.vload %113[%139] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %141 = pto.vmi.vmuls %140, %cst, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %141, %115[%139], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %142 = arith.muli %arg5, %c64 : index
        %143 = pto.vmi.vload %117[%142] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %144 = pto.vmi.vload %119[%142] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %145 = pto.vmi.vsub %143, %144, %106 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %145, %121[%142], %106 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %122 = pto.pointer_cast(%c0_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %123 = pto.bind_tile %122, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
        %subview_19 = memref.subview %129[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
        %130 = pto.vcvt %result_21, %mask_5 {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
        %131 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
        %subview_22 = memref.subview %131[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
        pto.vsts %130, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      %124 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %125 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %126 = pto.castptr %125 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %127 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %128 = pto.castptr %127 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %129 = arith.muli %arg5, %c64 : index
        %130 = pto.vmi.vload %126[%129] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %131 = pto.vmi.vmuls %130, %cst, %93 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %131, %128[%129], %93 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      pto.yield(%95, %123, %124) : (memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 5 : i64} : memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, memref<16x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>, !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_19 = memref.subview %81[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
      %82 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
      %83 = pto.vsub %result_21, %82, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %84 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %84[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %83, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = arith.index_cast %arg5 : index to i64
      %82 = arith.muli %81, %c128_i64 : i64
      %83 = arith.addi %82, %c25152_i64 : i64
      %84 = arith.muli %81, %c256_i64 : i64
      %85 = arith.addi %84, %c16448_i64 : i64
      %86 = pto.pointer_cast(%83) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %87 = pto.castptr %86 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %88 = pto.pointer_cast(%85) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_19 = memref.subview %88[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %89 = pto.vgather2 %87, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %90 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %90[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %89, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %91 = arith.addi %84, %c20544_i64 : i64
      pto.fusion_region {
        %92 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %93 = pto.castptr %92 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %94 = pto.pointer_cast(%91) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %95 = pto.castptr %94 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %96 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %97 = pto.vmi.vload %93[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %97, %95[%c0], %96 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 8 : i64} :
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = arith.index_cast %arg5 : index to i64
      %82 = arith.muli %81, %c128_i64 : i64
      %83 = arith.addi %82, %c29248_i64 : i64
      %84 = arith.muli %81, %c256_i64 : i64
      %85 = arith.addi %84, %c16448_i64 : i64
      %86 = pto.pointer_cast(%83) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
      %87 = pto.castptr %86 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %88 = pto.pointer_cast(%85) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_19 = memref.subview %88[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %89 = pto.vgather2 %87, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %90 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %90[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %89, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %91 = arith.addi %84, %c25152_i64 : i64
      pto.fusion_region {
        %92 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %93 = pto.castptr %92 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %94 = pto.pointer_cast(%91) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %95 = pto.castptr %94 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %96 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %97 = pto.vmi.vload %93[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %97, %95[%c0], %96 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 9 : i64} :
    }
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %81 = arith.index_cast %arg5 : index to i64
      %82 = arith.muli %81, %c256_i64 : i64
      %83 = arith.addi %82, %c4096_i64 : i64
      %84 = pto.pointer_cast(%83) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %85 = pto.castptr %84 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %86 = pto.pointer_cast(%82) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
      %subview_19 = memref.subview %86[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
      %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
      %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
      %87 = pto.vgather2 %85, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
      %88 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %subview_22 = memref.subview %88[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
      %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
      pto.vsts %87, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
      %89 = arith.addi %82, %c16448_i64 : i64
      pto.fusion_region {
        %90 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %91 = pto.castptr %90 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %92 = pto.pointer_cast(%89) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
        %93 = pto.castptr %92 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %94 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        %95 = pto.vmi.vload %91[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %95, %93[%c0], %94 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 10 : i64} :
    }
    %75 = pto.fusion_region {
      %81 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %82 = pto.castptr %81 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %83 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %84 = pto.castptr %83 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %85 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %86 = pto.castptr %85 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %87 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
      %88 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %89 = pto.castptr %88 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %90 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %91 = pto.castptr %90 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %92 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %93 = pto.castptr %92 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %94 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %95 = pto.castptr %94 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %96 = pto.pointer_cast(%c25152_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %97 = pto.castptr %96 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %98 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %99 = pto.castptr %98 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %100 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %101 = pto.castptr %100 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %102 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %103 = pto.castptr %102 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %104 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %105 = pto.castptr %104 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %106 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %113 = arith.muli %arg5, %c64 : index
        %114 = pto.vmi.vload %82[%113] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %115 = pto.vmi.vload %84[%113] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %116 = pto.vmi.vmul %114, %115, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %116, %86[%113], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %117 = arith.muli %arg5, %c64 : index
        %118 = pto.vmi.vload %89[%117] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %119 = pto.vmi.vload %91[%117] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %120 = pto.vmi.vmul %118, %119, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %120, %93[%117], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %121 = arith.muli %arg5, %c64 : index
        %122 = pto.vmi.vload %95[%121] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %123 = pto.vmi.vload %97[%121] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %124 = pto.vmi.vmul %122, %123, %87 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %124, %99[%121], %87 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %125 = arith.muli %arg5, %c64 : index
        %126 = pto.vmi.vload %101[%125] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %127 = pto.vmi.vload %103[%125] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %128 = pto.vmi.vadd %126, %127, %106 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %128, %105[%125], %106 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      %107 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      %108 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %109 = pto.castptr %108 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %110 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
      %111 = pto.castptr %110 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
      %112 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %113 = arith.muli %arg5, %c64 : index
        %114 = pto.vmi.vload %109[%113] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %115 = pto.vmi.vcvt %114 {saturate = "SAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xbf16>
        pto.vmi.vstore %115, %111[%113], %112 : !pto.vmi.vreg<64xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      pto.yield(%107) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
    } {pto.fusion.group_id = 6 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    %76 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %77 = pto.castptr %76 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %78 = pto.addptr %50, %c64 : <bf16, gm> -> <bf16, gm>
    %79 = pto.addptr %77, %c0 : <bf16, ub> -> <bf16, ub>
    %80 = pto.addptr %78, %c0 : <bf16, gm> -> <bf16, gm>
    pto.mte_ub_gm %79, %80, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
    return
  }
}
