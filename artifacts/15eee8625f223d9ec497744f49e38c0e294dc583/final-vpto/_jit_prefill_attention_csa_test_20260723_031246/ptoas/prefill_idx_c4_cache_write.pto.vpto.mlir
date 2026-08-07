module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c8160 = arith.constant 8160 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i32 = arith.constant 128 : i32
      %c255_i16 = arith.constant 255 : i16
      %c2048 = arith.constant 2048 : index
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c512_i64 = arith.constant 512 : i64
      %c16_i32 = arith.constant 16 : i32
      %c64 = arith.constant 64 : index
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
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c16 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %2 = arith.muli %0, %c2048 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %7 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %11 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %59 = arith.index_cast %arg6 : i16 to index
          %60 = arith.muli %59, %c128 : index
          %result_38 = pto.vlds %4[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %61 = arith.addi %60, %c64 : index
          %result_39 = pto.vlds %4[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %62 = pto.vcvt %result_38, %13 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %63 = pto.vcvt %result_39, %13 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %62, %11[%60], %12 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %63, %11[%61], %12 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          %64 = pto.vcvt %62, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %65 = pto.vcvt %63, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          pto.vsts %64, %4[%60], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %4[%61], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %59 = arith.index_cast %arg6 : i16 to index
          %60 = arith.muli %59, %c128 : index
          %result_38 = pto.vlds %4[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %61 = arith.addi %60, %c64 : index
          %result_39 = pto.vlds %4[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %62 = pto.vabs %result_38, %13 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vabs %result_39, %13 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %62, %7[%60], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %63, %7[%61], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tabs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %15 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
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
        %16 = pto.vmax %result, %result_2, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vcmax %16, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.vmax %result_3, %result_4, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vcmax %18, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vmax %result_5, %result_6, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vcmax %20, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vmax %result_7, %result_8, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.vcmax %22, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vmax %result_9, %result_10, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vcmax %24, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vmax %result_11, %result_12, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.vcmax %26, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.vmax %result_13, %result_14, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vcmax %28, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %30 = pto.vmax %result_15, %result_16, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.vcmax %30, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.vmax %result_17, %result_18, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %33 = pto.vcmax %32, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %34 = pto.vmax %result_19, %result_20, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vcmax %34, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vmax %result_21, %result_22, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vcmax %36, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.vmax %result_23, %result_24, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.vcmax %38, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %40 = pto.vmax %result_25, %result_26, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %41 = pto.vcmax %40, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.vmax %result_27, %result_28, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %43 = pto.vcmax %42, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.vmax %result_29, %result_30, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.vcmax %44, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %46 = pto.vmax %result_31, %result_32, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.vcmax %46, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %48 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        pto.vsts %17, %15[%c0], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %19, %15[%c1], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %21, %15[%c2], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %23, %15[%c3], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %25, %15[%c4], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %27, %15[%c5], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %29, %15[%c6], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %31, %15[%c7], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %33, %15[%c8], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %35, %15[%c9], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %37, %15[%c10], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %39, %15[%c11], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %41, %15[%c12], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %43, %15[%c13], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %45, %15[%c14], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %47, %15[%c15], %48 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %51 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
        %result_33 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_34 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %52 = pto.vmax %result_33, %result_34, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %52, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %53 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
        %54 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %55 = pto.addptr %53, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_35 = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_36 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %56 = pto.vdiv %result_35, %result_36, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %56, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_37 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %57 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %58 = pto.vdiv %57, %result_37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %58, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c16384_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        %11 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %13 = arith.index_cast %arg6 : i16 to index
          %result = pto.vlds %7[%13] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %14 = pto.vdup %result, %11 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %15 = arith.muli %13, %c128 : index
          %result_2 = pto.vlds %4[%15] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %16 = arith.addi %15, %c64 : index
          %result_3 = pto.vlds %4[%16] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = pto.vmul %result_2, %14, %11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %18 = pto.vmul %result_3, %14, %11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %17, %4[%15], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %18, %4[%16], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %11 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %13 = arith.index_cast %arg6 : i16 to index
          %14 = arith.muli %13, %c128 : index
          %result = pto.vlds %4[%14] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %15 = arith.addi %14, %c64 : index
          %result_2 = pto.vlds %4[%15] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %16 = pto.vcvt %result, %11 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %17 = pto.vcvt %result_2, %11 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %16, %9[%14], %12 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %17, %9[%15], %12 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf16, valid=?x?>
      pto.vecscope {
        %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
        %12 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          %result = pto.vlds %9[%18] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %19 = arith.addi %18, %c64 : index
          %result_2 = pto.vlds %9[%19] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %20 = pto.vcvt %result, %12 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = pto.vcvt %result_2, %12 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %22 = pto.vcvt %20, %12 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          %23 = pto.vcvt %21, %12 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
          pto.vsts %22, %11[%18], %13 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          pto.vsts %23, %11[%19], %13 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %14 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %15 = pto.vdup %c255_i16, %14 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          %19 = pto.addptr %11, %18 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %19[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %20 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %21 = pto.vand %20, %15, %mask : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %22 = pto.vcvt %21, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %23 = pto.vcvt %22, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %24 = pto.addptr %16, %18 : <i8, ub> -> <i8, ub>
          pto.vsts %23, %24[%c0], %mask {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %11 = arith.addi %1, %arg6 : index
        %12 = pto.load_scalar %arg2[%11] : !pto.ptr<i32, gm> -> i32
        %13 = arith.index_cast %12 : i32 to index
        %14 = arith.cmpi sge, %13, %c0 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        scf.if %14 {
          %15 = arith.index_cast %arg6 : index to i64
          %16 = arith.muli %15, %c128_i64 : i64
          pto.barrier <PIPE_MTE3>
          %17 = pto.castptr %16 : i64 -> !pto.ptr<i8, ub>
          %18 = arith.muli %13, %c128 : index
          %19 = pto.addptr %arg1, %18 : <i8, gm> -> <i8, gm>
          %20 = pto.addptr %17, %c0 : <i8, ub> -> <i8, ub>
          %21 = pto.addptr %19, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %20, %21, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %22 = pto.tgetval ins(%8, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          pto.store_scalar %22, %arg3[%13] : !pto.ptr<f32, gm>, f32
        } else {
          %15 = arith.addi %11, %c8160 : index
          %16 = arith.muli %15, %c128 : index
          %17 = pto.addptr %arg1, %16 : <i8, gm> -> <i8, gm>
          %18 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i8, ub>
          %19 = pto.addptr %17, %c0 : <i8, gm> -> <i8, gm>
          %20 = pto.addptr %18, %c0 : <i8, ub> -> <i8, ub>
          pto.copy_gm_to_ubuf %19, %20, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, gm>, !pto.ptr<i8, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          pto.copy_ubuf_to_gm %20, %19, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %21 = pto.load_scalar %arg3[%15] : !pto.ptr<f32, gm> -> f32
          pto.store_scalar %21, %arg3[%15] : !pto.ptr<f32, gm>, f32
        }
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
