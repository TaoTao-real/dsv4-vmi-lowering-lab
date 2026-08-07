module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c25152_i64 = arith.constant 25152 : i64
      %c29248_i64 = arith.constant 29248 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c12352_i64 = arith.constant 12352 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c20544_i64 = arith.constant 20544 : i64
      %c24640_i64 = arith.constant 24640 : i64
      %c24896_i64 = arith.constant 24896 : i64
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c64 = arith.constant 64 : index
      %c512 = arith.constant 512 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c-3 = arith.constant -3 : index
      %cst_0 = arith.constant 0.001953125 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c448 = arith.constant 448 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %c64_i64 = arith.constant 64 : i64
      %c16_i32 = arith.constant 16 : i32
      %c8192 = arith.constant 8192 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
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
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.muli %0, %c16 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %2 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %28 = pto.addptr %2, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %25 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c32 : index
          %28 = pto.addptr %25, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %24 = arith.addi %1, %arg10 : index
        %25 = pto.load_scalar %arg0[%24] : !pto.ptr<i32, gm> -> i32
        %26 = arith.index_cast %25 : i32 to index
        %27 = arith.cmpi sge, %26, %c0 : index
        scf.if %27 {
          %28 = pto.load_scalar %arg1[%24] : !pto.ptr<i32, gm> -> i32
          %29 = arith.index_cast %28 : i32 to index
          %30 = arith.addi %29, %c-3 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %31 = arith.muli %30, %c64 : index
          %32 = pto.addptr %arg2, %31 : <bf16, gm> -> <bf16, gm>
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %34 = pto.addptr %32, %c0 : <bf16, gm> -> <bf16, gm>
          %35 = pto.addptr %33, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %36 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %42 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %43 = pto.vcvt %result, %42 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %43, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %38 = arith.index_cast %arg10 : index to i64
          %39 = arith.muli %38, %c128_i64 : i64
          pto.vecscope {
            %42 = arith.addi %39, %c25152_i64 : i64
            %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
            %44 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %result, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %40 = pto.addptr %arg3, %31 : <bf16, gm> -> <bf16, gm>
          %41 = pto.addptr %40, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %41, %35, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %result = pto.vlds %35[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %42 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %43 = pto.vcvt %result, %42 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %43, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.vecscope {
            %42 = arith.addi %39, %c29248_i64 : i64
            %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
            %44 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %result, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %5 = arith.muli %0, %c8192 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg10 = %c0 to %c512 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %24 = arith.addi %5, %arg10 : index
        %25 = pto.addptr %arg4, %24 : <f32, gm> -> <f32, gm>
        %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %29 = arith.index_cast %arg11 : i16 to index
            %30 = arith.muli %29, %c64 : index
            %result = pto.vlds %6[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vmul %result, %result, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %8[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.vecscope {
          %27 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %8[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %8[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %8[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %8[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %8[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %8[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %8[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %8[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %8[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %8[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %8[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %8[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %8[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %29 = pto.vcadd %result, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vcadd %result_6, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vcadd %result_7, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcadd %result_8, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vcadd %result_9, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcadd %result_10, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vcadd %result_11, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vcadd %result_12, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %result_13, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %result_14, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcadd %result_15, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcadd %result_16, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcadd %result_17, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcadd %result_18, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcadd %result_19, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcadd %result_20, %28 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %29, %27[%c0], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %27[%c1], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %27[%c2], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %27[%c3], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %27[%c4], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %27[%c5], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %27[%c6], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %27[%c7], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %27[%c8], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %27[%c9], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %27[%c10], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %27[%c11], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %27[%c12], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %27[%c13], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %27[%c14], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %27[%c15], %45 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_21 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
          %result_22 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.vadd %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %26, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_8 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %27 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %28 = pto.vdiv %27, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %28, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      %10 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg10 = %c0 to %c448 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
        %24 = arith.addi %5, %arg10 : index
        %25 = pto.addptr %arg4, %24 : <f32, gm> -> <f32, gm>
        %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %27 = pto.addptr %arg6, %arg10 : <bf16, gm> -> <bf16, gm>
        %28 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %28, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %32 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %33 = pto.vcvt %result, %32 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %34 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg11 : i16 to index
            %result_6 = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vdup %result_6, %36 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = arith.muli %37, %c64 : index
            %result_7 = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result_7, %38, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %6[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %29 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg11 : i16 to index
            %35 = arith.muli %34, %c64 : index
            %result_6 = pto.vlds %6[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result_6, %result, %32 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %6[%35], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
        pto.barrier <PIPE_MTE3>
        %30 = pto.addptr %arg5, %24 : <f32, gm> -> <f32, gm>
        %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %7, %31, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      %12 = arith.addi %5, %c448 : index
      %13 = pto.addptr %arg4, %12 : <f32, gm> -> <f32, gm>
      %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %14, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %15 = pto.addptr %arg6, %c448 : <bf16, gm> -> <bf16, gm>
      %16 = pto.addptr %15, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %16, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %25 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %26 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %result_6 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vdup %result_6, %25 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = arith.muli %26, %c64 : index
          %result_7 = pto.vlds %6[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_7, %27, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vmul %29, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %6[%28], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_2, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg10 : i16 to index
          %28 = arith.muli %27, %c64 : index
          pto.vsts %25, %8[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %18 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %24 = arith.index_cast %arg10 : index to i32
        pto.store %24, %18[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %19 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %18[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vcvt %result, %24 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %25, %3[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %8[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_6, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %8[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = pto.vmuls %31, %cst_3, %26 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %3[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result_6, %24 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %31, %18[%30], %26 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %18[%30] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = pto.vcvt %result_6, %24 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %3[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = pto.vcvt %31, %24 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %32, %27[%30], %26 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmuls %result_6, %cst_4, %26 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result_7, %31, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %3[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %33 = pto.vadds %result_7, %cst_2, %26 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmuls %32, %cst_4, %26 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %19[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.vsub %33, %34, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %8[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %28 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg10 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result_6 = pto.vlds %8[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result_6, %24 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %31, %28[%30], %26 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmuls %result_7, %cst_4, %26 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %3[%30], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %20 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result = pto.vlds %3[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadds %result, %cst_5, %24 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %3[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %26 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c128_i64 : i64
          %33 = arith.addi %32, %c25152_i64 : i64
          %34 = arith.muli %31, %c256_i64 : i64
          %35 = arith.addi %34, %c16448_i64 : i64
          %36 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %38 = pto.addptr %37, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %39 = pto.vgather2 %36, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = arith.addi %34, %c20544_i64 : i64
          %41 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %41[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c128_i64 : i64
          %33 = arith.addi %32, %c29248_i64 : i64
          %34 = arith.muli %31, %c256_i64 : i64
          %35 = arith.addi %34, %c16448_i64 : i64
          %36 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %38 = pto.addptr %37, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %39 = pto.vgather2 %36, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = arith.addi %34, %c25152_i64 : i64
          %41 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %41[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %27 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.index_cast %30 : index to i64
          %32 = arith.muli %31, %c256_i64 : i64
          %33 = arith.addi %32, %c4096_i64 : i64
          %34 = pto.castptr %33 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %32 : i64 -> !pto.ptr<i32, ub>
          %36 = pto.addptr %35, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %36[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = pto.vgather2 %34, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = arith.addi %32, %c16448_i64 : i64
          %39 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %39[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg10 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result = pto.vlds %6[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %19[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %6[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %3[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_7, %result_8, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %2[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmul %33, %result_9, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %8[%31], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %21 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c64 : index
          %result = pto.vlds %6[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result, %result_6, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %6[%27], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      pto.barrier <PIPE_MTE3>
      %22 = pto.addptr %arg5, %12 : <f32, gm> -> <f32, gm>
      %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %23, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
