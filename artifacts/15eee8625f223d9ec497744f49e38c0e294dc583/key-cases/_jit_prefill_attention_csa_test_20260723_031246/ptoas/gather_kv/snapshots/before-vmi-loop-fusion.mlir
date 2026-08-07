// -----// IR Dump Before PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
  func.func @gather_kv(%arg0: memref<?xbf16, #pto.address_space<gm>>, %arg1: memref<?xi32, #pto.address_space<gm>>, %arg2: memref<?xbf16, #pto.address_space<gm>>, %arg3: memref<?xi32, #pto.address_space<gm>>, %arg4: memref<?xi32, #pto.address_space<gm>>, %arg5: memref<?xbf16, #pto.address_space<gm>>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
    %c1_i64 = arith.constant 1 : i64
    %c128_i64 = arith.constant 128 : i64
    %cst = arith.constant 0.000000e+00 : bf16
    %c384 = arith.constant 384 : index
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c128 = arith.constant 128 : index
    %c1 = arith.constant 1 : index
    %c512 = arith.constant 512 : index
    %c131072_i64 = arith.constant 131072 : i64
    %c0_i64 = arith.constant 0 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %0 = arith.index_cast %arg6 : i32 to index
    %1 = arith.divsi %0, %c3 : index
    %2 = arith.muli %1, %c3 : index
    %3 = arith.subi %0, %2 : index
    %4 = arith.muli %1, %c4 : index
    %5 = arith.muli %3, %c128 : index
    pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    scf.for %arg8 = %c0 to %c4 step %c1 {
      %6 = arith.addi %4, %arg8 : index
      %7 = arith.cmpi slt, %6, %c128 : index
      scf.if %7 {
        %8 = arith.muli %6, %c384 : index
        %9 = arith.addi %8, %5 : index
        %10 = pto.fusion_region {
          %18 = pto.pointer_cast(%c0_i64) %c128, %c512 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, strided<[512, 1], offset: ?>, #pto.address_space<vec>>
          %19 = pto.bind_tile %18, %c128, %c512 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, strided<[512, 1], offset: ?>, #pto.address_space<vec>> -> memref<128x512xbf16, strided<[512, 1], offset: ?>, #pto.address_space<vec>>
          %20 = pto.pointer_cast(%c0_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<vec>>
          %21 = pto.castptr %20 : memref<128x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
          %22 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_texpands_bf16", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : index -> !pto.vmi.mask<512xpred>
          %23 = pto.vmi.vbrc %cst {pto.tilelib.candidate = "vmi_texpands_bf16", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"} : bf16 -> !pto.vmi.vreg<512xbf16>
          scf.for %arg9 = %c0 to %c128 step %c1 {
            %24 = arith.muli %arg9, %c512 : index
            pto.vmi.vstore %23, %21[%24], %22 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
          } {pto.tilelib.candidate = "vmi_texpands_bf16", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          pto.yield(%19) : (memref<128x512xbf16, strided<[512, 1], offset: ?>, #pto.address_space<vec>>) -> ()
        } {pto.fusion.group_id = 0 : i64} : memref<128x512xbf16, strided<[512, 1], offset: ?>, #pto.address_space<vec>>
        scf.for %arg9 = %c0 to %c128 step %c1 {
          %18 = arith.addi %5, %arg9 : index
          %19 = arith.cmpi slt, %18, %c128 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.if %19 {
            %20 = arith.muli %6, %c128 : index
            %21 = arith.addi %20, %18 : index
            %22 = pto.load_scalar %arg1[%21] : memref<?xi32, #pto.address_space<gm>> -> i32
            %23 = arith.index_cast %22 : i32 to index
            %24 = arith.cmpi sge, %23, %c0 : index
            scf.if %24 {
              %25 = arith.muli %23, %c512 : index
              %26 = pto.castptr %arg2 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
              %27 = pto.addptr %26, %25 : <bf16, gm> -> <bf16, gm>
              %28 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
              %29 = pto.castptr %28 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
              %30 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
              %31 = pto.addptr %29, %c0 : <bf16, ub> -> <bf16, ub>
              pto.mte_gm_ub %30, %31, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
              pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
              %32 = arith.index_cast %arg9 : index to i64
              %33 = arith.muli %32, %c1024_i64 : i64
              pto.fusion_region {
                pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
                %34 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %35 = pto.castptr %34 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %36 = pto.pointer_cast(%33) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %37 = pto.castptr %36 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %38 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
                %39 = pto.vmi.vload %35[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<512xbf16>
                pto.vmi.vstore %39, %37[%c0], %38 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
                pto.yield() : () -> ()
              } {pto.fusion.group_id = 1 : i64} :
            }
          } else {
            %20 = arith.subi %18, %c128 : index
            %21 = arith.cmpi slt, %20, %c512 : index
            scf.if %21 {
              %22 = arith.muli %6, %c512 : index
              %23 = arith.addi %22, %20 : index
              %24 = pto.load_scalar %arg3[%23] : memref<?xi32, #pto.address_space<gm>> -> i32
              %25 = arith.index_cast %24 : i32 to index
              %26 = arith.cmpi sge, %25, %c0 : index
              scf.if %26 {
                %27 = arith.divsi %25, %c128 : index
                %28 = pto.load_scalar %arg4[%27] : memref<?xi32, #pto.address_space<gm>> -> i32
                %29 = arith.index_cast %28 : i32 to index
                %30 = arith.muli %29, %c128 : index
                %31 = arith.muli %27, %c128 : index
                %32 = arith.subi %25, %31 : index
                %33 = arith.addi %30, %32 : index
                %34 = arith.muli %33, %c512 : index
                %35 = pto.castptr %arg5 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
                %36 = pto.addptr %35, %34 : <bf16, gm> -> <bf16, gm>
                %37 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                %38 = pto.castptr %37 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                %39 = pto.addptr %36, %c0 : <bf16, gm> -> <bf16, gm>
                %40 = pto.addptr %38, %c0 : <bf16, ub> -> <bf16, ub>
                pto.mte_gm_ub %39, %40, %c0_i64, %c1024_i64 nburst(%c1_i64, %c0_i64, %c1024_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0>} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64
                pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
                %41 = arith.index_cast %arg9 : index to i64
                %42 = arith.muli %41, %c1024_i64 : i64
                pto.fusion_region {
                  pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
                  %43 = pto.pointer_cast(%c131072_i64) %c1, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                  %44 = pto.castptr %43 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                  %45 = pto.pointer_cast(%42) {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<1x512xbf16, #pto.address_space<vec>>
                  %46 = pto.castptr %45 : memref<1x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
                  %47 = pto.vmi.create_mask %c512 {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index -> !pto.vmi.mask<512xpred>
                  %48 = pto.vmi.vload %44[%c0] : !pto.ptr<bf16, ub> -> !pto.vmi.vreg<512xbf16>
                  pto.vmi.vstore %48, %46[%c0], %47 : !pto.vmi.vreg<512xbf16>, !pto.ptr<bf16, ub>, !pto.vmi.mask<512xpred>
                  pto.yield() : () -> ()
                } {pto.fusion.group_id = 2 : i64} :
              }
            }
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        }
        pto.barrier <PIPE_MTE3>
        %11 = pto.pointer_cast(%c0_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<vec>>
        %12 = pto.castptr %11 : memref<128x512xbf16, #pto.address_space<vec>> -> !pto.ptr<bf16, ub>
        %13 = arith.muli %9, %c512 : index
        %14 = pto.castptr %arg0 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %15 = pto.addptr %14, %13 : <bf16, gm> -> <bf16, gm>
        %16 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
        %17 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
        pto.mte_ub_gm %16, %17, %c1024_i64 nburst(%c128_i64, %c1024_i64, %c1024_i64) l2_cache_ctl(%c0_i64) {operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0>} : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64
      }
    }
    pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
    return
  }
}
