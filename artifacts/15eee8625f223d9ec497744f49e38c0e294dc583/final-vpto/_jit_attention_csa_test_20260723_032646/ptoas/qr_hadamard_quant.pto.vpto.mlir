module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_hadamard_quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c64_i16 = arith.constant 64 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c16640_i64 = arith.constant 16640 : i64
      %c256_i64 = arith.constant 256 : i64
      %c49408_i64 = arith.constant 49408 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %c0 = arith.constant 0 : index
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %c128_i32 = arith.constant 128 : i32
      %c64_i32 = arith.constant 64 : i32
      %c255_i16 = arith.constant 255 : i16
      %c512_i64 = arith.constant 512 : i64
      %c1_i64 = arith.constant 1 : i64
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c8192 = arith.constant 8192 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
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
      %c2 = arith.constant 2 : index
      %c3 = arith.constant 3 : index
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
      %c32 = arith.constant 32 : index
      %c33 = arith.constant 33 : index
      %c34 = arith.constant 34 : index
      %c35 = arith.constant 35 : index
      %c36 = arith.constant 36 : index
      %c37 = arith.constant 37 : index
      %c38 = arith.constant 38 : index
      %c39 = arith.constant 39 : index
      %c40 = arith.constant 40 : index
      %c41 = arith.constant 41 : index
      %c42 = arith.constant 42 : index
      %c43 = arith.constant 43 : index
      %c44 = arith.constant 44 : index
      %c45 = arith.constant 45 : index
      %c46 = arith.constant 46 : index
      %c47 = arith.constant 47 : index
      %c48 = arith.constant 48 : index
      %c49 = arith.constant 49 : index
      %c50 = arith.constant 50 : index
      %c51 = arith.constant 51 : index
      %c52 = arith.constant 52 : index
      %c53 = arith.constant 53 : index
      %c54 = arith.constant 54 : index
      %c55 = arith.constant 55 : index
      %c56 = arith.constant 56 : index
      %c57 = arith.constant 57 : index
      %c58 = arith.constant 58 : index
      %c59 = arith.constant 59 : index
      %c60 = arith.constant 60 : index
      %c61 = arith.constant 61 : index
      %c62 = arith.constant 62 : index
      %c63 = arith.constant 63 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c64 : index
      %2 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.vdup %cst, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %14, %3[%c0], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = arith.muli %0, %c8192 : index
      %5 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %12 = arith.addi %4, %arg5 : index
        %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
        %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %14, %6, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %17 = arith.index_cast %arg6 : i16 to index
            %18 = arith.muli %17, %c64 : index
            %result = pto.vlds %5[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %19 = pto.vneg %result, %15 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %20 = pto.vmax %result, %19, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %20, %7[%18], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          %15 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
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
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.vcmax %result, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %18 = pto.vcmax %result_2, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %19 = pto.vcmax %result_3, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.vcmax %result_4, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.vcmax %result_5, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %22 = pto.vcmax %result_6, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.vcmax %result_7, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vcmax %result_8, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vcmax %result_9, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vcmax %result_10, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vcmax %result_11, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vcmax %result_12, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vcmax %result_13, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vcmax %result_14, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vcmax %result_15, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcmax %result_16, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vcmax %result_17, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcmax %result_18, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vcmax %result_19, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vcmax %result_20, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcmax %result_21, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcmax %result_22, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcmax %result_23, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcmax %result_24, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcmax %result_25, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcmax %result_26, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcmax %result_27, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcmax %result_28, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcmax %result_29, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcmax %result_30, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcmax %result_31, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcmax %result_32, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcmax %result_33, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcmax %result_34, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcmax %result_35, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcmax %result_36, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcmax %result_37, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcmax %result_38, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vcmax %result_39, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vcmax %result_40, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vcmax %result_41, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vcmax %result_42, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vcmax %result_43, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vcmax %result_44, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vcmax %result_45, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vcmax %result_46, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vcmax %result_47, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vcmax %result_48, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vcmax %result_49, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vcmax %result_50, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vcmax %result_51, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vcmax %result_52, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vcmax %result_53, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vcmax %result_54, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vcmax %result_55, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vcmax %result_56, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vcmax %result_57, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vcmax %result_58, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vcmax %result_59, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vcmax %result_60, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vcmax %result_61, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vcmax %result_62, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vcmax %result_63, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vcmax %result_64, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %17, %15[%c0], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %18, %15[%c1], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %19, %15[%c2], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %20, %15[%c3], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %21, %15[%c4], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %22, %15[%c5], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %23, %15[%c6], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %24, %15[%c7], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %25, %15[%c8], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %26, %15[%c9], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %27, %15[%c10], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %15[%c11], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %15[%c12], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %15[%c13], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %15[%c14], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %15[%c15], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %15[%c16], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %15[%c17], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %15[%c18], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %15[%c19], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %15[%c20], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %15[%c21], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %15[%c22], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %15[%c23], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %15[%c24], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %15[%c25], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %15[%c26], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %15[%c27], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %15[%c28], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %15[%c29], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %15[%c30], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %15[%c31], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %15[%c32], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %15[%c33], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %15[%c34], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %15[%c35], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %15[%c36], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %15[%c37], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %55, %15[%c38], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %56, %15[%c39], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %57, %15[%c40], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %58, %15[%c41], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %59, %15[%c42], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %60, %15[%c43], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %15[%c44], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %62, %15[%c45], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %63, %15[%c46], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %64, %15[%c47], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %15[%c48], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %66, %15[%c49], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %67, %15[%c50], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %68, %15[%c51], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %15[%c52], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %70, %15[%c53], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %71, %15[%c54], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %72, %15[%c55], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %73, %15[%c56], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %74, %15[%c57], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %75, %15[%c58], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %76, %15[%c59], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %15[%c60], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %78, %15[%c61], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %79, %15[%c62], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %80, %15[%c63], %81 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_65 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_66 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %83 = pto.vmax %result_65, %result_66, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %3[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %12 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.vdup %cst_0, %12 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %14 = pto.vdiv %13, %result, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %14, %7[%c0], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %16 = pto.vdup %cst_1, %12 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vdiv %16, %14, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %5[%c0], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %8 = pto.addptr %arg1, %1 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %9, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %10 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<i8, ub>
      %11 = pto.addptr %10, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        %12 = arith.addi %4, %arg5 : index
        %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
        %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %14, %6, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %20 = arith.index_cast %arg6 : i16 to index
            %result = pto.vlds %7[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %21 = pto.vdup %result, %18 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %22 = arith.muli %20, %c64 : index
            %result_2 = pto.vlds %5[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %23 = pto.vmul %result_2, %21, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %23, %5[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %15 = pto.alloc_tile addr = %c16640_i64 valid_row = %c64 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x64xi32, valid=?x?>
        pto.vecscope {
          %18 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<i32, ub>
          %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg6 : i16 to index
            %26 = arith.muli %25, %c64 : index
            %result = pto.vlds %5[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = pto.vcvt %result, %19 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            pto.vsts %27, %18[%26], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %21 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %22 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg6 : i16 to index
            %26 = arith.muli %25, %c64 : index
            %27 = pto.addptr %18, %26 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %27[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %28 = pto.vcvt %result, %21 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %29 = pto.vcvt %28, %21 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %30 = pto.addptr %22, %26 : <f16, ub> -> <f16, ub>
            pto.vsts %29, %30[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %23 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %mask_2, %scalar_out_3 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_4, %scalar_out_5 = pto.plt_b16 %c64_i32 : i32 -> !pto.mask<b16>, i32
          %24 = pto.vdup %c255_i16, %23 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %25 = arith.index_cast %arg6 : i16 to index
            %26 = arith.muli %25, %c64 : index
            %27 = pto.addptr %22, %26 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %27[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %28 = pto.vcvt %result, %mask_2 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %29 = pto.vand %28, %24, %mask_4 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %30 = pto.vcvt %29, %mask_2 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %31 = pto.vcvt %30, %mask_2 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %32 = pto.addptr %10, %26 : <i8, ub> -> <i8, ub>
            pto.vsts %31, %32[%c0], %mask_4 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        %16 = pto.addptr %arg2, %12 : <i8, gm> -> <i8, gm>
        %17 = pto.addptr %16, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %11, %17, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
