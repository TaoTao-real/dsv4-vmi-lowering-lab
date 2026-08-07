module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_rms_norm_quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<i8, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c256_i16 = arith.constant 256 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c33344_i64 = arith.constant 33344 : i64
      %c33376_i64 = arith.constant 33376 : i64
      %c33408_i64 = arith.constant 33408 : i64
      %c41600_i64 = arith.constant 41600 : i64
      %c42112_i64 = arith.constant 42112 : i64
      %c0_i64 = arith.constant 0 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8704_i64 = arith.constant 8704 : i64
      %c16896_i64 = arith.constant 16896 : i64
      %c16928_i64 = arith.constant 16928 : i64
      %c25120_i64 = arith.constant 25120 : i64
      %c33312_i64 = arith.constant 33312 : i64
      %c128 = arith.constant 128 : index
      %c1024 = arith.constant 1024 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %cst_0 = arith.constant 9.765625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 9.99999974E-5 : f32
      %cst_3 = arith.constant 1.270000e+02 : f32
      %c512 = arith.constant 512 : index
      %cst_4 = arith.constant 1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c2_i64 = arith.constant 2 : i64
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c128_i32 = arith.constant 128 : i32
      %c256_i32 = arith.constant 256 : i32
      %c255_i16 = arith.constant 255 : i16
      %c4096_i64 = arith.constant 4096 : i64
      %c8_i32 = arith.constant 8 : i32
      %c8192 = arith.constant 8192 : index
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
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
      %c3 = arith.constant 3 : index
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c8 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      %2 = pto.castptr %c33344_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      %4 = pto.castptr %c33376_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.vsts %32, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %6 = arith.muli %0, %c8192 : index
      %7 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %9 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f32, ub>
      %11 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c16896_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
      %16 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      %18 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.castptr %c33312_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg8 = %c0 to %c4 step %c2 {
        %32 = arith.muli %arg8, %c256 : index
        %33 = arith.addi %32, %c256 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %34 = arith.addi %6, %32 : index
        %35 = pto.addptr %arg0, %34 : <f32, gm> -> <f32, gm>
        %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %36, %8, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %37 = pto.addptr %arg1, %32 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %37, %9, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %38 = arith.addi %6, %33 : index
        %39 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
        %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %40, %11, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %41 = pto.addptr %arg1, %33 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %41, %12, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %79 = arith.index_cast %arg9 : i16 to index
            %80 = arith.muli %79, %c256 : index
            %result_38 = pto.vlds %7[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %81 = arith.addi %80, %c64 : index
            %result_39 = pto.vlds %7[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %82 = arith.addi %80, %c128 : index
            %result_40 = pto.vlds %7[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = arith.addi %80, %c192 : index
            %result_41 = pto.vlds %7[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmul %result_38, %result_38, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %85 = pto.vmul %result_39, %result_39, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %86 = pto.vmul %result_40, %result_40, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vmul %result_41, %result_41, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %84, %13[%80], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %85, %13[%81], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %86, %13[%82], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %87, %13[%83], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %13[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %13[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %13[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %13[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %13[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %13[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %13[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %13[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %13[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %13[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %13[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %13[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %13[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %13[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %13[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %13[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %13[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %13[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %13[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %13[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %13[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %13[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %13[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %13[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %13[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %13[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %13[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %13[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %13[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %13[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %13[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vadd %result, %result_5, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vadd %45, %result_6, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %46, %result_7, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %47, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %result_8, %result_9, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_10, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_11, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcadd %51, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result_12, %result_13, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vadd %53, %result_14, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %54, %result_15, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vcadd %55, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %result_16, %result_17, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_18, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_19, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vcadd %59, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vadd %result_20, %result_21, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vadd %61, %result_22, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %62, %result_23, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vcadd %63, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %result_24, %result_25, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_26, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_27, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vcadd %67, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vadd %result_28, %result_29, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vadd %69, %result_30, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %70, %result_31, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %71, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result_32, %result_33, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_34, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_35, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vcadd %75, %43 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %48, %14[%c0], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %14[%c1], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %56, %14[%c2], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %60, %14[%c3], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %64, %14[%c4], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %68, %14[%c5], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %72, %14[%c6], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %76, %14[%c7], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_36 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %78 = pto.vadd %result_36, %result_37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %78, %17[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %result = pto.vlds %9[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %9[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %43 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %44 = pto.vcvt %result, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %45 = pto.vcvt %result_5, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result, %43 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %47 = pto.vcvt %result_5, %43 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %44, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_6, %high_7 = pto.vintlv %45, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_8, %high_9 = pto.pintlv_b32 %48, %48 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %13[%c0], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %13[%c64], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_6, %13[%c128], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_7, %13[%c192], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %83 = arith.index_cast %arg9 : i16 to index
            %84 = arith.muli %83, %c256 : index
            %low_42, %high_43 = pto.vldsx2 %7[%84], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %85 = arith.addi %84, %c128 : index
            %low_44, %high_45 = pto.vldsx2 %7[%85], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %86 = pto.vmul %low_42, %44, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vmul %low_44, %45, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %88 = pto.vmul %high_43, %46, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %89 = pto.vmul %high_45, %47, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %90 = pto.vabs %86, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vabs %87, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vabs %88, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.vabs %89, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_46, %high_47 = pto.vintlv %90, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_48, %high_49 = pto.vintlv %91, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_46, %7[%84], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %94 = arith.addi %84, %c64 : index
            pto.vsts %high_47, %7[%94], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_48, %7[%85], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %95 = arith.addi %84, %c192 : index
            pto.vsts %high_49, %7[%95], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_10 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %7[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %7[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %7[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %7[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %7[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %7[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %7[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %7[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %7[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %7[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %7[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %7[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %7[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %7[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %7[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %7[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %7[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %7[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %7[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %7[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %7[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %7[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %7[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %7[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %7[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %7[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %7[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %7[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %7[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %7[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %7[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmax %result_10, %result_11, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmax %50, %result_12, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmax %51, %result_13, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcmax %52, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmax %result_14, %result_15, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vmax %54, %result_16, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmax %55, %result_17, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vcmax %56, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmax %result_18, %result_19, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vmax %58, %result_20, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vmax %59, %result_21, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vcmax %60, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vmax %result_22, %result_23, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vmax %62, %result_24, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vmax %63, %result_25, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vcmax %64, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vmax %result_26, %result_27, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vmax %66, %result_28, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vmax %67, %result_29, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vcmax %68, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vmax %result_30, %result_31, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vmax %70, %result_32, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vmax %71, %result_33, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vcmax %72, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %result_34, %result_35, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vmax %74, %result_36, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vmax %75, %result_37, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vcmax %76, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vmax %result_38, %result_39, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vmax %78, %result_40, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vmax %79, %result_41, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vcmax %80, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %53, %14[%c0], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %57, %14[%c1], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %14[%c2], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %14[%c3], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %14[%c4], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %73, %14[%c5], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %14[%c6], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %81, %14[%c7], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %42 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %43 = pto.vmax %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %79 = arith.index_cast %arg9 : i16 to index
            %80 = arith.muli %79, %c256 : index
            %result_38 = pto.vlds %10[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %81 = arith.addi %80, %c64 : index
            %result_39 = pto.vlds %10[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %82 = arith.addi %80, %c128 : index
            %result_40 = pto.vlds %10[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = arith.addi %80, %c192 : index
            %result_41 = pto.vlds %10[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = pto.vmul %result_38, %result_38, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %85 = pto.vmul %result_39, %result_39, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %86 = pto.vmul %result_40, %result_40, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vmul %result_41, %result_41, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %84, %18[%80], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %85, %18[%81], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %86, %18[%82], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %87, %18[%83], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %18[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %18[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %18[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %18[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %18[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %18[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %18[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %18[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %18[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %18[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %18[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %18[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %18[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %18[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %18[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %18[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %18[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %18[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %18[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %18[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %18[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %18[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %18[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %18[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %18[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %18[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %18[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %18[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %18[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %18[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %18[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vadd %result, %result_5, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vadd %45, %result_6, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vadd %46, %result_7, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %47, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vadd %result_8, %result_9, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vadd %49, %result_10, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vadd %50, %result_11, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcadd %51, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result_12, %result_13, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vadd %53, %result_14, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vadd %54, %result_15, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vcadd %55, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vadd %result_16, %result_17, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vadd %57, %result_18, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vadd %58, %result_19, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vcadd %59, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vadd %result_20, %result_21, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vadd %61, %result_22, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vadd %62, %result_23, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vcadd %63, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vadd %result_24, %result_25, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vadd %65, %result_26, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vadd %66, %result_27, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vcadd %67, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vadd %result_28, %result_29, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vadd %69, %result_30, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %70, %result_31, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %71, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result_32, %result_33, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vadd %73, %result_34, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vadd %74, %result_35, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vcadd %75, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %48, %19[%c0], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %19[%c1], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %56, %19[%c2], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %60, %19[%c3], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %64, %19[%c4], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %68, %19[%c5], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %72, %19[%c6], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %76, %19[%c7], %77 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_36 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %78 = pto.vadd %result_36, %result_37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %78, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %result = pto.vlds %12[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %12[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %43 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %44 = pto.vcvt %result, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %45 = pto.vcvt %result_5, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result, %43 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %47 = pto.vcvt %result_5, %43 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %44, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_6, %high_7 = pto.vintlv %45, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_8, %high_9 = pto.pintlv_b32 %48, %48 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %18[%c0], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %18[%c64], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_6, %18[%c128], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_7, %18[%c192], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %83 = arith.index_cast %arg9 : i16 to index
            %84 = arith.muli %83, %c256 : index
            %low_42, %high_43 = pto.vldsx2 %10[%84], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %85 = arith.addi %84, %c128 : index
            %low_44, %high_45 = pto.vldsx2 %10[%85], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %86 = pto.vmul %low_42, %44, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vmul %low_44, %45, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %88 = pto.vmul %high_43, %46, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %89 = pto.vmul %high_45, %47, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %90 = pto.vabs %86, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vabs %87, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vabs %88, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.vabs %89, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_46, %high_47 = pto.vintlv %90, %92 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_48, %high_49 = pto.vintlv %91, %93 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_46, %10[%84], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %94 = arith.addi %84, %c64 : index
            pto.vsts %high_47, %10[%94], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_48, %10[%85], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %95 = arith.addi %84, %c192 : index
            pto.vsts %high_49, %10[%95], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_10 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %10[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %10[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %10[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %10[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %10[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %10[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %10[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %10[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %10[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %10[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %10[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %10[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_23 = pto.vlds %10[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %10[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_25 = pto.vlds %10[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_26 = pto.vlds %10[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_27 = pto.vlds %10[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_28 = pto.vlds %10[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_29 = pto.vlds %10[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_30 = pto.vlds %10[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_31 = pto.vlds %10[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_32 = pto.vlds %10[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_33 = pto.vlds %10[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_34 = pto.vlds %10[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_35 = pto.vlds %10[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_36 = pto.vlds %10[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_37 = pto.vlds %10[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_38 = pto.vlds %10[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_39 = pto.vlds %10[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_40 = pto.vlds %10[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_41 = pto.vlds %10[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmax %result_10, %result_11, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmax %50, %result_12, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmax %51, %result_13, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcmax %52, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmax %result_14, %result_15, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vmax %54, %result_16, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmax %55, %result_17, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vcmax %56, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmax %result_18, %result_19, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vmax %58, %result_20, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vmax %59, %result_21, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vcmax %60, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vmax %result_22, %result_23, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vmax %62, %result_24, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vmax %63, %result_25, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vcmax %64, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %66 = pto.vmax %result_26, %result_27, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %67 = pto.vmax %66, %result_28, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %68 = pto.vmax %67, %result_29, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %69 = pto.vcmax %68, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vmax %result_30, %result_31, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vmax %70, %result_32, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %72 = pto.vmax %71, %result_33, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vcmax %72, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %result_34, %result_35, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.vmax %74, %result_36, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vmax %75, %result_37, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %77 = pto.vcmax %76, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %78 = pto.vmax %result_38, %result_39, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vmax %78, %result_40, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %80 = pto.vmax %79, %result_41, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %81 = pto.vcmax %80, %48 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %53, %19[%c0], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %57, %19[%c1], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %19[%c2], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %19[%c3], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %69, %19[%c4], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %73, %19[%c5], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %77, %19[%c6], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %81, %19[%c7], %82 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %43 = pto.vmax %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %21 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.vadds %result_5, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %33, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.vsqrt %result_6, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vmuls %34, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vadds %35, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vdiv %36, %34, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %39 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %39, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %40 = pto.vmul %result_7, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %40, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_9 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_10 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %41 = pto.vmax %result_9, %result_10, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %41, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %42 = pto.vdup %cst_3, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %42, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_11 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_12 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %43 = pto.vdiv %result_11, %result_12, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %44 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_13 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %45 = pto.vbr %cst_4 : f32 -> !pto.vreg<64xf32>
        %46 = pto.vdiv %45, %result_13, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %46, %8[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %23 = pto.addptr %arg2, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %23, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %24 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<bf16, ub>
      %25 = pto.castptr %c25120_i64 : i64 -> !pto.ptr<bf16, ub>
      %26 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i32, ub>
      %27 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i8, ub>
      %28 = pto.addptr %27, %c0 : <i8, ub> -> <i8, ub>
      %29 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i32, ub>
      %30 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i8, ub>
      %31 = pto.addptr %30, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg8 = %c0 to %c1024 step %c512 {
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        %32 = arith.addi %6, %arg8 : index
        %33 = pto.addptr %arg0, %32 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %8, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %35 = pto.addptr %arg1, %arg8 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %35, %24, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        %36 = arith.addi %arg8, %c256 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
        %37 = arith.addi %6, %36 : index
        %38 = pto.addptr %arg0, %37 : <f32, gm> -> <f32, gm>
        %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %39, %11, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %40 = pto.addptr %arg1, %36 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %40, %25, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
        pto.vecscope {
          %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %24[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %24[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %51 = pto.vcvt %result, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result_5, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result_5, %50 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %51, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_6, %high_7 = pto.vintlv %52, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_8, %high_9 = pto.pintlv_b32 %49, %49 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %13[%c0], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %13[%c64], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_6, %13[%c128], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_7, %13[%c192], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %result_10 = pto.vlds %21[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vdup %result_10, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = arith.muli %56, %c256 : index
            %low_11, %high_12 = pto.vldsx2 %7[%58], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %59 = arith.addi %58, %c128 : index
            %low_13, %high_14 = pto.vldsx2 %7[%59], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %60 = pto.vmul %low_11, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %low_13, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %high_12, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmul %high_14, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vmul %60, %51, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %65 = pto.vmul %61, %52, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vmul %62, %53, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %63, %54, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %22[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vdup %result_15, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %64, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vmul %65, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmul %66, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmul %67, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_16, %high_17 = pto.vintlv %69, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_18, %high_19 = pto.vintlv %70, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_16, %7[%58], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %73 = arith.addi %58, %c64 : index
            pto.vsts %high_17, %7[%73], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_18, %7[%59], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %74 = arith.addi %58, %c192 : index
            pto.vsts %high_19, %7[%74], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %57 = arith.muli %56, %c256 : index
            %low_10, %high_11 = pto.vldsx2 %7[%57], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %58 = arith.addi %57, %c128 : index
            %low_12, %high_13 = pto.vldsx2 %7[%58], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %59 = pto.vcvt %low_10, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %60 = pto.vcvt %low_12, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %61 = pto.vcvt %high_11, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %62 = pto.vcvt %high_13, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %low_14, %high_15 = pto.vintlv %59, %61 : !pto.vreg<64xi32>, !pto.vreg<64xi32> -> !pto.vreg<64xi32>, !pto.vreg<64xi32>
            %low_16, %high_17 = pto.vintlv %60, %62 : !pto.vreg<64xi32>, !pto.vreg<64xi32> -> !pto.vreg<64xi32>, !pto.vreg<64xi32>
            pto.vsts %low_14, %26[%57], %low_8 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            %63 = arith.addi %57, %c64 : index
            pto.vsts %high_15, %26[%63], %high_9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            pto.vsts %low_16, %26[%58], %low_8 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            %64 = arith.addi %57, %c192 : index
            pto.vsts %high_17, %26[%64], %high_9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %41 = pto.alloc_tile addr = %c33408_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf16, valid=?x?>
        pto.vecscope {
          %49 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f16, ub>
          %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result = pto.vlds %26[%55] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %56 = arith.addi %55, %c64 : index
            %result_7 = pto.vlds %26[%56] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %57 = arith.addi %55, %c128 : index
            %result_8 = pto.vlds %26[%57] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %58 = arith.addi %55, %c192 : index
            %result_9 = pto.vlds %26[%58] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %59 = pto.vcvt %result, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vcvt %result_7, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result_8, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vcvt %result_9, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vcvt %59, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %64 = pto.vcvt %60, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %65 = pto.vcvt %61, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %66 = pto.vcvt %62, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            pto.vsts %63, %49[%55], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %64, %49[%56], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %65, %49[%57], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %66, %49[%58], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %52 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_5, %scalar_out_6 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %53 = pto.vdup %c255_i16, %52 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %49, %57 : <f16, ub> -> <f16, ub>
              %result = pto.vlds %58[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %59 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %60 = pto.vand %59, %53, %mask_5 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %61 = pto.vcvt %60, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %62 = pto.vcvt %61, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %63 = pto.addptr %27, %57 : <i8, ub> -> <i8, ub>
              pto.vsts %62, %63[%c0], %mask_5 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
        pto.barrier <PIPE_MTE3>
        %42 = pto.addptr %arg4, %32 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %27, %42, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %43 = pto.addptr %arg3, %32 : <i8, gm> -> <i8, gm>
        %44 = pto.addptr %43, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %28, %44, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
        pto.vecscope {
          %result = pto.vlds %25[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %result_5 = pto.vlds %25[%c128] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %49 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %50 = pto.vcvt %result, %49 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_5, %49 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %52 = pto.vcvt %result, %49 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result_5, %49 {part = "ODD"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %low, %high = pto.vintlv %50, %52 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %low_6, %high_7 = pto.vintlv %51, %53 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
          %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %low_8, %high_9 = pto.pintlv_b32 %54, %54 : !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>, !pto.mask<b32>
          pto.vsts %low, %16[%c0], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high, %16[%c64], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %low_6, %16[%c128], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %high_7, %16[%c192], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %result_10 = pto.vlds %21[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vdup %result_10, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = arith.muli %56, %c256 : index
            %low_11, %high_12 = pto.vldsx2 %10[%58], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %59 = arith.addi %58, %c128 : index
            %low_13, %high_14 = pto.vldsx2 %10[%59], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %60 = pto.vmul %low_11, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %low_13, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %high_12, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmul %high_14, %57, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vmul %60, %50, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %65 = pto.vmul %61, %51, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vmul %62, %52, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %63, %53, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %22[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vdup %result_15, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %64, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vmul %65, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmul %66, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmul %67, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %low_16, %high_17 = pto.vintlv %69, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_18, %high_19 = pto.vintlv %70, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            pto.vsts %low_16, %10[%58], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %73 = arith.addi %58, %c64 : index
            pto.vsts %high_17, %10[%73], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %low_18, %10[%59], %low_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %74 = arith.addi %58, %c192 : index
            pto.vsts %high_19, %10[%74], %high_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg9 : i16 to index
            %57 = arith.muli %56, %c256 : index
            %low_10, %high_11 = pto.vldsx2 %10[%57], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %58 = arith.addi %57, %c128 : index
            %low_12, %high_13 = pto.vldsx2 %10[%58], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %59 = pto.vcvt %low_10, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %60 = pto.vcvt %low_12, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %61 = pto.vcvt %high_11, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %62 = pto.vcvt %high_13, %55 {rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %low_14, %high_15 = pto.vintlv %59, %61 : !pto.vreg<64xi32>, !pto.vreg<64xi32> -> !pto.vreg<64xi32>, !pto.vreg<64xi32>
            %low_16, %high_17 = pto.vintlv %60, %62 : !pto.vreg<64xi32>, !pto.vreg<64xi32> -> !pto.vreg<64xi32>, !pto.vreg<64xi32>
            pto.vsts %low_14, %29[%57], %low_8 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            %63 = arith.addi %57, %c64 : index
            pto.vsts %high_15, %29[%63], %high_9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            pto.vsts %low_16, %29[%58], %low_8 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            %64 = arith.addi %57, %c192 : index
            pto.vsts %high_17, %29[%64], %high_9 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %45 = pto.alloc_tile addr = %c42112_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf16, valid=?x?>
        pto.vecscope {
          %49 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f16, ub>
          %50 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %51 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result = pto.vlds %29[%55] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %56 = arith.addi %55, %c64 : index
            %result_7 = pto.vlds %29[%56] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %57 = arith.addi %55, %c128 : index
            %result_8 = pto.vlds %29[%57] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %58 = arith.addi %55, %c192 : index
            %result_9 = pto.vlds %29[%58] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %59 = pto.vcvt %result, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vcvt %result_7, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcvt %result_8, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vcvt %result_9, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vcvt %59, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %64 = pto.vcvt %60, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %65 = pto.vcvt %61, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %66 = pto.vcvt %62, %50 {part = "EVEN", rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            pto.vsts %63, %49[%55], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %64, %49[%56], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %65, %49[%57], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            pto.vsts %66, %49[%58], %51 {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_5, %scalar_out_6 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %52 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %53 = pto.vdup %c255_i16, %52 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %49, %57 : <f16, ub> -> <f16, ub>
              %result = pto.vlds %58[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %59 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %60 = pto.vand %59, %53, %mask_5 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %61 = pto.vcvt %60, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %62 = pto.vcvt %61, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %63 = pto.addptr %30, %57 : <i8, ub> -> <i8, ub>
              pto.vsts %62, %63[%c0], %mask_5 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
        pto.barrier <PIPE_MTE3>
        %46 = pto.addptr %arg4, %37 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %30, %46, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %47 = pto.addptr %arg3, %37 : <i8, gm> -> <i8, gm>
        %48 = pto.addptr %47, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %31, %48, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
