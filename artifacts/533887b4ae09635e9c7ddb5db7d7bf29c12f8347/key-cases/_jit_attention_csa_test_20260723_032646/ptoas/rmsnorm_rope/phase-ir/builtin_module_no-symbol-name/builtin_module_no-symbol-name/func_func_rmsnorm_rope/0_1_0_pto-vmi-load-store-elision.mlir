// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
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
    %94 = pto.vdup %cst_4, %mask_19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %95 = arith.muli %arg5, %c32 : index
    %96 = pto.addptr %1, %95 : <f32, ub> -> <f32, ub>
    pto.vsts %94, %96[%c0], %mask_19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
  %2 = pto.pointer_cast(%c29248_i64) %c16, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x32xf32, #pto.address_space<vec>>
  %3 = pto.castptr %2 : memref<16x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %mask_19, %scalar_out_20 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
    %94 = pto.vdup %cst_4, %mask_19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %95 = arith.muli %arg5, %c32 : index
    %96 = pto.addptr %3, %95 : <f32, ub> -> <f32, ub>
    pto.vsts %94, %96[%c0], %mask_19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
  %4 = pto.castptr %arg0 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
  %5 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
  %6 = pto.castptr %5 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %7 = pto.addptr %4, %c0 : <f32, gm> -> <f32, gm>
  %8 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
  pto.mte_gm_ub %7, %8, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
  pto.fusion_region {
    %94 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %95 = pto.castptr %94 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %96 = pto.pointer_cast(%c25152_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
    scf.for %arg5 = %c0 to %c4 step %c1 {
      %99 = arith.muli %arg5, %c32 : index
      %100 = pto.vmi.vload %95[%99] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
      pto.vmi.vstore %100, %97[%99], %98 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
    } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 0 : i64} : 
  %9 = pto.castptr %arg1 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
  %10 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
  %11 = pto.castptr %10 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %12 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
  %13 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
  pto.mte_gm_ub %12, %13, %c0_i64, %c128_i64 nburst(%c4_i64, %c128_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
  pto.fusion_region {
    %94 = pto.pointer_cast(%c4096_i64) %c4, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %95 = pto.castptr %94 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %96 = pto.pointer_cast(%c29248_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<4x32xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<4x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = pto.vmi.create_mask %c32 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<32xpred>
    scf.for %arg5 = %c0 to %c4 step %c1 {
      %99 = arith.muli %arg5, %c32 : index
      %100 = pto.vmi.vload %95[%99] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<32xf32>
      pto.vmi.vstore %100, %97[%99], %98 : !pto.vmi.vreg<32xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<32xpred>
    } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 1 : i64} : 
  %14 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
  %15 = pto.castptr %14 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
  %16 = pto.vdup %cst_4, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
  %17 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
  pto.vsts %16, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  scf.for %arg5 = %c0 to %c128 step %c64 {
    %94 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %95 = pto.addptr %94, %arg5 : <f32, gm> -> <f32, gm>
    %96 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = pto.addptr %95, %c0 : <f32, gm> -> <f32, gm>
    %99 = pto.addptr %97, %c0 : <f32, ub> -> <f32, ub>
    pto.mte_gm_ub %98, %99, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
    %100 = pto.fusion_region {
      %101 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      %102 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %103 = pto.castptr %102 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %104 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %105 = pto.castptr %104 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %106 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %107 = pto.castptr %106 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %108 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %109 = arith.muli %arg6, %c64 : index
        %110 = pto.vmi.vload %103[%109] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %111 = pto.vmi.vmul %110, %110, %108 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %111, %107[%109], %108 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      pto.yield(%101) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    pto.fusion_region {
      %101 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
      %102 = pto.castptr %101 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %103 = pto.pointer_cast(%c12288_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
      %104 = pto.castptr %103 : memref<16x1xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %105 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<64xpred>
      %106 = pto.vmi.create_mask %c1 {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : index -> !pto.vmi.mask<1xpred>
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %107 = arith.muli %arg6, %c64 : index
        %108 = pto.vmi.vload %102[%107] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %109 = pto.vmi.vcadd %108, %105 {reassoc} : !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<1xf32>
        pto.vmi.vstore %109, %104[%arg6], %106 : !pto.vmi.vreg<1xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<1xpred>
      } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 21 : i64} : 
    pto.fusion_region {
      %101 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %102 = pto.castptr %101 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %103 = pto.pointer_cast(%c12288_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %104 = pto.castptr %103 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %105 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
      %106 = pto.castptr %105 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %107 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<16xpred>
      %108 = pto.vmi.vload %102[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
      %109 = pto.vmi.vload %104[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
      %110 = pto.vmi.vadd %108, %109, %107 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
      pto.vmi.vstore %110, %106[%c0], %107 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 22 : i64} : 
  }
  %18 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
    %95 = pto.pointer_cast(%c12352_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<16xpred>
    %100 = pto.vmi.vload %96[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
    %101 = pto.vmi.vmuls %100, %cst_3, %99 : !pto.vmi.vreg<16xf32>, f32, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
    pto.vmi.vstore %101, %98[%c0], %99 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
    pto.yield(%94) : (!pto.tile_buf<vec, 1x16xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
  pto.fusion_region {
    %94 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %95 = pto.castptr %94 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %96 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<16xpred>
    %99 = pto.vmi.vload %95[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
    %100 = pto.vmi.vadds %99, %cst_2, %98 : !pto.vmi.vreg<16xf32>, f32, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
    pto.vmi.vstore %100, %97[%c0], %98 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
    pto.yield() : () -> ()
  } {pto.fusion.group_id = 3 : i64} : 
  %19 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
  %20 = pto.castptr %19 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %21 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
  %22 = pto.castptr %21 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %23 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_tsqrt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsqrt"} : index -> !pto.vmi.mask<16xpred>
  %24 = pto.vmi.vload %20[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
  %25 = pto.vmi.vsqrt %24, %23 : !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
  pto.vmi.vstore %25, %22[%c0], %23 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
  %26 = pto.pointer_cast(%c4096_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
  %27 = pto.castptr %26 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %28 = pto.pointer_cast(%c16448_i64) %c1, %c16 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x16xf32, #pto.address_space<vec>>
  %29 = pto.castptr %28 : memref<1x16xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %30 = pto.vmi.create_mask %c16 {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"} : index -> !pto.vmi.mask<16xpred>
  %31 = pto.vmi.vload %27[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<16xf32>
  %32 = pto.vmi.vbrc %cst_1 : f32 -> !pto.vmi.vreg<16xf32>
  %33 = pto.vmi.vdiv %32, %31, %30 : !pto.vmi.vreg<16xf32>, !pto.vmi.vreg<16xf32>, !pto.vmi.mask<16xpred> -> !pto.vmi.vreg<16xf32>
  pto.vmi.vstore %33, %29[%c0], %30 : !pto.vmi.vreg<16xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<16xpred>
  %34 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
  %35 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
  %36 = pto.castptr %35 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %37 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
  %38 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
  pto.mte_gm_ub %37, %38, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
  %39 = pto.castptr %arg3 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
  %40 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
  %41 = pto.castptr %40 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
  %42 = pto.addptr %39, %c0 : <bf16, gm> -> <bf16, gm>
  %43 = pto.addptr %41, %c0 : <bf16, ub> -> <bf16, ub>
  pto.mte_gm_ub %42, %43, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
  %mask_5, %scalar_out_6 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
  %44 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
  %45 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
  %subview = memref.subview %45[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
  %cast = memref.cast %subview : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
  %result = pto.vlds %cast[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
  %46 = pto.vcvt %result, %44 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
  %47 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
  %subview_7 = memref.subview %47[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_8 = memref.cast %subview_7 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  pto.vsts %46, %cast_8[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %95[%arg5, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_23 = pto.vlds %subview_22[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %96 = pto.vdup %result_23, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %97 = pto.vmul %result_21, %96, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %98 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_24 = memref.subview %98[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_25 = memref.cast %subview_24 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %97, %cast_25[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
  %48 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
    %102 = pto.vmi.vload %98[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %103 = arith.muli %arg5, %c64 : index
      %104 = pto.vmi.vload %96[%103] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vmul %104, %102, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%103], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 4 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %49 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    %95 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vcvt %101 {saturate = "SAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xbf16>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
  %50 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
  %51 = pto.castptr %50 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
  %52 = pto.castptr %arg4 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
  %53 = pto.addptr %51, %c0 : <bf16, ub> -> <bf16, ub>
  %54 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
  pto.mte_ub_gm %53, %54, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
  %55 = pto.addptr %34, %c64 : <f32, gm> -> <f32, gm>
  %56 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
  %57 = pto.castptr %56 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  %58 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
  %59 = pto.addptr %57, %c0 : <f32, ub> -> <f32, ub>
  pto.mte_gm_ub %58, %59, %c0_i64, %c256_i64 nburst(%c16_i64, %c512_i64, %c256_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
  %60 = pto.addptr %39, %c64 : <bf16, gm> -> <bf16, gm>
  %61 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
  %62 = pto.castptr %61 : memref<1x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
  %63 = pto.addptr %60, %c0 : <bf16, gm> -> <bf16, gm>
  %64 = pto.addptr %62, %c0 : <bf16, ub> -> <bf16, ub>
  pto.mte_gm_ub %63, %64, %c0_i64, %c128_i64 nburst(%c1_i64, %c0_i64, %c128_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
  %65 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xbf16, #pto.address_space<vec>>
  %subview_9 = memref.subview %65[0, 0] [1, 64] [1, 1] : memref<1x64xbf16, #pto.address_space<vec>> to memref<64xbf16, strided<[1]>, #pto.address_space<vec>>
  %cast_10 = memref.cast %subview_9 : memref<64xbf16, strided<[1]>, #pto.address_space<vec>> to memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>>
  %result_11 = pto.vlds %cast_10[%c0] {dist = "UNPK_B16"} : memref<?xbf16, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<128xbf16>
  %66 = pto.vcvt %result_11, %44 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
  %67 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
  %subview_12 = memref.subview %67[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_13 = memref.cast %subview_12 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  pto.vsts %66, %cast_13[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.pointer_cast(%c16448_i64) %c16, %c1 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x1xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %95[%arg5, 0] [1, 1] [1, 1] : memref<16x1xf32, #pto.address_space<vec>> to memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_23 = pto.vlds %subview_22[%c0] : memref<1xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %96 = pto.vdup %result_23, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %97 = pto.vmul %result_21, %96, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %98 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_24 = memref.subview %98[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_25 = memref.cast %subview_24 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %97, %cast_25[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
  %68 = pto.fusion_region {
    %94 = pto.pointer_cast(%c4096_i64) %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
    %95 = pto.bind_tile %94, %c16, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
    %96 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %97 = pto.castptr %96 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %98 = pto.pointer_cast(%c0_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %99 = pto.castptr %98 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %100 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %101 = pto.castptr %100 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %102 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
    %103 = pto.vmi.vload %99[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %104 = arith.muli %arg5, %c64 : index
      %105 = pto.vmi.vload %97[%104] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %106 = pto.vmi.vmul %105, %103, %102 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %106, %101[%104], %102 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
    pto.yield(%95) : (memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>) -> ()
  } {pto.fusion.group_id = 6 : i64} : memref<16x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
  %69 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
  %70 = pto.castptr %69 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.vdup %cst_1, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
    %95 = arith.muli %arg5, %c64 : index
    %96 = pto.addptr %70, %95 : <f32, ub> -> <f32, ub>
    pto.vsts %94, %96[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
  %71 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
  %72 = pto.castptr %71 : memref<1x64xi32, #pto.address_space<vec>> -> !pto.ptr<i32, ub>
  scf.for %arg5 = %c0 to %c64 step %c1 {
    %94 = arith.index_cast %arg5 : index to i32
    pto.store %94, %72[%arg5] : !pto.ptr<i32, ub>, i32
  } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
  %73 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
  %subview_14 = memref.subview %73[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
  %cast_15 = memref.cast %subview_14 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
  %result_16 = pto.vlds %cast_15[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
  %74 = pto.vcvt %result_16, %mask_5 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
  %75 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
  %subview_17 = memref.subview %75[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
  %cast_18 = memref.cast %subview_17 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
  pto.vsts %74, %cast_18[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  %76 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : index -> !pto.vmi.mask<64xpred>
    %102 = pto.vmi.vload %98[%c0] {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"} : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %103 = arith.muli %arg5, %c64 : index
      %104 = pto.vmi.vload %96[%103] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vmul %104, %102, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%103], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 7 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %77 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vmuls %101, %cst_0, %99 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.vcvt %result_21, %mask_5 {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
    %96 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
    %subview_22 = memref.subview %96[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %95, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %95 = pto.vcvt %result_21, %mask_5 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %96 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %96[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %95, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.vcvt %result_21, %mask_5 {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
    %96 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
    %subview_22 = memref.subview %96[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %95, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
  %78 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vmuls %101, %cst, %99 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 9 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %79 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vsub %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 10 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %80 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vadds %101, %cst_1, %99 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %81 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c20544_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vmuls %101, %cst, %99 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 12 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %82 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vsub %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 13 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.vcvt %result_21, %mask_5 {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
    %96 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xi32, #pto.address_space<vec>>
    %subview_22 = memref.subview %96[%arg5, 0] [1, 64] [1, 1] : memref<16x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xi32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %95, %cast_23[%c0], %mask_5 : !pto.vreg<64xi32>, memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
  %83 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vmuls %101, %cst, %99 : !pto.vmi.vreg<64xf32>, f32, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_19 = memref.subview %94[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
    %95 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
    %96 = pto.vsub %result_21, %95, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %97[%arg5, 0] [1, 64] [1, 1] : memref<16x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1], offset: ?>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %96, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
  } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = arith.index_cast %arg5 : index to i64
    %95 = arith.muli %94, %c128_i64 : i64
    %96 = arith.addi %95, %c25152_i64 : i64
    %97 = arith.muli %94, %c256_i64 : i64
    %98 = arith.addi %97, %c16448_i64 : i64
    %99 = pto.pointer_cast(%96) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.pointer_cast(%98) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %subview_19 = memref.subview %101[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %102 = pto.vgather2 %100, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %103 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %103[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %102, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %104 = arith.addi %97, %c20544_i64 : i64
    pto.fusion_region {
      %105 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %106 = pto.castptr %105 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %107 = pto.pointer_cast(%104) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %108 = pto.castptr %107 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %109 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
      %110 = pto.vmi.vload %106[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %110, %108[%c0], %109 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 23 : i64} : 
  }
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = arith.index_cast %arg5 : index to i64
    %95 = arith.muli %94, %c128_i64 : i64
    %96 = arith.addi %95, %c29248_i64 : i64
    %97 = arith.muli %94, %c256_i64 : i64
    %98 = arith.addi %97, %c16448_i64 : i64
    %99 = pto.pointer_cast(%96) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x32xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<1x32xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.pointer_cast(%98) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %subview_19 = memref.subview %101[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %102 = pto.vgather2 %100, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %103 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %103[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %102, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %104 = arith.addi %97, %c25152_i64 : i64
    pto.fusion_region {
      %105 = pto.pointer_cast(%c24896_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %106 = pto.castptr %105 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %107 = pto.pointer_cast(%104) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %108 = pto.castptr %107 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %109 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
      %110 = pto.vmi.vload %106[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %110, %108[%c0], %109 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 24 : i64} : 
  }
  scf.for %arg5 = %c0 to %c16 step %c1 {
    %94 = arith.index_cast %arg5 : index to i64
    %95 = arith.muli %94, %c256_i64 : i64
    %96 = arith.addi %95, %c4096_i64 : i64
    %97 = pto.pointer_cast(%96) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%95) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xi32, #pto.address_space<vec>>
    %subview_19 = memref.subview %99[0, 0] [1, 64] [1, 1] : memref<1x64xi32, #pto.address_space<vec>> to memref<64xi32, strided<[1]>, #pto.address_space<vec>>
    %cast_20 = memref.cast %subview_19 : memref<64xi32, strided<[1]>, #pto.address_space<vec>> to memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>>
    %result_21 = pto.vlds %cast_20[%c0] : memref<?xi32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xi32>
    %100 = pto.vgather2 %98, %result_21, %mask_5 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
    %101 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
    %subview_22 = memref.subview %101[0, 0] [1, 64] [1, 1] : memref<1x64xf32, #pto.address_space<vec>> to memref<64xf32, strided<[1]>, #pto.address_space<vec>>
    %cast_23 = memref.cast %subview_22 : memref<64xf32, strided<[1]>, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
    pto.vsts %100, %cast_23[%c0], %mask_5 : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
    %102 = arith.addi %95, %c16448_i64 : i64
    pto.fusion_region {
      %103 = pto.pointer_cast(%c24640_i64) %c1, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %104 = pto.castptr %103 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %105 = pto.pointer_cast(%102) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x64xf32, #pto.address_space<vec>>
      %106 = pto.castptr %105 : memref<1x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %107 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
      %108 = pto.vmi.vload %104[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %108, %106[%c0], %107 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 25 : i64} : 
  }
  %84 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c20544_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vmul %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 15 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %85 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c16448_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c12352_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vmul %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 16 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %86 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c25152_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vmul %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %87 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
    %95 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c0_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %99 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %100 = pto.castptr %99 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %101 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %102 = arith.muli %arg5, %c64 : index
      %103 = pto.vmi.vload %96[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %104 = pto.vmi.vload %98[%102] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %105 = pto.vmi.vadd %103, %104, %101 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
      pto.vmi.vstore %105, %100[%102], %101 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xf32, valid=?x?>) -> ()
  } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
  %88 = pto.fusion_region {
    %94 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
    %95 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xf32, #pto.address_space<vec>>
    %96 = pto.castptr %95 : memref<16x64xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %97 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
    %98 = pto.castptr %97 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
    %99 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : index -> !pto.vmi.mask<64xpred>
    scf.for %arg5 = %c0 to %c16 step %c1 {
      %100 = arith.muli %arg5, %c64 : index
      %101 = pto.vmi.vload %96[%100] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
      %102 = pto.vmi.vcvt %101 {saturate = "SAT"} : !pto.vmi.vreg<64xf32> -> !pto.vmi.vreg<64xbf16>
      pto.vmi.vstore %102, %98[%100], %99 : !pto.vmi.vreg<64xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<64xpred>
    } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
    pto.yield(%94) : (!pto.tile_buf<vec, 16x64xbf16, valid=?x?>) -> ()
  } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
  %89 = pto.pointer_cast(%c4096_i64) %c16, %c64 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x64xbf16, #pto.address_space<vec>>
  %90 = pto.castptr %89 : memref<16x64xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
  %91 = pto.addptr %52, %c64 : <bf16, gm> -> <bf16, gm>
  %92 = pto.addptr %90, %c0 : <bf16, ub> -> <bf16, ub>
  %93 = pto.addptr %91, %c0 : <bf16, gm> -> <bf16, gm>
  pto.mte_ub_gm %92, %93, %c128_i64 nburst(%c16_i64, %c128_i64, %c256_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
  return
}

