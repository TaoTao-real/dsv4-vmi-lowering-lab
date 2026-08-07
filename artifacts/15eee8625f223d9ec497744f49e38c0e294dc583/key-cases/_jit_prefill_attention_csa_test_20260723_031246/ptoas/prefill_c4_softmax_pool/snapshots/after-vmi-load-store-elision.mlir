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
  pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
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
      pto.fusion_region {
        %31 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %32 = pto.castptr %31 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %33 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<64xpred>
        %34 = pto.vmi.vbrc %cst_0 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          pto.vmi.vstore %34, %32[%arg13], %33 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %35 = arith.index_cast %arg12 : index to i64
        %36 = arith.muli %35, %c1024_i64 : i64
        %37 = arith.addi %36, %c14336_i64 : i64
        %38 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %39 = pto.castptr %38 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %40 = pto.pointer_cast(%37) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          %50 = pto.vmi.vload %39[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %50, %41[%arg13], %42 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %43 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %45 = pto.vmi.vbrc %cst {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          pto.vmi.vstore %45, %44[%arg13], %33 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %46 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %47 = pto.castptr %46 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %48 = pto.pointer_cast(%36) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %49 = pto.castptr %48 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          %50 = pto.vmi.vload %47[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %50, %49[%arg13], %42 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 2 : i64} :
      %22 = arith.cmpi sge, %9, %c7 : index
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      scf.if %22 {
        %31 = arith.divsi %21, %c4 : index
        %32 = arith.muli %31, %c4 : index
        %33 = arith.subi %21, %32 : index
        %34 = pto.load_scalar %arg2[%31] : memref<?xi32, #pto.address_space<gm>> -> i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.cmpi sge, %35, %c0 : index
        scf.if %36 {
          %37 = arith.muli %35, %c4 : index
          %38 = arith.addi %37, %33 : index
          %39 = arith.muli %38, %c2048 : index
          %40 = arith.addi %39, %4 : index
          %41 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %42 = pto.addptr %41, %40 : <f32, gm> -> <f32, gm>
          %43 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %45 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
          %46 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %45, %46, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %47 = arith.index_cast %arg12 : index to i64
          %48 = arith.muli %47, %c1024_i64 : i64
          %49 = arith.addi %48, %c14336_i64 : i64
          pto.fusion_region {
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
            %57 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %59 = pto.pointer_cast(%49) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %61 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
            scf.for %arg13 = %c0 to %c256 step %c64 {
              %62 = pto.vmi.vload %58[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              pto.vmi.vstore %62, %60[%arg13], %61 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 4 : i64} :
          %50 = arith.addi %4, %c1024 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %51 = arith.addi %39, %50 : index
          %52 = pto.addptr %41, %51 : <f32, gm> -> <f32, gm>
          %53 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %54 = pto.castptr %53 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %55 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
          %56 = pto.addptr %54, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %55, %56, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.fusion_region {
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            %57 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %59 = pto.pointer_cast(%48) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %61 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
            scf.for %arg13 = %c0 to %c256 step %c64 {
              %62 = pto.vmi.vload %58[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              pto.vmi.vstore %62, %60[%arg13], %61 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            pto.yield() : () -> ()
          } {pto.fusion.group_id = 5 : i64} :
        }
      }
      %23 = arith.addi %10, %arg12 : index
      %24 = arith.addi %arg12, %c4 : index
      pto.fusion_region {
        %31 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %32 = pto.castptr %31 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %33 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<64xpred>
        %34 = pto.vmi.vbrc %cst_0 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          pto.vmi.vstore %34, %32[%arg13], %33 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %35 = arith.index_cast %24 : index to i64
        %36 = arith.muli %35, %c1024_i64 : i64
        %37 = arith.addi %36, %c14336_i64 : i64
        %38 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %39 = pto.castptr %38 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %40 = pto.pointer_cast(%37) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %42 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          %50 = pto.vmi.vload %39[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %50, %41[%arg13], %42 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        %43 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %45 = pto.vmi.vbrc %cst {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          pto.vmi.vstore %45, %44[%arg13], %33 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %46 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %47 = pto.castptr %46 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %48 = pto.pointer_cast(%36) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %49 = pto.castptr %48 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        scf.for %arg13 = %c0 to %c256 step %c64 {
          %50 = pto.vmi.vload %47[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
          pto.vmi.vstore %50, %49[%arg13], %42 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.yield() : () -> ()
      } {pto.fusion.group_id = 3 : i64} :
      %25 = arith.divsi %23, %c4 : index
      %26 = arith.muli %25, %c4 : index
      %27 = arith.subi %23, %26 : index
      %28 = pto.load_scalar %arg2[%25] : memref<?xi32, #pto.address_space<gm>> -> i32
      %29 = arith.index_cast %28 : i32 to index
      %30 = arith.cmpi sge, %29, %c0 : index
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      scf.if %30 {
        %31 = arith.muli %29, %c4 : index
        %32 = arith.addi %31, %27 : index
        %33 = arith.addi %4, %c512 : index
        %34 = arith.muli %32, %c2048 : index
        %35 = arith.addi %34, %33 : index
        %36 = pto.castptr %arg3 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %37 = pto.addptr %36, %35 : <f32, gm> -> <f32, gm>
        %38 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %39 = pto.castptr %38 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %40 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
        %41 = pto.addptr %39, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %40, %41, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %42 = arith.index_cast %24 : index to i64
        %43 = arith.muli %42, %c1024_i64 : i64
        %44 = arith.addi %43, %c14336_i64 : i64
        pto.fusion_region {
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %52 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %54 = pto.pointer_cast(%44) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %56 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
          scf.for %arg13 = %c0 to %c256 step %c64 {
            %57 = pto.vmi.vload %53[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %57, %55[%arg13], %56 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 6 : i64} :
        %45 = arith.addi %4, %c1536 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %46 = arith.addi %34, %45 : index
        %47 = pto.addptr %36, %46 : <f32, gm> -> <f32, gm>
        %48 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
        %49 = pto.castptr %48 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
        %50 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
        %51 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        pto.mte_gm_ub %50, %51, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.fusion_region {
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          %52 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %54 = pto.pointer_cast(%43) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %56 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
          scf.for %arg13 = %c0 to %c256 step %c64 {
            %57 = pto.vmi.vload %53[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %57, %55[%arg13], %56 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          pto.yield() : () -> ()
        } {pto.fusion.group_id = 7 : i64} :
      }
    }
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
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
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
          %36 = arith.muli %arg12, %c1024 : index
          %37 = arith.addi %36, %26#0 : index
          %38 = pto.castptr %arg6 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %39 = pto.addptr %38, %37 : <f32, gm> -> <f32, gm>
          %40 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %42 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
          %43 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %42, %43, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
          %44 = pto.fusion_region {
            %54 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
            %55 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %56 = pto.castptr %55 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %57 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %58 = pto.castptr %57 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %59 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %61 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<64xpred>
            scf.for %arg13 = %c0 to %c256 step %c64 {
              %62 = pto.vmi.vload %56[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              %63 = pto.vmi.vload %58[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              %64 = pto.vmi.vadd %62, %63, %61 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
              pto.vmi.vstore %64, %60[%arg13], %61 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
            pto.yield(%54) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
          } {pto.fusion.group_id = 8 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
          %45 = pto.castptr %arg7 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
          %46 = pto.addptr %45, %37 : <f32, gm> -> <f32, gm>
          %47 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %48 = pto.castptr %47 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %49 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
          %50 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
          pto.mte_gm_ub %49, %50, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
          %51 = arith.index_cast %26#1 : index to i64
          %52 = arith.muli %51, %c1024_i64 : i64
          %53 = arith.addi %52, %c14336_i64 : i64
          pto.fusion_region {
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
            %54 = pto.pointer_cast(%c9216_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %56 = pto.pointer_cast(%53) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %58 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
            scf.for %arg13 = %c0 to %c256 step %c64 {
              %63 = pto.vmi.vload %55[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              pto.vmi.vstore %63, %57[%arg13], %58 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
            %59 = pto.pointer_cast(%c8192_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            %61 = pto.pointer_cast(%52) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
            scf.for %arg13 = %c0 to %c256 step %c64 {
              %63 = pto.vmi.vload %60[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
              pto.vmi.vstore %63, %62[%arg13], %58 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
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
      %25 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
      %26 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %27 = pto.castptr %26 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %28 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %29 = pto.castptr %28 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %30 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %31 = pto.castptr %30 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %32 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
      %33 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %34 = pto.castptr %33 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %35 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %36 = pto.castptr %35 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %37 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<64xpred>
      %38 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %39 = pto.castptr %38 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %40 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %41 = pto.castptr %40 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %42 = pto.pointer_cast(%c21504_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %43 = pto.castptr %42 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %44 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %45 = pto.castptr %44 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      scf.for %arg12 = %c0 to %c256 step %c64 {
        %46 = pto.vmi.vload %22[%arg12] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %46, %24[%arg12], %25 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %47 = pto.vmi.vsub %46, %46, %32 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        %48 = pto.vmi.vexp %47, %37 : !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %48, %36[%arg12], %37 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        pto.vmi.vstore %48, %41[%arg12], %25 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
        %49 = pto.vmi.vload %43[%arg12] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %49, %45[%arg12], %25 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
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
        %27 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
          %28 = arith.index_cast %arg14 : index to i32
          %mask, %scalar_out = pto.plt_b32 %28 : i32 -> !pto.mask<b32>, i32
          %29 = arith.index_cast %scalar_out : i32 to index
          %30 = arith.subi %c256, %arg13 : index
          %31 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %subview = memref.subview %31[0, %arg13] [1, %30] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %32 = pto.pointer_cast(%25) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %subview_1 = memref.subview %32[0, %arg13] [1, %30] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          %result_2 = pto.vlds %subview_1[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
          %33 = pto.vmax %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %subview_3 = memref.subview %34[0, %arg13] [1, %30] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
          pto.vsts %33, %subview_3[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
          scf.yield %29 : index
        }
        pto.fusion_region {
          %28 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %29 = pto.castptr %28 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %30 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %31 = pto.castptr %30 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %32 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %33 = pto.castptr %32 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %34 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"} : index -> !pto.vmi.mask<64xpred>
          %35 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %36 = pto.castptr %35 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %37 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %38 = pto.castptr %37 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %39 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"} : index -> !pto.vmi.mask<64xpred>
          scf.for %arg13 = %c0 to %c256 step %c64 {
            %85 = pto.vmi.vload %29[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %86 = pto.vmi.vload %31[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %87 = pto.vmi.vsub %85, %86, %34 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            %88 = pto.vmi.vexp %87, %39 : !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %88, %38[%arg13], %39 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %40 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
            %85 = arith.index_cast %arg14 : index to i32
            %mask, %scalar_out = pto.plt_b32 %85 : i32 -> !pto.mask<b32>, i32
            %86 = arith.index_cast %scalar_out : i32 to index
            %87 = arith.subi %c256, %arg13 : index
            %88 = pto.pointer_cast(%25) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview = memref.subview %88[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %89 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview_1 = memref.subview %89[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result_2 = pto.vlds %subview_1[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %90 = pto.vsub %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview_3 = memref.subview %91[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            pto.vsts %90, %subview_3[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
            scf.yield %86 : index
          }
          %41 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %42 = pto.castptr %41 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %43 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %44 = pto.castptr %43 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %45 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %46 = pto.castptr %45 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %47 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %48 = pto.castptr %47 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %49 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %50 = pto.castptr %49 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %51 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"} : index -> !pto.vmi.mask<64xpred>
          %52 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %53 = pto.castptr %52 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %54 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %55 = pto.castptr %54 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %56 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %57 = pto.castptr %56 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %58 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"} : index -> !pto.vmi.mask<64xpred>
          %59 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %60 = pto.castptr %59 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %61 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %62 = pto.castptr %61 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %63 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %64 = pto.castptr %63 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          scf.for %arg13 = %c0 to %c256 step %c64 {
            %85 = pto.vmi.vload %42[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %86 = pto.vmi.vexp %85, %39 : !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %86, %44[%arg13], %39 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            %87 = pto.vmi.vload %46[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %88 = pto.vmi.vload %48[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %89 = pto.vmi.vmul %87, %88, %51 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            %90 = pto.vmi.vadd %89, %86, %58 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %90, %57[%arg13], %58 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            %91 = pto.vmi.vload %60[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %92 = pto.vmi.vmul %91, %87, %51 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %92, %64[%arg13], %51 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %65 = scf.for %arg13 = %c0 to %c256 step %c64 iter_args(%arg14 = %c256) -> (index) {
            %85 = arith.index_cast %arg14 : index to i32
            %mask, %scalar_out = pto.plt_b32 %85 : i32 -> !pto.mask<b32>, i32
            %86 = arith.index_cast %scalar_out : i32 to index
            %87 = arith.subi %c256, %arg13 : index
            %88 = pto.pointer_cast(%26) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview = memref.subview %88[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result = pto.vlds %subview[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %89 = pto.pointer_cast(%c0_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview_1 = memref.subview %89[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            %result_2 = pto.vlds %subview_1[%c0] : memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>> -> !pto.vreg<64xf32>
            %90 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
            %subview_3 = memref.subview %91[0, %arg13] [1, %87] [1, 1] : memref<1x256xf32, #pto.address_space<vec>> to memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>
            pto.vsts %90, %subview_3[%c0], %mask : !pto.vreg<64xf32>, memref<?xf32, strided<[1], offset: ?>, #pto.address_space<vec>>, !pto.mask<b32>
            scf.yield %86 : index
          }
          %66 = pto.pointer_cast(%c12288_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %67 = pto.castptr %66 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %68 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %69 = pto.castptr %68 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %70 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %71 = pto.castptr %70 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %72 = pto.pointer_cast(%c11264_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %73 = pto.castptr %72 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %74 = pto.pointer_cast(%c8192_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %75 = pto.castptr %74 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %76 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<64xpred>
          %77 = pto.pointer_cast(%c13312_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %78 = pto.castptr %77 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %79 = pto.pointer_cast(%c9216_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %80 = pto.castptr %79 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %81 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %82 = pto.castptr %81 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          %83 = pto.pointer_cast(%c10240_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
          %84 = pto.castptr %83 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
          scf.for %arg13 = %c0 to %c256 step %c64 {
            %85 = pto.vmi.vload %67[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %86 = pto.vmi.vload %69[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            %87 = pto.vmi.vadd %85, %86, %58 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %87, %71[%arg13], %58 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            %88 = pto.vmi.vload %73[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %88, %75[%arg13], %76 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            %89 = pto.vmi.vload %78[%arg13] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
            pto.vmi.vstore %89, %80[%arg13], %76 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
            pto.vmi.vstore %87, %84[%arg13], %76 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
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
      %28 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"} : index -> !pto.vmi.mask<64xpred>
      scf.for %arg12 = %c0 to %c256 step %c64 {
        %29 = pto.vmi.vload %23[%arg12] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %30 = pto.vmi.vload %25[%arg12] : !pto.ptr<f32, ub> -> !pto.vmi.vreg<64xf32>
        %31 = pto.vmi.vdiv %29, %30, %28 : !pto.vmi.vreg<64xf32>, !pto.vmi.vreg<64xf32>, !pto.vmi.mask<64xpred> -> !pto.vmi.vreg<64xf32>
        pto.vmi.vstore %31, %27[%arg12], %28 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
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
    %8 = pto.fusion_region {
      %17 = pto.alloc_tile addr = %c14336_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %18 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
      %19 = pto.castptr %18 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
      %20 = pto.vmi.create_mask %c64 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<64xpred>
      %21 = pto.vmi.vbrc %cst_0 {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : f32 -> !pto.vmi.vreg<64xf32>
      scf.for %arg12 = %c0 to %c256 step %c64 {
        pto.vmi.vstore %21, %19[%arg12], %20 : !pto.vmi.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.vmi.mask<64xpred>
      } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      pto.yield(%17) : (!pto.tile_buf<vec, 1x256xf32, valid=?x?>) -> ()
    } {pto.fusion.group_id = 11 : i64} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
    %9 = pto.pointer_cast(%c14336_i64) %c1, %c256 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x256xf32, #pto.address_space<vec>>
    %10 = pto.castptr %9 : memref<1x256xf32, #pto.address_space<vec>> -> !pto.ptr<f32, ub>
    %11 = arith.muli %1, %c512 : index
    %12 = arith.addi %11, %4 : index
    %13 = pto.castptr %arg8 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
    %14 = pto.addptr %13, %12 : <f32, gm> -> <f32, gm>
    %15 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
    %16 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
    pto.mte_ub_gm %15, %16, %c1024_i64 nburst(%c1_i64, %c1024_i64, %c0_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64
  }
  pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
  pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
  return
}
