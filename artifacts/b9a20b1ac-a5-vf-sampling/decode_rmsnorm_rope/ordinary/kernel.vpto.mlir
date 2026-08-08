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
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
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
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c1_i32 = arith.constant 1 : i32
      %c4_i64 = arith.constant 4 : i64
      %c32_i32 = arith.constant 32 : i32
      %c16_i32 = arith.constant 16 : i32
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.vecscope {
        %18 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %19, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %20 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %19, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %0 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c4_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg5 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %0, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.addptr %18, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
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
        %18 = pto.castptr %c29248_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c4_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg5 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %0, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.addptr %18, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.vecscope {
        %18 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %18 = pto.addptr %arg2, %arg5 : <f32, gm> -> <f32, gm>
        %19 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %19, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %21 = arith.index_cast %arg6 : i16 to index
            %22 = arith.muli %21, %c64 : index
            %23 = pto.addptr %0, %22 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %24 = pto.vmul %result, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %25 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
            pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.vecscope {
          %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<f32, ub>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          %22 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
          %mask_5, %scalar_out_6 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.muli %27, %c64 : index
            %29 = pto.addptr %20, %28 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = pto.vcadd %result_10, %mask_5 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %31 = pto.vadd %22, %30, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.addptr %21, %27 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %mask_7, %scalar_out_8 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %23 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
          pto.mem_bar "VST_VLD"
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
          %result_9 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vadd %result, %result_9, %mask_7 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %24[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        %result = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %20 = pto.vmuls %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %20, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_5 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %21 = pto.vadds %result_5, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %21, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_6 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.vsqrt %result_6, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %22, %2[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %result_7 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        %24 = pto.vdiv %23, %result_7, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        %26 = pto.addptr %25, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %24, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
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
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %7[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %19 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %22 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %26 = pto.addptr %0, %25 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.addptr %22, %24 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %27[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %26 = pto.addptr %0, %25 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VST_VLD"
        %23 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %26 = pto.addptr %0, %25 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vcvt %result_5, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %28 = pto.addptr %23, %25 : <bf16, ub> -> <bf16, ub>
          pto.vsts %27, %28[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.mem_bar "VLD_VST"
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %8 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      %9 = pto.addptr %8, %c0 : <bf16, ub> -> <bf16, ub>
      %10 = pto.addptr %arg4, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %9, %10, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %11 = pto.addptr %arg2, %c64 : <f32, gm> -> <f32, gm>
      %12 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %12, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %13 = pto.addptr %arg3, %c64 : <bf16, gm> -> <bf16, gm>
      %14 = pto.addptr %13, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %14, %7, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %result = pto.vlds %7[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
        %19 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
        %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %24 = pto.addptr %0, %23 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %25[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vmul %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %24 = pto.addptr %0, %23 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VLD_VST"
        %21 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %24 = pto.addptr %19, %23 : <f32, ub> -> <f32, ub>
          pto.vsts %21, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %15 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg5 = %c0 to %c64 step %c1 {
        %18 = arith.index_cast %arg5 : index to i32
        pto.store %18, %15[%arg5] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.addptr %15, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %18[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.castptr %c12352_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VV_ALL"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmuls %result_5, %cst_3, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result_5, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %37 = pto.addptr %15, %34 : <i32, ub> -> <i32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %15, %34 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %36 = pto.vcvt %result_5, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        %23 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result_5, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %37 = pto.addptr %23, %34 : <i32, ub> -> <i32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vadds %result_5, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        %24 = pto.castptr %c20544_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.addptr %24, %34 : <f32, ub> -> <f32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %24, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        pto.mem_bar "VST_VLD"
        %25 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result_5, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %37 = pto.addptr %25, %34 : <i32, ub> -> <i32, ub>
          pto.vsts %36, %37[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmuls %result_5, %cst_4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        %26 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vsub %result_5, %26, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %27 = pto.castptr %c24896_i64 : i64 -> !pto.ptr<f32, ub>
        %28 = pto.addptr %27, %c0 : <f32, ub> -> <f32, ub>
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
          %result_5 = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %42 = pto.vgather2 %39, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = arith.addi %37, %c20544_i64 : i64
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
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
          %result_5 = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %42 = pto.vgather2 %39, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = arith.addi %37, %c25152_i64 : i64
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.addptr %44, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        }
        %29 = pto.castptr %c24640_i64 : i64 -> !pto.ptr<f32, ub>
        %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.index_cast %33 : index to i64
          %35 = arith.muli %34, %c256_i64 : i64
          %36 = arith.addi %35, %c4096_i64 : i64
          %37 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %38 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %39 = pto.addptr %38, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %39[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %40 = pto.vgather2 %37, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %40, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = arith.addi %35, %c16448_i64 : i64
          pto.mem_bar "VST_VLD"
          %result_6 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.castptr %41 : i64 -> !pto.ptr<f32, ub>
          %43 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_6, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        }
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %0, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %24, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.mem_bar "VV_ALL"
        %31 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %31, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %20, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          pto.vsts %37, %38[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.mem_bar "VST_VLD"
        %32 = pto.castptr %c25152_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %32, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %0, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.addptr %22, %34 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vadd %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %33 = arith.index_cast %arg5 : i16 to index
          %34 = arith.muli %33, %c64 : index
          %35 = pto.addptr %0, %34 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vcvt %result_5, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %37 = pto.addptr %8, %34 : <bf16, ub> -> <bf16, ub>
          pto.vsts %36, %37[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.mem_bar "VLD_VST"
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %16 = pto.addptr %arg4, %c64 : <bf16, gm> -> <bf16, gm>
      %17 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %9, %17, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
