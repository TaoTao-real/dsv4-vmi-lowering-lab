module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rmsnorm_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c64_i32 = arith.constant 64 : i32
      %cst_5 = arith.constant -1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
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
      %0 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg5 : i16 to index
          %32 = arith.muli %31, %c32 : index
          %33 = pto.addptr %0, %32 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg5 : i16 to index
          %32 = arith.muli %31, %c32 : index
          %33 = pto.addptr %1, %32 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c32 : index
          %32 = pto.addptr %2, %31 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.addptr %0, %31 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
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
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %30 = arith.index_cast %arg5 : i16 to index
          %31 = arith.muli %30, %c32 : index
          %32 = pto.addptr %2, %31 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.addptr %1, %31 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %6 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %30, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %30 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %31, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg6 : i16 to index
            %35 = arith.muli %34, %c64 : index
            %result = pto.vlds %2[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %8[%35], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %32 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
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
          %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.vcadd %result, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vcadd %result_6, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vcadd %result_7, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcadd %result_8, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcadd %result_9, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcadd %result_10, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcadd %result_11, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcadd %result_12, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcadd %result_13, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcadd %result_14, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcadd %result_15, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcadd %result_16, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcadd %result_17, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcadd %result_18, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcadd %result_19, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcadd %result_20, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          pto.vsts %34, %32[%c0], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %32[%c1], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %32[%c2], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %32[%c3], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %32[%c4], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %32[%c5], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %32[%c6], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %32[%c7], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %32[%c8], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %32[%c9], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %32[%c10], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %32[%c11], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %32[%c12], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %32[%c13], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %32[%c14], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %32[%c15], %50 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_21 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
          %result_22 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %52 = pto.vadd %result_21, %result_22, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %30, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.vadds %result_6, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %31, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %32 = pto.vsqrt %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_8 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %33 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %34 = pto.vdiv %33, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID3>]
      %10 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %10, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<bf16, ub>
      %12 = pto.addptr %arg3, %c0 : <bf16, gm> -> <bf16, gm>
      %13 = pto.addptr %11, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %14 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %31 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        pto.vsts %31, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %34 = arith.index_cast %arg5 : i16 to index
          %result_6 = pto.vlds %9[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vdup %result_6, %33 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = arith.muli %34, %c64 : index
          %result_7 = pto.vlds %2[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_7, %35, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %2[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %15 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %result_6 = pto.vlds %2[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_6, %result, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %2[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %32 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %2, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result_6, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %37 = pto.addptr %32, %34 : <bf16, ub> -> <bf16, ub>
          pto.vsts %36, %37[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %16 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.addptr %16, %c0 : <bf16, ub> -> <bf16, ub>
      %18 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %17, %18, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %19 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %20, %4, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %21 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %22 = pto.addptr %21, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %22, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %result = pto.vlds %13[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %30 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %31 = pto.vcvt %result, %30 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        pto.vsts %31, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg5 : i16 to index
          %result_6 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vdup %result_6, %30 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = arith.muli %32, %c64 : index
          %result_7 = pto.vlds %2[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_7, %33, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %35, %result, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %2[%34], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vdup %cst_2, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          pto.vsts %31, %8[%34], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %24 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %30 = arith.index_cast %arg5 : index to i32
        pto.store %30, %24[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %25 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vcvt %result, %30 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %31, %6[%c0], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_6 = pto.vlds %8[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_6, %31, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %8[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = pto.vmuls %37, %cst_3, %32 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_6 = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vcvt %result_6, %30 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %37, %24[%36], %32 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %33 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_6 = pto.vlds %24[%36] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = pto.vcvt %result_6, %30 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %6[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = pto.vcvt %37, %30 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %38, %33[%36], %32 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_6 = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmuls %result_6, %cst_4, %32 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %8[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vsub %result_7, %37, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = pto.vadds %result_7, %cst_2, %32 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmuls %38, %cst_4, %32 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %25[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = pto.vsub %39, %40, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %8[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %34 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %35 = arith.index_cast %arg5 : i16 to index
          %36 = arith.muli %35, %c64 : index
          %result_6 = pto.vlds %8[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vcvt %result_6, %30 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %37, %34[%36], %32 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %6[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmuls %result_7, %cst_4, %32 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %26 = pto.alloc_tile addr = %c12352_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %30 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg5 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vadds %result, %cst_5, %30 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%37], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %31 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg5 : i16 to index
          %37 = arith.index_cast %36 : index to i64
          %38 = arith.muli %37, %c128_i64 : i64
          %39 = arith.addi %38, %c25152_i64 : i64
          %40 = arith.muli %37, %c256_i64 : i64
          %41 = arith.addi %40, %c16448_i64 : i64
          %42 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %43 = pto.castptr %41 : i64 -> !pto.ptr<i32, ub>
          %44 = pto.addptr %43, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %44[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %45 = pto.vgather2 %42, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = arith.addi %40, %c20544_i64 : i64
          %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %47[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg5 : i16 to index
          %37 = arith.index_cast %36 : index to i64
          %38 = arith.muli %37, %c128_i64 : i64
          %39 = arith.addi %38, %c29248_i64 : i64
          %40 = arith.muli %37, %c256_i64 : i64
          %41 = arith.addi %40, %c16448_i64 : i64
          %42 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %43 = pto.castptr %41 : i64 -> !pto.ptr<i32, ub>
          %44 = pto.addptr %43, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %44[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %45 = pto.vgather2 %42, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = arith.addi %40, %c25152_i64 : i64
          %47 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %47[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %33 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg5 : i16 to index
          %37 = arith.index_cast %36 : index to i64
          %38 = arith.muli %37, %c256_i64 : i64
          %39 = arith.addi %38, %c4096_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %41 = pto.castptr %38 : i64 -> !pto.ptr<i32, ub>
          %42 = pto.addptr %41, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %42[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %43 = pto.vgather2 %40, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = arith.addi %38, %c16448_i64 : i64
          %45 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %45[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %36 = arith.index_cast %arg5 : i16 to index
          %37 = arith.muli %36, %c64 : index
          %result = pto.vlds %2[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %25[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result, %result_6, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %2[%37], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_7 = pto.vlds %9[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %6[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_7, %result_8, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %0[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.vmul %39, %result_9, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %8[%37], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %27 = pto.alloc_tile addr = %c4096_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg5 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %result = pto.vlds %2[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %8[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result, %result_6, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %2[%33], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %32 = arith.index_cast %arg5 : i16 to index
          %33 = arith.muli %32, %c64 : index
          %34 = pto.addptr %2, %33 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %36 = pto.addptr %16, %33 : <bf16, ub> -> <bf16, ub>
          pto.vsts %35, %36[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %28 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %29 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %17, %29, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
