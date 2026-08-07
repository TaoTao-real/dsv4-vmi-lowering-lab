module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4_i16 = arith.constant 4 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c25152_i64 = arith.constant 25152 : i64
      %c29248_i64 = arith.constant 29248 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c12352_i64 = arith.constant 12352 : i64
      %c0_i64 = arith.constant 0 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c20544_i64 = arith.constant 20544 : i64
      %c24640_i64 = arith.constant 24640 : i64
      %c24896_i64 = arith.constant 24896 : i64
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 7.812500e-03 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %cst_3 = arith.constant 5.000000e-01 : f32
      %cst_4 = arith.constant 2.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      %c64_i32 = arith.constant 64 : i32
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
      pto.vecscope {
        %22 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pand %23, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c32 : index
          pto.vsts %25, %22[%29], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %27 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c32 : index
          pto.vsts %25, %27[%29], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %0 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg5 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %0, %24 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.addptr %22, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %3 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %3, %2, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg5 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %0, %24 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.addptr %22, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.vecscope {
        %22 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %22 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %23 = pto.addptr %22, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %23, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.muli %27, %c64 : index
            %result = pto.vlds %0[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = pto.vmul %result, %result, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %29, %24[%28], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %24[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %24[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %24[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %24[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %24[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %24[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %24[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %24[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %24[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_15 = pto.vlds %24[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %24[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_17 = pto.vlds %24[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %24[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_19 = pto.vlds %24[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %24[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
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
          pto.mem_bar "VST_VST"
          pto.vsts %28, %25[%c1], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %29, %25[%c2], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %30, %25[%c3], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %31, %25[%c4], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %32, %25[%c5], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %33, %25[%c6], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %34, %25[%c7], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %35, %25[%c8], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %36, %25[%c9], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %37, %25[%c10], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %38, %25[%c11], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %39, %25[%c12], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %40, %25[%c13], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %41, %25[%c14], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          pto.vsts %42, %25[%c15], %43 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VLD"
          %result_21 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
          %result_22 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.vadd %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %22 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %24, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_7 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %26, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_8 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %27 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %28 = pto.vdiv %27, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %28, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %4 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %4, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %5 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %arg3, %c0 : <bf16, gm> -> <bf16, gm>
      %7 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.vecscope {
        %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %25 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %25, %22[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %26 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %result_7 = pto.vlds %26[%28] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.muli %28, %c64 : index
          %result_8 = pto.vlds %0[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_8, %result_7, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %0[%29], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        %result_6 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c64 : index
          %result_7 = pto.vlds %0[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_7, %result_6, %27 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %0[%29], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %22 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg5 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result = pto.vlds %0[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vcvt %result, %23 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %27, %22[%26], %24 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.mem_bar "VLD_VST"
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %9 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
      %11 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %10, %11, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %12 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %13, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %15 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %15, %7, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %25 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %25, %22[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %22 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %result_6 = pto.vlds %22[%26] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.muli %26, %c64 : index
          %result_7 = pto.vlds %0[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_7, %result_6, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %0[%27], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %25 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c64 : index
          %result_6 = pto.vlds %0[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_6, %result, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %0[%27], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_2, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c64 : index
          pto.vsts %25, %22[%27], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %17 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %22 = arith.index_cast %arg5 : index to i32
        pto.store %22, %17[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %22 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %17[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vcvt %result, %24 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %22[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        %result_6 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_7, %result_6, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %26[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VV_ALL"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmuls %result_7, %cst_3, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %22[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result_7, %24 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %32, %17[%31], %23 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %17[%31] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %32 = pto.vcvt %result_7, %24 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %22[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result_7, %24 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %32, %27[%31], %23 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmuls %result_7, %cst_4, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %22[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result_7, %result_8, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %22[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadds %result_7, %cst_2, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %26[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %28 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmuls %result_7, %cst_4, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %28[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %28[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result_7, %result_8, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %26[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %29 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %26[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result_7, %24 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %32, %29[%31], %23 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c64 : index
          %result_7 = pto.vlds %22[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmuls %result_7, %cst_4, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %22[%31], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %18 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %22 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result = pto.vlds %22[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vadds %result, %cst_5, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %22[%34], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.index_cast %33 : index to i64
          %35 = arith.muli %34, %c128_i64 : i64
          %36 = arith.addi %35, %c25152_i64 : i64
          %37 = arith.muli %34, %c256_i64 : i64
          %38 = arith.addi %37, %c16448_i64 : i64
          %39 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.castptr %38 : i64 -> !pto.ptr<i32, ub>
          %41 = pto.addptr %40, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %42 = pto.vgather2 %39, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = arith.addi %37, %c20544_i64 : i64
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %44[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        }
        pto.mem_bar "VV_ALL"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.index_cast %33 : index to i64
          %35 = arith.muli %34, %c128_i64 : i64
          %36 = arith.addi %35, %c29248_i64 : i64
          %37 = arith.muli %34, %c256_i64 : i64
          %38 = arith.addi %37, %c16448_i64 : i64
          %39 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.castptr %38 : i64 -> !pto.ptr<i32, ub>
          %41 = pto.addptr %40, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %42 = pto.vgather2 %39, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = arith.addi %37, %c25152_i64 : i64
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %44[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        }
        %26 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.index_cast %33 : index to i64
          %35 = arith.muli %34, %c256_i64 : i64
          %36 = arith.addi %35, %c4096_i64 : i64
          %37 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %39 = pto.addptr %38, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vgather2 %37, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = arith.addi %35, %c16448_i64 : i64
          %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %42[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        }
        %28 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
        %29 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result = pto.vlds %0[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %28[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %0[%34], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        %30 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        %31 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result = pto.vlds %30[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %22[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %31[%34], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        %32 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result = pto.vlds %31[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %32[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %31[%34], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result = pto.vlds %0[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %31[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vadd %result, %result_6, %29 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %0[%34], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %19 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xbf16, valid=?x?>
      pto.vecscope {
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %result = pto.vlds %0[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vcvt %result, %22 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %26, %9[%25], %23 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.mem_bar "VLD_VST"
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %20 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %21 = pto.addptr %20, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %10, %21, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
