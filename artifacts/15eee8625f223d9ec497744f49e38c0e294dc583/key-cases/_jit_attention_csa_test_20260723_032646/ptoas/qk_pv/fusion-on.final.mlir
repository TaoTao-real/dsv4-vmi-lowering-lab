module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c82624_i64 = arith.constant 82624 : i64
      %c82496_i64 = arith.constant 82496 : i64
      %c160 = arith.constant 160 : index
      %c63 = arith.constant 63 : index
      %c0_i32 = arith.constant 0 : i32
      %c65536_i64 = arith.constant 65536 : i64
      %c90880_i64 = arith.constant 90880 : i64
      %c82432_i64 = arith.constant 82432 : i64
      %c82560_i64 = arith.constant 82560 : i64
      %c82688_i64 = arith.constant 82688 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c640 = arith.constant 640 : index
      %c5 = arith.constant 5 : index
      %c128 = arith.constant 128 : index
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c24 = arith.constant 24 : index
      %c0 = arith.constant 0 : index
      %c320 = arith.constant 320 : index
      %c2 = arith.constant 2 : index
      %cst = arith.constant 0.0441941731 : f32
      %c80 = arith.constant 80 : index
      %c16 = arith.constant 16 : index
      %cst_0 = arith.constant 0.000000e+00 : f32
      %cst_1 = arith.constant -3.000000e+38 : f32
      %c16_i64 = arith.constant 16 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c0_i64 = arith.constant 0 : i64
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32_i16 = arith.constant 32 : i16
      %c1_i16 = arith.constant 1 : i16
      %c512_i64 = arith.constant 512 : i64
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c576 = arith.constant 576 : index
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
      %c2048 = arith.constant 2048 : index
      %c2112 = arith.constant 2112 : index
      %c2176 = arith.constant 2176 : index
      %c2240 = arith.constant 2240 : index
      %c2304 = arith.constant 2304 : index
      %c2368 = arith.constant 2368 : index
      %c2432 = arith.constant 2432 : index
      %c2496 = arith.constant 2496 : index
      %c2560 = arith.constant 2560 : index
      %c2624 = arith.constant 2624 : index
      %c2688 = arith.constant 2688 : index
      %c2752 = arith.constant 2752 : index
      %c2816 = arith.constant 2816 : index
      %c2880 = arith.constant 2880 : index
      %c2944 = arith.constant 2944 : index
      %c3008 = arith.constant 3008 : index
      %c3072 = arith.constant 3072 : index
      %c3136 = arith.constant 3136 : index
      %c3200 = arith.constant 3200 : index
      %c3264 = arith.constant 3264 : index
      %c3328 = arith.constant 3328 : index
      %c3392 = arith.constant 3392 : index
      %c3456 = arith.constant 3456 : index
      %c3520 = arith.constant 3520 : index
      %c3584 = arith.constant 3584 : index
      %c3648 = arith.constant 3648 : index
      %c3712 = arith.constant 3712 : index
      %c3776 = arith.constant 3776 : index
      %c3840 = arith.constant 3840 : index
      %c3904 = arith.constant 3904 : index
      %c3968 = arith.constant 3968 : index
      %c4032 = arith.constant 4032 : index
      %c3 = arith.constant 3 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %c8 = arith.constant 8 : index
      %c9 = arith.constant 9 : index
      %c10 = arith.constant 10 : index
      %c11 = arith.constant 11 : index
      %c12 = arith.constant 12 : index
      %c13 = arith.constant 13 : index
      %c14 = arith.constant 14 : index
      %c15 = arith.constant 15 : index
      %c17 = arith.constant 17 : index
      %c18 = arith.constant 18 : index
      %c19 = arith.constant 19 : index
      %c20 = arith.constant 20 : index
      %c21 = arith.constant 21 : index
      %c22 = arith.constant 22 : index
      %c23 = arith.constant 23 : index
      %c25 = arith.constant 25 : index
      %c26 = arith.constant 26 : index
      %c27 = arith.constant 27 : index
      %c28 = arith.constant 28 : index
      %c29 = arith.constant 29 : index
      %c30 = arith.constant 30 : index
      %c31 = arith.constant 31 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg12 : i32 to index
      %2 = arith.subi %c63, %1 : index
      %3 = arith.divsi %2, %c24 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %4 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg14 = %c0 to %3 step %c1 {
        %6 = arith.muli %arg14, %c24 : index
        %7 = arith.addi %1, %6 : index
        %8 = pto.load_scalar %arg3[%7] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.divsi %9, %c5 : index
        %11 = arith.muli %10, %c5 : index
        %12 = arith.subi %9, %11 : index
        %13 = arith.muli %10, %c320 : index
        %14 = arith.muli %12, %c128 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %15 = arith.muli %10, %c640 : index
        %16 = arith.addi %15, %14 : index
        %17 = pto.addptr %arg4, %16 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %18, %5, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %19 = pto.load_scalar %arg5[%9] : !pto.ptr<i32, gm> -> i32
        %20 = arith.index_cast %19 : i32 to index
        %21 = arith.cmpi sgt, %20, %c0 : index
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
        scf.if %21 {
          %22 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.castptr %c82432_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.castptr %c82560_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<bf16, ub>
          %26 = arith.muli %12, %c16 : index
          %27 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
          %28 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          %29 = pto.castptr %c82496_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
          %31 = pto.castptr %c82624_i64 : i64 -> !pto.ptr<f32, ub>
          %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg15 = %c0 to %c2 step %c1 {
            %33 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
            %34 = builtin.unrealized_conversion_cast %33 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
            %35 = pto.materialize_tile %33, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tpop(%35, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
            pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            %36 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            pto.vecscope {
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %55 = arith.index_cast %arg16 : i16 to index
                %56 = arith.muli %55, %c128 : index
                %result = pto.vlds %34[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %57 = arith.addi %56, %c64 : index
                %result_2 = pto.vlds %34[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %58 = pto.vmuls %result, %cst, %54 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %59 = pto.vmuls %result_2, %cst, %54 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %58, %22[%56], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %59, %22[%57], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %4[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %185 = arith.index_cast %arg16 : i16 to index
                %186 = arith.muli %185, %c128 : index
                %result_131 = pto.vlds %22[%186] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %187 = arith.addi %186, %c64 : index
                %result_132 = pto.vlds %22[%187] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %188 = pto.vadd %result_131, %result, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %189 = pto.vadd %result_132, %result_2, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %188, %22[%186], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %189, %22[%187], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"}
              %result_3 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %22[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %22[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %22[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %22[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %22[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %22[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %22[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %22[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %22[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %22[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %22[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %22[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %22[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %22[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %22[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %22[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %22[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %22[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %22[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %22[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_24 = pto.vlds %22[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %22[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %22[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %22[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_28 = pto.vlds %22[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %22[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %22[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %22[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_32 = pto.vlds %22[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_33 = pto.vlds %22[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_34 = pto.vlds %22[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_35 = pto.vlds %22[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_36 = pto.vlds %22[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_37 = pto.vlds %22[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_38 = pto.vlds %22[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_39 = pto.vlds %22[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_40 = pto.vlds %22[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_41 = pto.vlds %22[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_42 = pto.vlds %22[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_43 = pto.vlds %22[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_44 = pto.vlds %22[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_45 = pto.vlds %22[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_46 = pto.vlds %22[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_47 = pto.vlds %22[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_48 = pto.vlds %22[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_49 = pto.vlds %22[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_50 = pto.vlds %22[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_51 = pto.vlds %22[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_52 = pto.vlds %22[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_53 = pto.vlds %22[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_54 = pto.vlds %22[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_55 = pto.vlds %22[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_56 = pto.vlds %22[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_57 = pto.vlds %22[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_58 = pto.vlds %22[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_59 = pto.vlds %22[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_60 = pto.vlds %22[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_61 = pto.vlds %22[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_62 = pto.vlds %22[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_63 = pto.vlds %22[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_64 = pto.vlds %22[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_65 = pto.vlds %22[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_66 = pto.vlds %22[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vmax %result_3, %result_4, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vcmax %56, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vmax %result_5, %result_6, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.vcmax %58, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vmax %result_7, %result_8, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.vcmax %60, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %62 = pto.vmax %result_9, %result_10, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %63 = pto.vcmax %62, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vmax %result_11, %result_12, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %65 = pto.vcmax %64, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vmax %result_13, %result_14, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vcmax %66, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = pto.vmax %result_15, %result_16, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vcmax %68, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmax %result_17, %result_18, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vcmax %70, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vmax %result_19, %result_20, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vcmax %72, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmax %result_21, %result_22, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vcmax %74, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmax %result_23, %result_24, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vcmax %76, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vmax %result_25, %result_26, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vcmax %78, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vmax %result_27, %result_28, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vcmax %80, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vmax %result_29, %result_30, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vcmax %82, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmax %result_31, %result_32, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vcmax %84, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmax %result_33, %result_34, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vcmax %86, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vmax %result_35, %result_36, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vcmax %88, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vmax %result_37, %result_38, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vcmax %90, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vmax %result_39, %result_40, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vcmax %92, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vmax %result_41, %result_42, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vcmax %94, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vmax %result_43, %result_44, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vcmax %96, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vmax %result_45, %result_46, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %99 = pto.vcmax %98, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %100 = pto.vmax %result_47, %result_48, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %101 = pto.vcmax %100, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %102 = pto.vmax %result_49, %result_50, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %103 = pto.vcmax %102, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %104 = pto.vmax %result_51, %result_52, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %105 = pto.vcmax %104, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %106 = pto.vmax %result_53, %result_54, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %107 = pto.vcmax %106, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %108 = pto.vmax %result_55, %result_56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %109 = pto.vcmax %108, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %110 = pto.vmax %result_57, %result_58, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %111 = pto.vcmax %110, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %112 = pto.vmax %result_59, %result_60, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %113 = pto.vcmax %112, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %114 = pto.vmax %result_61, %result_62, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %115 = pto.vcmax %114, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %116 = pto.vmax %result_63, %result_64, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %117 = pto.vcmax %116, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %118 = pto.vmax %result_65, %result_66, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %119 = pto.vcmax %118, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %120 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              pto.vsts %57, %23[%c0], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %59, %23[%c1], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %61, %23[%c2], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %63, %23[%c3], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %65, %23[%c4], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %67, %23[%c5], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %69, %23[%c6], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %23[%c7], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %23[%c8], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %23[%c9], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %23[%c10], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %79, %23[%c11], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %81, %23[%c12], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %83, %23[%c13], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %23[%c14], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %23[%c15], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %89, %23[%c16], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %91, %23[%c17], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %93, %23[%c18], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %95, %23[%c19], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %97, %23[%c20], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %99, %23[%c21], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %101, %23[%c22], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %103, %23[%c23], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %105, %23[%c24], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %107, %23[%c25], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %109, %23[%c26], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %111, %23[%c27], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %113, %23[%c28], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %115, %23[%c29], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %117, %23[%c30], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %119, %23[%c31], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %185 = arith.index_cast %arg16 : i16 to index
                %result_131 = pto.vlds %23[%185] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %186 = pto.vdup %result_131, %54 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %187 = arith.muli %185, %c128 : index
                %result_132 = pto.vlds %22[%187] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %188 = arith.addi %187, %c64 : index
                %result_133 = pto.vlds %22[%188] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %189 = pto.vsub %result_132, %186, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %190 = pto.vsub %result_133, %186, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %191 = pto.vexp %189, %54 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %192 = pto.vexp %190, %54 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %191, %22[%187], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %192, %22[%188], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              %result_67 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_68 = pto.vlds %22[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_69 = pto.vlds %22[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_70 = pto.vlds %22[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_71 = pto.vlds %22[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_72 = pto.vlds %22[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_73 = pto.vlds %22[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_74 = pto.vlds %22[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_75 = pto.vlds %22[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_76 = pto.vlds %22[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_77 = pto.vlds %22[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_78 = pto.vlds %22[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_79 = pto.vlds %22[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_80 = pto.vlds %22[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_81 = pto.vlds %22[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_82 = pto.vlds %22[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_83 = pto.vlds %22[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_84 = pto.vlds %22[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_85 = pto.vlds %22[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_86 = pto.vlds %22[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_87 = pto.vlds %22[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_88 = pto.vlds %22[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_89 = pto.vlds %22[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_90 = pto.vlds %22[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_91 = pto.vlds %22[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_92 = pto.vlds %22[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_93 = pto.vlds %22[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_94 = pto.vlds %22[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_95 = pto.vlds %22[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_96 = pto.vlds %22[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_97 = pto.vlds %22[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_98 = pto.vlds %22[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_99 = pto.vlds %22[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_100 = pto.vlds %22[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_101 = pto.vlds %22[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_102 = pto.vlds %22[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_103 = pto.vlds %22[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_104 = pto.vlds %22[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_105 = pto.vlds %22[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_106 = pto.vlds %22[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_107 = pto.vlds %22[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_108 = pto.vlds %22[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_109 = pto.vlds %22[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_110 = pto.vlds %22[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_111 = pto.vlds %22[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_112 = pto.vlds %22[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_113 = pto.vlds %22[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_114 = pto.vlds %22[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_115 = pto.vlds %22[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_116 = pto.vlds %22[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_117 = pto.vlds %22[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_118 = pto.vlds %22[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_119 = pto.vlds %22[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_120 = pto.vlds %22[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_121 = pto.vlds %22[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_122 = pto.vlds %22[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_123 = pto.vlds %22[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_124 = pto.vlds %22[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_125 = pto.vlds %22[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_126 = pto.vlds %22[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_127 = pto.vlds %22[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_128 = pto.vlds %22[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_129 = pto.vlds %22[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_130 = pto.vlds %22[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %121 = pto.vadd %result_67, %result_68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %122 = pto.vcadd %121, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %123 = pto.vadd %result_69, %result_70, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %124 = pto.vcadd %123, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %125 = pto.vadd %result_71, %result_72, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vcadd %125, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.vadd %result_73, %result_74, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %128 = pto.vcadd %127, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %129 = pto.vadd %result_75, %result_76, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %130 = pto.vcadd %129, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %131 = pto.vadd %result_77, %result_78, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %132 = pto.vcadd %131, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %133 = pto.vadd %result_79, %result_80, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %134 = pto.vcadd %133, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %135 = pto.vadd %result_81, %result_82, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %136 = pto.vcadd %135, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %137 = pto.vadd %result_83, %result_84, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %138 = pto.vcadd %137, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %139 = pto.vadd %result_85, %result_86, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %140 = pto.vcadd %139, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %141 = pto.vadd %result_87, %result_88, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %142 = pto.vcadd %141, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %143 = pto.vadd %result_89, %result_90, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %144 = pto.vcadd %143, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %145 = pto.vadd %result_91, %result_92, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %146 = pto.vcadd %145, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %147 = pto.vadd %result_93, %result_94, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %148 = pto.vcadd %147, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %149 = pto.vadd %result_95, %result_96, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %150 = pto.vcadd %149, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %151 = pto.vadd %result_97, %result_98, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %152 = pto.vcadd %151, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %153 = pto.vadd %result_99, %result_100, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %154 = pto.vcadd %153, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %155 = pto.vadd %result_101, %result_102, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %156 = pto.vcadd %155, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %157 = pto.vadd %result_103, %result_104, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %158 = pto.vcadd %157, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %159 = pto.vadd %result_105, %result_106, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %160 = pto.vcadd %159, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %161 = pto.vadd %result_107, %result_108, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %162 = pto.vcadd %161, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %163 = pto.vadd %result_109, %result_110, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %164 = pto.vcadd %163, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %165 = pto.vadd %result_111, %result_112, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %166 = pto.vcadd %165, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %167 = pto.vadd %result_113, %result_114, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %168 = pto.vcadd %167, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %169 = pto.vadd %result_115, %result_116, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %170 = pto.vcadd %169, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %171 = pto.vadd %result_117, %result_118, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %172 = pto.vcadd %171, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %173 = pto.vadd %result_119, %result_120, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %174 = pto.vcadd %173, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %175 = pto.vadd %result_121, %result_122, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %176 = pto.vcadd %175, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %177 = pto.vadd %result_123, %result_124, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %178 = pto.vcadd %177, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %179 = pto.vadd %result_125, %result_126, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %180 = pto.vcadd %179, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %181 = pto.vadd %result_127, %result_128, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %182 = pto.vcadd %181, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %183 = pto.vadd %result_129, %result_130, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %184 = pto.vcadd %183, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %122, %24[%c0], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %124, %24[%c1], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %126, %24[%c2], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %128, %24[%c3], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %130, %24[%c4], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %132, %24[%c5], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %134, %24[%c6], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %136, %24[%c7], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %138, %24[%c8], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %140, %24[%c9], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %142, %24[%c10], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %144, %24[%c11], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %146, %24[%c12], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %148, %24[%c13], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %150, %24[%c14], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %152, %24[%c15], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %154, %24[%c16], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %156, %24[%c17], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %158, %24[%c18], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %160, %24[%c19], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %162, %24[%c20], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %164, %24[%c21], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %166, %24[%c22], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %168, %24[%c23], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %170, %24[%c24], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %172, %24[%c25], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %174, %24[%c26], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %176, %24[%c27], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %178, %24[%c28], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %180, %24[%c29], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %182, %24[%c30], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %184, %24[%c31], %120 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %185 = arith.index_cast %arg16 : i16 to index
                %186 = arith.muli %185, %c128 : index
                %result_131 = pto.vlds %22[%186] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %187 = arith.addi %186, %c64 : index
                %result_132 = pto.vlds %22[%187] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %188 = pto.vcvt %result_131, %54 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %189 = pto.vcvt %result_132, %54 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                pto.vsts %188, %25[%186], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
                pto.vsts %189, %25[%187], %55 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            %37 = pto.alloc_tile addr = %c82688_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            pto.vecscope {
              %54 = pto.castptr %c82688_i64 : i64 -> !pto.ptr<bf16, ub>
              %55 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
              %56 = scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16 iter_args(%arg17 = %54) -> (!pto.ptr<bf16, ub>)  : i16 {
                %57 = arith.index_cast %arg16 : i16 to index
                %58 = arith.muli %57, %c128 : index
                %result = pto.vlds %25[%58] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %59 = pto.addptr %arg17, %c0 : <bf16, ub> -> <bf16, ub>
                %60 = pto.vsstb %result, %59, %c32_i16, %c1_i16, %55 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
                scf.yield %60 : !pto.ptr<bf16, ub>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.tpush(%37, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
            %38 = arith.muli %arg15, %c2 : index
            %39 = arith.muli %arg15, %c160 : index
            %40 = arith.addi %13, %39 : index
            %41 = arith.addi %40, %26 : index
            pto.barrier <PIPE_MTE3>
            %42 = pto.addptr %arg1, %41 : <f32, gm> -> <f32, gm>
            %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %27, %43, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %44 = pto.addptr %arg0, %41 : <f32, gm> -> <f32, gm>
            %45 = pto.addptr %44, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %28, %45, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %46 = arith.addi %38, %c1 : index
            %47 = arith.muli %46, %c80 : index
            %48 = arith.addi %13, %47 : index
            %49 = arith.addi %48, %26 : index
            pto.barrier <PIPE_MTE3>
            %50 = pto.addptr %arg1, %49 : <f32, gm> -> <f32, gm>
            %51 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %30, %51, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %52 = pto.addptr %arg0, %49 : <f32, gm> -> <f32, gm>
            %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %32, %53, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        } else {
          %22 = pto.alloc_tile addr = %c90880_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
          %23 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %28 = pto.vdup %cst_0, %27 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg15 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %29 = arith.index_cast %arg15 : i16 to index
              %30 = arith.muli %29, %c512 : index
              pto.vsts %28, %23[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %31 = arith.addi %30, %c64 : index
              pto.vsts %28, %23[%31], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %32 = arith.addi %30, %c128 : index
              pto.vsts %28, %23[%32], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %33 = arith.addi %30, %c192 : index
              pto.vsts %28, %23[%33], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %34 = arith.addi %30, %c256 : index
              pto.vsts %28, %23[%34], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %35 = arith.addi %30, %c320 : index
              pto.vsts %28, %23[%35], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %36 = arith.addi %30, %c384 : index
              pto.vsts %28, %23[%36], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %37 = arith.addi %30, %c448 : index
              pto.vsts %28, %23[%37], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          }
          %24 = arith.muli %12, %c16 : index
          %25 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg15 = %c0 to %c4 step %c1 {
            %26 = arith.muli %arg15, %c80 : index
            %27 = arith.addi %13, %26 : index
            %28 = arith.addi %27, %24 : index
            scf.for %arg16 = %c0 to %c16 step %c1 {
              %32 = arith.addi %28, %arg16 : index
              pto.store_scalar %cst_1, %arg1[%32] : !pto.ptr<f32, gm>, f32
              pto.store_scalar %cst_0, %arg0[%32] : !pto.ptr<f32, gm>, f32
            }
            pto.barrier <PIPE_MTE3>
            %29 = arith.muli %28, %c512 : index
            %30 = pto.addptr %arg2, %29 : <f32, gm> -> <f32, gm>
            %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %25, %31, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
        pto.set_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qk_pv_aic(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022240_i64 = arith.constant 8796093022240 : i64
      %c2199024312320_i64 = arith.constant 2199024312320 : i64
      %c2305843017803759648_i64 = arith.constant 2305843017803759648 : i64
      %c-6917529019051016160_i64 = arith.constant -6917529019051016160 : i64
      %c2305843011361701920_i64 = arith.constant 2305843011361701920 : i64
      %c-6917529025493073888_i64 = arith.constant -6917529025493073888 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c2_i64 = arith.constant 2 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c4295032833_i64 = arith.constant 4295032833 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c32_i64 = arith.constant 32 : i64
      %c63 = arith.constant 63 : index
      %c0_i32 = arith.constant 0 : i32
      %c240 = arith.constant 240 : index
      %c160 = arith.constant 160 : index
      %c80 = arith.constant 80 : index
      %c65536_i64 = arith.constant 65536 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c5 = arith.constant 5 : index
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %c24 = arith.constant 24 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c320 = arith.constant 320 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c16 = arith.constant 16 : index
      %c512_i64 = arith.constant 512 : i64
      %c1_i64 = arith.constant 1 : i64
      %false = arith.constant false
      %c32768 = arith.constant 32768 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg12 : i32 to index
      %2 = arith.subi %c63, %1 : index
      %3 = arith.divsi %2, %c24 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      scf.for %arg14 = %c0 to %3 step %c1 {
        %4 = arith.muli %arg14, %c24 : index
        %5 = arith.addi %1, %4 : index
        %6 = pto.load_scalar %arg3[%5] : !pto.ptr<i32, gm> -> i32
        %7 = arith.index_cast %6 : i32 to index
        %8 = arith.divsi %7, %c5 : index
        %9 = arith.muli %8, %c5 : index
        %10 = arith.subi %7, %9 : index
        %11 = arith.divsi %8, %c2 : index
        %12 = arith.muli %8, %c320 : index
        %13 = arith.muli %10, %c128 : index
        %14 = pto.load_scalar %arg5[%7] : !pto.ptr<i32, gm> -> i32
        %15 = arith.index_cast %14 : i32 to index
        %16 = arith.cmpi sgt, %15, %c0 : index
        scf.if %16 {
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          scf.for %arg15 = %c0 to %c128 step %c1 {
            %60 = arith.addi %13, %arg15 : index
            %61 = arith.cmpi slt, %60, %c128 : index
            scf.if %61 {
              %62 = arith.muli %8, %c128 : index
              %63 = arith.addi %62, %60 : index
              %64 = pto.load_scalar %arg6[%63] : !pto.ptr<i32, gm> -> i32
              %65 = arith.index_cast %64 : i32 to index
              %66 = arith.cmpi sge, %65, %c0 : index
              scf.if %66 {
                %67 = arith.index_cast %arg15 : index to i64
                %68 = arith.muli %67, %c32_i64 : i64
                %69 = arith.addi %68, %c65536_i64 : i64
                %70 = arith.muli %65, %c512 : index
                %71 = pto.addptr %arg7, %70 : <bf16, gm> -> <bf16, gm>
                %72 = pto.castptr %69 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %71, %72, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              } else {
                %67 = arith.index_cast %arg15 : index to i64
                %68 = arith.muli %67, %c32_i64 : i64
                %69 = arith.addi %68, %c65536_i64 : i64
                %70 = pto.castptr %69 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %70, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              }
            } else {
              %62 = arith.subi %60, %c128 : index
              %63 = arith.cmpi slt, %62, %c512 : index
              scf.if %63 {
                %64 = arith.muli %8, %c512 : index
                %65 = arith.addi %64, %62 : index
                %66 = pto.load_scalar %arg8[%65] : !pto.ptr<i32, gm> -> i32
                %67 = arith.index_cast %66 : i32 to index
                %68 = arith.cmpi sge, %67, %c0 : index
                scf.if %68 {
                  %69 = arith.divsi %67, %c128 : index
                  %70 = arith.muli %11, %c32 : index
                  %71 = arith.addi %70, %69 : index
                  %72 = pto.load_scalar %arg9[%71] : !pto.ptr<i32, gm> -> i32
                  %73 = arith.index_cast %72 : i32 to index
                  %74 = arith.muli %73, %c128 : index
                  %75 = arith.remsi %67, %c128 : index
                  %76 = arith.addi %74, %75 : index
                  %77 = arith.index_cast %arg15 : index to i64
                  %78 = arith.muli %77, %c32_i64 : i64
                  %79 = arith.addi %78, %c65536_i64 : i64
                  %80 = arith.muli %76, %c512 : index
                  %81 = pto.addptr %arg10, %80 : <bf16, gm> -> <bf16, gm>
                  %82 = pto.castptr %79 : i64 -> !pto.ptr<bf16, l1>
                  pto.set_mte2_nz_para %c4295032833_i64 : i64
                  pto.copy_gm_to_cbuf_multi_nd2nz %81, %82, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
                } else {
                  %69 = arith.index_cast %arg15 : index to i64
                  %70 = arith.muli %69, %c32_i64 : i64
                  %71 = arith.addi %70, %c65536_i64 : i64
                  %72 = pto.castptr %71 : i64 -> !pto.ptr<bf16, l1>
                  pto.set_mte2_nz_para %c4295032833_i64 : i64
                  pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %72, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
                }
              } else {
                %64 = arith.index_cast %arg15 : index to i64
                %65 = arith.muli %64, %c32_i64 : i64
                %66 = arith.addi %65, %c65536_i64 : i64
                %67 = pto.castptr %66 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %67, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              }
            }
          }
          %17 = arith.muli %8, %c64 : index
          %18 = arith.muli %8, %c32768 : index
          %19 = pto.addptr %arg11, %18 : <bf16, gm> -> <bf16, gm>
          %20 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %19, %20, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %21 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          %23 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, l1>
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          %25 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          %26 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
          %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
          %28 = pto.get_ctrl : i64
          %29 = pto.sbitset0 %28, %c45_i64 : i64, i64 -> i64
          %30 = pto.sbitset0 %29, %c46_i64 : i64, i64 -> i64
          %31 = pto.sbitset0 %30, %c47_i64 : i64, i64 -> i64
          %32 = pto.sbitset0 %31, %c51_i64 : i64, i64 -> i64
          scf.for %arg15 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_MTE1>
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %22, %c0_i64, %61, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            %63 = arith.addi %arg15, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %25, %c0_i64, %65, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            %67 = arith.cmpi eq, %arg15, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            scf.if %67 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          pto.tpush(%21, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          %33 = arith.addi %17, %c32 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          %34 = arith.muli %33, %c512 : index
          %35 = pto.addptr %arg11, %34 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %35, %20, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
          %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          scf.for %arg15 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            pto.barrier <PIPE_MTE1>
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %22, %c0_i64, %61, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            %63 = arith.addi %arg15, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %25, %c0_i64, %65, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            %67 = arith.cmpi eq, %arg15, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            scf.if %67 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
          pto.tpush(%36, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
          %37 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %38 = pto.materialize_tile %37, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
          pto.tpop(%38, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          %39 = pto.castptr %37 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg15 = %c0 to %c128 step %c64 {
            pto.barrier <PIPE_MTE1>
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %39, %22, %c0_i64, %61, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            %63 = arith.addi %arg15, %c32 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %39, %25, %c0_i64, %65, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            %67 = arith.cmpi eq, %arg15, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            scf.if %67 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %40 = arith.muli %10, %c16 : index
          %41 = arith.addi %12, %40 : index
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
          pto.barrier <PIPE_FIX>
          %42 = arith.muli %41, %c512 : index
          %43 = pto.addptr %arg2, %42 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %27, %43, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %44 = arith.addi %12, %c80 : index
          %45 = arith.addi %44, %40 : index
          pto.barrier <PIPE_FIX>
          %46 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, l0c>
          %47 = arith.muli %45, %c512 : index
          %48 = pto.addptr %arg2, %47 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %46, %48, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
          %49 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %50 = pto.materialize_tile %49, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
          pto.tpop(%50, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %51 = pto.castptr %49 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg15 = %c0 to %c128 step %c64 {
            pto.barrier <PIPE_MTE1>
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %51, %22, %c0_i64, %61, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            %63 = arith.addi %arg15, %c32 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %51, %25, %c0_i64, %65, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            %67 = arith.cmpi eq, %arg15, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            scf.if %67 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %52 = arith.addi %12, %c160 : index
          %53 = arith.addi %52, %40 : index
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
          pto.barrier <PIPE_FIX>
          %54 = arith.muli %53, %c512 : index
          %55 = pto.addptr %arg2, %54 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %27, %55, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %56 = arith.addi %12, %c240 : index
          %57 = arith.addi %56, %40 : index
          pto.barrier <PIPE_FIX>
          %58 = arith.muli %57, %c512 : index
          %59 = pto.addptr %arg2, %58 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %46, %59, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
