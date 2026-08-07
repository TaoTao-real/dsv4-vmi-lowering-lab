module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rope_cs(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c128_i16 = arith.constant 128 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c64_i64 = arith.constant 64 : i64
      %c33024_i64 = arith.constant 33024 : i64
      %c49408_i64 = arith.constant 49408 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c32896_i64 = arith.constant 32896 : i64
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c256_i64 = arith.constant 256 : i64
      %c16_i32 = arith.constant 16 : i32
      %c32_i64 = arith.constant 32 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c16 : index
      %2 = arith.muli %0, %c32 : index
      %3 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %3, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %18, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %4 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %18 = arith.index_cast %arg6 : index to i32
        pto.store %18, %4[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %5 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.addptr %4, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %18[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %19, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %3, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmul %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %3, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_2, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result_2, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %25 = pto.addptr %4, %22 : <i32, ub> -> <i32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %4, %22 : <i32, ub> -> <i32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = pto.vcvt %result_2, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result_2, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %25 = pto.addptr %20, %22 : <i32, ub> -> <i32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_2, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %3, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.addptr %5, %22 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %3, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmuls %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %18 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %3, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vsub %result, %18, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %3, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %7 = pto.addptr %arg0, %1 : <bf16, gm> -> <bf16, gm>
      %8 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<bf16, ub>
      %9 = pto.addptr %7, %c0 : <bf16, gm> -> <bf16, gm>
      %10 = pto.addptr %8, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %19 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c16 : index
          %22 = pto.addptr %8, %21 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %22[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %23 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %24 = pto.addptr %19, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %11 = pto.addptr %arg1, %1 : <bf16, gm> -> <bf16, gm>
      %12 = pto.addptr %11, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %12, %10, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %19 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c16 : index
          %24 = pto.addptr %8, %23 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %24[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %25 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %26 = pto.addptr %19, %23 : <f32, ub> -> <f32, ub>
          pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.index_cast %22 : index to i64
          %24 = arith.muli %23, %c64_i64 : i64
          %25 = arith.addi %24, %c16384_i64 : i64
          %26 = arith.muli %23, %c128_i64 : i64
          %27 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %26 : i64 -> !pto.ptr<i32, ub>
          %29 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vgather2 %27, %result, %mask_2 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %21[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %26, %c49408_i64 : i64
          %result_4 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
          %33 = pto.addptr %32, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_4, %33[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      %13 = pto.addptr %arg2, %2 : <f32, gm> -> <f32, gm>
      %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %14, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.index_cast %20 : index to i64
          %22 = arith.muli %21, %c64_i64 : i64
          %23 = arith.addi %22, %c24576_i64 : i64
          %24 = arith.muli %21, %c128_i64 : i64
          %25 = pto.castptr %23 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.castptr %24 : i64 -> !pto.ptr<i32, ub>
          %27 = pto.addptr %26, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %27[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %28 = pto.vgather2 %25, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = arith.addi %24, %c49408_i64 : i64
          %result_2 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.castptr %29 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %result_2, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.addptr %3, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %15 = pto.addptr %arg3, %2 : <f32, gm> -> <f32, gm>
      %16 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %17 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %16, %17, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
