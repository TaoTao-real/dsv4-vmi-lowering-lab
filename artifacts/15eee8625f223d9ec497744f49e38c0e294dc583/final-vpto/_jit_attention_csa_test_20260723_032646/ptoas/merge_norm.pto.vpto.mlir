module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c256_i64 = arith.constant 256 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c72704_i64 = arith.constant 72704 : i64
      %c70784_i64 = arith.constant 70784 : i64
      %c70848_i64 = arith.constant 70848 : i64
      %c70912_i64 = arith.constant 70912 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c32896_i64 = arith.constant 32896 : i64
      %c69760_i64 = arith.constant 69760 : i64
      %c70016_i64 = arith.constant 70016 : i64
      %c70272_i64 = arith.constant 70272 : i64
      %c70528_i64 = arith.constant 70528 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %c4096 = arith.constant 4096 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c80 = arith.constant 80 : index
      %c0 = arith.constant 0 : index
      %c5 = arith.constant 5 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c448 = arith.constant 448 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c896_i64 = arith.constant 896 : i64
      %c64_i32 = arith.constant 64 : i32
      %c16_i64 = arith.constant 16 : i64
      %c40960 = arith.constant 40960 : index
      %c16_i32 = arith.constant 16 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c4 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c16 : index
      %5 = arith.muli %0, %c80 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %6 = pto.addptr %arg0, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c70784_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.addptr %6, %c0 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %8, %9, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %10 = pto.addptr %arg1, %5 : <f32, gm> -> <f32, gm>
      %11 = pto.castptr %c70848_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %10, %c0 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = arith.muli %0, %c40960 : index
      %15 = pto.addptr %arg2, %14 : <f32, gm> -> <f32, gm>
      %16 = pto.castptr %c70912_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %17, %18, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
      %21 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
      %23 = pto.castptr %c128_i64 : i64 -> !pto.ptr<f32, ub>
      %24 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
      %25 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      %26 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
      %27 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
      %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
      %29 = pto.castptr %c69760_i64 : i64 -> !pto.ptr<f32, ub>
      %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
      %31 = pto.castptr %c70016_i64 : i64 -> !pto.ptr<f32, ub>
      %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
      %33 = pto.castptr %c70272_i64 : i64 -> !pto.ptr<f32, ub>
      %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg9 = %c1 to %c5 step %c1 {
        %45 = arith.muli %arg9, %c16 : index
        %46 = arith.addi %5, %45 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %47 = pto.addptr %arg0, %46 : <f32, gm> -> <f32, gm>
        %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %48, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %49 = pto.addptr %arg1, %46 : <f32, gm> -> <f32, gm>
        %50 = pto.addptr %49, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %50, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %51 = arith.muli %46, %c512 : index
        %52 = pto.addptr %arg2, %51 : <f32, gm> -> <f32, gm>
        %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %53, %24, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmax %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vsub %result_3, %result_4, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %56 = pto.vexp %result_5, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_6 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = pto.vsub %result_6, %result_7, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %57, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.vecscope {
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %54 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_2 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.vmul %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %54 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.vecscope {
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %54 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %56 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %57 = arith.index_cast %arg10 : i16 to index
            %result_3 = pto.vlds %29[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = pto.vdup %result_3, %56 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = arith.muli %57, %c512 : index
            %result_4 = pto.vlds %16[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = arith.addi %59, %c64 : index
            %result_5 = pto.vlds %16[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = arith.addi %59, %c128 : index
            %result_6 = pto.vlds %16[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %62 = arith.addi %59, %c192 : index
            %result_7 = pto.vlds %16[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %59, %c256 : index
            %result_8 = pto.vlds %16[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %59, %c320 : index
            %result_9 = pto.vlds %16[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %59, %c384 : index
            %result_10 = pto.vlds %16[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = arith.addi %59, %c448 : index
            %result_11 = pto.vlds %16[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_4, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_5, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_6, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vmul %result_7, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmul %result_8, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmul %result_9, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vmul %result_10, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vmul %result_11, %58, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %67, %27[%59], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %27[%60], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %27[%61], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %27[%62], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %71, %27[%63], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %72, %27[%64], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %73, %27[%65], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %74, %27[%66], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %54 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %56 = arith.index_cast %arg10 : i16 to index
            %result = pto.vlds %31[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.vdup %result, %54 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = arith.muli %56, %c512 : index
            %result_2 = pto.vlds %23[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = arith.addi %58, %c64 : index
            %result_3 = pto.vlds %23[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = arith.addi %58, %c128 : index
            %result_4 = pto.vlds %23[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = arith.addi %58, %c192 : index
            %result_5 = pto.vlds %23[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %62 = arith.addi %58, %c256 : index
            %result_6 = pto.vlds %23[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %63 = arith.addi %58, %c320 : index
            %result_7 = pto.vlds %23[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %64 = arith.addi %58, %c384 : index
            %result_8 = pto.vlds %23[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %65 = arith.addi %58, %c448 : index
            %result_9 = pto.vlds %23[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %66 = pto.vmul %result_2, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vmul %result_3, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vmul %result_4, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vmul %result_5, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vmul %result_6, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmul %result_7, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmul %result_8, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vmul %result_9, %57, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %66, %23[%58], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %67, %23[%59], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %68, %23[%60], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %69, %23[%61], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %70, %23[%62], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %71, %23[%63], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %72, %23[%64], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %73, %23[%65], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_10 = pto.vlds %27[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %27[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %27[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %27[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %27[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %27[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %27[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %27[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = pto.vadd %result_10, %66, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vadd %result_11, %67, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %result_12, %68, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vadd %result_13, %69, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %78 = pto.vadd %result_14, %70, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %result_15, %71, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %result_16, %72, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %result_17, %73, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %74, %16[%58], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %16[%59], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %76, %16[%60], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %77, %16[%61], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %78, %16[%62], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %79, %16[%63], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %80, %16[%64], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %81, %16[%65], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %result, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_2 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %35 = pto.addptr %arg3, %4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %35, %23, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %45 = pto.vsub %result, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %45, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %45, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %46 = pto.vsub %result_3, %result_4, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %46, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %47 = pto.vexp %result_5, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %47, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.vadd %result_6, %result_7, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %48, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %36 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %result = pto.vlds %23[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vdup %result, %46 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = arith.muli %48, %c512 : index
          %result_2 = pto.vlds %16[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.addi %50, %c64 : index
          %result_3 = pto.vlds %16[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = arith.addi %50, %c128 : index
          %result_4 = pto.vlds %16[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = arith.addi %50, %c192 : index
          %result_5 = pto.vlds %16[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = arith.addi %50, %c256 : index
          %result_6 = pto.vlds %16[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = arith.addi %50, %c320 : index
          %result_7 = pto.vlds %16[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %56 = arith.addi %50, %c384 : index
          %result_8 = pto.vlds %16[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = arith.addi %50, %c448 : index
          %result_9 = pto.vlds %16[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vdiv %result_2, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vdiv %result_3, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vdiv %result_4, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vdiv %result_5, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %62 = pto.vdiv %result_6, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.vdiv %result_7, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %64 = pto.vdiv %result_8, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %65 = pto.vdiv %result_9, %49, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %58, %16[%50], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %59, %16[%51], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %60, %16[%52], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %61, %16[%53], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %62, %16[%54], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %63, %16[%55], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %64, %16[%56], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %65, %16[%57], %45 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpanddiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %47 = pto.castptr %c128_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c512 : index
          %result = pto.vlds %16[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = arith.addi %49, %c64 : index
          %result_2 = pto.vlds %16[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.addi %49, %c128 : index
          %result_3 = pto.vlds %16[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = arith.addi %49, %c192 : index
          %result_4 = pto.vlds %16[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = arith.addi %49, %c256 : index
          %result_5 = pto.vlds %16[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = arith.addi %49, %c320 : index
          %result_6 = pto.vlds %16[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = arith.addi %49, %c384 : index
          %result_7 = pto.vlds %16[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %56 = arith.addi %49, %c448 : index
          %result_8 = pto.vlds %16[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %57 = pto.vcvt %result, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %58 = pto.vcvt %result_2, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %59 = pto.vcvt %result_3, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %60 = pto.vcvt %result_4, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %61 = pto.vcvt %result_5, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %62 = pto.vcvt %result_6, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %63 = pto.vcvt %result_7, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %64 = pto.vcvt %result_8, %46 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %57, %47[%49], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %58, %47[%50], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %59, %47[%51], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %60, %47[%52], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %61, %47[%53], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %62, %47[%54], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %63, %47[%55], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %64, %47[%56], %45 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %37 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vdup %cst, %45 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          pto.vsts %46, %27[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %38 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %45 = arith.index_cast %arg9 : index to i32
        pto.store %45, %38[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.vcvt %result, %45 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %46, %25[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg9 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %27[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result_2, %46, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %27[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %52 = pto.vmuls %51, %cst_0, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %25[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg9 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %25[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_2, %45 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %51, %38[%50], %47 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg9 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %38[%50] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %51 = pto.vcvt %result_2, %45 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %25[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg9 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %25[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmuls %result_2, %cst_1, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %27[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vsub %result_3, %51, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vadds %result_3, %cst, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmuls %52, %cst_1, %47 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %25[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = pto.vsub %53, %54, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %55, %27[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %48 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg9 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %27[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_2, %45 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %51, %48[%50], %47 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %39 = arith.muli %1, %c64 : index
      %40 = pto.addptr %arg4, %39 : <f32, gm> -> <f32, gm>
      %41 = pto.addptr %40, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %41, %30, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
      %42 = pto.addptr %arg5, %39 : <f32, gm> -> <f32, gm>
      %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %43, %32, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %45 = pto.castptr %c70528_i64 : i64 -> !pto.ptr<f32, ub>
        %46 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.index_cast %48 : index to i64
          %50 = arith.muli %49, %c2048_i64 : i64
          %51 = arith.addi %50, %c72704_i64 : i64
          %52 = arith.muli %49, %c256_i64 : i64
          %53 = arith.addi %52, %c32896_i64 : i64
          %54 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
          %55 = pto.castptr %53 : i64 -> !pto.ptr<i32, ub>
          %56 = pto.addptr %55, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %56[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %57 = pto.vgather2 %54, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %57, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %58 = arith.addi %52, %c65664_i64 : i64
          %59 = pto.castptr %58 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %59[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c512 : index
          %50 = arith.addi %49, %c448 : index
          %51 = pto.addptr %16, %50 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = arith.muli %48, %c64 : index
          %53 = pto.addptr %27, %52 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_textract_vec2vec_nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID5>]
      pto.vecscope {
        %result = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg9 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_2 = pto.vlds %27[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_2, %result, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %16[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID6>]
      pto.vecscope {
        %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg9 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_2 = pto.vlds %25[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_2, %result, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %27[%48], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %44 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result = pto.vlds %16[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %27[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vadd %result, %result_2, %45 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %16[%49], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %47 = pto.castptr %c70912_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %50 = pto.addptr %16, %49 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %52 = pto.addptr %47, %49 : <bf16, ub> -> <bf16, ub>
          pto.vsts %51, %52[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      scf.for %arg9 = %c0 to %c16 step %c1 {
        %45 = arith.addi %4, %arg9 : index
        %46 = arith.divsi %45, %c8 : index
        %47 = arith.muli %46, %c8 : index
        %48 = arith.subi %45, %47 : index
        %49 = arith.addi %47, %1 : index
        %50 = arith.muli %48, %c512 : index
        %51 = arith.index_cast %arg9 : index to i64
        %52 = arith.muli %51, %c1024_i64 : i64
        %53 = arith.addi %52, %c128_i64 : i64
        pto.barrier <PIPE_MTE3>
        %54 = pto.castptr %53 : i64 -> !pto.ptr<bf16, ub>
        %55 = arith.muli %49, %c4096 : index
        %56 = arith.addi %55, %50 : index
        %57 = pto.addptr %arg6, %56 : <bf16, gm> -> <bf16, gm>
        %58 = pto.addptr %54, %c0 : <bf16, ub> -> <bf16, ub>
        %59 = pto.addptr %57, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %58, %59, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        %60 = arith.muli %51, %c128_i64 : i64
        %61 = arith.addi %60, %c70912_i64 : i64
        %62 = arith.addi %50, %c448 : index
        pto.barrier <PIPE_MTE3>
        %63 = pto.castptr %61 : i64 -> !pto.ptr<bf16, ub>
        %64 = arith.addi %55, %62 : index
        %65 = pto.addptr %arg6, %64 : <bf16, gm> -> <bf16, gm>
        %66 = pto.addptr %63, %c0 : <bf16, ub> -> <bf16, ub>
        %67 = pto.addptr %65, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %66, %67, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
