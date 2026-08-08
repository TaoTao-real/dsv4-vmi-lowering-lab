module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @comb_sinkhorn(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: f32, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c2_i16 = arith.constant 2 : i16
      %c18_i16 = arith.constant 18 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1952_i64 = arith.constant 1952 : i64
      %c1984_i64 = arith.constant 1984 : i64
      %c2240_i64 = arith.constant 2240 : i64
      %c2752_i64 = arith.constant 2752 : i64
      %c3008_i64 = arith.constant 3008 : i64
      %c2496_i64 = arith.constant 2496 : i64
      %c3264_i64 = arith.constant 3264 : i64
      %c3520_i64 = arith.constant 3520 : i64
      %c3776_i64 = arith.constant 3776 : i64
      %c1536_i64 = arith.constant 1536 : i64
      %c1792_i64 = arith.constant 1792 : i64
      %c1824_i64 = arith.constant 1824 : i64
      %c1856_i64 = arith.constant 1856 : i64
      %c1888_i64 = arith.constant 1888 : i64
      %c1920_i64 = arith.constant 1920 : i64
      %c4032_i64 = arith.constant 4032 : i64
      %c4288_i64 = arith.constant 4288 : i64
      %c256_i64 = arith.constant 256 : i64
      %c512_i64 = arith.constant 512 : i64
      %c768_i64 = arith.constant 768 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c0_i64 = arith.constant 0 : i64
      %c1280_i64 = arith.constant 1280 : i64
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c16_i64 = arith.constant 16 : i64
      %c12 = arith.constant 12 : index
      %c20 = arith.constant 20 : index
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c1_i32 = arith.constant 1 : i32
      %cst_1 = arith.constant 0.000000e+00 : f32
      %c64_i64 = arith.constant 64 : i64
      %c8_i32 = arith.constant 8 : i32
      %c4_i32 = arith.constant 4 : i32
      %c256 = arith.constant 256 : index
      %c128 = arith.constant 128 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c1952_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = arith.muli %0, %c256 : index
      %5 = arith.addi %4, %c8 : index
      %6 = pto.addptr %arg1, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c1984_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %8 = arith.addi %4, %c12 : index
      %9 = pto.addptr %arg1, %8 : <f32, gm> -> <f32, gm>
      %10 = pto.castptr %c2240_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = arith.addi %4, %c16 : index
      %12 = pto.addptr %arg1, %11 : <f32, gm> -> <f32, gm>
      %13 = pto.castptr %c2752_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = arith.addi %4, %c20 : index
      %15 = pto.addptr %arg1, %14 : <f32, gm> -> <f32, gm>
      %16 = pto.castptr %c3008_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %17 = pto.addptr %arg2, %c8 : <f32, gm> -> <f32, gm>
      %18 = pto.castptr %c2496_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
      %20 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %19, %20, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %21 = pto.addptr %arg2, %c12 : <f32, gm> -> <f32, gm>
      %22 = pto.castptr %c3264_i64 : i64 -> !pto.ptr<f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %23, %24, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      %25 = pto.addptr %arg2, %c16 : <f32, gm> -> <f32, gm>
      %26 = pto.castptr %c3520_i64 : i64 -> !pto.ptr<f32, ub>
      %27 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
      %28 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %27, %28, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      %29 = pto.addptr %arg2, %c20 : <f32, gm> -> <f32, gm>
      %30 = pto.castptr %c3776_i64 : i64 -> !pto.ptr<f32, ub>
      %31 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
      %32 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %31, %32, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %7, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %7, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        pto.mem_bar "VST_VLD"
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %7, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        pto.mem_bar "VST_VLD"
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VLD_VST"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %13, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %13, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        pto.mem_bar "VST_VLD"
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %13, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %16, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %3, %50 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %result_11 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        pto.mem_bar "VST_VLD"
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %82[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VLD_VST"
        %mask_2, %scalar_out_3 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %50 = pto.vdup %cst_0, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        %51 = pto.castptr %c1824_i64 : i64 -> !pto.ptr<f32, ub>
        %mask_4, %scalar_out_5 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
        pto.mem_bar "VST_VLD"
        %52 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcmax %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vsel %82, %52, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vmax %52, %83, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.addptr %51, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %84, %85[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %53 = pto.castptr %c1856_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcmax %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vsel %82, %52, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vmax %52, %83, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.addptr %53, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %84, %85[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %54 = pto.castptr %c1888_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcmax %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vsel %82, %52, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vmax %52, %83, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.addptr %54, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %84, %85[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %55 = pto.castptr %c1920_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcmax %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vsel %82, %52, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vmax %52, %83, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %85 = pto.addptr %55, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %84, %85[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %51, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vsub %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vexp %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %53, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vsub %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vexp %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %54, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vsub %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vexp %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %55, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vsub %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpandsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vexp %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_texp", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        %mask_6, %scalar_out_7 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
        pto.mem_bar "VST_VLD"
        %56 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %3, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %51, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %53, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %54, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %3, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %51, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %53, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %54, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VV_ALL"
        %57 = pto.vdup %cst_1, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %57, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %57, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %57, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %57, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_11, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %18, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %18, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        pto.mem_bar "VV_ALL"
        %58 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %59 = pto.addptr %58, %c0 : <f32, ub> -> <f32, ub>
        %60 = pto.castptr %c4032_i64 : i64 -> !pto.ptr<f32, ub>
        %61 = pto.addptr %60, %c0 : <f32, ub> -> <f32, ub>
        %62 = pto.castptr %c4288_i64 : i64 -> !pto.ptr<f32, ub>
        %63 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
        %64 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
        %65 = pto.addptr %64, %c0 : <f32, ub> -> <f32, ub>
        %66 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
        %67 = pto.addptr %66, %c0 : <f32, ub> -> <f32, ub>
        %68 = pto.castptr %c768_i64 : i64 -> !pto.ptr<f32, ub>
        %69 = pto.addptr %68, %c0 : <f32, ub> -> <f32, ub>
        %70 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
        %71 = pto.addptr %70, %c0 : <f32, ub> -> <f32, ub>
        %72 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %73 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c18_i16 step %c2_i16  : i16 {
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %7, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %58, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_11 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %79 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %79, %24[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %10, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %58, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_12 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %80 = pto.vadds %result_12, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %80, %28[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %13, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %58, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_13 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %81 = pto.vadds %result_13, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %81, %32[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %16, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %58, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_14 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_14, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %61[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %7, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %22, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %10, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %26, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %13, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %30, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %16, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %60, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %62, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %62, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vadds %result_19, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %90, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %60, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %51, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_15 = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadds %result_15, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %65[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %51, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_16 = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %84 = pto.vadds %result_16, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %67[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %51, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_17 = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %85 = pto.vadds %result_17, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %85, %69[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_19, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %56, %90, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %51, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          pto.mem_bar "VST_VLD"
          %result_18 = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %86 = pto.vadds %result_18, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %86, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %64, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %72, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %66, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %64, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %68, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %66, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %70, %87 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %68, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %72, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %64, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %70, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %66, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %68, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %73, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %70, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %73, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %89[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %70, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vadds %result_19, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.addptr %49, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %90, %91[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
          pto.mem_bar "VST_VLD"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %72, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %49, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %7, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VV_ALL"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %64, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %49, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %10, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %66, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %49, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %13, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VV_ALL"
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %68, %88 : <f32, ub> -> <f32, ub>
            %result_19 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %49, %88 : <f32, ub> -> <f32, ub>
            %result_20 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdiv %result_19, %result_20, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %16, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.mem_bar "VST_VST"
          } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          pto.mem_bar "VV_ALL"
        }
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %58, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VST_VLD"
        %result = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %74 = pto.vadds %result, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %75 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
        pto.mem_bar "VST_VST"
        pto.vsts %74, %75[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %58, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VST_VLD"
        %result_8 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %76 = pto.vadds %result_8, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.mem_bar "VST_VST"
        pto.vsts %76, %20[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %58, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VST_VLD"
        %result_9 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %77 = pto.vadds %result_9, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.mem_bar "VST_VST"
        pto.vsts %77, %24[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_11, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %56, %82, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %58, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        pto.mem_bar "VST_VLD"
        %result_10 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %78 = pto.vadds %result_10, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.mem_bar "VST_VST"
        pto.vsts %78, %28[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %18, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %22, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %26, %79 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] {dist = "BRC_B32"} : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VV_ALL"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %18, %80 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %18, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadds %result_11, %cst, %mask_2 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_11 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %49, %80 : <f32, ub> -> <f32, ub>
          %result_12 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdiv %result_11, %result_12, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %81[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %10, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vdiv %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %13, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vdiv %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg8 : i16 to index
          %51 = arith.muli %50, %c8 : index
          %52 = pto.addptr %16, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.addptr %49, %51 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vdiv %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tdiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %33 = arith.muli %0, %c128 : index
      %34 = pto.addptr %arg3, %33 : <f32, gm> -> <f32, gm>
      %35 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %36 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %35, %36, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_MTE3>
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %37 = arith.addi %33, %c4 : index
      %38 = pto.addptr %arg3, %37 : <f32, gm> -> <f32, gm>
      %39 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %40 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %39, %40, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_MTE3>
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID2>]
      %41 = arith.addi %33, %c8 : index
      %42 = pto.addptr %arg3, %41 : <f32, gm> -> <f32, gm>
      %43 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      %44 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %43, %44, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_MTE3>
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID3>]
      %45 = arith.addi %33, %c12 : index
      %46 = pto.addptr %arg3, %45 : <f32, gm> -> <f32, gm>
      %47 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      %48 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %47, %48, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}

