// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
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
        %23 = arith.addi %11, %arg12 : index
        %24 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %25 = pto.castptr %24 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %26 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %51 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %51 : i32 -> !pto.mask<b32>, i32
          %52 = arith.index_cast %scalar_out : i32 to index
          %53 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.addptr %25, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %52 : index
        }
        %27 = arith.index_cast %arg12 : index to i64
        %28 = arith.muli %27, %c1024_i64 : i64
        %29 = arith.addi %28, %c14336_i64 : i64
        pto.fusion_region {
          %51 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %52 = pto.castptr %51 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %53 = pto.pointer_cast(%29) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %56 = pto.vmi.vload %52[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %56, %54[%c0], %55 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 6 : i64} : 
        %30 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %31 = pto.castptr %30 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %32 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %51 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %51 : i32 -> !pto.mask<b32>, i32
          %52 = arith.index_cast %scalar_out : i32 to index
          %53 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.addptr %31, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %52 : index
        }
        pto.fusion_region {
          %51 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %52 = pto.castptr %51 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %53 = pto.pointer_cast(%28) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %56 = pto.vmi.vload %52[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %56, %54[%c0], %55 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 7 : i64} : 
        %33 = arith.cmpi sge, %9, %c7 : index
        scf.if %33 {
          %51 = arith.divsi %23, %c4 : index
          %52 = arith.muli %51, %c4 : index
          %53 = arith.subi %23, %52 : index
          %54 = pto.load_scalar %arg2[%51] : memref<?xi32, #pto.address_space<gm>> -> i32
          %55 = arith.index_cast %54 : i32 to index
          %56 = arith.cmpi sge, %55, %c0 : index
          scf.if %56 {
            %57 = arith.muli %55, %c4 : index
            %58 = arith.addi %57, %53 : index
            %59 = arith.muli %58, %c2048 : index
            %60 = arith.addi %59, %4 : index
            %61 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
            %62 = pto.addptr %61, %60 : <f32, gm> -> <f32, gm>
            %63 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %64 = pto.castptr %63 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %65 = pto.addptr %62, %c0 : <f32, gm> -> <f32, gm>
            %66 = pto.addptr %64, %c0 : <f32, ub> -> <f32, ub>
            pto.mte_gm_ub %65, %66, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
            pto.fusion_region {
              %74 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %75 = pto.castptr %74 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %76 = pto.pointer_cast(%29) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %77 = pto.castptr %76 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %78 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
              %79 = pto.vmi.vload %75[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              pto.vmi.vstore %79, %77[%c0], %78 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 10 : i64} : 
            %67 = arith.addi %4, %c1024 : index
            %68 = arith.addi %59, %67 : index
            %69 = pto.addptr %61, %68 : <f32, gm> -> <f32, gm>
            %70 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %71 = pto.castptr %70 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %72 = pto.addptr %69, %c0 : <f32, gm> -> <f32, gm>
            %73 = pto.addptr %71, %c0 : <f32, ub> -> <f32, ub>
            pto.mte_gm_ub %72, %73, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
            pto.fusion_region {
              %74 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %75 = pto.castptr %74 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %76 = pto.pointer_cast(%28) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %77 = pto.castptr %76 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %78 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
              %79 = pto.vmi.vload %75[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              pto.vmi.vstore %79, %77[%c0], %78 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 11 : i64} : 
          }
        }
        %34 = arith.addi %10, %arg12 : index
        %35 = arith.addi %arg12, %c4 : index
        %36 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %37 = pto.castptr %36 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %38 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %51 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %51 : i32 -> !pto.mask<b32>, i32
          %52 = arith.index_cast %scalar_out : i32 to index
          %53 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.addptr %37, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %52 : index
        }
        %39 = arith.index_cast %35 : index to i64
        %40 = arith.muli %39, %c1024_i64 : i64
        %41 = arith.addi %40, %c14336_i64 : i64
        pto.fusion_region {
          %51 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %52 = pto.castptr %51 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %53 = pto.pointer_cast(%41) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %56 = pto.vmi.vload %52[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %56, %54[%c0], %55 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 8 : i64} : 
        %42 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %44 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %51 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %51 : i32 -> !pto.mask<b32>, i32
          %52 = arith.index_cast %scalar_out : i32 to index
          %53 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.addptr %43, %arg13 : <f32, ub> -> <f32, ub>
          pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %52 : index
        }
        pto.fusion_region {
          %51 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %52 = pto.castptr %51 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %53 = pto.pointer_cast(%40) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
          %56 = pto.vmi.vload %52[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
          pto.vmi.vstore %56, %54[%c0], %55 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 9 : i64} : 
        %45 = arith.divsi %34, %c4 : index
        %46 = arith.muli %45, %c4 : index
        %47 = arith.subi %34, %46 : index
        %48 = pto.load_scalar %arg2[%45] : memref<?xi32, #pto.address_space<gm>> -> i32
        %49 = arith.index_cast %48 : i32 to index
        %50 = arith.cmpi sge, %49, %c0 : index
        scf.if %50 {
          %51 = arith.muli %49, %c4 : index
          %52 = arith.addi %51, %47 : index
          %53 = arith.addi %4, %c512 : index
          %54 = arith.muli %52, %c2048 : index
          %55 = arith.addi %54, %53 : index
          %56 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %57 = pto.addptr %56, %55 : <f32, gm> -> <f32, gm>
          %58 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %59 = pto.castptr %58 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %60 = pto.addptr %57, %c0 : <f32, gm> -> <f32, gm>
          %61 = pto.addptr %59, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %60, %61, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.fusion_region {
            %69 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %70 = pto.castptr %69 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %71 = pto.pointer_cast(%41) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %72 = pto.castptr %71 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %73 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %74 = pto.vmi.vload %70[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %74, %72[%c0], %73 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 12 : i64} : 
          %62 = arith.addi %4, %c1536 : index
          %63 = arith.addi %54, %62 : index
          %64 = pto.addptr %56, %63 : <f32, gm> -> <f32, gm>
          %65 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %66 = pto.castptr %65 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %67 = pto.addptr %64, %c0 : <f32, gm> -> <f32, gm>
          %68 = pto.addptr %66, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %67, %68, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.fusion_region {
            %69 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %70 = pto.castptr %69 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %71 = pto.pointer_cast(%40) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %72 = pto.castptr %71 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %73 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %74 = pto.vmi.vload %70[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %74, %72[%c0], %73 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 13 : i64} : 
        }
      }
      scf.for %arg12 = %c0 to %c128 step %c1 {
        %23 = pto.load_scalar %arg4[%arg12] : memref<?xi32, #pto.address_space<gm>> -> i32
        %24 = arith.cmpi sle, %23, %8 : i32
        scf.if %24 {
          %25 = arith.index_cast %23 : i32 to index
          %26 = arith.cmpi sle, %11, %25 : index
          scf.if %26 {
            %27 = arith.cmpi slt, %25, %10 : index
            %28:2 = scf.if %27 -> (index, index) {
              %56 = arith.subi %25, %11 : index
              scf.yield %4, %56 : index, index
            } else {
              %56 = arith.subi %25, %10 : index
              %57 = arith.addi %56, %c4 : index
              %58 = arith.addi %4, %c512 : index
              scf.yield %58, %57 : index, index
            }
            %29 = arith.remsi %25, %c4 : index
            %30 = arith.muli %29, %c1024 : index
            %31 = arith.addi %30, %28#0 : index
            %32 = pto.castptr %arg5 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
            %33 = pto.addptr %32, %31 : <f32, gm> -> <f32, gm>
            %34 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %35 = pto.castptr %34 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %36 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
            %37 = pto.addptr %35, %c0 : <f32, ub> -> <f32, ub>
            pto.mte_gm_ub %36, %37, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
            %38 = arith.muli %arg12, %c1024 : index
            %39 = arith.addi %38, %28#0 : index
            %40 = pto.castptr %arg6 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
            %41 = pto.addptr %40, %39 : <f32, gm> -> <f32, gm>
            %42 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
            %45 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
            pto.mte_gm_ub %44, %45, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
            %46 = pto.fusion_region {
              %56 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
              %57 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %59 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %61 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %63 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<256xpred>
              %64 = pto.vmi.vload %58[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              %65 = pto.vmi.vload %60[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              %66 = pto.vmi.vadd %64, %65, %63 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
              pto.vmi.vstore %66, %62[%c0], %63 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
              pto.yield(%56) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
            } {pto.fusion.group_id = 14 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %47 = pto.castptr %arg7 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
            %48 = pto.addptr %47, %39 : <f32, gm> -> <f32, gm>
            %49 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %50 = pto.castptr %49 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %51 = pto.addptr %48, %c0 : <f32, gm> -> <f32, gm>
            %52 = pto.addptr %50, %c0 : <f32, ub> -> <f32, ub>
            pto.mte_gm_ub %51, %52, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
            %53 = arith.index_cast %28#1 : index to i64
            %54 = arith.muli %53, %c1024_i64 : i64
            %55 = arith.addi %54, %c14336_i64 : i64
            pto.fusion_region {
              %56 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %58 = pto.pointer_cast(%55) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %59 = pto.castptr %58 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %60 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
              %61 = pto.vmi.vload %57[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              pto.vmi.vstore %61, %59[%c0], %60 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 15 : i64} : 
            pto.fusion_region {
              %56 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %58 = pto.pointer_cast(%54) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
              %59 = pto.castptr %58 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
              %60 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
              %61 = pto.vmi.vload %57[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
              pto.vmi.vstore %61, %59[%c0], %60 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
              pto.yield() : () -> ()
            } {pto.fusion.group_id = 16 : i64} : 
          }
        }
      }
      pto.fusion_region {
        %23 = pto.pointer_cast(%c7168_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %24 = pto.castptr %23 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %25 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %26 = pto.castptr %25 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %27 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
        %28 = pto.vmi.vload %24[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %28, %26[%c0], %27 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 0 : i64} : 
      %12 = pto.fusion_region {
        %23 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %24 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %25 = pto.castptr %24 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %26 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %27 = pto.castptr %26 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %28 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %29 = pto.castptr %28 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %30 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<256xpred>
        %31 = pto.vmi.vload %25[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        %32 = pto.vmi.vload %27[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        %33 = pto.vmi.vsub %31, %32, %30 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %33, %29[%c0], %30 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield(%23) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 1 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %13 = pto.fusion_region {
        %23 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %24 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %25 = pto.castptr %24 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %26 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %27 = pto.castptr %26 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %28 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<256xpred>
        %29 = pto.vmi.vload %25[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        %30 = pto.vmi.vexp %29, %28 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %30, %27[%c0], %28 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield(%23) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 2 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      pto.fusion_region {
        %23 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %24 = pto.castptr %23 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %25 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %26 = pto.castptr %25 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %27 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
        %28 = pto.vmi.vload %24[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %28, %26[%c0], %27 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} : 
      pto.fusion_region {
        %23 = pto.pointer_cast(%c21504_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %24 = pto.castptr %23 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %25 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %26 = pto.castptr %25 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %27 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
        %28 = pto.vmi.vload %24[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %28, %26[%c0], %27 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 4 : i64} : 
      scf.for %arg12 = %c0 to %c7 step %c1 {
        %23 = arith.cmpi sge, %arg12, %c4 : index
        %24 = arith.cmpi sge, %9, %c7 : index
        %25 = arith.ori %23, %24 : i1
        scf.if %25 {
          %26 = arith.index_cast %arg12 : index to i64
          %27 = arith.muli %26, %c1024_i64 : i64
          %28 = arith.addi %27, %c14336_i64 : i64
          %29 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c11264_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%27) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vmax %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 17 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %30 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vsub %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 18 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %31 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<256xpred>
            %45 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %46 = pto.vmi.vexp %45, %44 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %46, %43[%c0], %44 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 19 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %32 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%27) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vsub %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 20 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %33 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<256xpred>
            %45 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %46 = pto.vmi.vexp %45, %44 : !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %46, %43[%c0], %44 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 21 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %34 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vmul %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 22 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %35 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c13312_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vadd %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 23 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %36 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c12288_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vmul %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 24 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %37 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%28) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vmul %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 25 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          %38 = pto.fusion_region {
            %39 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            %40 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %42 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %44 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %46 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<256xpred>
            %47 = pto.vmi.vload %41[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %48 = pto.vmi.vload %43[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            %49 = pto.vmi.vadd %47, %48, %46 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %49, %45[%c0], %46 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield(%39) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 26 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.fusion_region {
            %39 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %40 = pto.castptr %39 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %41 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %43 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %44 = pto.vmi.vload %40[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %44, %42[%c0], %43 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 27 : i64} : 
          pto.fusion_region {
            %39 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %40 = pto.castptr %39 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %41 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %43 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %44 = pto.vmi.vload %40[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %44, %42[%c0], %43 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 28 : i64} : 
          pto.fusion_region {
            %39 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %40 = pto.castptr %39 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %41 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %43 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<256xpred>
            %44 = pto.vmi.vload %40[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
            pto.vmi.vstore %44, %42[%c0], %43 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 29 : i64} : 
        }
      }
      %14 = pto.fusion_region {
        %23 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
        %24 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %25 = pto.castptr %24 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %26 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %27 = pto.castptr %26 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %28 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %29 = pto.castptr %28 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %30 = pto.vmi.create_mask %c256 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<256xpred>
        %31 = pto.vmi.vload %25[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        %32 = pto.vmi.vload %27[%c0] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<256xf32>
        %33 = pto.vmi.vdiv %31, %32, %30 : !pto.vmi.vreg<256xf32>, !pto.vmi.vreg<256xf32>, !pto.vmi.mask<256xpred> -> !pto.vmi.vreg<256xf32>
        pto.vmi.vstore %33, %29[%c0], %30 : !pto.vmi.vreg<256xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<256xpred>
        pto.yield(%23) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
      } {pto.fusion.group_id = 5 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %15 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %16 = pto.castptr %15 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %17 = arith.muli %1, %c512 : index
      %18 = arith.addi %17, %4 : index
      %19 = pto.castptr %arg8 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
      %20 = pto.addptr %19, %18 : <f32, gm> -> <f32, gm>
      %21 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      %22 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
      pto.mte_ub_gm %21, %22, %c1024_i64 nburst(%c1_i64, %c1024_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
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
}

