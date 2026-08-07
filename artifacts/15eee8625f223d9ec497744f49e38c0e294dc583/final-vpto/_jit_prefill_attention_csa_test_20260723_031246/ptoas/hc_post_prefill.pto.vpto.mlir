module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_post_prefill(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: index, %arg6: index, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c4096_i16 = arith.constant 4096 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c131072_i64 = arith.constant 131072 : i64
      %c114688_i64 = arith.constant 114688 : i64
      %c147456_i64 = arith.constant 147456 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c98304_i64 = arith.constant 98304 : i64
      %c16384 = arith.constant 16384 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c4096 = arith.constant 4096 : index
      %c16 = arith.constant 16 : index
      %c2 = arith.constant 2 : index
      %c8 = arith.constant 8 : index
      %c12 = arith.constant 12 : index
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c8192 = arith.constant 8192 : index
      %c12288 = arith.constant 12288 : index
      %c64 = arith.constant 64 : index
      %c8192_i64 = arith.constant 8192 : i64
      %c128 = arith.constant 128 : index
      %c256 = arith.constant 256 : index
      %c384 = arith.constant 384 : index
      %c512 = arith.constant 512 : index
      %c640 = arith.constant 640 : index
      %c768 = arith.constant 768 : index
      %c896 = arith.constant 896 : index
      %c1024 = arith.constant 1024 : index
      %c1152 = arith.constant 1152 : index
      %c1280 = arith.constant 1280 : index
      %c1408 = arith.constant 1408 : index
      %c1536 = arith.constant 1536 : index
      %c1664 = arith.constant 1664 : index
      %c1792 = arith.constant 1792 : index
      %c1920 = arith.constant 1920 : index
      %c2048 = arith.constant 2048 : index
      %c2176 = arith.constant 2176 : index
      %c2304 = arith.constant 2304 : index
      %c2432 = arith.constant 2432 : index
      %c2560 = arith.constant 2560 : index
      %c2688 = arith.constant 2688 : index
      %c2816 = arith.constant 2816 : index
      %c2944 = arith.constant 2944 : index
      %c3072 = arith.constant 3072 : index
      %c3200 = arith.constant 3200 : index
      %c3328 = arith.constant 3328 : index
      %c3456 = arith.constant 3456 : index
      %c3584 = arith.constant 3584 : index
      %c3712 = arith.constant 3712 : index
      %c3840 = arith.constant 3840 : index
      %c3968 = arith.constant 3968 : index
      %c192 = arith.constant 192 : index
      %c320 = arith.constant 320 : index
      %c448 = arith.constant 448 : index
      %c576 = arith.constant 576 : index
      %c704 = arith.constant 704 : index
      %c832 = arith.constant 832 : index
      %c960 = arith.constant 960 : index
      %c1088 = arith.constant 1088 : index
      %c1216 = arith.constant 1216 : index
      %c1344 = arith.constant 1344 : index
      %c1472 = arith.constant 1472 : index
      %c1600 = arith.constant 1600 : index
      %c1728 = arith.constant 1728 : index
      %c1856 = arith.constant 1856 : index
      %c1984 = arith.constant 1984 : index
      %c2112 = arith.constant 2112 : index
      %c2240 = arith.constant 2240 : index
      %c2368 = arith.constant 2368 : index
      %c2496 = arith.constant 2496 : index
      %c2624 = arith.constant 2624 : index
      %c2752 = arith.constant 2752 : index
      %c2880 = arith.constant 2880 : index
      %c3008 = arith.constant 3008 : index
      %c3136 = arith.constant 3136 : index
      %c3264 = arith.constant 3264 : index
      %c3392 = arith.constant 3392 : index
      %c3520 = arith.constant 3520 : index
      %c3648 = arith.constant 3648 : index
      %c3776 = arith.constant 3776 : index
      %c3904 = arith.constant 3904 : index
      %c4032 = arith.constant 4032 : index
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.remsi %0, %c4 : index
      %3 = arith.muli %1, %c4 : index
      %4 = arith.addi %3, %c4 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      scf.for %arg10 = %3 to %4 step %c2 {
        %8 = arith.cmpi slt, %arg10, %arg5 : index
        scf.if %8 {
          %11 = arith.muli %arg10, %c4 : index
          %12 = arith.addi %11, %2 : index
          %13 = pto.load_scalar %arg1[%12] : !pto.ptr<f32, gm> -> f32
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %14 = arith.muli %arg10, %c4096 : index
          %15 = pto.addptr %arg2, %14 : <bf16, gm> -> <bf16, gm>
          %16 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, ub>
          %17 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
          %18 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %17, %18, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %19 = pto.castptr %c114688_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %16[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_0 = pto.vlds %16[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_1 = pto.vlds %16[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_2 = pto.vlds %16[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_3 = pto.vlds %16[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_4 = pto.vlds %16[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_5 = pto.vlds %16[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_6 = pto.vlds %16[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_7 = pto.vlds %16[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_8 = pto.vlds %16[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_9 = pto.vlds %16[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_10 = pto.vlds %16[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_11 = pto.vlds %16[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_12 = pto.vlds %16[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_13 = pto.vlds %16[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_14 = pto.vlds %16[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_15 = pto.vlds %16[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_16 = pto.vlds %16[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_17 = pto.vlds %16[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_18 = pto.vlds %16[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_19 = pto.vlds %16[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_20 = pto.vlds %16[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_21 = pto.vlds %16[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_22 = pto.vlds %16[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_23 = pto.vlds %16[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_24 = pto.vlds %16[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_25 = pto.vlds %16[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_26 = pto.vlds %16[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_27 = pto.vlds %16[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_28 = pto.vlds %16[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_29 = pto.vlds %16[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_30 = pto.vlds %16[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %51 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %52 = pto.vcvt %result_0, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %53 = pto.vcvt %result_1, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %54 = pto.vcvt %result_2, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %55 = pto.vcvt %result_3, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %56 = pto.vcvt %result_4, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %57 = pto.vcvt %result_5, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %58 = pto.vcvt %result_6, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %59 = pto.vcvt %result_7, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %60 = pto.vcvt %result_8, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result_9, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %62 = pto.vcvt %result_10, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %63 = pto.vcvt %result_11, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %64 = pto.vcvt %result_12, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %65 = pto.vcvt %result_13, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %66 = pto.vcvt %result_14, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %67 = pto.vcvt %result_15, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %68 = pto.vcvt %result_16, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %69 = pto.vcvt %result_17, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %70 = pto.vcvt %result_18, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %71 = pto.vcvt %result_19, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %72 = pto.vcvt %result_20, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %73 = pto.vcvt %result_21, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %74 = pto.vcvt %result_22, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %75 = pto.vcvt %result_23, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %76 = pto.vcvt %result_24, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %77 = pto.vcvt %result_25, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %78 = pto.vcvt %result_26, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %79 = pto.vcvt %result_27, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %80 = pto.vcvt %result_28, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %81 = pto.vcvt %result_29, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %82 = pto.vcvt %result_30, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %83 = pto.vcvt %result, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %84 = pto.vcvt %result_0, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %85 = pto.vcvt %result_1, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %86 = pto.vcvt %result_2, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %87 = pto.vcvt %result_3, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %88 = pto.vcvt %result_4, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %89 = pto.vcvt %result_5, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %90 = pto.vcvt %result_6, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %91 = pto.vcvt %result_7, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %92 = pto.vcvt %result_8, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %93 = pto.vcvt %result_9, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %94 = pto.vcvt %result_10, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %95 = pto.vcvt %result_11, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %96 = pto.vcvt %result_12, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %97 = pto.vcvt %result_13, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %98 = pto.vcvt %result_14, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %99 = pto.vcvt %result_15, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %100 = pto.vcvt %result_16, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %101 = pto.vcvt %result_17, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %102 = pto.vcvt %result_18, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %103 = pto.vcvt %result_19, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %104 = pto.vcvt %result_20, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %105 = pto.vcvt %result_21, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %106 = pto.vcvt %result_22, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %107 = pto.vcvt %result_23, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %108 = pto.vcvt %result_24, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %109 = pto.vcvt %result_25, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %110 = pto.vcvt %result_26, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %111 = pto.vcvt %result_27, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %112 = pto.vcvt %result_28, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %113 = pto.vcvt %result_29, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %114 = pto.vcvt %result_30, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low, %high = pto.vintlv %51, %83 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_31, %high_32 = pto.vintlv %52, %84 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_33, %high_34 = pto.vintlv %53, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_35, %high_36 = pto.vintlv %54, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_37, %high_38 = pto.vintlv %55, %87 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_39, %high_40 = pto.vintlv %56, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_41, %high_42 = pto.vintlv %57, %89 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_43, %high_44 = pto.vintlv %58, %90 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_45, %high_46 = pto.vintlv %59, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_47, %high_48 = pto.vintlv %60, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_49, %high_50 = pto.vintlv %61, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_51, %high_52 = pto.vintlv %62, %94 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_53, %high_54 = pto.vintlv %63, %95 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_55, %high_56 = pto.vintlv %64, %96 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_57, %high_58 = pto.vintlv %65, %97 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_59, %high_60 = pto.vintlv %66, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_61, %high_62 = pto.vintlv %67, %99 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_63, %high_64 = pto.vintlv %68, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_65, %high_66 = pto.vintlv %69, %101 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_67, %high_68 = pto.vintlv %70, %102 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_69, %high_70 = pto.vintlv %71, %103 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_71, %high_72 = pto.vintlv %72, %104 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_73, %high_74 = pto.vintlv %73, %105 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_75, %high_76 = pto.vintlv %74, %106 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_77, %high_78 = pto.vintlv %75, %107 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_79, %high_80 = pto.vintlv %76, %108 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_81, %high_82 = pto.vintlv %77, %109 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_83, %high_84 = pto.vintlv %78, %110 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_85, %high_86 = pto.vintlv %79, %111 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_87, %high_88 = pto.vintlv %80, %112 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_89, %high_90 = pto.vintlv %81, %113 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_91, %high_92 = pto.vintlv %82, %114 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_93, %high_94 = pto.pintlv_b32 %49, %49 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
            pto.vsts %low, %19[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high, %19[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_31, %19[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_32, %19[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_33, %19[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_34, %19[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_35, %19[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_36, %19[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_37, %19[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_38, %19[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_39, %19[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_40, %19[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_41, %19[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_42, %19[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_43, %19[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_44, %19[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_45, %19[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_46, %19[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_47, %19[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_48, %19[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_49, %19[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_50, %19[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_51, %19[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_52, %19[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_53, %19[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_54, %19[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_55, %19[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_56, %19[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_57, %19[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_58, %19[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_59, %19[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_60, %19[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_61, %19[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_62, %19[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_63, %19[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_64, %19[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_65, %19[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_66, %19[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_67, %19[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_68, %19[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_69, %19[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_70, %19[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_71, %19[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_72, %19[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_73, %19[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_74, %19[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_75, %19[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_76, %19[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_77, %19[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_78, %19[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_79, %19[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_80, %19[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_81, %19[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_82, %19[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_83, %19[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_84, %19[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_85, %19[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_86, %19[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_87, %19[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_88, %19[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_89, %19[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_90, %19[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_91, %19[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_92, %19[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %20 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %50 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %19[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmuls %result, %13, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %19[%50], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %21 = arith.muli %arg10, %c16 : index
          %22 = arith.addi %21, %2 : index
          %23 = pto.load_scalar %arg3[%22] : !pto.ptr<f32, gm> -> f32
          %24 = arith.addi %2, %c4 : index
          %25 = arith.addi %21, %24 : index
          %26 = pto.load_scalar %arg3[%25] : !pto.ptr<f32, gm> -> f32
          %27 = arith.addi %2, %c8 : index
          %28 = arith.addi %21, %27 : index
          %29 = pto.load_scalar %arg3[%28] : !pto.ptr<f32, gm> -> f32
          %30 = arith.addi %2, %c12 : index
          %31 = arith.addi %21, %30 : index
          %32 = pto.load_scalar %arg3[%31] : !pto.ptr<f32, gm> -> f32
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %33 = arith.muli %arg10, %c16384 : index
          %34 = pto.addptr %arg4, %33 : <f32, gm> -> <f32, gm>
          %35 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %36 = arith.addi %33, %c4096 : index
          %37 = pto.addptr %arg4, %36 : <f32, gm> -> <f32, gm>
          %38 = pto.castptr %c147456_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %37, %38, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %39 = arith.addi %33, %c8192 : index
          %40 = pto.addptr %arg4, %39 : <f32, gm> -> <f32, gm>
          %41 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %40, %41, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          %42 = arith.addi %33, %c12288 : index
          %43 = pto.addptr %arg4, %42 : <f32, gm> -> <f32, gm>
          %44 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %43, %44, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %35[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %23, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %19[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %35[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %38[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %26, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %35[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %38[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %41[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %29, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %38[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %41[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %50 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %44[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmuls %result, %32, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %44[%50], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %45 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %41[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %44[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vadd %result, %result_0, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %52, %19[%51], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %46 = arith.muli %2, %c4096 : index
          pto.barrier <PIPE_MTE3>
          %47 = arith.addi %33, %46 : index
          %48 = pto.addptr %arg0, %47 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %19, %48, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
        %9 = arith.addi %arg10, %c1 : index
        %10 = arith.cmpi slt, %9, %arg5 : index
        scf.if %10 {
          %11 = arith.muli %9, %c4 : index
          %12 = arith.addi %11, %2 : index
          %13 = pto.load_scalar %arg1[%12] : !pto.ptr<f32, gm> -> f32
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          %14 = arith.muli %9, %c4096 : index
          %15 = pto.addptr %arg2, %14 : <bf16, gm> -> <bf16, gm>
          %16 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<bf16, ub>
          %17 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
          %18 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %17, %18, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
          %19 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %16[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_0 = pto.vlds %16[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_1 = pto.vlds %16[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_2 = pto.vlds %16[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_3 = pto.vlds %16[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_4 = pto.vlds %16[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_5 = pto.vlds %16[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_6 = pto.vlds %16[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_7 = pto.vlds %16[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_8 = pto.vlds %16[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_9 = pto.vlds %16[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_10 = pto.vlds %16[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_11 = pto.vlds %16[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_12 = pto.vlds %16[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_13 = pto.vlds %16[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_14 = pto.vlds %16[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_15 = pto.vlds %16[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_16 = pto.vlds %16[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_17 = pto.vlds %16[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_18 = pto.vlds %16[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_19 = pto.vlds %16[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_20 = pto.vlds %16[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_21 = pto.vlds %16[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_22 = pto.vlds %16[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_23 = pto.vlds %16[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_24 = pto.vlds %16[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_25 = pto.vlds %16[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_26 = pto.vlds %16[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_27 = pto.vlds %16[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_28 = pto.vlds %16[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_29 = pto.vlds %16[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_30 = pto.vlds %16[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %51 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %52 = pto.vcvt %result_0, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %53 = pto.vcvt %result_1, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %54 = pto.vcvt %result_2, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %55 = pto.vcvt %result_3, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %56 = pto.vcvt %result_4, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %57 = pto.vcvt %result_5, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %58 = pto.vcvt %result_6, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %59 = pto.vcvt %result_7, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %60 = pto.vcvt %result_8, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result_9, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %62 = pto.vcvt %result_10, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %63 = pto.vcvt %result_11, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %64 = pto.vcvt %result_12, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %65 = pto.vcvt %result_13, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %66 = pto.vcvt %result_14, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %67 = pto.vcvt %result_15, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %68 = pto.vcvt %result_16, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %69 = pto.vcvt %result_17, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %70 = pto.vcvt %result_18, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %71 = pto.vcvt %result_19, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %72 = pto.vcvt %result_20, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %73 = pto.vcvt %result_21, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %74 = pto.vcvt %result_22, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %75 = pto.vcvt %result_23, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %76 = pto.vcvt %result_24, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %77 = pto.vcvt %result_25, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %78 = pto.vcvt %result_26, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %79 = pto.vcvt %result_27, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %80 = pto.vcvt %result_28, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %81 = pto.vcvt %result_29, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %82 = pto.vcvt %result_30, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %83 = pto.vcvt %result, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %84 = pto.vcvt %result_0, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %85 = pto.vcvt %result_1, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %86 = pto.vcvt %result_2, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %87 = pto.vcvt %result_3, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %88 = pto.vcvt %result_4, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %89 = pto.vcvt %result_5, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %90 = pto.vcvt %result_6, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %91 = pto.vcvt %result_7, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %92 = pto.vcvt %result_8, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %93 = pto.vcvt %result_9, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %94 = pto.vcvt %result_10, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %95 = pto.vcvt %result_11, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %96 = pto.vcvt %result_12, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %97 = pto.vcvt %result_13, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %98 = pto.vcvt %result_14, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %99 = pto.vcvt %result_15, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %100 = pto.vcvt %result_16, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %101 = pto.vcvt %result_17, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %102 = pto.vcvt %result_18, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %103 = pto.vcvt %result_19, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %104 = pto.vcvt %result_20, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %105 = pto.vcvt %result_21, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %106 = pto.vcvt %result_22, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %107 = pto.vcvt %result_23, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %108 = pto.vcvt %result_24, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %109 = pto.vcvt %result_25, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %110 = pto.vcvt %result_26, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %111 = pto.vcvt %result_27, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %112 = pto.vcvt %result_28, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %113 = pto.vcvt %result_29, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %114 = pto.vcvt %result_30, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low, %high = pto.vintlv %51, %83 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_31, %high_32 = pto.vintlv %52, %84 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_33, %high_34 = pto.vintlv %53, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_35, %high_36 = pto.vintlv %54, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_37, %high_38 = pto.vintlv %55, %87 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_39, %high_40 = pto.vintlv %56, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_41, %high_42 = pto.vintlv %57, %89 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_43, %high_44 = pto.vintlv %58, %90 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_45, %high_46 = pto.vintlv %59, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_47, %high_48 = pto.vintlv %60, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_49, %high_50 = pto.vintlv %61, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_51, %high_52 = pto.vintlv %62, %94 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_53, %high_54 = pto.vintlv %63, %95 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_55, %high_56 = pto.vintlv %64, %96 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_57, %high_58 = pto.vintlv %65, %97 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_59, %high_60 = pto.vintlv %66, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_61, %high_62 = pto.vintlv %67, %99 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_63, %high_64 = pto.vintlv %68, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_65, %high_66 = pto.vintlv %69, %101 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_67, %high_68 = pto.vintlv %70, %102 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_69, %high_70 = pto.vintlv %71, %103 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_71, %high_72 = pto.vintlv %72, %104 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_73, %high_74 = pto.vintlv %73, %105 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_75, %high_76 = pto.vintlv %74, %106 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_77, %high_78 = pto.vintlv %75, %107 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_79, %high_80 = pto.vintlv %76, %108 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_81, %high_82 = pto.vintlv %77, %109 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_83, %high_84 = pto.vintlv %78, %110 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_85, %high_86 = pto.vintlv %79, %111 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_87, %high_88 = pto.vintlv %80, %112 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_89, %high_90 = pto.vintlv %81, %113 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_91, %high_92 = pto.vintlv %82, %114 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_93, %high_94 = pto.pintlv_b32 %49, %49 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
            pto.vsts %low, %19[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high, %19[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_31, %19[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_32, %19[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_33, %19[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_34, %19[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_35, %19[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_36, %19[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_37, %19[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_38, %19[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_39, %19[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_40, %19[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_41, %19[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_42, %19[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_43, %19[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_44, %19[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_45, %19[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_46, %19[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_47, %19[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_48, %19[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_49, %19[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_50, %19[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_51, %19[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_52, %19[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_53, %19[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_54, %19[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_55, %19[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_56, %19[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_57, %19[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_58, %19[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_59, %19[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_60, %19[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_61, %19[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_62, %19[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_63, %19[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_64, %19[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_65, %19[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_66, %19[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_67, %19[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_68, %19[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_69, %19[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_70, %19[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_71, %19[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_72, %19[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_73, %19[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_74, %19[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_75, %19[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_76, %19[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_77, %19[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_78, %19[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_79, %19[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_80, %19[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_81, %19[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_82, %19[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_83, %19[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_84, %19[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_85, %19[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_86, %19[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_87, %19[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_88, %19[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_89, %19[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_90, %19[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_91, %19[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_92, %19[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
          %20 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %50 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %19[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmuls %result, %13, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %19[%50], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %21 = arith.muli %9, %c16 : index
          %22 = arith.addi %21, %2 : index
          %23 = pto.load_scalar %arg3[%22] : !pto.ptr<f32, gm> -> f32
          %24 = arith.addi %2, %c4 : index
          %25 = arith.addi %21, %24 : index
          %26 = pto.load_scalar %arg3[%25] : !pto.ptr<f32, gm> -> f32
          %27 = arith.addi %2, %c8 : index
          %28 = arith.addi %21, %27 : index
          %29 = pto.load_scalar %arg3[%28] : !pto.ptr<f32, gm> -> f32
          %30 = arith.addi %2, %c12 : index
          %31 = arith.addi %21, %30 : index
          %32 = pto.load_scalar %arg3[%31] : !pto.ptr<f32, gm> -> f32
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
          %33 = arith.muli %9, %c16384 : index
          %34 = pto.addptr %arg4, %33 : <f32, gm> -> <f32, gm>
          %35 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
          %36 = arith.addi %33, %c4096 : index
          %37 = pto.addptr %arg4, %36 : <f32, gm> -> <f32, gm>
          %38 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %37, %38, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
          %39 = arith.addi %33, %c8192 : index
          %40 = pto.addptr %arg4, %39 : <f32, gm> -> <f32, gm>
          %41 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %40, %41, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %42 = arith.addi %33, %c12288 : index
          %43 = pto.addptr %arg4, %42 : <f32, gm> -> <f32, gm>
          %44 = pto.castptr %c98304_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %43, %44, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %35[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %23, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %19[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %35[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %38[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %26, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %35[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %38[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %41[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vmuls %result, %29, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %38[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.vadd %result_0, %52, %50 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %53, %41[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %50 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %44[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vmuls %result, %32, %49 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %44[%50], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %45 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg11 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %51 = arith.index_cast %arg11 : i16 to index
              %result = pto.vlds %41[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %44[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vadd %result, %result_0, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %52, %19[%51], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %46 = arith.muli %2, %c4096 : index
          pto.barrier <PIPE_MTE3>
          %47 = arith.addi %33, %46 : index
          %48 = pto.addptr %arg0, %47 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %19, %48, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      %5 = arith.subi %3, %4 : index
      %6 = arith.addi %5, %c4 : index
      %7 = arith.cmpi eq, %6, %c1 : index
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      scf.if %7 {
        %8 = arith.cmpi slt, %4, %arg5 : index
        scf.if %8 {
          %9 = arith.muli %4, %c4 : index
          %10 = arith.addi %9, %2 : index
          %11 = pto.load_scalar %arg1[%10] : !pto.ptr<f32, gm> -> f32
          %12 = arith.muli %4, %c4096 : index
          %13 = pto.addptr %arg2, %12 : <bf16, gm> -> <bf16, gm>
          %14 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, ub>
          %15 = pto.addptr %13, %c0 : <bf16, gm> -> <bf16, gm>
          %16 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %17 = pto.castptr %c114688_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %14[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_0 = pto.vlds %14[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_1 = pto.vlds %14[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_2 = pto.vlds %14[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_3 = pto.vlds %14[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_4 = pto.vlds %14[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_5 = pto.vlds %14[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_6 = pto.vlds %14[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_7 = pto.vlds %14[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_8 = pto.vlds %14[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_9 = pto.vlds %14[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_10 = pto.vlds %14[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_11 = pto.vlds %14[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_12 = pto.vlds %14[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_13 = pto.vlds %14[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_14 = pto.vlds %14[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_15 = pto.vlds %14[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_16 = pto.vlds %14[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_17 = pto.vlds %14[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_18 = pto.vlds %14[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_19 = pto.vlds %14[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_20 = pto.vlds %14[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_21 = pto.vlds %14[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_22 = pto.vlds %14[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_23 = pto.vlds %14[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_24 = pto.vlds %14[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_25 = pto.vlds %14[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_26 = pto.vlds %14[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_27 = pto.vlds %14[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_28 = pto.vlds %14[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_29 = pto.vlds %14[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %result_30 = pto.vlds %14[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %48 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %49 = pto.vcvt %result, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %50 = pto.vcvt %result_0, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %51 = pto.vcvt %result_1, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %52 = pto.vcvt %result_2, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %53 = pto.vcvt %result_3, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %54 = pto.vcvt %result_4, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %55 = pto.vcvt %result_5, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %56 = pto.vcvt %result_6, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %57 = pto.vcvt %result_7, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %58 = pto.vcvt %result_8, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %59 = pto.vcvt %result_9, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %60 = pto.vcvt %result_10, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result_11, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %62 = pto.vcvt %result_12, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %63 = pto.vcvt %result_13, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %64 = pto.vcvt %result_14, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %65 = pto.vcvt %result_15, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %66 = pto.vcvt %result_16, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %67 = pto.vcvt %result_17, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %68 = pto.vcvt %result_18, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %69 = pto.vcvt %result_19, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %70 = pto.vcvt %result_20, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %71 = pto.vcvt %result_21, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %72 = pto.vcvt %result_22, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %73 = pto.vcvt %result_23, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %74 = pto.vcvt %result_24, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %75 = pto.vcvt %result_25, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %76 = pto.vcvt %result_26, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %77 = pto.vcvt %result_27, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %78 = pto.vcvt %result_28, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %79 = pto.vcvt %result_29, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %80 = pto.vcvt %result_30, %48 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %81 = pto.vcvt %result, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %82 = pto.vcvt %result_0, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %83 = pto.vcvt %result_1, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %84 = pto.vcvt %result_2, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %85 = pto.vcvt %result_3, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %86 = pto.vcvt %result_4, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %87 = pto.vcvt %result_5, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %88 = pto.vcvt %result_6, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %89 = pto.vcvt %result_7, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %90 = pto.vcvt %result_8, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %91 = pto.vcvt %result_9, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %92 = pto.vcvt %result_10, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %93 = pto.vcvt %result_11, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %94 = pto.vcvt %result_12, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %95 = pto.vcvt %result_13, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %96 = pto.vcvt %result_14, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %97 = pto.vcvt %result_15, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %98 = pto.vcvt %result_16, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %99 = pto.vcvt %result_17, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %100 = pto.vcvt %result_18, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %101 = pto.vcvt %result_19, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %102 = pto.vcvt %result_20, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %103 = pto.vcvt %result_21, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %104 = pto.vcvt %result_22, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %105 = pto.vcvt %result_23, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %106 = pto.vcvt %result_24, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %107 = pto.vcvt %result_25, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %108 = pto.vcvt %result_26, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %109 = pto.vcvt %result_27, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %110 = pto.vcvt %result_28, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %111 = pto.vcvt %result_29, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %112 = pto.vcvt %result_30, %48 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %low, %high = pto.vintlv %49, %81 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_31, %high_32 = pto.vintlv %50, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_33, %high_34 = pto.vintlv %51, %83 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_35, %high_36 = pto.vintlv %52, %84 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_37, %high_38 = pto.vintlv %53, %85 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_39, %high_40 = pto.vintlv %54, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_41, %high_42 = pto.vintlv %55, %87 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_43, %high_44 = pto.vintlv %56, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_45, %high_46 = pto.vintlv %57, %89 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_47, %high_48 = pto.vintlv %58, %90 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_49, %high_50 = pto.vintlv %59, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_51, %high_52 = pto.vintlv %60, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_53, %high_54 = pto.vintlv %61, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_55, %high_56 = pto.vintlv %62, %94 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_57, %high_58 = pto.vintlv %63, %95 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_59, %high_60 = pto.vintlv %64, %96 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_61, %high_62 = pto.vintlv %65, %97 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_63, %high_64 = pto.vintlv %66, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_65, %high_66 = pto.vintlv %67, %99 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_67, %high_68 = pto.vintlv %68, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_69, %high_70 = pto.vintlv %69, %101 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_71, %high_72 = pto.vintlv %70, %102 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_73, %high_74 = pto.vintlv %71, %103 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_75, %high_76 = pto.vintlv %72, %104 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_77, %high_78 = pto.vintlv %73, %105 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_79, %high_80 = pto.vintlv %74, %106 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_81, %high_82 = pto.vintlv %75, %107 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_83, %high_84 = pto.vintlv %76, %108 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_85, %high_86 = pto.vintlv %77, %109 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_87, %high_88 = pto.vintlv %78, %110 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_89, %high_90 = pto.vintlv %79, %111 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_91, %high_92 = pto.vintlv %80, %112 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_93, %high_94 = pto.pintlv_b32 %47, %47 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
            pto.vsts %low, %17[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high, %17[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_31, %17[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_32, %17[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_33, %17[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_34, %17[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_35, %17[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_36, %17[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_37, %17[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_38, %17[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_39, %17[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_40, %17[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_41, %17[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_42, %17[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_43, %17[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_44, %17[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_45, %17[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_46, %17[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_47, %17[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_48, %17[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_49, %17[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_50, %17[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_51, %17[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_52, %17[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_53, %17[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_54, %17[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_55, %17[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_56, %17[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_57, %17[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_58, %17[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_59, %17[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_60, %17[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_61, %17[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_62, %17[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_63, %17[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_64, %17[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_65, %17[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_66, %17[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_67, %17[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_68, %17[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_69, %17[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_70, %17[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_71, %17[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_72, %17[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_73, %17[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_74, %17[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_75, %17[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_76, %17[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_77, %17[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_78, %17[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_79, %17[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_80, %17[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_81, %17[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_82, %17[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_83, %17[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_84, %17[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_85, %17[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_86, %17[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_87, %17[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_88, %17[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_89, %17[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_90, %17[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_91, %17[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %high_92, %17[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
          %18 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %48 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %17[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %49 = pto.vmuls %result, %11, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %17[%48], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %19 = arith.muli %4, %c16 : index
          %20 = arith.addi %19, %2 : index
          %21 = pto.load_scalar %arg3[%20] : !pto.ptr<f32, gm> -> f32
          %22 = arith.addi %2, %c4 : index
          %23 = arith.addi %19, %22 : index
          %24 = pto.load_scalar %arg3[%23] : !pto.ptr<f32, gm> -> f32
          %25 = arith.addi %2, %c8 : index
          %26 = arith.addi %19, %25 : index
          %27 = pto.load_scalar %arg3[%26] : !pto.ptr<f32, gm> -> f32
          %28 = arith.addi %2, %c12 : index
          %29 = arith.addi %19, %28 : index
          %30 = pto.load_scalar %arg3[%29] : !pto.ptr<f32, gm> -> f32
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
          %31 = arith.muli %4, %c16384 : index
          %32 = pto.addptr %arg4, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %32, %33, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %34 = arith.addi %31, %c4096 : index
          %35 = pto.addptr %arg4, %34 : <f32, gm> -> <f32, gm>
          %36 = pto.castptr %c147456_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %35, %36, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %37 = arith.addi %31, %c8192 : index
          %38 = pto.addptr %arg4, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %38, %39, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %40 = arith.addi %31, %c12288 : index
          %41 = pto.addptr %arg4, %40 : <f32, gm> -> <f32, gm>
          %42 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %41, %42, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %33[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vmuls %result, %21, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %17[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vadd %result_0, %50, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %33[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %36[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vmuls %result, %24, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %33[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vadd %result_0, %50, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %36[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %39[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vmuls %result, %27, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %36[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vadd %result_0, %50, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %39[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.vecscope {
            %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %48 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %42[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %49 = pto.vmuls %result, %30, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %42[%48], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
          }
          %43 = pto.alloc_tile addr = %c114688_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
          pto.vecscope {
            %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %result = pto.vlds %39[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %42[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vadd %result, %result_0, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %50, %17[%49], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %44 = arith.muli %2, %c4096 : index
          pto.barrier <PIPE_MTE3>
          %45 = arith.addi %31, %44 : index
          %46 = pto.addptr %arg0, %45 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %17, %46, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
