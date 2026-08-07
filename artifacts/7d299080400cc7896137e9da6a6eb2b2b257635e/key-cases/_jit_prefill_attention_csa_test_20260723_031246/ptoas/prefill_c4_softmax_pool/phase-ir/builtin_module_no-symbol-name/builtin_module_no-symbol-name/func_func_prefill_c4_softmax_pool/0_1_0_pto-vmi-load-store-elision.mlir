// -----// IR Dump After PTOVmiLoadStoreElision (pto-vmi-load-store-elision) //----- //
func.func @prefill_c4_softmax_pool(%arg0: memref<?xi32, #pto.address_space<gm>>, %arg1: memref<?xi32, #pto.address_space<gm>>, %arg2: memref<?xi32, #pto.address_space<gm>>, %arg3: memref<?xf32, #pto.address_space<gm>>, %arg4: memref<?xi32, #pto.address_space<gm>>, %arg5: memref<?xf32, #pto.address_space<gm>>, %arg6: memref<?xf32, #pto.address_space<gm>>, %arg7: memref<?xf32, #pto.address_space<gm>>, %arg8: memref<?xf32, #pto.address_space<gm>>, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
  %c64 = arith.constant 64 : index
  %c1_i64 = arith.constant 1 : i64
  %c1536 = arith.constant 1536 : index
  %c7 = arith.constant 7 : index
  %cst = arith.constant -3.40282347E+38 : f32
  %cst_0 = arith.constant 0.000000e+00 : f32
  %c-3 = arith.constant -3 : index
  %c0 = arith.constant 0 : index
  %c256 = arith.constant 256 : index
  %c2 = arith.constant 2 : index
  %c512 = arith.constant 512 : index
  %c128 = arith.constant 128 : index
  %c1024 = arith.constant 1024 : index
  %c4 = arith.constant 4 : index
  %c2048 = arith.constant 2048 : index
  %c1 = arith.constant 1 : index
  %c13312_i64 = arith.constant 13312 : i64
  %c12288_i64 = arith.constant 12288 : i64
  %c11264_i64 = arith.constant 11264 : i64
  %c10240_i64 = arith.constant 10240 : i64
  %c9216_i64 = arith.constant 9216 : i64
  %c8192_i64 = arith.constant 8192 : i64
  %c0_i64 = arith.constant 0 : i64
  %c14336_i64 = arith.constant 14336 : i64
  %c-7 = arith.constant -7 : index
  %c1024_i64 = arith.constant 1024 : i64
  %c7168_i64 = arith.constant 7168 : i64
  %c21504_i64 = arith.constant 21504 : i64
  %0 = arith.index_cast %arg10 : i32 to index
  %1 = arith.divsi %0, %c2 : index
  %2 = arith.muli %1, %c2 : index
  %3 = arith.subi %0, %2 : index
  %4 = arith.muli %3, %c256 : index
  %5 = pto.load_scalar %arg0[%1] : memref<?xi32, #pto.address_space<gm>> -> i32
  %6 = arith.index_cast %5 : i32 to index
  %7 = arith.cmpi sge, %6, %c0 : index
  scf.if %7 {
    %8 = pto.load_scalar %arg1[%1] : memref<?xi32, #pto.address_space<gm>> -> i32
    %9 = arith.index_cast %8 : i32 to index
    %10 = arith.addi %9, %c-3 : index
    %11 = arith.addi %9, %c-7 : index
    scf.for %arg12 = %c0 to %c4 step %c1 {
      %21 = arith.addi %11, %arg12 : index
      %22 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
        %43 = arith.index_cast %arg14 : index to i32
        %mask, %scalar_out = pto.plt_b32 %43 : i32 -> !pto.mask<b32>, i32
        %44 = arith.index_cast %scalar_out : i32 to index
        %45 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %46 = pto.addptr %23, %arg13 : <f32, ub> -> <f32, ub>
        pto.vsts %45, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.yield %44 : index
      }
      %25 = arith.index_cast %arg12 : index to i64
      %26 = arith.muli %25, %c1024_i64 : i64
      %27 = arith.addi %26, %c14336_i64 : i64
      pto.fusion_region {
        %43 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %45 = pto.pointer_cast(%27) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %46 = pto.castptr %45 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %47 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
        %48 = pto.vmi.vload %44[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %48, %46[%c0], %47 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        %49 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %50 = pto.castptr %49 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %51 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %57 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
          %58 = arith.index_cast %scalar_out : i32 to index
          %59 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.addptr %50, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %58 : index
        }
        %52 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %54 = pto.pointer_cast(%26) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %56 = pto.vmi.vload %53[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %56, %55[%c0], %47 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
      %28 = arith.cmpi sge, %9, %c7 : index
      scf.if %28 {
        %43 = arith.divsi %21, %c4 : index
        %44 = arith.muli %43, %c4 : index
        %45 = arith.subi %21, %44 : index
        %46 = pto.load_scalar %arg2[%43] : memref<?xi32, #pto.address_space<gm>> -> i32
        %47 = arith.index_cast %46 : i32 to index
        %48 = arith.cmpi sge, %47, %c0 : index
        scf.if %48 {
          %49 = arith.muli %47, %c4 : index
          %50 = arith.addi %49, %45 : index
          %51 = arith.muli %50, %c2048 : index
          %52 = arith.addi %51, %4 : index
          %53 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %54 = pto.addptr %53, %52 : <f32, gm> -> <f32, gm>
          %55 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %56 = pto.castptr %55 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %57 = pto.addptr %54, %c0 : <f32, gm> -> <f32, gm>
          %58 = pto.addptr %56, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %57, %58, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.fusion_region {
            %66 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %67 = pto.castptr %66 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %68 = pto.pointer_cast(%27) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %69 = pto.castptr %68 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %70 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %71 = pto.vmi.vload %67[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %71, %69[%c0], %70 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 4 : i64} :
          %59 = arith.addi %4, %c1024 : index
          %60 = arith.addi %51, %59 : index
          %61 = pto.addptr %53, %60 : <f32, gm> -> <f32, gm>
          %62 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %63 = pto.castptr %62 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %64 = pto.addptr %61, %c0 : <f32, gm> -> <f32, gm>
          %65 = pto.addptr %63, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %64, %65, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.fusion_region {
            %66 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %67 = pto.castptr %66 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %68 = pto.pointer_cast(%26) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %69 = pto.castptr %68 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %70 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %71 = pto.vmi.vload %67[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %71, %69[%c0], %70 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 5 : i64} :
        }
      }
      %29 = arith.addi %10, %arg12 : index
      %30 = arith.addi %arg12, %c4 : index
      %31 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %32 = pto.castptr %31 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %33 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
        %43 = arith.index_cast %arg14 : index to i32
        %mask, %scalar_out = pto.plt_b32 %43 : i32 -> !pto.mask<b32>, i32
        %44 = arith.index_cast %scalar_out : i32 to index
        %45 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %46 = pto.addptr %32, %arg13 : <f32, ub> -> <f32, ub>
        pto.vsts %45, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.yield %44 : index
      }
      %34 = arith.index_cast %30 : index to i64
      %35 = arith.muli %34, %c1024_i64 : i64
      %36 = arith.addi %35, %c14336_i64 : i64
      pto.fusion_region {
        %43 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %45 = pto.pointer_cast(%36) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %46 = pto.castptr %45 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %47 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
        %48 = pto.vmi.vload %44[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %48, %46[%c0], %47 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        %49 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %50 = pto.castptr %49 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %51 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %57 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
          %58 = arith.index_cast %scalar_out : i32 to index
          %59 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.addptr %50, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %58 : index
        }
        %52 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %54 = pto.pointer_cast(%35) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %56 = pto.vmi.vload %53[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %56, %55[%c0], %47 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
      %37 = arith.divsi %29, %c4 : index
      %38 = arith.muli %37, %c4 : index
      %39 = arith.subi %29, %38 : index
      %40 = pto.load_scalar %arg2[%37] : memref<?xi32, #pto.address_space<gm>> -> i32
      %41 = arith.index_cast %40 : i32 to index
      %42 = arith.cmpi sge, %41, %c0 : index
      scf.if %42 {
        %43 = arith.muli %41, %c4 : index
        %44 = arith.addi %43, %39 : index
        %45 = arith.addi %4, %c512 : index
        %46 = arith.muli %44, %c2048 : index
        %47 = arith.addi %46, %45 : index
        %48 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %49 = pto.addptr %48, %47 : <f32, gm> -> <f32, gm>
        %50 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %51 = pto.castptr %50 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %52 = pto.addptr %49, %c0 : <f32, gm> -> <f32, gm>
        %53 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %52, %53, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.fusion_region {
          %61 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %63 = pto.pointer_cast(%36) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %64 = pto.castptr %63 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %65 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %66 = pto.vmi.vload %62[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %66, %64[%c0], %65 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 6 : i64} :
        %54 = arith.addi %4, %c1536 : index
        %55 = arith.addi %46, %54 : index
        %56 = pto.addptr %48, %55 : <f32, gm> -> <f32, gm>
        %57 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %59 = pto.addptr %56, %c0 : <f32, gm> -> <f32, gm>
        %60 = pto.addptr %58, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %59, %60, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.fusion_region {
          %61 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %63 = pto.pointer_cast(%35) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %64 = pto.castptr %63 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %65 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %66 = pto.vmi.vload %62[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %66, %64[%c0], %65 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 7 : i64} :
      }
    }
    scf.for %arg12 = %c0 to %c128 step %c1 {
      %21 = pto.load_scalar %arg4[%arg12] : memref<?xi32, #pto.address_space<gm>> -> i32
      %22 = arith.cmpi sle, %21, %8 : i32
      scf.if %22 {
        %23 = arith.index_cast %21 : i32 to index
        %24 = arith.cmpi sle, %11, %23 : index
        scf.if %24 {
          %25 = arith.cmpi slt, %23, %10 : index
          %26:2 = scf.if %25 -> (index, index) {
            %54 = arith.subi %23, %11 : index
            scf.yield %4, %54 : index, index
          } else {
            %54 = arith.subi %23, %10 : index
            %55 = arith.addi %54, %c4 : index
            %56 = arith.addi %4, %c512 : index
            scf.yield %56, %55 : index, index
          }
          %27 = arith.remsi %23, %c4 : index
          %28 = arith.muli %27, %c1024 : index
          %29 = arith.addi %28, %26#0 : index
          %30 = pto.castptr %arg5 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %31 = pto.addptr %30, %29 : <f32, gm> -> <f32, gm>
          %32 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %33 = pto.castptr %32 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %34 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %34, %35, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          %36 = arith.muli %arg12, %c1024 : index
          %37 = arith.addi %36, %26#0 : index
          %38 = pto.castptr %arg6 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %39 = pto.addptr %38, %37 : <f32, gm> -> <f32, gm>
          %40 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %42 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
          %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %42, %43, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          %44 = pto.fusion_region {
            %54 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %55 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %56 = pto.castptr %55 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %57 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %59 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %61 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<256xpred>
            %62 = pto.vmi.vload %56[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %63 = pto.vmi.vload %58[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %64 = pto.vmi.vadd %62, %63, %61 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %64, %60[%c0], %61 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%54) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %45 = pto.castptr %arg7 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %46 = pto.addptr %45, %37 : <f32, gm> -> <f32, gm>
          %47 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %48 = pto.castptr %47 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %49 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
          %50 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %49, %50, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          %51 = arith.index_cast %26#1 : index to i64
          %52 = arith.muli %51, %c1024_i64 : i64
          %53 = arith.addi %52, %c14336_i64 : i64
          pto.fusion_region {
            %54 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %56 = pto.pointer_cast(%53) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %58 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %59 = pto.vmi.vload %55[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %59, %57[%c0], %58 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            %60 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %61 = pto.castptr %60 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %62 = pto.pointer_cast(%52) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %63 = pto.castptr %62 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %64 = pto.vmi.vload %61[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %64, %63[%c0], %58 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 9 : i64} :
        }
      }
    }
    pto.fusion_region {
      %21 = pto.pointer_cast(%c7168_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %22 = pto.castptr %21 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %23 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %24 = pto.castptr %23 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %25 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
      %26 = pto.vmi.vload %22[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
      pto.vmi.vstore %26, %24[%c0], %25 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
      %27 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %28 = pto.castptr %27 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %29 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %30 = pto.castptr %29 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %31 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %32 = pto.castptr %31 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %33 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<256xpred>
      %34 = pto.vmi.vsub %26, %26, %33 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
      %35 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %36 = pto.castptr %35 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %37 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %38 = pto.castptr %37 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %39 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<256xpred>
      %40 = pto.vmi.vexp %34, %39 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
      pto.vmi.vstore %40, %38[%c0], %39 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
      %41 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %43 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      pto.vmi.vstore %40, %44[%c0], %25 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
      %45 = pto.pointer_cast(%c21504_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %46 = pto.castptr %45 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %47 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %48 = pto.castptr %47 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %49 = pto.vmi.vload %46[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
      pto.vmi.vstore %49, %48[%c0], %25 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
      pto.yield() : () -> ()
    } {pto.fusion.group_id = 0 : i64} :
    scf.for %arg12 = %c0 to %c7 step %c1 {
      %21 = arith.cmpi sge, %arg12, %c4 : index
      %22 = arith.cmpi sge, %9, %c7 : index
      %23 = arith.ori %21, %22 : i1
      scf.if %23 {
        %24 = arith.index_cast %arg12 : index to i64
        %25 = arith.muli %24, %c1024_i64 : i64
        %26 = arith.addi %25, %c14336_i64 : i64
        pto.fusion_region {
          %27 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %28 = pto.castptr %27 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %29 = pto.pointer_cast(%25) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %30 = pto.castptr %29 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %31 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %32 = pto.castptr %31 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %33 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"} : index -> !pto.vmi.mask<256xpred>
          %34 = pto.vmi.vload %28[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %35 = pto.vmi.vload %30[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %36 = pto.vmi.vmax %34, %35, %33 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %36, %32[%c0], %33 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %37 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %38 = pto.castptr %37 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %39 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %40 = pto.castptr %39 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %41 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %43 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<256xpred>
          %44 = pto.vmi.vload %38[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %45 = pto.vmi.vsub %44, %36, %43 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          %46 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %47 = pto.castptr %46 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %48 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %49 = pto.castptr %48 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %50 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<256xpred>
          %51 = pto.vmi.vexp %45, %50 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %51, %49[%c0], %50 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %52 = pto.pointer_cast(%25) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %54 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %56 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %58 = pto.vmi.vload %53[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %59 = pto.vmi.vload %55[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %60 = pto.vmi.vsub %58, %59, %43 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          %61 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %63 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %64 = pto.castptr %63 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %65 = pto.vmi.vexp %60, %50 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %65, %64[%c0], %50 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %66 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %67 = pto.castptr %66 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %68 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<256xpred>
          %73 = pto.vmi.vload %67[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %74 = pto.vmi.vload %69[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %75 = pto.vmi.vmul %73, %74, %72 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          %76 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %77 = pto.castptr %76 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %78 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %79 = pto.castptr %78 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %80 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %81 = pto.castptr %80 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %82 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<256xpred>
          %83 = pto.vmi.vadd %75, %65, %82 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %83, %81[%c0], %82 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %84 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %85 = pto.castptr %84 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %86 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %87 = pto.castptr %86 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %88 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %89 = pto.castptr %88 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %90 = pto.vmi.vload %85[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %91 = pto.vmi.vmul %90, %73, %72 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %91, %89[%c0], %72 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %92 = pto.pointer_cast(%26) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %93 = pto.castptr %92 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %94 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %95 = pto.castptr %94 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %96 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %97 = pto.castptr %96 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %98 = pto.vmi.vload %93[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %99 = pto.vmi.vload %95[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %100 = pto.vmi.vmul %98, %99, %72 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          %101 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %102 = pto.castptr %101 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %103 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %104 = pto.castptr %103 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %105 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %106 = pto.castptr %105 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %107 = pto.vmi.vload %102[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          %108 = pto.vmi.vadd %107, %100, %82 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %108, %106[%c0], %82 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %109 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %110 = pto.castptr %109 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %111 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %112 = pto.castptr %111 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %113 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %114 = pto.vmi.vload %110[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %114, %112[%c0], %113 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %115 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %116 = pto.castptr %115 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %117 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %118 = pto.castptr %117 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %119 = pto.vmi.vload %116[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %119, %118[%c0], %113 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          %120 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %121 = pto.castptr %120 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %122 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %123 = pto.castptr %122 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          pto.vmi.vstore %108, %123[%c0], %113 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 10 : i64} :
      }
    }
    %12 = pto.fusion_region {
      %21 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %22 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %23 = pto.castptr %22 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %24 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %25 = pto.castptr %24 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %26 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %27 = pto.castptr %26 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %28 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<256xpred>
      %29 = pto.vmi.vload %23[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
      %30 = pto.vmi.vload %25[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
      %31 = pto.vmi.vdiv %29, %30, %28 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
      pto.vmi.vstore %31, %27[%c0], %28 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
      pto.yield(%21) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %13 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
    %14 = pto.castptr %13 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %15 = arith.muli %1, %c512 : index
    %16 = arith.addi %15, %4 : index
    %17 = pto.castptr %arg8 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %18 = pto.addptr %17, %16 : <f32, gm> -> <f32, gm>
    %19 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
    %20 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %19, %20, %c1024_i64 nburst(%c1_i64, %c1024_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
  } else {
    %8 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
    %9 = pto.castptr %8 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %10 = scf.for %arg12 = %c0 to %c256 step %c64 iter_args(%arg13 = %c256) -> (index) {
      %19 = arith.index_cast %arg13 : index to i32
      %mask, %scalar_out = pto.plt_b32 %19 : i32 -> !pto.mask<b32>, i32
      %20 = arith.index_cast %scalar_out : i32 to index
      %21 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
      %22 = pto.addptr %9, %arg12 : <f32, ub> -> <f32, ub>
      pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      scf.yield %20 : index
    }
    %11 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
    %12 = pto.castptr %11 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %13 = arith.muli %1, %c512 : index
    %14 = arith.addi %13, %4 : index
    %15 = pto.castptr %arg8 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %16 = pto.addptr %15, %14 : <f32, gm> -> <f32, gm>
    %17 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
    %18 = pto.addptr %16, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %17, %18, %c1024_i64 nburst(%c1_i64, %c1024_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
  }
  return
}
