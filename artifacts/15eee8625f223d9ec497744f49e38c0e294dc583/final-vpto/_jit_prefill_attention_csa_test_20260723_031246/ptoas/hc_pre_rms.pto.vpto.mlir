module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_pre_rms(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c32832_i64 = arith.constant 32832 : i64
      %c49280_i64 = arith.constant 49280 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c82048_i64 = arith.constant 82048 : i64
      %c98432_i64 = arith.constant 98432 : i64
      %c131200_i64 = arith.constant 131200 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c49248_i64 = arith.constant 49248 : i64
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c4 = arith.constant 4 : index
      %c512 = arith.constant 512 : index
      %c1024 = arith.constant 1024 : index
      %c1536 = arith.constant 1536 : index
      %cst_0 = arith.constant 6.10351563E-5 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i64 = arith.constant 8 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c8_i32 = arith.constant 8 : i32
      %c131072 = arith.constant 131072 : index
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
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
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c8 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %2 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %15 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %15, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = arith.muli %0, %c131072 : index
      %5 = pto.castptr %c49280_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.castptr %c82048_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.castptr %c98432_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %11 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %13 = pto.castptr %c49248_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c4 {
        %15 = arith.muli %arg6, %c512 : index
        %16 = arith.addi %15, %c512 : index
        %17 = arith.addi %15, %c1024 : index
        %18 = arith.addi %15, %c1536 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %19 = arith.addi %4, %15 : index
        %20 = pto.addptr %arg0, %19 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %20, %5, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %21 = arith.addi %4, %16 : index
        %22 = pto.addptr %arg0, %21 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %22, %6, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %23 = arith.addi %4, %17 : index
        %24 = pto.addptr %arg0, %23 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %7, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %25 = arith.addi %4, %18 : index
        %26 = pto.addptr %arg0, %25 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %8, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %98 = arith.index_cast %arg7 : i16 to index
            %99 = arith.muli %98, %c512 : index
            %result_68 = pto.vlds %5[%99] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %100 = arith.addi %99, %c64 : index
            %result_69 = pto.vlds %5[%100] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %101 = arith.addi %99, %c128 : index
            %result_70 = pto.vlds %5[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = arith.addi %99, %c192 : index
            %result_71 = pto.vlds %5[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = arith.addi %99, %c256 : index
            %result_72 = pto.vlds %5[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = arith.addi %99, %c320 : index
            %result_73 = pto.vlds %5[%104] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %105 = arith.addi %99, %c384 : index
            %result_74 = pto.vlds %5[%105] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %106 = arith.addi %99, %c448 : index
            %result_75 = pto.vlds %5[%106] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %107 = pto.vmul %result_68, %result_68, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vmul %result_69, %result_69, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vmul %result_70, %result_70, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vmul %result_71, %result_71, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vmul %result_72, %result_72, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vmul %result_73, %result_73, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vmul %result_74, %result_74, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.vmul %result_75, %result_75, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %107, %5[%99], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %108, %5[%100], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %109, %5[%101], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %110, %5[%102], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %111, %5[%103], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %112, %5[%104], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %113, %5[%105], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %114, %5[%106], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %30 = pto.castptr %c131200_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %5[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %5[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %5[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %5[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %5[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %5[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %5[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %5[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %5[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %5[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %5[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %5[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %5[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %5[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %5[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %5[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %5[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %5[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %5[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %5[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %5[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %5[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %5[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %5[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %5[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %5[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %5[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %5[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %5[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %5[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %5[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %5[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %5[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %5[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %5[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %5[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %5[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %5[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %5[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_42 = pto.vlds %5[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_43 = pto.vlds %5[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_44 = pto.vlds %5[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_45 = pto.vlds %5[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_46 = pto.vlds %5[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_47 = pto.vlds %5[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_48 = pto.vlds %5[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_49 = pto.vlds %5[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_50 = pto.vlds %5[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_51 = pto.vlds %5[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_52 = pto.vlds %5[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_53 = pto.vlds %5[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_54 = pto.vlds %5[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_55 = pto.vlds %5[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_56 = pto.vlds %5[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_57 = pto.vlds %5[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_58 = pto.vlds %5[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_59 = pto.vlds %5[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_60 = pto.vlds %5[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_61 = pto.vlds %5[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_62 = pto.vlds %5[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_63 = pto.vlds %5[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_64 = pto.vlds %5[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_65 = pto.vlds %5[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result, %result_3, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %31, %result_4, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %32, %result_5, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %33, %result_6, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %34, %result_7, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %35, %result_8, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vadd %36, %result_9, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %37, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result_10, %result_11, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadd %39, %result_12, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadd %40, %result_13, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vadd %41, %result_14, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vadd %42, %result_15, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vadd %43, %result_16, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vadd %44, %result_17, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcadd %45, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %result_18, %result_19, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vadd %47, %result_20, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %48, %result_21, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_22, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_23, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vadd %51, %result_24, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vadd %52, %result_25, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcadd %53, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %result_26, %result_27, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vadd %55, %result_28, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %56, %result_29, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_30, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_31, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vadd %59, %result_32, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vadd %60, %result_33, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vcadd %61, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %result_34, %result_35, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vadd %63, %result_36, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %64, %result_37, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_38, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_39, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vadd %67, %result_40, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vadd %68, %result_41, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vcadd %69, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %result_42, %result_43, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vadd %71, %result_44, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %72, %result_45, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_46, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_47, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vadd %75, %result_48, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vadd %76, %result_49, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vcadd %77, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vadd %result_50, %result_51, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vadd %79, %result_52, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vadd %80, %result_53, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vadd %81, %result_54, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %82, %result_55, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vadd %83, %result_56, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.vadd %84, %result_57, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %86 = pto.vcadd %85, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vadd %result_58, %result_59, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.vadd %87, %result_60, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %89 = pto.vadd %88, %result_61, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.vadd %89, %result_62, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = pto.vadd %90, %result_63, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %92 = pto.vadd %91, %result_64, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vadd %92, %result_65, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vcadd %93, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %38, %30[%c0], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %30[%c1], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %30[%c2], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %62, %30[%c3], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %70, %30[%c4], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %78, %30[%c5], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %86, %30[%c6], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %94, %30[%c7], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_66 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %96 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %result_67 = pto.vlds %96[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %97 = pto.vadd %result_66, %result_67, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %97, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %98 = arith.index_cast %arg7 : i16 to index
            %99 = arith.muli %98, %c512 : index
            %result_68 = pto.vlds %6[%99] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %100 = arith.addi %99, %c64 : index
            %result_69 = pto.vlds %6[%100] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %101 = arith.addi %99, %c128 : index
            %result_70 = pto.vlds %6[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = arith.addi %99, %c192 : index
            %result_71 = pto.vlds %6[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = arith.addi %99, %c256 : index
            %result_72 = pto.vlds %6[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = arith.addi %99, %c320 : index
            %result_73 = pto.vlds %6[%104] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %105 = arith.addi %99, %c384 : index
            %result_74 = pto.vlds %6[%105] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %106 = arith.addi %99, %c448 : index
            %result_75 = pto.vlds %6[%106] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %107 = pto.vmul %result_68, %result_68, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vmul %result_69, %result_69, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vmul %result_70, %result_70, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vmul %result_71, %result_71, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vmul %result_72, %result_72, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vmul %result_73, %result_73, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vmul %result_74, %result_74, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.vmul %result_75, %result_75, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %107, %6[%99], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %108, %6[%100], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %109, %6[%101], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %110, %6[%102], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %111, %6[%103], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %112, %6[%104], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %113, %6[%105], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %114, %6[%106], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %30 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %6[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %6[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %6[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %6[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %6[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %6[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %6[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %6[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %6[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %6[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %6[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %6[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %6[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %6[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %6[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %6[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %6[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %6[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %6[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %6[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %6[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %6[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %6[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %6[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %6[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %6[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %6[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %6[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %6[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %6[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %6[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %6[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %6[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %6[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %6[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %6[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %6[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %6[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %6[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_42 = pto.vlds %6[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_43 = pto.vlds %6[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_44 = pto.vlds %6[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_45 = pto.vlds %6[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_46 = pto.vlds %6[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_47 = pto.vlds %6[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_48 = pto.vlds %6[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_49 = pto.vlds %6[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_50 = pto.vlds %6[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_51 = pto.vlds %6[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_52 = pto.vlds %6[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_53 = pto.vlds %6[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_54 = pto.vlds %6[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_55 = pto.vlds %6[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_56 = pto.vlds %6[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_57 = pto.vlds %6[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_58 = pto.vlds %6[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_59 = pto.vlds %6[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_60 = pto.vlds %6[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_61 = pto.vlds %6[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_62 = pto.vlds %6[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_63 = pto.vlds %6[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_64 = pto.vlds %6[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_65 = pto.vlds %6[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result, %result_3, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %31, %result_4, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %32, %result_5, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %33, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %34, %result_7, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %35, %result_8, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vadd %36, %result_9, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %37, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result_10, %result_11, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadd %39, %result_12, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadd %40, %result_13, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vadd %41, %result_14, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vadd %42, %result_15, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vadd %43, %result_16, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vadd %44, %result_17, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcadd %45, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %result_18, %result_19, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vadd %47, %result_20, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %48, %result_21, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_22, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_23, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vadd %51, %result_24, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vadd %52, %result_25, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vcadd %53, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %result_26, %result_27, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vadd %55, %result_28, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %56, %result_29, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_30, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vadd %59, %result_32, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vadd %60, %result_33, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vcadd %61, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %result_34, %result_35, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vadd %63, %result_36, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %64, %result_37, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_38, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_39, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vadd %67, %result_40, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vadd %68, %result_41, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vcadd %69, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %result_42, %result_43, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vadd %71, %result_44, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %72, %result_45, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_46, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_47, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vadd %75, %result_48, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vadd %76, %result_49, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vcadd %77, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vadd %result_50, %result_51, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vadd %79, %result_52, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vadd %80, %result_53, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vadd %81, %result_54, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %82, %result_55, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vadd %83, %result_56, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.vadd %84, %result_57, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %86 = pto.vcadd %85, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vadd %result_58, %result_59, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.vadd %87, %result_60, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %89 = pto.vadd %88, %result_61, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.vadd %89, %result_62, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = pto.vadd %90, %result_63, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %92 = pto.vadd %91, %result_64, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vadd %92, %result_65, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vcadd %93, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %38, %30[%c0], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %30[%c1], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %54, %30[%c2], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %62, %30[%c3], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %70, %30[%c4], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %78, %30[%c5], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %86, %30[%c6], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %94, %30[%c7], %95 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_66 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %96 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %result_67 = pto.vlds %96[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %97 = pto.vadd %result_66, %result_67, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %97, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg7 : i16 to index
            %96 = arith.muli %95, %c512 : index
            %result_66 = pto.vlds %7[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = arith.addi %96, %c64 : index
            %result_67 = pto.vlds %7[%97] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %98 = arith.addi %96, %c128 : index
            %result_68 = pto.vlds %7[%98] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %99 = arith.addi %96, %c192 : index
            %result_69 = pto.vlds %7[%99] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %100 = arith.addi %96, %c256 : index
            %result_70 = pto.vlds %7[%100] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %101 = arith.addi %96, %c320 : index
            %result_71 = pto.vlds %7[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = arith.addi %96, %c384 : index
            %result_72 = pto.vlds %7[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = arith.addi %96, %c448 : index
            %result_73 = pto.vlds %7[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vmul %result_66, %result_66, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %105 = pto.vmul %result_67, %result_67, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %106 = pto.vmul %result_68, %result_68, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %107 = pto.vmul %result_69, %result_69, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vmul %result_70, %result_70, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vmul %result_71, %result_71, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vmul %result_72, %result_72, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vmul %result_73, %result_73, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %7[%96], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %105, %7[%97], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %106, %7[%98], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %107, %7[%99], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %108, %7[%100], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %109, %7[%101], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %110, %7[%102], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %111, %7[%103], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %7[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %7[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %7[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %7[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %7[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %7[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %7[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %7[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %7[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %7[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %7[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %7[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %7[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %7[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %7[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %7[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %7[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %7[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %7[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %7[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %7[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %7[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %7[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %7[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %7[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %7[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %7[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %7[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %7[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %7[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %7[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %7[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_42 = pto.vlds %7[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_43 = pto.vlds %7[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_44 = pto.vlds %7[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_45 = pto.vlds %7[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_46 = pto.vlds %7[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_47 = pto.vlds %7[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_48 = pto.vlds %7[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_49 = pto.vlds %7[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_50 = pto.vlds %7[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_51 = pto.vlds %7[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_52 = pto.vlds %7[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_53 = pto.vlds %7[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_54 = pto.vlds %7[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_55 = pto.vlds %7[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_56 = pto.vlds %7[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_57 = pto.vlds %7[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_58 = pto.vlds %7[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_59 = pto.vlds %7[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_60 = pto.vlds %7[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_61 = pto.vlds %7[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_62 = pto.vlds %7[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_63 = pto.vlds %7[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_64 = pto.vlds %7[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_65 = pto.vlds %7[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vadd %result, %result_3, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %30, %result_4, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %31, %result_5, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %32, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %33, %result_7, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %34, %result_8, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %35, %result_9, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %36, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result_10, %result_11, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadd %38, %result_12, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadd %39, %result_13, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadd %40, %result_14, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vadd %41, %result_15, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vadd %42, %result_16, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vadd %43, %result_17, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcadd %44, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vadd %result_18, %result_19, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %46, %result_20, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vadd %47, %result_21, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %48, %result_22, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_23, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_24, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vadd %51, %result_25, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcadd %52, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vadd %result_26, %result_27, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %54, %result_28, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vadd %55, %result_29, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %56, %result_30, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_32, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vadd %59, %result_33, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vcadd %60, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vadd %result_34, %result_35, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %62, %result_36, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vadd %63, %result_37, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %64, %result_38, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_39, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_40, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vadd %67, %result_41, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vcadd %68, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vadd %result_42, %result_43, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %70, %result_44, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vadd %71, %result_45, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %72, %result_46, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_47, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_48, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vadd %75, %result_49, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vcadd %76, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vadd %result_50, %result_51, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vadd %78, %result_52, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vadd %79, %result_53, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vadd %80, %result_54, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vadd %81, %result_55, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %82, %result_56, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vadd %83, %result_57, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.vcadd %84, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %86 = pto.vadd %result_58, %result_59, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vadd %86, %result_60, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.vadd %87, %result_61, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %89 = pto.vadd %88, %result_62, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.vadd %89, %result_63, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = pto.vadd %90, %result_64, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %92 = pto.vadd %91, %result_65, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %92, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %37, %11[%c0], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %11[%c1], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %11[%c2], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %11[%c3], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %11[%c4], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %11[%c5], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %85, %11[%c6], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %11[%c7], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %27 = pto.alloc_tile addr = %c82048_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.vadd %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %12[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %95 = arith.index_cast %arg7 : i16 to index
            %96 = arith.muli %95, %c512 : index
            %result_66 = pto.vlds %8[%96] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %97 = arith.addi %96, %c64 : index
            %result_67 = pto.vlds %8[%97] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %98 = arith.addi %96, %c128 : index
            %result_68 = pto.vlds %8[%98] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %99 = arith.addi %96, %c192 : index
            %result_69 = pto.vlds %8[%99] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %100 = arith.addi %96, %c256 : index
            %result_70 = pto.vlds %8[%100] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %101 = arith.addi %96, %c320 : index
            %result_71 = pto.vlds %8[%101] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %102 = arith.addi %96, %c384 : index
            %result_72 = pto.vlds %8[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = arith.addi %96, %c448 : index
            %result_73 = pto.vlds %8[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vmul %result_66, %result_66, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %105 = pto.vmul %result_67, %result_67, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %106 = pto.vmul %result_68, %result_68, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %107 = pto.vmul %result_69, %result_69, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vmul %result_70, %result_70, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vmul %result_71, %result_71, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vmul %result_72, %result_72, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vmul %result_73, %result_73, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %8[%96], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %105, %8[%97], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %106, %8[%98], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %107, %8[%99], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %108, %8[%100], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %109, %8[%101], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %110, %8[%102], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %111, %8[%103], %29 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %8[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %8[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %8[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %8[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %8[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %8[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %8[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %8[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %8[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %8[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %8[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %8[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %8[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %8[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %8[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %8[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %8[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %8[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %8[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %8[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %8[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %8[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %8[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %8[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %8[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %8[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %8[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %8[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %8[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %8[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %8[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %8[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %8[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %8[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %8[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %8[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %8[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_42 = pto.vlds %8[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_43 = pto.vlds %8[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_44 = pto.vlds %8[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_45 = pto.vlds %8[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_46 = pto.vlds %8[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_47 = pto.vlds %8[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_48 = pto.vlds %8[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_49 = pto.vlds %8[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_50 = pto.vlds %8[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_51 = pto.vlds %8[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_52 = pto.vlds %8[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_53 = pto.vlds %8[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_54 = pto.vlds %8[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_55 = pto.vlds %8[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_56 = pto.vlds %8[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_57 = pto.vlds %8[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_58 = pto.vlds %8[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_59 = pto.vlds %8[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_60 = pto.vlds %8[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_61 = pto.vlds %8[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_62 = pto.vlds %8[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_63 = pto.vlds %8[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_64 = pto.vlds %8[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_65 = pto.vlds %8[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vadd %result, %result_3, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %30, %result_4, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %31, %result_5, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vadd %32, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %33, %result_7, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %34, %result_8, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %35, %result_9, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %36, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vadd %result_10, %result_11, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadd %38, %result_12, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadd %39, %result_13, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadd %40, %result_14, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vadd %41, %result_15, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vadd %42, %result_16, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vadd %43, %result_17, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcadd %44, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vadd %result_18, %result_19, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %46, %result_20, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vadd %47, %result_21, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %48, %result_22, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_23, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_24, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vadd %51, %result_25, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcadd %52, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vadd %result_26, %result_27, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %54, %result_28, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vadd %55, %result_29, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %56, %result_30, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_31, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_32, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vadd %59, %result_33, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vcadd %60, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vadd %result_34, %result_35, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %62, %result_36, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vadd %63, %result_37, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %64, %result_38, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_39, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_40, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vadd %67, %result_41, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vcadd %68, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vadd %result_42, %result_43, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %70, %result_44, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vadd %71, %result_45, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %72, %result_46, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_47, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_48, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vadd %75, %result_49, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vcadd %76, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vadd %result_50, %result_51, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vadd %78, %result_52, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vadd %79, %result_53, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vadd %80, %result_54, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vadd %81, %result_55, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %82, %result_56, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vadd %83, %result_57, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.vcadd %84, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %86 = pto.vadd %result_58, %result_59, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %87 = pto.vadd %86, %result_60, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %88 = pto.vadd %87, %result_61, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %89 = pto.vadd %88, %result_62, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %90 = pto.vadd %89, %result_63, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = pto.vadd %90, %result_64, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %92 = pto.vadd %91, %result_65, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %92, %29 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %37, %13[%c0], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %13[%c1], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %13[%c2], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %13[%c3], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %13[%c4], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %13[%c5], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %85, %13[%c6], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %93, %13[%c7], %94 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %29 = pto.vadd %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %15 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %15, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %16 = pto.vadds %result_3, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %16, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %17 = pto.vsqrt %result_4, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.vmuls %17, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vadds %18, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vdiv %19, %17, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %12[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %14 = pto.addptr %arg1, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %14, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
