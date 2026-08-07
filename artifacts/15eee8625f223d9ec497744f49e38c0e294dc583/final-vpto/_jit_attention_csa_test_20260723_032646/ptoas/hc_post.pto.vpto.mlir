module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_post(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: index, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c4096_i16 = arith.constant 4096 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c147456_i64 = arith.constant 147456 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c98304_i64 = arith.constant 98304 : i64
      %c114688_i64 = arith.constant 114688 : i64
      %c16384 = arith.constant 16384 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c8 = arith.constant 8 : index
      %c4096 = arith.constant 4096 : index
      %c16 = arith.constant 16 : index
      %c2 = arith.constant 2 : index
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
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.remsi %0, %c4 : index
      %3 = arith.muli %1, %c4 : index
      %4 = arith.addi %3, %c4 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %5 = pto.castptr %c147456_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      %7 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, ub>
      %8 = pto.addptr %7, %c0 : <bf16, ub> -> <bf16, ub>
      %9 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = arith.addi %2, %c4 : index
      %11 = arith.addi %2, %c8 : index
      %12 = arith.addi %2, %c12 : index
      %13 = pto.castptr %c147456_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = arith.muli %2, %c4096 : index
      %18 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<f32, ub>
      %21 = pto.castptr %c98304_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.castptr %c114688_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg9 = %3 to %4 step %c2 {
        %26 = arith.muli %arg9, %c4 : index
        %27 = arith.addi %26, %2 : index
        %28 = pto.load_scalar %arg1[%27] : !pto.ptr<f32, gm> -> f32
        %29 = arith.addi %arg9, %c1 : index
        %30 = arith.muli %29, %c4 : index
        %31 = arith.addi %30, %2 : index
        %32 = pto.load_scalar %arg1[%31] : !pto.ptr<f32, gm> -> f32
        %33 = arith.muli %arg9, %c4096 : index
        %34 = pto.addptr %arg2, %33 : <bf16, gm> -> <bf16, gm>
        %35 = pto.addptr %34, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %35, %6, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %36 = arith.muli %29, %c4096 : index
        %37 = pto.addptr %arg2, %36 : <bf16, gm> -> <bf16, gm>
        %38 = pto.addptr %37, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %38, %8, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %5[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_0 = pto.vlds %5[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_1 = pto.vlds %5[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_2 = pto.vlds %5[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_3 = pto.vlds %5[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_4 = pto.vlds %5[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %5[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_6 = pto.vlds %5[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_7 = pto.vlds %5[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_8 = pto.vlds %5[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_9 = pto.vlds %5[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_10 = pto.vlds %5[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_11 = pto.vlds %5[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_12 = pto.vlds %5[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_13 = pto.vlds %5[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_14 = pto.vlds %5[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_15 = pto.vlds %5[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_16 = pto.vlds %5[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_17 = pto.vlds %5[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_18 = pto.vlds %5[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_19 = pto.vlds %5[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_20 = pto.vlds %5[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_21 = pto.vlds %5[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_22 = pto.vlds %5[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_23 = pto.vlds %5[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_24 = pto.vlds %5[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_25 = pto.vlds %5[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_26 = pto.vlds %5[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_27 = pto.vlds %5[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_28 = pto.vlds %5[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_29 = pto.vlds %5[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_30 = pto.vlds %5[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %82 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %83 = pto.vcvt %result, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %84 = pto.vcvt %result_0, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %85 = pto.vcvt %result_1, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %86 = pto.vcvt %result_2, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %87 = pto.vcvt %result_3, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %88 = pto.vcvt %result_4, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %89 = pto.vcvt %result_5, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %90 = pto.vcvt %result_6, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %91 = pto.vcvt %result_7, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %92 = pto.vcvt %result_8, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %93 = pto.vcvt %result_9, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %94 = pto.vcvt %result_10, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %95 = pto.vcvt %result_11, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %96 = pto.vcvt %result_12, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %97 = pto.vcvt %result_13, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %98 = pto.vcvt %result_14, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %99 = pto.vcvt %result_15, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %100 = pto.vcvt %result_16, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %101 = pto.vcvt %result_17, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %102 = pto.vcvt %result_18, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %103 = pto.vcvt %result_19, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %104 = pto.vcvt %result_20, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %105 = pto.vcvt %result_21, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %106 = pto.vcvt %result_22, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %107 = pto.vcvt %result_23, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %108 = pto.vcvt %result_24, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %109 = pto.vcvt %result_25, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %110 = pto.vcvt %result_26, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %111 = pto.vcvt %result_27, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %112 = pto.vcvt %result_28, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %113 = pto.vcvt %result_29, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %114 = pto.vcvt %result_30, %82 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %115 = pto.vcvt %result, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %116 = pto.vcvt %result_0, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %117 = pto.vcvt %result_1, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %118 = pto.vcvt %result_2, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %119 = pto.vcvt %result_3, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %120 = pto.vcvt %result_4, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %121 = pto.vcvt %result_5, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %122 = pto.vcvt %result_6, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %123 = pto.vcvt %result_7, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %124 = pto.vcvt %result_8, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %125 = pto.vcvt %result_9, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %126 = pto.vcvt %result_10, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %127 = pto.vcvt %result_11, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %128 = pto.vcvt %result_12, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %129 = pto.vcvt %result_13, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %130 = pto.vcvt %result_14, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %131 = pto.vcvt %result_15, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %132 = pto.vcvt %result_16, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %133 = pto.vcvt %result_17, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %134 = pto.vcvt %result_18, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %135 = pto.vcvt %result_19, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %136 = pto.vcvt %result_20, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %137 = pto.vcvt %result_21, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %138 = pto.vcvt %result_22, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %139 = pto.vcvt %result_23, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %140 = pto.vcvt %result_24, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %141 = pto.vcvt %result_25, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %142 = pto.vcvt %result_26, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %143 = pto.vcvt %result_27, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %144 = pto.vcvt %result_28, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %145 = pto.vcvt %result_29, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %146 = pto.vcvt %result_30, %82 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %83, %115 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_31, %high_32 = pto.vintlv %84, %116 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_33, %high_34 = pto.vintlv %85, %117 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_35, %high_36 = pto.vintlv %86, %118 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_37, %high_38 = pto.vintlv %87, %119 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_39, %high_40 = pto.vintlv %88, %120 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_41, %high_42 = pto.vintlv %89, %121 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_43, %high_44 = pto.vintlv %90, %122 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_45, %high_46 = pto.vintlv %91, %123 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_47, %high_48 = pto.vintlv %92, %124 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_49, %high_50 = pto.vintlv %93, %125 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_51, %high_52 = pto.vintlv %94, %126 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_53, %high_54 = pto.vintlv %95, %127 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_55, %high_56 = pto.vintlv %96, %128 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_57, %high_58 = pto.vintlv %97, %129 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_59, %high_60 = pto.vintlv %98, %130 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_61, %high_62 = pto.vintlv %99, %131 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_63, %high_64 = pto.vintlv %100, %132 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_65, %high_66 = pto.vintlv %101, %133 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_67, %high_68 = pto.vintlv %102, %134 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_69, %high_70 = pto.vintlv %103, %135 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_71, %high_72 = pto.vintlv %104, %136 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_73, %high_74 = pto.vintlv %105, %137 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_75, %high_76 = pto.vintlv %106, %138 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_77, %high_78 = pto.vintlv %107, %139 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_79, %high_80 = pto.vintlv %108, %140 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_81, %high_82 = pto.vintlv %109, %141 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_83, %high_84 = pto.vintlv %110, %142 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_85, %high_86 = pto.vintlv %111, %143 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_87, %high_88 = pto.vintlv %112, %144 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_89, %high_90 = pto.vintlv %113, %145 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_91, %high_92 = pto.vintlv %114, %146 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_93, %high_94 = pto.pintlv_b32 %81, %81 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %9[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %9[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_31, %9[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_32, %9[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_33, %9[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_34, %9[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_35, %9[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_36, %9[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_37, %9[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_38, %9[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_39, %9[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_40, %9[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_41, %9[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_42, %9[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_43, %9[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_44, %9[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_45, %9[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_46, %9[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_47, %9[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_48, %9[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_49, %9[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_50, %9[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_51, %9[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_52, %9[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_53, %9[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_54, %9[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_55, %9[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_56, %9[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_57, %9[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_58, %9[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_59, %9[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_60, %9[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_61, %9[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_62, %9[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_63, %9[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_64, %9[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_65, %9[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_66, %9[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_67, %9[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_68, %9[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_69, %9[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_70, %9[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_71, %9[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_72, %9[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_73, %9[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_74, %9[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_75, %9[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_76, %9[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_77, %9[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_78, %9[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_79, %9[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_80, %9[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_81, %9[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_82, %9[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_83, %9[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_84, %9[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_85, %9[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_86, %9[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_87, %9[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_88, %9[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_89, %9[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_90, %9[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_91, %9[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_92, %9[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %39 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %82 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %9[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = pto.vmuls %result, %28, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %9[%82], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %40 = arith.muli %arg9, %c16 : index
        %41 = arith.addi %40, %2 : index
        %42 = pto.load_scalar %arg3[%41] : !pto.ptr<f32, gm> -> f32
        %43 = arith.addi %40, %10 : index
        %44 = pto.load_scalar %arg3[%43] : !pto.ptr<f32, gm> -> f32
        %45 = arith.addi %40, %11 : index
        %46 = pto.load_scalar %arg3[%45] : !pto.ptr<f32, gm> -> f32
        %47 = arith.addi %40, %12 : index
        %48 = pto.load_scalar %arg3[%47] : !pto.ptr<f32, gm> -> f32
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %49 = arith.muli %arg9, %c16384 : index
        %50 = pto.addptr %arg4, %49 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %50, %13, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %51 = arith.addi %49, %c4096 : index
        %52 = pto.addptr %arg4, %51 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %52, %14, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %53 = arith.addi %49, %c8192 : index
        %54 = pto.addptr %arg4, %53 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %54, %15, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        %55 = arith.addi %49, %c12288 : index
        %56 = pto.addptr %arg4, %55 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %56, %16, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %13[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %42, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %9[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %13[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %14[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %44, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %13[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %14[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %15[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %46, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %14[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %15[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %82 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %16[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = pto.vmuls %result, %48, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %16[%82], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %57 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %81 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %15[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %16[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vadd %result, %result_0, %81 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %84, %9[%83], %82 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        pto.barrier <PIPE_MTE3>
        %58 = arith.addi %49, %17 : index
        %59 = pto.addptr %arg0, %58 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %9, %59, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %result = pto.vlds %7[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_0 = pto.vlds %7[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_1 = pto.vlds %7[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_2 = pto.vlds %7[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_3 = pto.vlds %7[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_4 = pto.vlds %7[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %7[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_6 = pto.vlds %7[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_7 = pto.vlds %7[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_8 = pto.vlds %7[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_9 = pto.vlds %7[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_10 = pto.vlds %7[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_11 = pto.vlds %7[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_12 = pto.vlds %7[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_13 = pto.vlds %7[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_14 = pto.vlds %7[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_15 = pto.vlds %7[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_16 = pto.vlds %7[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_17 = pto.vlds %7[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_18 = pto.vlds %7[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_19 = pto.vlds %7[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_20 = pto.vlds %7[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_21 = pto.vlds %7[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_22 = pto.vlds %7[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_23 = pto.vlds %7[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_24 = pto.vlds %7[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_25 = pto.vlds %7[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_26 = pto.vlds %7[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_27 = pto.vlds %7[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_28 = pto.vlds %7[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_29 = pto.vlds %7[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_30 = pto.vlds %7[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %81 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %82 = pto.vcvt %result, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %83 = pto.vcvt %result_0, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %84 = pto.vcvt %result_1, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %85 = pto.vcvt %result_2, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %86 = pto.vcvt %result_3, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %87 = pto.vcvt %result_4, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %88 = pto.vcvt %result_5, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %89 = pto.vcvt %result_6, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %90 = pto.vcvt %result_7, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %91 = pto.vcvt %result_8, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %92 = pto.vcvt %result_9, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %93 = pto.vcvt %result_10, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %94 = pto.vcvt %result_11, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %95 = pto.vcvt %result_12, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %96 = pto.vcvt %result_13, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %97 = pto.vcvt %result_14, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %98 = pto.vcvt %result_15, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %99 = pto.vcvt %result_16, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %100 = pto.vcvt %result_17, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %101 = pto.vcvt %result_18, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %102 = pto.vcvt %result_19, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %103 = pto.vcvt %result_20, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %104 = pto.vcvt %result_21, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %105 = pto.vcvt %result_22, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %106 = pto.vcvt %result_23, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %107 = pto.vcvt %result_24, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %108 = pto.vcvt %result_25, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %109 = pto.vcvt %result_26, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %110 = pto.vcvt %result_27, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %111 = pto.vcvt %result_28, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %112 = pto.vcvt %result_29, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %113 = pto.vcvt %result_30, %81 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %114 = pto.vcvt %result, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %115 = pto.vcvt %result_0, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %116 = pto.vcvt %result_1, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %117 = pto.vcvt %result_2, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %118 = pto.vcvt %result_3, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %119 = pto.vcvt %result_4, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %120 = pto.vcvt %result_5, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %121 = pto.vcvt %result_6, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %122 = pto.vcvt %result_7, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %123 = pto.vcvt %result_8, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %124 = pto.vcvt %result_9, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %125 = pto.vcvt %result_10, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %126 = pto.vcvt %result_11, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %127 = pto.vcvt %result_12, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %128 = pto.vcvt %result_13, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %129 = pto.vcvt %result_14, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %130 = pto.vcvt %result_15, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %131 = pto.vcvt %result_16, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %132 = pto.vcvt %result_17, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %133 = pto.vcvt %result_18, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %134 = pto.vcvt %result_19, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %135 = pto.vcvt %result_20, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %136 = pto.vcvt %result_21, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %137 = pto.vcvt %result_22, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %138 = pto.vcvt %result_23, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %139 = pto.vcvt %result_24, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %140 = pto.vcvt %result_25, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %141 = pto.vcvt %result_26, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %142 = pto.vcvt %result_27, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %143 = pto.vcvt %result_28, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %144 = pto.vcvt %result_29, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %145 = pto.vcvt %result_30, %81 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %82, %114 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_31, %high_32 = pto.vintlv %83, %115 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_33, %high_34 = pto.vintlv %84, %116 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_35, %high_36 = pto.vintlv %85, %117 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_37, %high_38 = pto.vintlv %86, %118 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_39, %high_40 = pto.vintlv %87, %119 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_41, %high_42 = pto.vintlv %88, %120 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_43, %high_44 = pto.vintlv %89, %121 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_45, %high_46 = pto.vintlv %90, %122 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_47, %high_48 = pto.vintlv %91, %123 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_49, %high_50 = pto.vintlv %92, %124 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_51, %high_52 = pto.vintlv %93, %125 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_53, %high_54 = pto.vintlv %94, %126 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_55, %high_56 = pto.vintlv %95, %127 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_57, %high_58 = pto.vintlv %96, %128 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_59, %high_60 = pto.vintlv %97, %129 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_61, %high_62 = pto.vintlv %98, %130 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_63, %high_64 = pto.vintlv %99, %131 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_65, %high_66 = pto.vintlv %100, %132 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_67, %high_68 = pto.vintlv %101, %133 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_69, %high_70 = pto.vintlv %102, %134 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_71, %high_72 = pto.vintlv %103, %135 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_73, %high_74 = pto.vintlv %104, %136 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_75, %high_76 = pto.vintlv %105, %137 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_77, %high_78 = pto.vintlv %106, %138 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_79, %high_80 = pto.vintlv %107, %139 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_81, %high_82 = pto.vintlv %108, %140 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_83, %high_84 = pto.vintlv %109, %141 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_85, %high_86 = pto.vintlv %110, %142 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_87, %high_88 = pto.vintlv %111, %143 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_89, %high_90 = pto.vintlv %112, %144 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_91, %high_92 = pto.vintlv %113, %145 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %146 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_93, %high_94 = pto.pintlv_b32 %146, %146 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %18[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %18[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_31, %18[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_32, %18[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_33, %18[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_34, %18[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_35, %18[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_36, %18[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_37, %18[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_38, %18[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_39, %18[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_40, %18[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_41, %18[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_42, %18[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_43, %18[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_44, %18[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_45, %18[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_46, %18[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_47, %18[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_48, %18[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_49, %18[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_50, %18[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_51, %18[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_52, %18[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_53, %18[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_54, %18[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_55, %18[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_56, %18[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_57, %18[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_58, %18[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_59, %18[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_60, %18[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_61, %18[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_62, %18[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_63, %18[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_64, %18[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_65, %18[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_66, %18[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_67, %18[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_68, %18[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_69, %18[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_70, %18[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_71, %18[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_72, %18[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_73, %18[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_74, %18[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_75, %18[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_76, %18[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_77, %18[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_78, %18[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_79, %18[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_80, %18[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_81, %18[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_82, %18[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_83, %18[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_84, %18[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_85, %18[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_86, %18[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_87, %18[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_88, %18[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_89, %18[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_90, %18[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_91, %18[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_92, %18[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %60 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %82 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %18[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = pto.vmuls %result, %32, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %18[%82], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %61 = arith.muli %29, %c16 : index
        %62 = arith.addi %61, %2 : index
        %63 = pto.load_scalar %arg3[%62] : !pto.ptr<f32, gm> -> f32
        %64 = arith.addi %61, %10 : index
        %65 = pto.load_scalar %arg3[%64] : !pto.ptr<f32, gm> -> f32
        %66 = arith.addi %61, %11 : index
        %67 = pto.load_scalar %arg3[%66] : !pto.ptr<f32, gm> -> f32
        %68 = arith.addi %61, %12 : index
        %69 = pto.load_scalar %arg3[%68] : !pto.ptr<f32, gm> -> f32
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %70 = arith.muli %29, %c16384 : index
        %71 = pto.addptr %arg4, %70 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %71, %19, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        %72 = arith.addi %70, %c4096 : index
        %73 = pto.addptr %arg4, %72 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %73, %20, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
        %74 = arith.addi %70, %c8192 : index
        %75 = pto.addptr %arg4, %74 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %75, %21, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
        %76 = arith.addi %70, %c12288 : index
        %77 = pto.addptr %arg4, %76 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %77, %22, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %19[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %63, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %18[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %19[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %20[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %65, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %19[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %20[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID7>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %21[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmuls %result, %67, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %20[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_0, %84, %82 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %21[%83], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %81 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %82 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %22[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = pto.vmuls %result, %69, %81 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %83, %22[%82], %81 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %78 = pto.alloc_tile addr = %c49152_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %81 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %82 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %83 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %21[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %22[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vadd %result, %result_0, %81 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %84, %18[%83], %82 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        pto.barrier <PIPE_MTE3>
        %79 = arith.addi %70, %17 : index
        %80 = pto.addptr %arg0, %79 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %18, %80, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      %23 = arith.subi %3, %4 : index
      %24 = arith.addi %23, %c4 : index
      %25 = arith.cmpi eq, %24, %c1 : index
      scf.if %25 {
        %26 = arith.muli %4, %c4 : index
        %27 = arith.addi %26, %2 : index
        %28 = pto.load_scalar %arg1[%27] : !pto.ptr<f32, gm> -> f32
        %29 = arith.muli %4, %c4096 : index
        %30 = pto.addptr %arg2, %29 : <bf16, gm> -> <bf16, gm>
        %31 = pto.addptr %30, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %31, %6, %c0_i64, %c1_i64, %c8192_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c8192_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %5[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_0 = pto.vlds %5[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_1 = pto.vlds %5[%c256] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_2 = pto.vlds %5[%c384] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_3 = pto.vlds %5[%c512] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_4 = pto.vlds %5[%c640] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %5[%c768] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_6 = pto.vlds %5[%c896] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_7 = pto.vlds %5[%c1024] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_8 = pto.vlds %5[%c1152] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_9 = pto.vlds %5[%c1280] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_10 = pto.vlds %5[%c1408] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_11 = pto.vlds %5[%c1536] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_12 = pto.vlds %5[%c1664] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_13 = pto.vlds %5[%c1792] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_14 = pto.vlds %5[%c1920] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_15 = pto.vlds %5[%c2048] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_16 = pto.vlds %5[%c2176] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_17 = pto.vlds %5[%c2304] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_18 = pto.vlds %5[%c2432] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_19 = pto.vlds %5[%c2560] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_20 = pto.vlds %5[%c2688] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_21 = pto.vlds %5[%c2816] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_22 = pto.vlds %5[%c2944] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_23 = pto.vlds %5[%c3072] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_24 = pto.vlds %5[%c3200] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_25 = pto.vlds %5[%c3328] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_26 = pto.vlds %5[%c3456] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_27 = pto.vlds %5[%c3584] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_28 = pto.vlds %5[%c3712] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_29 = pto.vlds %5[%c3840] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_30 = pto.vlds %5[%c3968] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %55 = pto.vcvt %result, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %56 = pto.vcvt %result_0, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %57 = pto.vcvt %result_1, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %58 = pto.vcvt %result_2, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %59 = pto.vcvt %result_3, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %60 = pto.vcvt %result_4, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %61 = pto.vcvt %result_5, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %62 = pto.vcvt %result_6, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %63 = pto.vcvt %result_7, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %64 = pto.vcvt %result_8, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %65 = pto.vcvt %result_9, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %66 = pto.vcvt %result_10, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %67 = pto.vcvt %result_11, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %68 = pto.vcvt %result_12, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %69 = pto.vcvt %result_13, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %70 = pto.vcvt %result_14, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %71 = pto.vcvt %result_15, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %72 = pto.vcvt %result_16, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %73 = pto.vcvt %result_17, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %74 = pto.vcvt %result_18, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %75 = pto.vcvt %result_19, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %76 = pto.vcvt %result_20, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %77 = pto.vcvt %result_21, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %78 = pto.vcvt %result_22, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %79 = pto.vcvt %result_23, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %80 = pto.vcvt %result_24, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %81 = pto.vcvt %result_25, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %82 = pto.vcvt %result_26, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %83 = pto.vcvt %result_27, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %84 = pto.vcvt %result_28, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %85 = pto.vcvt %result_29, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %86 = pto.vcvt %result_30, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %87 = pto.vcvt %result, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %88 = pto.vcvt %result_0, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %89 = pto.vcvt %result_1, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %90 = pto.vcvt %result_2, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %91 = pto.vcvt %result_3, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %92 = pto.vcvt %result_4, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %93 = pto.vcvt %result_5, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %94 = pto.vcvt %result_6, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %95 = pto.vcvt %result_7, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %96 = pto.vcvt %result_8, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %97 = pto.vcvt %result_9, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %98 = pto.vcvt %result_10, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %99 = pto.vcvt %result_11, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %100 = pto.vcvt %result_12, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %101 = pto.vcvt %result_13, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %102 = pto.vcvt %result_14, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %103 = pto.vcvt %result_15, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %104 = pto.vcvt %result_16, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %105 = pto.vcvt %result_17, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %106 = pto.vcvt %result_18, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %107 = pto.vcvt %result_19, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %108 = pto.vcvt %result_20, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %109 = pto.vcvt %result_21, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %110 = pto.vcvt %result_22, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %111 = pto.vcvt %result_23, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %112 = pto.vcvt %result_24, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %113 = pto.vcvt %result_25, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %114 = pto.vcvt %result_26, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %115 = pto.vcvt %result_27, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %116 = pto.vcvt %result_28, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %117 = pto.vcvt %result_29, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %118 = pto.vcvt %result_30, %54 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %55, %87 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_31, %high_32 = pto.vintlv %56, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_33, %high_34 = pto.vintlv %57, %89 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_35, %high_36 = pto.vintlv %58, %90 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_37, %high_38 = pto.vintlv %59, %91 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_39, %high_40 = pto.vintlv %60, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_41, %high_42 = pto.vintlv %61, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_43, %high_44 = pto.vintlv %62, %94 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_45, %high_46 = pto.vintlv %63, %95 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_47, %high_48 = pto.vintlv %64, %96 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_49, %high_50 = pto.vintlv %65, %97 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_51, %high_52 = pto.vintlv %66, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_53, %high_54 = pto.vintlv %67, %99 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_55, %high_56 = pto.vintlv %68, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_57, %high_58 = pto.vintlv %69, %101 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_59, %high_60 = pto.vintlv %70, %102 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_61, %high_62 = pto.vintlv %71, %103 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_63, %high_64 = pto.vintlv %72, %104 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_65, %high_66 = pto.vintlv %73, %105 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_67, %high_68 = pto.vintlv %74, %106 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_69, %high_70 = pto.vintlv %75, %107 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_71, %high_72 = pto.vintlv %76, %108 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_73, %high_74 = pto.vintlv %77, %109 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_75, %high_76 = pto.vintlv %78, %110 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_77, %high_78 = pto.vintlv %79, %111 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_79, %high_80 = pto.vintlv %80, %112 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_81, %high_82 = pto.vintlv %81, %113 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_83, %high_84 = pto.vintlv %82, %114 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_85, %high_86 = pto.vintlv %83, %115 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_87, %high_88 = pto.vintlv %84, %116 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_89, %high_90 = pto.vintlv %85, %117 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_91, %high_92 = pto.vintlv %86, %118 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_93, %high_94 = pto.pintlv_b32 %53, %53 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %9[%c0], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %9[%c64], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_31, %9[%c128], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_32, %9[%c192], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_33, %9[%c256], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_34, %9[%c320], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_35, %9[%c384], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_36, %9[%c448], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_37, %9[%c512], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_38, %9[%c576], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_39, %9[%c640], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_40, %9[%c704], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_41, %9[%c768], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_42, %9[%c832], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_43, %9[%c896], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_44, %9[%c960], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_45, %9[%c1024], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_46, %9[%c1088], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_47, %9[%c1152], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_48, %9[%c1216], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_49, %9[%c1280], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_50, %9[%c1344], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_51, %9[%c1408], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_52, %9[%c1472], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_53, %9[%c1536], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_54, %9[%c1600], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_55, %9[%c1664], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_56, %9[%c1728], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_57, %9[%c1792], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_58, %9[%c1856], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_59, %9[%c1920], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_60, %9[%c1984], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_61, %9[%c2048], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_62, %9[%c2112], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_63, %9[%c2176], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_64, %9[%c2240], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_65, %9[%c2304], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_66, %9[%c2368], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_67, %9[%c2432], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_68, %9[%c2496], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_69, %9[%c2560], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_70, %9[%c2624], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_71, %9[%c2688], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_72, %9[%c2752], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_73, %9[%c2816], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_74, %9[%c2880], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_75, %9[%c2944], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_76, %9[%c3008], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_77, %9[%c3072], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_78, %9[%c3136], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_79, %9[%c3200], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_80, %9[%c3264], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_81, %9[%c3328], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_82, %9[%c3392], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_83, %9[%c3456], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_84, %9[%c3520], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_85, %9[%c3584], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_86, %9[%c3648], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_87, %9[%c3712], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_88, %9[%c3776], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_89, %9[%c3840], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_90, %9[%c3904], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_91, %9[%c3968], %low_93 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_92, %9[%c4032], %high_94 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %32 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %9[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmuls %result, %28, %53 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %9[%54], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %33 = arith.muli %4, %c16 : index
        %34 = arith.addi %33, %2 : index
        %35 = pto.load_scalar %arg3[%34] : !pto.ptr<f32, gm> -> f32
        %36 = arith.addi %33, %10 : index
        %37 = pto.load_scalar %arg3[%36] : !pto.ptr<f32, gm> -> f32
        %38 = arith.addi %33, %11 : index
        %39 = pto.load_scalar %arg3[%38] : !pto.ptr<f32, gm> -> f32
        %40 = arith.addi %33, %12 : index
        %41 = pto.load_scalar %arg3[%40] : !pto.ptr<f32, gm> -> f32
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %42 = arith.muli %4, %c16384 : index
        %43 = pto.addptr %arg4, %42 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %43, %13, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %44 = arith.addi %42, %c4096 : index
        %45 = pto.addptr %arg4, %44 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %45, %14, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %46 = arith.addi %42, %c8192 : index
        %47 = pto.addptr %arg4, %46 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %47, %15, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %48 = arith.addi %42, %c12288 : index
        %49 = pto.addptr %arg4, %48 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %49, %16, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %13[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmuls %result, %35, %53 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %9[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_0, %56, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %57, %13[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %14[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmuls %result, %37, %53 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %13[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_0, %56, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %57, %14[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %15[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmuls %result, %39, %53 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %14[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_0, %56, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %57, %15[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %53 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %16[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmuls %result, %41, %53 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %16[%54], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        }
        %50 = pto.alloc_tile addr = %c131072_i64 valid_row = %c1 valid_col = %c4096 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x4096xf32, valid=?x?>
        pto.vecscope {
          %53 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c4096_i16 step %c64_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %result = pto.vlds %15[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %16[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result, %result_0, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %9[%55], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        pto.barrier <PIPE_MTE3>
        %51 = arith.addi %42, %17 : index
        %52 = pto.addptr %arg0, %51 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %9, %52, %c0_i64, %c1_i64, %c16384_i64, %c0_i64, %c0_i64, %c16384_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
