module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_rmsnorm_rope(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c128 = arith.constant 128 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c-3 = arith.constant -3 : index
      %cst_0 = arith.constant 7.812500e-03 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c64_i32 = arith.constant 64 : i32
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c32_i32 = arith.constant 32 : i32
      %c64_i64 = arith.constant 64 : i64
      %c16_i32 = arith.constant 16 : i32
      %c2048 = arith.constant 2048 : index
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
      %2 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg10 : i16 to index
          %36 = arith.muli %35, %c32 : index
          %37 = pto.addptr %2, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %34 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg10 : i16 to index
          %36 = arith.muli %35, %c32 : index
          %37 = pto.addptr %34, %36 : <f32, ub> -> <f32, ub>
          pto.vsts %33, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      scf.for %arg10 = %c0 to %c16 step %c1 {
        %33 = arith.addi %1, %arg10 : index
        %34 = pto.load_scalar %arg0[%33] : !pto.ptr<i32, gm> -> i32
        %35 = arith.index_cast %34 : i32 to index
        %36 = arith.cmpi sge, %35, %c0 : index
        scf.if %36 {
          %37 = pto.load_scalar %arg1[%33] : !pto.ptr<i32, gm> -> i32
          %38 = arith.index_cast %37 : i32 to index
          %39 = arith.addi %38, %c-3 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          %40 = arith.muli %39, %c64 : index
          %41 = pto.addptr %arg2, %40 : <bf16, gm> -> <bf16, gm>
          %42 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %43 = pto.addptr %41, %c0 : <bf16, gm> -> <bf16, gm>
          %44 = pto.addptr %42, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %43, %44, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %45 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.addptr %45, %c0 : <f32, ub> -> <f32, ub>
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %44[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %52 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %52, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %47 = arith.index_cast %arg10 : index to i64
          %48 = arith.muli %47, %c128_i64 : i64
          pto.vecscope {
            %51 = arith.addi %48, %c25152_i64 : i64
            %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
            %53 = pto.addptr %52, %c0 : <f32, ub> -> <f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
          %49 = pto.addptr %arg3, %40 : <bf16, gm> -> <bf16, gm>
          %50 = pto.addptr %49, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %50, %44, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %result = pto.vlds %44[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %51 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %52 = pto.vcvt %result, %51 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %52, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.vecscope {
            %51 = arith.addi %48, %c29248_i64 : i64
            %result = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
            %53 = pto.addptr %52, %c0 : <f32, ub> -> <f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %result, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %3 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %33, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      %5 = arith.muli %0, %c2048 : index
      %6 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg10 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        %33 = arith.addi %5, %arg10 : index
        %34 = pto.addptr %arg4, %33 : <f32, gm> -> <f32, gm>
        %35 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %35, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg11 : i16 to index
            %39 = arith.muli %38, %c64 : index
            %result = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.vmul %result, %result, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %40, %8[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.vecscope {
          %36 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
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
          %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %38 = pto.vcadd %result, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcadd %result_6, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcadd %result_7, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcadd %result_8, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcadd %result_9, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcadd %result_10, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcadd %result_11, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcadd %result_12, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcadd %result_13, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcadd %result_14, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %result_15, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcadd %result_16, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcadd %result_17, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcadd %result_18, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vcadd %result_19, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vcadd %result_20, %37 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %38, %36[%c0], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %36[%c1], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %36[%c2], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %36[%c3], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %36[%c4], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %36[%c5], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %36[%c6], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %36[%c7], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %36[%c8], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %36[%c9], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %36[%c10], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %36[%c11], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %36[%c12], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %36[%c13], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %36[%c14], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %53, %36[%c15], %54 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_21 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
          %result_22 = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %56 = pto.vadd %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %33, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %34, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %35 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %35, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_8 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %36 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %37 = pto.vdiv %36, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %38 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      %10 = pto.addptr %arg4, %5 : <f32, gm> -> <f32, gm>
      %11 = pto.addptr %10, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %11, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %12 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %13 = pto.addptr %arg5, %c0 : <bf16, gm> -> <bf16, gm>
      %14 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %13, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %15 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %14[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %34 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %34, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %37 = arith.index_cast %arg10 : i16 to index
          %result_6 = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vdup %result_6, %36 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = arith.muli %37, %c64 : index
          %result_7 = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_7, %38, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %6[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result_6 = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_6, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %35 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %38 = pto.addptr %6, %37 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %40 = pto.addptr %35, %37 : <bf16, ub> -> <bf16, ub>
          pto.vsts %39, %40[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %17 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %18 = pto.addptr %arg6, %5 : <bf16, gm> -> <bf16, gm>
      %19 = pto.addptr %17, %c0 : <bf16, ub> -> <bf16, ub>
      %20 = pto.addptr %18, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %21 = arith.addi %5, %c64 : index
      %22 = pto.addptr %arg4, %21 : <f32, gm> -> <f32, gm>
      %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %23, %7, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %24 = pto.addptr %arg5, %c64 : <bf16, gm> -> <bf16, gm>
      %25 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %25, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %result = pto.vlds %14[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %33 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %34 = pto.vcvt %result, %33 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %34, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg10 : i16 to index
          %result_6 = pto.vlds %9[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vdup %result_6, %33 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = arith.muli %35, %c64 : index
          %result_7 = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_7, %36, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %38, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %6[%37], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vdup %cst_2, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg10 : i16 to index
          %37 = arith.muli %36, %c64 : index
          pto.vsts %34, %8[%37], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %27 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg10 = %c0 to %c64 step %c1 {
        %33 = arith.index_cast %arg10 : index to i32
        pto.store %33, %27[%arg10] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %28 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %27[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.vcvt %result, %33 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %34, %3[%c0], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %8[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_6, %34, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %8[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = pto.vmuls %40, %cst_3, %35 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %3[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %3[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result_6, %33 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %40, %27[%39], %35 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %36 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %27[%39] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vcvt %result_6, %33 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %3[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = pto.vcvt %40, %33 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %41, %36[%39], %35 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %3[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmuls %result_6, %cst_4, %35 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vsub %result_7, %40, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %3[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %42 = pto.vadds %result_7, %cst_2, %35 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmuls %41, %cst_4, %35 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %28[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vsub %42, %43, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %8[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg10 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %result_6 = pto.vlds %8[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result_6, %33 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %40, %37[%39], %35 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %3[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmuls %result_7, %cst_4, %35 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %3[%39], %35 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %29 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg10 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %3[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vadds %result, %cst_5, %33 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %3[%40], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %35 = pto.addptr %34, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg10 : i16 to index
          %40 = arith.index_cast %39 : index to i64
          %41 = arith.muli %40, %c128_i64 : i64
          %42 = arith.addi %41, %c25152_i64 : i64
          %43 = arith.muli %40, %c256_i64 : i64
          %44 = arith.addi %43, %c16448_i64 : i64
          %45 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.castptr %44 : i64 -> !pto.ptr<i32, ub>
          %47 = pto.addptr %46, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %47[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %48 = pto.vgather2 %45, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = arith.addi %43, %c20544_i64 : i64
          %50 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %50[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg10 : i16 to index
          %40 = arith.index_cast %39 : index to i64
          %41 = arith.muli %40, %c128_i64 : i64
          %42 = arith.addi %41, %c29248_i64 : i64
          %43 = arith.muli %40, %c256_i64 : i64
          %44 = arith.addi %43, %c16448_i64 : i64
          %45 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
          %46 = pto.castptr %44 : i64 -> !pto.ptr<i32, ub>
          %47 = pto.addptr %46, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %47[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %48 = pto.vgather2 %45, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = arith.addi %43, %c25152_i64 : i64
          %50 = pto.castptr %49 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %50[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %36 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg10 : i16 to index
          %40 = arith.index_cast %39 : index to i64
          %41 = arith.muli %40, %c256_i64 : i64
          %42 = arith.addi %41, %c4096_i64 : i64
          %43 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
          %44 = pto.castptr %41 : i64 -> !pto.ptr<i32, ub>
          %45 = pto.addptr %44, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %45[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %46 = pto.vgather2 %43, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %47 = arith.addi %41, %c16448_i64 : i64
          %48 = pto.castptr %47 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %48[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg10 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %6[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %28[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result, %result_6, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %6[%40], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %9[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %3[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_7, %result_8, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %2[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %42, %result_9, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %8[%40], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %30 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg10 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vadd %result, %result_6, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %6[%36], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg10 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %37 = pto.addptr %6, %36 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %39 = pto.addptr %17, %36 : <bf16, ub> -> <bf16, ub>
          pto.vsts %38, %39[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %31 = pto.addptr %arg6, %21 : <bf16, gm> -> <bf16, gm>
      %32 = pto.addptr %31, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %32, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
