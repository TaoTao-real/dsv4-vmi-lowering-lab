module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @split_pre_post(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: f32, %arg6: f32, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c288_i64 = arith.constant 288 : i64
      %c320_i64 = arith.constant 320 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8 = arith.constant 8 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 9.99999997E-7 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0 = arith.constant 0 : index
      %c16_i64 = arith.constant 16 : i64
      %c256 = arith.constant 256 : index
      %c8_i32 = arith.constant 8 : i32
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.castptr %c288_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %arg1, %4, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %5 = arith.muli %0, %c256 : index
      %6 = pto.addptr %arg2, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c320_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.addptr %3, %19 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vmul %result, %23, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmuls %result, %arg5, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %17 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %18, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.addptr %17, %20 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vadds %result, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %18 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vdiv %18, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.addptr %17, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trecip", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg10 : i16 to index
          %20 = arith.muli %19, %c8 : index
          %21 = pto.addptr %17, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vadds %result, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.addptr %7, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %8 = arith.muli %0, %c64 : index
      %9 = pto.addptr %arg3, %8 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %9, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c32_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %10 = pto.addptr %arg1, %c4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %10, %4, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %11 = arith.addi %5, %c4 : index
      %12 = pto.addptr %arg2, %11 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %12, %7, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.addptr %3, %20 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result, %24, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result, %arg6, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %17 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vexp %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vadds %result, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %19 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vdiv %19, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trecip", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg10 : i16 to index
          %21 = arith.muli %20, %c8 : index
          %22 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %13 = arith.muli %0, %c32 : index
      %14 = pto.addptr %arg4, %13 : <f32, gm> -> <f32, gm>
      %15 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %16 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c16_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
