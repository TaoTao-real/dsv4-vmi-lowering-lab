module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_and_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i64, gm>, %arg5: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c8256_i64 = arith.constant 8256 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c3 = arith.constant 3 : index
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c128_i32 = arith.constant 128 : i32
      %c255_i16 = arith.constant 255 : i16
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c16_i32 = arith.constant 16 : i32
      %c256 = arith.constant 256 : index
      %c64 = arith.constant 64 : index
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
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %0 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %3 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %8 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<bf16, ub>
        %9 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %10 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %11 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %55 = arith.index_cast %arg6 : i16 to index
          %56 = arith.muli %55, %c128 : index
          %result_38 = pto.vlds %0[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = arith.addi %56, %c64 : index
          %result_39 = pto.vlds %0[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vcvt %result_38, %10 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %59 = pto.vcvt %result_39, %10 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %58, %8[%56], %9 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %59, %8[%57], %9 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          %60 = pto.vcvt %58, %11 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %61 = pto.vcvt %59, %11 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          pto.vsts %60, %0[%56], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %0[%57], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %55 = arith.index_cast %arg6 : i16 to index
          %56 = arith.muli %55, %c128 : index
          %result_38 = pto.vlds %0[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = arith.addi %56, %c64 : index
          %result_39 = pto.vlds %0[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vabs %result_38, %10 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vabs %result_39, %10 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %58, %3[%56], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %59, %3[%57], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tabs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
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
        %13 = pto.vmax %result, %result_2, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %14 = pto.vcmax %13, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.vmax %result_3, %result_4, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vcmax %15, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vmax %result_5, %result_6, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.vcmax %17, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vmax %result_7, %result_8, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vcmax %19, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vmax %result_9, %result_10, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vcmax %21, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.vmax %result_11, %result_12, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vcmax %23, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vmax %result_13, %result_14, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vcmax %25, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.vmax %result_15, %result_16, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.vcmax %27, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vmax %result_17, %result_18, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.vcmax %29, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.vmax %result_19, %result_20, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.vcmax %31, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %33 = pto.vmax %result_21, %result_22, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.vcmax %33, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vmax %result_23, %result_24, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vcmax %35, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vmax %result_25, %result_26, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.vcmax %37, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vmax %result_27, %result_28, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vcmax %39, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vmax %result_29, %result_30, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.vcmax %41, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %43 = pto.vmax %result_31, %result_32, %9 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.vcmax %43, %9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        pto.vsts %14, %12[%c0], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %16, %12[%c1], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %18, %12[%c2], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %20, %12[%c3], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %22, %12[%c4], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %24, %12[%c5], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %26, %12[%c6], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %28, %12[%c7], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %30, %12[%c8], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %32, %12[%c9], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %34, %12[%c10], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %36, %12[%c11], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %38, %12[%c12], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %40, %12[%c13], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %42, %12[%c14], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %44, %12[%c15], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %46 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %46, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %47 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
        %result_33 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_34 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.vmax %result_33, %result_34, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %48, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %49 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %50 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %51 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_35 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_36 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %52 = pto.vdiv %result_35, %result_36, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %52, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_37 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %53 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %54 = pto.vdiv %53, %result_37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %54, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        %8 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %9 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %10 = arith.index_cast %arg6 : i16 to index
          %result = pto.vlds %3[%10] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %11 = pto.vdup %result, %8 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %12 = arith.muli %10, %c128 : index
          %result_2 = pto.vlds %0[%12] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %13 = arith.addi %12, %c64 : index
          %result_3 = pto.vlds %0[%13] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %14 = pto.vmul %result_2, %11, %8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %15 = pto.vmul %result_3, %11, %8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %14, %0[%12], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %15, %0[%13], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %6 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %8 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %9 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %10 = arith.index_cast %arg6 : i16 to index
          %11 = arith.muli %10, %c128 : index
          %result = pto.vlds %0[%11] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %12 = arith.addi %11, %c64 : index
          %result_2 = pto.vlds %0[%12] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %13 = pto.vcvt %result, %8 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %14 = pto.vcvt %result_2, %8 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %13, %6[%11], %9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %14, %6[%12], %9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %7 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf16, valid=?x?>
      pto.vecscope {
        %8 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f16, ub>
        %9 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %10 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %14 = arith.index_cast %arg6 : i16 to index
          %15 = arith.muli %14, %c128 : index
          %result = pto.vlds %6[%15] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %16 = arith.addi %15, %c64 : index
          %result_2 = pto.vlds %6[%16] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %17 = pto.vcvt %result, %9 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %18 = pto.vcvt %result_2, %9 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %19 = pto.vcvt %17, %9 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %20 = pto.vcvt %18, %9 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          pto.vsts %19, %8[%15], %10 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %20, %8[%16], %10 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %11 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %12 = pto.vdup %c255_i16, %11 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %13 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %14 = arith.index_cast %arg6 : i16 to index
          %15 = arith.muli %14, %c128 : index
          %16 = pto.addptr %8, %15 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %16[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %17 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %18 = pto.vand %17, %12, %mask : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %19 = pto.vcvt %18, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %20 = pto.vcvt %19, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %21 = pto.addptr %13, %15 : <i8, ub> -> <i8, ub>
          pto.vsts %20, %21[%c0], %mask {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %8 = arith.muli %arg6, %c2 : index
        %9 = pto.load_scalar %arg3[%8] : !pto.ptr<i32, gm> -> i32
        %10 = arith.index_cast %9 : i32 to index
        %11 = arith.remsi %10, %c4 : index
        %12 = arith.cmpi sge, %11, %c2 : index
        scf.if %12 {
          %13 = arith.subi %c3, %11 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          %14 = arith.muli %arg6, %c128 : index
          %15 = pto.addptr %arg0, %14 : <f32, gm> -> <f32, gm>
          %16 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %16, %4, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          %17 = arith.addi %8, %13 : index
          %18 = pto.load_scalar %arg4[%17] : !pto.ptr<i64, gm> -> i64
          %19 = arith.index_cast %18 : i64 to index
          %20 = arith.cmpi sge, %19, %c0 : index
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          scf.if %20 {
            %21 = arith.muli %arg6, %c256 : index
            %22 = pto.addptr %arg2, %21 : <f32, gm> -> <f32, gm>
            %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %4, %23, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %24 = arith.index_cast %arg6 : index to i64
            %25 = arith.muli %24, %c128_i64 : i64
            %26 = arith.addi %25, %c8256_i64 : i64
            pto.barrier <PIPE_MTE3>
            %27 = pto.castptr %26 : i64 -> !pto.ptr<i8, ub>
            %28 = arith.muli %19, %c128 : index
            %29 = pto.addptr %arg1, %28 : <i8, gm> -> <i8, gm>
            %30 = pto.addptr %27, %c0 : <i8, ub> -> <i8, ub>
            %31 = pto.addptr %29, %c0 : <i8, gm> -> <i8, gm>
            pto.copy_ubuf_to_gm %30, %31, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
            %32 = pto.tgetval ins(%5, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
            pto.store_scalar %32, %arg5[%19] : !pto.ptr<f32, gm>, f32
          }
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
