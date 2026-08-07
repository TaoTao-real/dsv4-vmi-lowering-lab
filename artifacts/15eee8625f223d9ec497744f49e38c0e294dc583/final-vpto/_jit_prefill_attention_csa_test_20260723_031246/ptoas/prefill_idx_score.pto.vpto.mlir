module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_aiv(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i32 = arith.constant 0 : i32
      %c90368_i64 = arith.constant 90368 : i64
      %c90496_i64 = arith.constant 90496 : i64
      %c73984_i64 = arith.constant 73984 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c73728_i64 = arith.constant 73728 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c2048 = arith.constant 2048 : index
      %c64 = arith.constant 64 : index
      %c127 = arith.constant 127 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32_i32 = arith.constant 32 : i32
      %c256_i64 = arith.constant 256 : i64
      %c192 = arith.constant 192 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c512 = arith.constant 512 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %c1024 = arith.constant 1024 : index
      %c1088 = arith.constant 1088 : index
      %c1152 = arith.constant 1152 : index
      %c1216 = arith.constant 1216 : index
      %c1280 = arith.constant 1280 : index
      %c1344 = arith.constant 1344 : index
      %c1408 = arith.constant 1408 : index
      %c1472 = arith.constant 1472 : index
      %c1536 = arith.constant 1536 : index
      %c1600 = arith.constant 1600 : index
      %c1664 = arith.constant 1664 : index
      %c1728 = arith.constant 1728 : index
      %c1792 = arith.constant 1792 : index
      %c1856 = arith.constant 1856 : index
      %c1920 = arith.constant 1920 : index
      %c1984 = arith.constant 1984 : index
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %c9 = arith.constant 9 : index
      %c10 = arith.constant 10 : index
      %c11 = arith.constant 11 : index
      %c12 = arith.constant 12 : index
      %c13 = arith.constant 13 : index
      %c14 = arith.constant 14 : index
      %c15 = arith.constant 15 : index
      %c16 = arith.constant 16 : index
      %c17 = arith.constant 17 : index
      %c18 = arith.constant 18 : index
      %c19 = arith.constant 19 : index
      %c20 = arith.constant 20 : index
      %c21 = arith.constant 21 : index
      %c22 = arith.constant 22 : index
      %c23 = arith.constant 23 : index
      %c24 = arith.constant 24 : index
      %c25 = arith.constant 25 : index
      %c26 = arith.constant 26 : index
      %c27 = arith.constant 27 : index
      %c28 = arith.constant 28 : index
      %c29 = arith.constant 29 : index
      %c30 = arith.constant 30 : index
      %c31 = arith.constant 31 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      %1 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
      %2 = arith.index_cast %1 : i32 to index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.divsi %3, %c4 : index
      %5 = arith.minsi %4, %c256 : index
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %6 = arith.muli %arg9, %c32 : index
        %7 = arith.cmpi slt, %6, %5 : index
        scf.if %7 {
          %8 = arith.divsi %6, %c128 : index
          %9 = pto.load_scalar %arg2[%8] : !pto.ptr<i32, gm> -> i32
          %10 = arith.index_cast %9 : i32 to index
          %11 = arith.muli %10, %c128 : index
          %12 = arith.remsi %6, %c128 : index
          %13 = arith.addi %11, %12 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %14 = pto.addptr %arg4, %13 : <f32, gm> -> <f32, gm>
          %15 = pto.castptr %c90368_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
          %17 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %16, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %18 = pto.castptr %c90496_i64 : i64 -> !pto.ptr<f32, ub>
          %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
          %20 = pto.castptr %c73984_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
          %24 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg10 = %c0 to %c128 step %c1 {
            %25 = arith.muli %arg10, %c64 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
            %26 = pto.addptr %arg6, %25 : <f32, gm> -> <f32, gm>
            %27 = pto.addptr %26, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %27, %19, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            %28 = pto.declare_tile_memref -> memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
            %29 = builtin.unrealized_conversion_cast %28 : memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<i32, ub>
            %30 = pto.materialize_tile %28, %c32, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x64xi32, valid=?x?>
            pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tpop(%30, %0 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>, !pto.pipe) {split = 0}
            pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            %31 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
            pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
            pto.vecscope {
              %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %41 = arith.index_cast %arg11 : i16 to index
                %42 = arith.muli %41, %c64 : index
                %result = pto.vlds %29[%42] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %43 = pto.vcvt %result, %40 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %43, %20[%42], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %41 = arith.index_cast %arg11 : i16 to index
                %result = pto.vlds %15[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %42 = pto.vdup %result, %39 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %43 = arith.muli %41, %c64 : index
                %result_1 = pto.vlds %20[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vmul %result_1, %42, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %20[%43], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            }
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            pto.vecscope {
              %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %41 = arith.index_cast %arg11 : i16 to index
                %42 = arith.muli %41, %c64 : index
                %result_1 = pto.vlds %20[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %43 = pto.vmul %result_1, %result, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %43, %20[%42], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %44 = pto.vmuls %43, %cst, %40 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %21[%42], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
            %32 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
            pto.vecscope {
              %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %41 = arith.index_cast %arg11 : i16 to index
                %42 = arith.muli %41, %c64 : index
                %result = pto.vlds %20[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %21[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %43 = pto.vmax %result, %result_1, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %43, %20[%42], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
            }
            %33 = pto.addptr %arg7, %25 : <f32, gm> -> <f32, gm>
            %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %34, %23, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %75 = arith.index_cast %arg11 : i16 to index
                %76 = arith.muli %75, %c64 : index
                %result_34 = pto.vlds %20[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %77 = pto.vmul %result_34, %result, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %77, %21[%76], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
              %result_1 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %21[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %21[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %21[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %21[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %21[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %21[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %21[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %21[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %21[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %21[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %21[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %21[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %21[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %21[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %21[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %21[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %21[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %21[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %21[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %21[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %21[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %21[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_24 = pto.vlds %21[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %21[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %21[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %21[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_28 = pto.vlds %21[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %21[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %21[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %21[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_32 = pto.vlds %21[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vcadd %result_1, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %42 = pto.vcadd %result_2, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %43 = pto.vcadd %result_3, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vcadd %result_4, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.vcadd %result_5, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vcadd %result_6, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vcadd %result_7, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vcadd %result_8, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vcadd %result_9, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vcadd %result_10, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vcadd %result_11, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.vcadd %result_12, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vcadd %result_13, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %54 = pto.vcadd %result_14, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %55 = pto.vcadd %result_15, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %56 = pto.vcadd %result_16, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vcadd %result_17, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vcadd %result_18, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.vcadd %result_19, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vcadd %result_20, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.vcadd %result_21, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %62 = pto.vcadd %result_22, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %63 = pto.vcadd %result_23, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vcadd %result_24, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %65 = pto.vcadd %result_25, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vcadd %result_26, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vcadd %result_27, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = pto.vcadd %result_28, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vcadd %result_29, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vcadd %result_30, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vcadd %result_31, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vcadd %result_32, %40 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              pto.vsts %41, %18[%c0], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %42, %18[%c1], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %43, %18[%c2], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %44, %18[%c3], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %45, %18[%c4], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %46, %18[%c5], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %47, %18[%c6], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %18[%c7], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %49, %18[%c8], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %18[%c9], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %51, %18[%c10], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %52, %18[%c11], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %53, %18[%c12], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %54, %18[%c13], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %55, %18[%c14], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %56, %18[%c15], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %57, %18[%c16], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %58, %18[%c17], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %59, %18[%c18], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %60, %18[%c19], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %61, %18[%c20], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %62, %18[%c21], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %63, %18[%c22], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %64, %18[%c23], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %65, %18[%c24], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %66, %18[%c25], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %67, %18[%c26], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %68, %18[%c27], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %69, %18[%c28], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %18[%c29], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %18[%c30], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %18[%c31], %73 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %74 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_33 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_33, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
            pto.vecscope {
              %39 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %40 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %40, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %41, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            %35 = arith.muli %arg10, %c2048 : index
            %36 = arith.addi %35, %6 : index
            %37 = pto.addptr %arg1, %36 : <f32, gm> -> <f32, gm>
            %38 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %24, %38, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_aic(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c-6917529026566815712_i64 = arith.constant -6917529026566815712 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c2_i64 = arith.constant 2 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c0_i32 = arith.constant 0 : i32
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c127 = arith.constant 127 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c32 = arith.constant 32 : index
      %c32_i64 = arith.constant 32 : i64
      %c128_i64 = arith.constant 128 : i64
      %false = arith.constant false
      %c64_i64 = arith.constant 64 : i64
      %c8192 = arith.constant 8192 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      %1 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
      %2 = arith.index_cast %1 : i32 to index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.divsi %3, %c4 : index
      %5 = arith.minsi %4, %c256 : index
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %6 = arith.muli %arg9, %c32 : index
        %7 = arith.cmpi slt, %6, %5 : index
        scf.if %7 {
          %8 = arith.divsi %6, %c128 : index
          %9 = pto.load_scalar %arg2[%8] : !pto.ptr<i32, gm> -> i32
          %10 = arith.index_cast %9 : i32 to index
          %11 = arith.muli %10, %c128 : index
          %12 = arith.remsi %6, %c128 : index
          %13 = arith.addi %11, %12 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          %14 = arith.muli %13, %c128 : index
          %15 = pto.addptr %arg3, %14 : <i8, gm> -> <i8, gm>
          %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %15, %16, %c0_i64, %c128_i64, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %17 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l1>
          %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
          %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
          %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
          %21 = pto.get_ctrl : i64
          %22 = pto.sbitset0 %21, %c45_i64 : i64, i64 -> i64
          %23 = pto.sbitset0 %22, %c46_i64 : i64, i64 -> i64
          %24 = pto.sbitset0 %23, %c47_i64 : i64, i64 -> i64
          %25 = pto.sbitset0 %24, %c51_i64 : i64, i64 -> i64
          scf.for %arg10 = %c0 to %c128 step %c1 {
            pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
            %26 = arith.muli %arg10, %c8192 : index
            %27 = pto.addptr %arg5, %26 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c274877972481_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %27, %17, %c0_i64, %c128_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
            pto.load_cbuf_to_ca %16, %18, %c0_i64, %c0_i64, %c2_i64, %c4_i64, %c2_i64, %c2_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.load_cbuf_to_cb %17, %19, %c0_i64, %c0_i64, %c8_i64, %c2_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            %28 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
            pto.set_ctrl %25 : i64
            pto.mad_raw %18, %19, %20, %c-6917529026566815712_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %21 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
            pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
            pto.tpush(%28, %0 : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
            pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
          }
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
