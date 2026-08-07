module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c65728_i64 = arith.constant 65728 : i64
      %c65600_i64 = arith.constant 65600 : i64
      %c96 = arith.constant 96 : index
      %c0_i32 = arith.constant 0 : i32
      %c73984_i64 = arith.constant 73984 : i64
      %c74496_i64 = arith.constant 74496 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c65792_i64 = arith.constant 65792 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c384 = arith.constant 384 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c2 = arith.constant 2 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.0441941731 : f32
      %c48 = arith.constant 48 : index
      %c16 = arith.constant 16 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32_i16 = arith.constant 32 : i16
      %c1_i16 = arith.constant 1 : i16
      %c512_i64 = arith.constant 512 : i64
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
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
      %c4 = arith.constant 4 : index
      %c5 = arith.constant 5 : index
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
      %c24 = arith.constant 24 : index
      %c25 = arith.constant 25 : index
      %c26 = arith.constant 26 : index
      %c27 = arith.constant 27 : index
      %c28 = arith.constant 28 : index
      %c29 = arith.constant 29 : index
      %c30 = arith.constant 30 : index
      %c31 = arith.constant 31 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg6 : i32 to index
      %2 = arith.cmpi slt, %1, %c128 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      scf.if %2 {
        %3 = arith.muli %1, %c192 : index
        %4 = arith.muli %1, %c384 : index
        %5 = pto.castptr %c73984_i64 : i64 -> !pto.ptr<f32, ub>
        %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
        %7 = pto.castptr %c74496_i64 : i64 -> !pto.ptr<f32, ub>
        %8 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
        %10 = pto.castptr %c74496_i64 : i64 -> !pto.ptr<bf16, ub>
        %11 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %12 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        %13 = pto.castptr %c65600_i64 : i64 -> !pto.ptr<f32, ub>
        %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        %15 = pto.castptr %c65728_i64 : i64 -> !pto.ptr<f32, ub>
        %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg8 = %c0 to %c3 step %c1 {
          %17 = arith.muli %arg8, %c128 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %18 = arith.addi %4, %17 : index
          %19 = pto.addptr %arg4, %18 : <f32, gm> -> <f32, gm>
          %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %20, %6, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %21 = arith.muli %arg8, %c16 : index
          scf.for %arg9 = %c0 to %c2 step %c1 {
            %22 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
            %23 = builtin.unrealized_conversion_cast %22 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
            %24 = pto.materialize_tile %22, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tpop(%24, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
            pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            %25 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
            pto.vecscope {
              %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %44 = arith.index_cast %arg10 : i16 to index
                %45 = arith.muli %44, %c128 : index
                %result = pto.vlds %23[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = arith.addi %45, %c64 : index
                %result_0 = pto.vlds %23[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %47 = pto.vmuls %result, %cst, %43 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %48 = pto.vmuls %result_0, %cst, %43 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %47, %7[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %48, %7[%46], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
            }
            pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %5[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %174 = arith.index_cast %arg10 : i16 to index
                %175 = arith.muli %174, %c128 : index
                %result_129 = pto.vlds %7[%175] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %176 = arith.addi %175, %c64 : index
                %result_130 = pto.vlds %7[%176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %177 = pto.vadd %result_129, %result, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %178 = pto.vadd %result_130, %result_0, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %177, %7[%175], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %178, %7[%176], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcolexpandadd", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandadd"}
              %result_1 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %7[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %7[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %7[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %7[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %7[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_14 = pto.vlds %7[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_15 = pto.vlds %7[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %7[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_17 = pto.vlds %7[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_18 = pto.vlds %7[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_19 = pto.vlds %7[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %7[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_21 = pto.vlds %7[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_22 = pto.vlds %7[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_23 = pto.vlds %7[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_24 = pto.vlds %7[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_25 = pto.vlds %7[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_26 = pto.vlds %7[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_27 = pto.vlds %7[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_28 = pto.vlds %7[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_29 = pto.vlds %7[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_30 = pto.vlds %7[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_31 = pto.vlds %7[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_32 = pto.vlds %7[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_33 = pto.vlds %7[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_34 = pto.vlds %7[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_35 = pto.vlds %7[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_36 = pto.vlds %7[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_37 = pto.vlds %7[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_38 = pto.vlds %7[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_39 = pto.vlds %7[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_40 = pto.vlds %7[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_41 = pto.vlds %7[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_42 = pto.vlds %7[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_43 = pto.vlds %7[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_44 = pto.vlds %7[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_45 = pto.vlds %7[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_46 = pto.vlds %7[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_47 = pto.vlds %7[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_48 = pto.vlds %7[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_49 = pto.vlds %7[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_50 = pto.vlds %7[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_51 = pto.vlds %7[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_52 = pto.vlds %7[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_53 = pto.vlds %7[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_54 = pto.vlds %7[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_55 = pto.vlds %7[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_56 = pto.vlds %7[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_57 = pto.vlds %7[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_58 = pto.vlds %7[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_59 = pto.vlds %7[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_60 = pto.vlds %7[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_61 = pto.vlds %7[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_62 = pto.vlds %7[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_63 = pto.vlds %7[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_64 = pto.vlds %7[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.vmax %result_1, %result_2, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.vcmax %45, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %47 = pto.vmax %result_3, %result_4, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %48 = pto.vcmax %47, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.vmax %result_5, %result_6, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %50 = pto.vcmax %49, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vmax %result_7, %result_8, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %52 = pto.vcmax %51, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vmax %result_9, %result_10, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %54 = pto.vcmax %53, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %55 = pto.vmax %result_11, %result_12, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %56 = pto.vcmax %55, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vmax %result_13, %result_14, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vcmax %57, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %59 = pto.vmax %result_15, %result_16, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vcmax %59, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = pto.vmax %result_17, %result_18, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %62 = pto.vcmax %61, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %63 = pto.vmax %result_19, %result_20, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vcmax %63, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %65 = pto.vmax %result_21, %result_22, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vcmax %65, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vmax %result_23, %result_24, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = pto.vcmax %67, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vmax %result_25, %result_26, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vcmax %69, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vmax %result_27, %result_28, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vcmax %71, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vmax %result_29, %result_30, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vcmax %73, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmax %result_31, %result_32, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vcmax %75, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vmax %result_33, %result_34, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vcmax %77, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vmax %result_35, %result_36, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vcmax %79, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmax %result_37, %result_38, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vcmax %81, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vmax %result_39, %result_40, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vcmax %83, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmax %result_41, %result_42, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vcmax %85, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmax %result_43, %result_44, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vcmax %87, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vmax %result_45, %result_46, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vcmax %89, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vmax %result_47, %result_48, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vcmax %91, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vmax %result_49, %result_50, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vcmax %93, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vmax %result_51, %result_52, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vcmax %95, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vmax %result_53, %result_54, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vcmax %97, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %99 = pto.vmax %result_55, %result_56, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %100 = pto.vcmax %99, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %101 = pto.vmax %result_57, %result_58, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %102 = pto.vcmax %101, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %103 = pto.vmax %result_59, %result_60, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %104 = pto.vcmax %103, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %105 = pto.vmax %result_61, %result_62, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %106 = pto.vcmax %105, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %107 = pto.vmax %result_63, %result_64, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %108 = pto.vcmax %107, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %109 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              pto.vsts %46, %8[%c0], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %48, %8[%c1], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %50, %8[%c2], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %52, %8[%c3], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %54, %8[%c4], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %56, %8[%c5], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %58, %8[%c6], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %60, %8[%c7], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %62, %8[%c8], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %64, %8[%c9], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %66, %8[%c10], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %68, %8[%c11], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %8[%c12], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %8[%c13], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %8[%c14], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %8[%c15], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %78, %8[%c16], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %80, %8[%c17], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %82, %8[%c18], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %8[%c19], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %8[%c20], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %88, %8[%c21], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %90, %8[%c22], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %92, %8[%c23], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %94, %8[%c24], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %96, %8[%c25], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %98, %8[%c26], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %100, %8[%c27], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %102, %8[%c28], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %104, %8[%c29], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %106, %8[%c30], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %108, %8[%c31], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %174 = arith.index_cast %arg10 : i16 to index
                %result_129 = pto.vlds %8[%174] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %175 = pto.vdup %result_129, %43 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %176 = arith.muli %174, %c128 : index
                %result_130 = pto.vlds %7[%176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %177 = arith.addi %176, %c64 : index
                %result_131 = pto.vlds %7[%177] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %178 = pto.vsub %result_130, %175, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %179 = pto.vsub %result_131, %175, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %180 = pto.vexp %178, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %181 = pto.vexp %179, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %180, %7[%176], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %181, %7[%177], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              %result_65 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_66 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_67 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_68 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_69 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_70 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_71 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_72 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_73 = pto.vlds %7[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_74 = pto.vlds %7[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_75 = pto.vlds %7[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_76 = pto.vlds %7[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_77 = pto.vlds %7[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_78 = pto.vlds %7[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_79 = pto.vlds %7[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_80 = pto.vlds %7[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_81 = pto.vlds %7[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_82 = pto.vlds %7[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_83 = pto.vlds %7[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_84 = pto.vlds %7[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_85 = pto.vlds %7[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_86 = pto.vlds %7[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_87 = pto.vlds %7[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_88 = pto.vlds %7[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_89 = pto.vlds %7[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_90 = pto.vlds %7[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_91 = pto.vlds %7[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_92 = pto.vlds %7[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_93 = pto.vlds %7[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_94 = pto.vlds %7[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_95 = pto.vlds %7[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_96 = pto.vlds %7[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_97 = pto.vlds %7[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_98 = pto.vlds %7[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_99 = pto.vlds %7[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_100 = pto.vlds %7[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_101 = pto.vlds %7[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_102 = pto.vlds %7[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_103 = pto.vlds %7[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_104 = pto.vlds %7[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_105 = pto.vlds %7[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_106 = pto.vlds %7[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_107 = pto.vlds %7[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_108 = pto.vlds %7[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_109 = pto.vlds %7[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_110 = pto.vlds %7[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_111 = pto.vlds %7[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_112 = pto.vlds %7[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_113 = pto.vlds %7[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_114 = pto.vlds %7[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_115 = pto.vlds %7[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_116 = pto.vlds %7[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_117 = pto.vlds %7[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_118 = pto.vlds %7[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_119 = pto.vlds %7[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_120 = pto.vlds %7[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_121 = pto.vlds %7[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_122 = pto.vlds %7[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_123 = pto.vlds %7[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_124 = pto.vlds %7[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_125 = pto.vlds %7[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_126 = pto.vlds %7[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_127 = pto.vlds %7[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_128 = pto.vlds %7[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %110 = pto.vadd %result_65, %result_66, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %111 = pto.vcadd %110, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %112 = pto.vadd %result_67, %result_68, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %113 = pto.vcadd %112, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %114 = pto.vadd %result_69, %result_70, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %115 = pto.vcadd %114, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %116 = pto.vadd %result_71, %result_72, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %117 = pto.vcadd %116, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %118 = pto.vadd %result_73, %result_74, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %119 = pto.vcadd %118, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %120 = pto.vadd %result_75, %result_76, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %121 = pto.vcadd %120, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %122 = pto.vadd %result_77, %result_78, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %123 = pto.vcadd %122, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %124 = pto.vadd %result_79, %result_80, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %125 = pto.vcadd %124, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %126 = pto.vadd %result_81, %result_82, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %127 = pto.vcadd %126, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %128 = pto.vadd %result_83, %result_84, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %129 = pto.vcadd %128, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %130 = pto.vadd %result_85, %result_86, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %131 = pto.vcadd %130, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %132 = pto.vadd %result_87, %result_88, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %133 = pto.vcadd %132, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %134 = pto.vadd %result_89, %result_90, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %135 = pto.vcadd %134, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %136 = pto.vadd %result_91, %result_92, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %137 = pto.vcadd %136, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %138 = pto.vadd %result_93, %result_94, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %139 = pto.vcadd %138, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %140 = pto.vadd %result_95, %result_96, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %141 = pto.vcadd %140, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %142 = pto.vadd %result_97, %result_98, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %143 = pto.vcadd %142, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %144 = pto.vadd %result_99, %result_100, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %145 = pto.vcadd %144, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %146 = pto.vadd %result_101, %result_102, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %147 = pto.vcadd %146, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %148 = pto.vadd %result_103, %result_104, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %149 = pto.vcadd %148, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %150 = pto.vadd %result_105, %result_106, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %151 = pto.vcadd %150, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %152 = pto.vadd %result_107, %result_108, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %153 = pto.vcadd %152, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %154 = pto.vadd %result_109, %result_110, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %155 = pto.vcadd %154, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %156 = pto.vadd %result_111, %result_112, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %157 = pto.vcadd %156, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %158 = pto.vadd %result_113, %result_114, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %159 = pto.vcadd %158, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %160 = pto.vadd %result_115, %result_116, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %161 = pto.vcadd %160, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %162 = pto.vadd %result_117, %result_118, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %163 = pto.vcadd %162, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %164 = pto.vadd %result_119, %result_120, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %165 = pto.vcadd %164, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %166 = pto.vadd %result_121, %result_122, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %167 = pto.vcadd %166, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %168 = pto.vadd %result_123, %result_124, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %169 = pto.vcadd %168, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %170 = pto.vadd %result_125, %result_126, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %171 = pto.vcadd %170, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %172 = pto.vadd %result_127, %result_128, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %173 = pto.vcadd %172, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %111, %9[%c0], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %113, %9[%c1], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %115, %9[%c2], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %117, %9[%c3], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %119, %9[%c4], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %121, %9[%c5], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %123, %9[%c6], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %125, %9[%c7], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %127, %9[%c8], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %129, %9[%c9], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %131, %9[%c10], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %133, %9[%c11], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %135, %9[%c12], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %137, %9[%c13], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %139, %9[%c14], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %141, %9[%c15], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %143, %9[%c16], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %145, %9[%c17], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %147, %9[%c18], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %149, %9[%c19], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %151, %9[%c20], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %153, %9[%c21], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %155, %9[%c22], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %157, %9[%c23], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %159, %9[%c24], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %161, %9[%c25], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %163, %9[%c26], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %165, %9[%c27], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %167, %9[%c28], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %169, %9[%c29], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %171, %9[%c30], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %173, %9[%c31], %109 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %174 = arith.index_cast %arg10 : i16 to index
                %175 = arith.muli %174, %c128 : index
                %result_129 = pto.vlds %7[%175] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %176 = arith.addi %175, %c64 : index
                %result_130 = pto.vlds %7[%176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %177 = pto.vcvt %result_129, %43 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %178 = pto.vcvt %result_130, %43 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                pto.vsts %177, %10[%175], %44 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
                pto.vsts %178, %10[%176], %44 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            %26 = pto.alloc_tile addr = %c65792_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            pto.vecscope {
              %43 = pto.castptr %c65792_i64 : i64 -> !pto.ptr<bf16, ub>
              %44 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
              %45 = scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16 iter_args(%arg11 = %43) -> (!pto.ptr<bf16, ub>)  : i16 {
                %46 = arith.index_cast %arg10 : i16 to index
                %47 = arith.muli %46, %c128 : index
                %result = pto.vlds %10[%47] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %48 = pto.addptr %arg11, %c0 : <bf16, ub> -> <bf16, ub>
                %49 = pto.vsstb %result, %48, %c32_i16, %c1_i16, %44 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
                scf.yield %49 : !pto.ptr<bf16, ub>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.tpush(%26, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
            %27 = arith.muli %arg9, %c2 : index
            %28 = arith.muli %arg9, %c96 : index
            %29 = arith.addi %3, %28 : index
            %30 = arith.addi %29, %21 : index
            pto.barrier <PIPE_MTE3>
            %31 = pto.addptr %arg1, %30 : <f32, gm> -> <f32, gm>
            %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %11, %32, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %33 = pto.addptr %arg0, %30 : <f32, gm> -> <f32, gm>
            %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %12, %34, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %35 = arith.addi %27, %c1 : index
            %36 = arith.muli %35, %c48 : index
            %37 = arith.addi %3, %36 : index
            %38 = arith.addi %37, %21 : index
            pto.barrier <PIPE_MTE3>
            %39 = pto.addptr %arg1, %38 : <f32, gm> -> <f32, gm>
            %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %14, %40, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %41 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
            %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %16, %42, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qk_pv_aic(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022240_i64 = arith.constant 8796093022240 : i64
      %c2199024312320_i64 = arith.constant 2199024312320 : i64
      %c1_i64 = arith.constant 1 : i64
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
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c0_i32 = arith.constant 0 : i32
      %c144 = arith.constant 144 : index
      %c96 = arith.constant 96 : index
      %c48 = arith.constant 48 : index
      %c65536_i64 = arith.constant 65536 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c327680_i64 = arith.constant 327680 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c128 = arith.constant 128 : index
      %c384 = arith.constant 384 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %c16 = arith.constant 16 : index
      %c128_i64 = arith.constant 128 : i64
      %c512_i64 = arith.constant 512 : i64
      %false = arith.constant false
      %c32_i64 = arith.constant 32 : i64
      %c32768 = arith.constant 32768 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg6 : i32 to index
      %2 = arith.cmpi slt, %1, %c128 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
      scf.if %2 {
        %3 = arith.muli %1, %c384 : index
        %4 = arith.muli %1, %c192 : index
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        %5 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, l1>
        %6 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
        %7 = arith.muli %1, %c64 : index
        %8 = arith.muli %1, %c32768 : index
        %9 = pto.addptr %arg5, %8 : <bf16, gm> -> <bf16, gm>
        %10 = pto.castptr %c327680_i64 : i64 -> !pto.ptr<bf16, l1>
        %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
        %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
        %13 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
        %14 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
        %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
        %16 = pto.get_ctrl : i64
        %17 = pto.sbitset0 %16, %c45_i64 : i64, i64 -> i64
        %18 = pto.sbitset0 %17, %c46_i64 : i64, i64 -> i64
        %19 = pto.sbitset0 %18, %c47_i64 : i64, i64 -> i64
        %20 = pto.sbitset0 %19, %c51_i64 : i64, i64 -> i64
        %21 = arith.addi %7, %c32 : index
        %22 = arith.muli %21, %c512 : index
        %23 = pto.addptr %arg5, %22 : <bf16, gm> -> <bf16, gm>
        %24 = arith.addi %4, %c48 : index
        %25 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, l0c>
        %26 = arith.addi %4, %c96 : index
        %27 = arith.addi %4, %c144 : index
        scf.for %arg8 = %c0 to %c3 step %c1 {
          %28 = arith.muli %arg8, %c128 : index
          %29 = arith.addi %3, %28 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          %30 = arith.muli %29, %c512 : index
          %31 = pto.addptr %arg3, %30 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c549755879425_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %31, %5, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          pto.set_mte2_nz_para %c549755879425_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %31, %6, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %9, %10, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          %32 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          scf.for %arg9 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_MTE1>
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %11, %c0_i64, %54, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %12, %55, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            %56 = arith.addi %arg9, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %13, %c0_i64, %58, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %14, %59, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            %60 = arith.cmpi eq, %arg9, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            scf.if %60 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
          pto.tpush(%32, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %23, %10, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
          %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          scf.for %arg9 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            pto.barrier <PIPE_MTE1>
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %11, %c0_i64, %54, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %12, %55, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            %56 = arith.addi %arg9, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %13, %c0_i64, %58, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %14, %59, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            %60 = arith.cmpi eq, %arg9, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            scf.if %60 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
          pto.tpush(%33, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
          %34 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %35 = pto.materialize_tile %34, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
          pto.tpop(%35, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          %36 = pto.castptr %34 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg9 = %c0 to %c128 step %c64 {
            pto.barrier <PIPE_MTE1>
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %36, %11, %c0_i64, %54, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %12, %55, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            %56 = arith.addi %arg9, %c32 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %36, %13, %c0_i64, %58, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %14, %59, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            %60 = arith.cmpi eq, %arg9, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            scf.if %60 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %37 = arith.muli %arg8, %c16 : index
          %38 = arith.addi %4, %37 : index
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
          pto.barrier <PIPE_FIX>
          %39 = arith.muli %38, %c512 : index
          %40 = pto.addptr %arg2, %39 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %15, %40, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %41 = arith.addi %24, %37 : index
          pto.barrier <PIPE_FIX>
          %42 = arith.muli %41, %c512 : index
          %43 = pto.addptr %arg2, %42 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %25, %43, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
          %44 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %45 = pto.materialize_tile %44, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
          pto.tpop(%45, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %46 = pto.castptr %44 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg9 = %c0 to %c128 step %c64 {
            pto.barrier <PIPE_MTE1>
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %46, %11, %c0_i64, %54, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %12, %55, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            %56 = arith.addi %arg9, %c32 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %46, %13, %c0_i64, %58, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %14, %59, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            %60 = arith.cmpi eq, %arg9, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            scf.if %60 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
          pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
          pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %47 = arith.addi %26, %37 : index
          pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
          pto.barrier <PIPE_FIX>
          %48 = arith.muli %47, %c512 : index
          %49 = pto.addptr %arg2, %48 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %15, %49, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %50 = arith.addi %27, %37 : index
          pto.barrier <PIPE_FIX>
          %51 = arith.muli %50, %c512 : index
          %52 = pto.addptr %arg2, %51 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %25, %52, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
