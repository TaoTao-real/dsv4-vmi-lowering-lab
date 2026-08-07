module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c32_i64 = arith.constant 32 : i64
      %c16416_i64 = arith.constant 16416 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c8 = arith.constant 8 : index
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c8192 = arith.constant 8192 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %c0 = arith.constant 0 : index
      %c1024 = arith.constant 1024 : index
      %c512 = arith.constant 512 : index
      %cst_0 = arith.constant 1.270000e+02 : f32
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c8_i64 = arith.constant 8 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c128_i32 = arith.constant 128 : i32
      %c512_i32 = arith.constant 512 : i32
      %c255_i16 = arith.constant 255 : i16
      %c32768_i64 = arith.constant 32768 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c1_i64 = arith.constant 1 : i64
      %c8_i32 = arith.constant 8 : i32
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
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
      %0 = arith.addi %arg3, %c32 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      %3 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c16416_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = arith.muli %arg5, %c128 : index
      %8 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i32, ub>
      %9 = pto.castptr %c32_i64 : i64 -> !pto.ptr<i8, ub>
      %10 = pto.addptr %9, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg6 = %arg3 to %0 step %c8 {
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %15 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %15, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %11 = arith.muli %arg6, %c8192 : index
        scf.for %arg7 = %c0 to %c1024 step %c512 {
          %15 = arith.addi %arg4, %arg7 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %16 = arith.addi %11, %15 : index
          %17 = pto.addptr %arg2, %16 : <f32, gm> -> <f32, gm>
          %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %18, %4, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %86 = arith.index_cast %arg8 : i16 to index
              %87 = arith.muli %86, %c512 : index
              %result_65 = pto.vlds %3[%87] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %88 = arith.addi %87, %c64 : index
              %result_66 = pto.vlds %3[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %89 = arith.addi %87, %c128 : index
              %result_67 = pto.vlds %3[%89] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %90 = arith.addi %87, %c192 : index
              %result_68 = pto.vlds %3[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %91 = arith.addi %87, %c256 : index
              %result_69 = pto.vlds %3[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %92 = arith.addi %87, %c320 : index
              %result_70 = pto.vlds %3[%92] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %93 = arith.addi %87, %c384 : index
              %result_71 = pto.vlds %3[%93] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %94 = arith.addi %87, %c448 : index
              %result_72 = pto.vlds %3[%94] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %95 = pto.vneg %result_65, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vneg %result_66, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vneg %result_67, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vneg %result_68, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %99 = pto.vneg %result_69, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %100 = pto.vneg %result_70, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %101 = pto.vneg %result_71, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %102 = pto.vneg %result_72, %20 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %95, %6[%87], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %96, %6[%88], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %97, %6[%89], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %98, %6[%90], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %99, %6[%91], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %100, %6[%92], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %101, %6[%93], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %102, %6[%94], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %103 = pto.vmax %result_65, %95, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %104 = pto.vmax %result_66, %96, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %105 = pto.vmax %result_67, %97, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %106 = pto.vmax %result_68, %98, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %107 = pto.vmax %result_69, %99, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %108 = pto.vmax %result_70, %100, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %109 = pto.vmax %result_71, %101, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %110 = pto.vmax %result_72, %102, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %103, %3[%87], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %104, %3[%88], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %105, %3[%89], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %106, %3[%90], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %107, %3[%91], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %108, %3[%92], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %109, %3[%93], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %110, %3[%94], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %3[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %3[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %3[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %3[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %3[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %3[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %3[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %3[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %3[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %3[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %3[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %3[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %3[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %3[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %3[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %3[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %3[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %3[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %3[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %3[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %3[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_23 = pto.vlds %3[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_24 = pto.vlds %3[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %3[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %3[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %3[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %3[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %3[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %3[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %3[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_32 = pto.vlds %3[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_33 = pto.vlds %3[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_34 = pto.vlds %3[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_35 = pto.vlds %3[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_36 = pto.vlds %3[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_37 = pto.vlds %3[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_38 = pto.vlds %3[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_39 = pto.vlds %3[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_40 = pto.vlds %3[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_41 = pto.vlds %3[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_42 = pto.vlds %3[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_43 = pto.vlds %3[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_44 = pto.vlds %3[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_45 = pto.vlds %3[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_46 = pto.vlds %3[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_47 = pto.vlds %3[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_48 = pto.vlds %3[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_49 = pto.vlds %3[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_50 = pto.vlds %3[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_51 = pto.vlds %3[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_52 = pto.vlds %3[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_53 = pto.vlds %3[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_54 = pto.vlds %3[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_55 = pto.vlds %3[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_56 = pto.vlds %3[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_57 = pto.vlds %3[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_58 = pto.vlds %3[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_59 = pto.vlds %3[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_60 = pto.vlds %3[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_61 = pto.vlds %3[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_62 = pto.vlds %3[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_63 = pto.vlds %3[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_64 = pto.vlds %3[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %21 = pto.vmax %result, %result_2, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %22 = pto.vmax %21, %result_3, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %23 = pto.vmax %22, %result_4, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %24 = pto.vmax %23, %result_5, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %25 = pto.vmax %24, %result_6, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.vmax %25, %result_7, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmax %26, %result_8, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %28 = pto.vcmax %27, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %29 = pto.vmax %result_9, %result_10, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.vmax %29, %result_11, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %31 = pto.vmax %30, %result_12, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.vmax %31, %result_13, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vmax %32, %result_14, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vmax %33, %result_15, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %35 = pto.vmax %34, %result_16, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vcmax %35, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vmax %result_17, %result_18, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vmax %37, %result_19, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmax %38, %result_20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vmax %39, %result_21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %41 = pto.vmax %40, %result_22, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %42 = pto.vmax %41, %result_23, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = pto.vmax %42, %result_24, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vcmax %43, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vmax %result_25, %result_26, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vmax %45, %result_27, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmax %46, %result_28, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmax %47, %result_29, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmax %48, %result_30, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmax %49, %result_31, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmax %50, %result_32, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vcmax %51, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmax %result_33, %result_34, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmax %53, %result_35, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vmax %54, %result_36, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmax %55, %result_37, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmax %56, %result_38, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmax %57, %result_39, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmax %58, %result_40, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vcmax %59, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmax %result_41, %result_42, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmax %61, %result_43, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmax %62, %result_44, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vmax %63, %result_45, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %65 = pto.vmax %64, %result_46, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vmax %65, %result_47, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmax %66, %result_48, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vcmax %67, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmax %result_49, %result_50, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vmax %69, %result_51, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmax %70, %result_52, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmax %71, %result_53, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vmax %72, %result_54, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vmax %73, %result_55, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vmax %74, %result_56, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vcmax %75, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vmax %result_57, %result_58, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %78 = pto.vmax %77, %result_59, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vmax %78, %result_60, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vmax %79, %result_61, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vmax %80, %result_62, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.vmax %81, %result_63, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vmax %82, %result_64, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.vcmax %83, %19 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %85 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            pto.vsts %28, %5[%c0], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %36, %5[%c1], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %44, %5[%c2], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %5[%c3], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %5[%c4], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %5[%c5], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %5[%c6], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %84, %5[%c7], %85 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.vecscope {
            %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %19 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
            %result_2 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %20 = pto.vmax %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %20, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %15 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %15, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %16 = pto.vdiv %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %17 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %16, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %18 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
          %19 = pto.vdiv %18, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %12 = arith.addi %7, %arg6 : index
        %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
        %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %14, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        scf.for %arg7 = %c0 to %c1024 step %c512 {
          %15 = arith.addi %arg4, %arg7 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
          %16 = arith.addi %11, %15 : index
          %17 = pto.addptr %arg2, %16 : <f32, gm> -> <f32, gm>
          %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %18, %4, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %result = pto.vlds %6[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %25 = pto.vdup %result, %23 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %26 = arith.muli %24, %c512 : index
              %result_2 = pto.vlds %3[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %27 = arith.addi %26, %c64 : index
              %result_3 = pto.vlds %3[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = arith.addi %26, %c128 : index
              %result_4 = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %29 = arith.addi %26, %c192 : index
              %result_5 = pto.vlds %3[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = arith.addi %26, %c256 : index
              %result_6 = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = arith.addi %26, %c320 : index
              %result_7 = pto.vlds %3[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = arith.addi %26, %c384 : index
              %result_8 = pto.vlds %3[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %33 = arith.addi %26, %c448 : index
              %result_9 = pto.vlds %3[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %34 = pto.vmul %result_2, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %35 = pto.vmul %result_3, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %36 = pto.vmul %result_4, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %37 = pto.vmul %result_5, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %38 = pto.vmul %result_6, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vmul %result_7, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %40 = pto.vmul %result_8, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.vmul %result_9, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %34, %3[%26], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %35, %3[%27], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %36, %3[%28], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %37, %3[%29], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %38, %3[%30], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %39, %3[%31], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %40, %3[%32], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %41, %3[%33], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %24 = arith.index_cast %arg8 : i16 to index
              %25 = arith.muli %24, %c512 : index
              %result = pto.vlds %3[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %26 = arith.addi %25, %c64 : index
              %result_2 = pto.vlds %3[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %27 = arith.addi %25, %c128 : index
              %result_3 = pto.vlds %3[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = arith.addi %25, %c192 : index
              %result_4 = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %29 = arith.addi %25, %c256 : index
              %result_5 = pto.vlds %3[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %30 = arith.addi %25, %c320 : index
              %result_6 = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = arith.addi %25, %c384 : index
              %result_7 = pto.vlds %3[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = arith.addi %25, %c448 : index
              %result_8 = pto.vlds %3[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %33 = pto.vcvt %result, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %34 = pto.vcvt %result_2, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %35 = pto.vcvt %result_3, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %36 = pto.vcvt %result_4, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %37 = pto.vcvt %result_5, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %38 = pto.vcvt %result_6, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %39 = pto.vcvt %result_7, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %40 = pto.vcvt %result_8, %23 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              pto.vsts %33, %8[%25], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %34, %8[%26], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %35, %8[%27], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %36, %8[%28], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %37, %8[%29], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %38, %8[%30], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %39, %8[%31], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
              pto.vsts %40, %8[%32], %22 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %19 = pto.alloc_tile addr = %c32_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf16, valid=?x?>
          pto.vecscope {
            %22 = pto.castptr %c32_i64 : i64 -> !pto.ptr<f16, ub>
            %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %27 = arith.index_cast %arg8 : i16 to index
              %28 = arith.muli %27, %c512 : index
              %result = pto.vlds %8[%28] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %29 = arith.addi %28, %c64 : index
              %result_4 = pto.vlds %8[%29] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %30 = arith.addi %28, %c128 : index
              %result_5 = pto.vlds %8[%30] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %31 = arith.addi %28, %c192 : index
              %result_6 = pto.vlds %8[%31] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %32 = arith.addi %28, %c256 : index
              %result_7 = pto.vlds %8[%32] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %33 = arith.addi %28, %c320 : index
              %result_8 = pto.vlds %8[%33] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %34 = arith.addi %28, %c384 : index
              %result_9 = pto.vlds %8[%34] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %35 = arith.addi %28, %c448 : index
              %result_10 = pto.vlds %8[%35] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %36 = pto.vcvt %result, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %37 = pto.vcvt %result_4, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %38 = pto.vcvt %result_5, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.vcvt %result_6, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %40 = pto.vcvt %result_7, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %41 = pto.vcvt %result_8, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %42 = pto.vcvt %result_9, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %43 = pto.vcvt %result_10, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %44 = pto.vcvt %36, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %45 = pto.vcvt %37, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %46 = pto.vcvt %38, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %47 = pto.vcvt %39, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %48 = pto.vcvt %40, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %49 = pto.vcvt %41, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %50 = pto.vcvt %42, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %51 = pto.vcvt %43, %23 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              pto.vsts %44, %22[%28], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %45, %22[%29], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %46, %22[%30], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %47, %22[%31], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %48, %22[%32], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %49, %22[%33], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %50, %22[%34], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
              pto.vsts %51, %22[%35], %24 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %25 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
            %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
            %mask_2, %scalar_out_3 = pto.plt_b16 %c512_i32 : i32 -> !pto.mask<b16>, i32
            %26 = pto.vdup %c255_i16, %25 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
            scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %27 = arith.index_cast %arg8 : i16 to index
              %28 = arith.muli %27, %c512 : index
              scf.for %arg9 = %c0_i16 to %c512_i16 step %c128_i16  : i16 {
                %29 = arith.index_cast %arg9 : i16 to index
                %30 = arith.addi %28, %29 : index
                %31 = pto.addptr %22, %30 : <f16, ub> -> <f16, ub>
                %result = pto.vlds %31[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
                %32 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
                %33 = pto.vand %32, %26, %mask_2 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
                %34 = pto.vcvt %33, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
                %35 = pto.vcvt %34, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
                %36 = pto.addptr %9, %30 : <i8, ub> -> <i8, ub>
                pto.vsts %35, %36[%c0], %mask_2 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
              }
            } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          %20 = pto.addptr %arg1, %16 : <i8, gm> -> <i8, gm>
          %21 = pto.addptr %20, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %10, %21, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %c8192_i64, %c512_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
        }
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
