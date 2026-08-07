module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<i32, gm>, %arg8: !pto.ptr<i64, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4_i16 = arith.constant 4 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c27200_i64 = arith.constant 27200 : i64
      %c0_i64 = arith.constant 0 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c14400_i64 = arith.constant 14400 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c14336_i64 = arith.constant 14336 : i64
      %c18496_i64 = arith.constant 18496 : i64
      %c22592_i64 = arith.constant 22592 : i64
      %c26688_i64 = arith.constant 26688 : i64
      %c26944_i64 = arith.constant 26944 : i64
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c512 = arith.constant 512 : index
      %c2 = arith.constant 2 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 0.001953125 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c448 = arith.constant 448 : index
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c3 = arith.constant 3 : index
      %c1024 = arith.constant 1024 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c16_i64 = arith.constant 16 : i64
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c64_i32 = arith.constant 64 : i32
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
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
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
      %0 = pto.castptr %c27200_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg9 : i16 to index
          %25 = arith.muli %24, %c32 : index
          %26 = pto.addptr %0, %25 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg9 : i16 to index
          %25 = arith.muli %24, %c32 : index
          %26 = pto.addptr %1, %25 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg9 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %2, %24 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.addptr %0, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %5 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %5, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg9 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %2, %24 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.addptr %1, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %6 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %23, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %8 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg9 = %c0 to %c512 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %23 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %24 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg10 : i16 to index
            %28 = arith.muli %27, %c64 : index
            %result = pto.vlds %2[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = pto.vmul %result, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %29, %8[%28], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %25 = pto.castptr %c14336_i64 : i64 -> !pto.ptr<f32, ub>
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
          %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %27 = pto.vcadd %result, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vcadd %result_6, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vcadd %result_7, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vcadd %result_8, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vcadd %result_9, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vcadd %result_10, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vcadd %result_11, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vcadd %result_12, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vcadd %result_13, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vcadd %result_14, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %result_15, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %result_16, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcadd %result_17, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcadd %result_18, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcadd %result_19, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcadd %result_20, %26 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %27, %25[%c0], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %25[%c1], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %25[%c2], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %25[%c3], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %25[%c4], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %25[%c5], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %25[%c6], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %25[%c7], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %25[%c8], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %25[%c9], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %25[%c10], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %25[%c11], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %25[%c12], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %25[%c13], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %25[%c14], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %25[%c15], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_21 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
          %result_22 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %45 = pto.vadd %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %23, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_8 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %27 = pto.vdiv %26, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %27, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %10 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.addptr %10, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg9 = %c0 to %c448 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        %23 = pto.addptr %arg2, %arg9 : <f32, gm> -> <f32, gm>
        %24 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %25 = pto.addptr %arg4, %arg9 : <bf16, gm> -> <bf16, gm>
        %26 = pto.addptr %25, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %26, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %31 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %32 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg10 : i16 to index
            %result_6 = pto.vlds %9[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vdup %result_6, %34 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = arith.muli %35, %c64 : index
            %result_7 = pto.vlds %2[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_7, %36, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %2[%37], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %27 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg10 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %result_6 = pto.vlds %2[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vmul %result_6, %result, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %34, %2[%33], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
        pto.barrier <PIPE_MTE3>
        %28 = pto.addptr %arg3, %arg9 : <f32, gm> -> <f32, gm>
        %29 = pto.addptr %28, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %29, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID5>]
      %12 = pto.addptr %arg2, %c448 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %13, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = pto.addptr %arg4, %c448 : <bf16, gm> -> <bf16, gm>
      %15 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %15, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %11[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %24 = pto.vcvt %result, %23 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %25 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg9 : i16 to index
          %result_6 = pto.vlds %9[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vdup %result_6, %24 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = arith.muli %25, %c64 : index
          %result_7 = pto.vlds %2[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_7, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vmul %28, %result, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %2[%27], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %16 = pto.alloc_tile addr = %c2048_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.vdup %cst_2, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg9 : i16 to index
          %27 = arith.muli %26, %c64 : index
          pto.vsts %24, %8[%27], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %17 = pto.castptr %c14400_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %23 = arith.index_cast %arg9 : index to i32
        pto.store %23, %17[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %18 = pto.castptr %c22592_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %17[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.vcvt %result, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %24, %6[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %8[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_6, %24, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %8[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.vmuls %30, %cst_3, %25 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %6[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result_6, %23 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %30, %17[%29], %25 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %26 = pto.castptr %c18496_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %17[%29] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vcvt %result_6, %23 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %6[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.vcvt %30, %23 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %31, %26[%29], %25 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %6[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmuls %result_6, %cst_4, %25 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vsub %result_7, %30, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = pto.vadds %result_7, %cst_2, %25 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmuls %31, %cst_4, %25 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %18[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = pto.vsub %32, %33, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %8[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %27 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg9 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_6 = pto.vlds %8[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result_6, %23 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %30, %27[%29], %25 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %6[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmuls %result_7, %cst_4, %25 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %19 = pto.alloc_tile addr = %c14400_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg9 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result = pto.vlds %6[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadds %result, %cst_5, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%30], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.castptr %c26944_i64 : i64 -> !pto.ptr<f32, ub>
        %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg9 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c128_i64 : i64
          %32 = arith.addi %31, %c27200_i64 : i64
          %33 = arith.muli %30, %c256_i64 : i64
          %34 = arith.addi %33, %c18496_i64 : i64
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %34 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %33, %c22592_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %40[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg9 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c128_i64 : i64
          %32 = arith.muli %30, %c256_i64 : i64
          %33 = arith.addi %32, %c18496_i64 : i64
          %34 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %33 : i64 -> !pto.ptr<i32, ub>
          %36 = pto.addptr %35, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %36[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = pto.vgather2 %34, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = arith.addi %32, %c27200_i64 : i64
          %39 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %39[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %26 = pto.castptr %c26688_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg9 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c256_i64 : i64
          %32 = arith.addi %31, %c6144_i64 : i64
          %33 = arith.addi %31, %c2048_i64 : i64
          %34 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %33 : i64 -> !pto.ptr<i32, ub>
          %36 = pto.addptr %35, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %36[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = pto.vgather2 %34, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = arith.addi %31, %c18496_i64 : i64
          %39 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %39[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg9 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %result = pto.vlds %2[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %18[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %result_6, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %2[%30], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %6[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_7, %result_8, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %0[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %32, %result_9, %28 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %8[%30], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %20 = pto.alloc_tile addr = %c6144_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg9 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result = pto.vlds %2[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result, %result_6, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %2[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      pto.barrier <PIPE_MTE3>
      %21 = pto.addptr %arg3, %c448 : <f32, gm> -> <f32, gm>
      %22 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %4, %22, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c2048_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID6>]
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %23 = arith.muli %arg9, %c2 : index
        %24 = pto.load_scalar %arg7[%23] : !pto.ptr<i32, gm> -> i32
        %25 = arith.index_cast %24 : i32 to index
        %26 = arith.remsi %25, %c4 : index
        %27 = arith.cmpi sge, %26, %c2 : index
        scf.if %27 {
          %28 = arith.subi %c3, %26 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
          %29 = arith.muli %arg9, %c512 : index
          %30 = pto.addptr %arg3, %29 : <f32, gm> -> <f32, gm>
          %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %31, %4, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          %32 = arith.addi %23, %28 : index
          %33 = pto.load_scalar %arg8[%32] : !pto.ptr<i64, gm> -> i64
          %34 = arith.index_cast %33 : i64 to index
          %35 = arith.cmpi sge, %34, %c0 : index
          pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
          scf.if %35 {
            %36 = arith.muli %arg9, %c1024 : index
            %37 = pto.addptr %arg6, %36 : <f32, gm> -> <f32, gm>
            %38 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %4, %38, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
            %39 = pto.alloc_tile addr = %c6144_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
            pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
            %40 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
            pto.vecscope {
              %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %2[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_7 = pto.vlds %2[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %2[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_9 = pto.vlds %2[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %2[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_11 = pto.vlds %2[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_12 = pto.vlds %2[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %46 = pto.vcvt %result, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %47 = pto.vcvt %result_6, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %48 = pto.vcvt %result_7, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %49 = pto.vcvt %result_8, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %50 = pto.vcvt %result_9, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %51 = pto.vcvt %result_10, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %52 = pto.vcvt %result_11, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %53 = pto.vcvt %result_12, %45 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              pto.vsts %46, %40[%c0], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %47, %40[%c64], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %48, %40[%c128], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %49, %40[%c192], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %50, %40[%c256], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %51, %40[%c320], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %52, %40[%c384], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %53, %40[%c448], %54 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            }
            pto.barrier <PIPE_MTE3>
            %41 = arith.muli %34, %c512 : index
            %42 = pto.addptr %arg5, %41 : <bf16, gm> -> <bf16, gm>
            %43 = pto.addptr %40, %c0 : <bf16, ub> -> <bf16, ub>
            %44 = pto.addptr %42, %c0 : <bf16, gm> -> <bf16, gm>
            pto.copy_ubuf_to_gm %43, %44, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
        }
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID7>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
