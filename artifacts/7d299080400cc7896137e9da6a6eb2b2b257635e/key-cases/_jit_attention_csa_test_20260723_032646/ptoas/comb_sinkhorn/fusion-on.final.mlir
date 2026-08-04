module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @comb_sinkhorn(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: f32, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %21 = pto.addptr %arg2, %c12 : <f32, gm> -> <f32, gm>
      %22 = pto.castptr %c3264_i64 : i64 -> !pto.ptr<f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %23, %24, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %25 = pto.addptr %arg2, %c16 : <f32, gm> -> <f32, gm>
      %26 = pto.castptr %c3520_i64 : i64 -> !pto.ptr<f32, ub>
      %27 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
      %28 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %27, %28, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %29 = pto.addptr %arg2, %c20 : <f32, gm> -> <f32, gm>
      %30 = pto.castptr %c3776_i64 : i64 -> !pto.ptr<f32, ub>
      %31 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
      %32 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %31, %32, %c0_i64, %c1_i64, %c16_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %33 = pto.castptr %c1824_i64 : i64 -> !pto.ptr<f32, ub>
      %34 = pto.castptr %c1856_i64 : i64 -> !pto.ptr<f32, ub>
      %35 = pto.castptr %c1888_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        %61 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %72, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %73, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %72, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %73, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %72, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %73, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmul %result, %73, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %72, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %61, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vadd %result, %result_8, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %73, %72[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %62 = pto.vdup %cst_0, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %62, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %62, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %62, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          pto.vsts %62, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        %mask_4, %scalar_out_5 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
        %63 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vsel %72, %63, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %63, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %33, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vsel %72, %63, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %63, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %34, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vsel %72, %63, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %63, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %35, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %64 = pto.castptr %c1920_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vsel %72, %63, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vmax %63, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %75 = pto.addptr %64, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %74, %75[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %65 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %66 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %67 = pto.pand %65, %mask_2, %66 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %33[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %70 = pto.vdup %result, %66 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = arith.muli %69, %c8 : index
          %result_8 = pto.vlds %7[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vsub %result_8, %70, %66 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vexp %72, %66 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %73, %7[%71], %67 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_9 = pto.vlds %34[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %74 = pto.vdup %result_9, %66 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %10[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %75 = pto.vsub %result_10, %74, %66 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %76 = pto.vexp %75, %66 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %76, %10[%71], %67 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_11 = pto.vlds %35[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %77 = pto.vdup %result_11, %66 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %13[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %78 = pto.vsub %result_12, %77, %66 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %79 = pto.vexp %78, %66 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %79, %13[%71], %67 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_13 = pto.vlds %64[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %80 = pto.vdup %result_13, %66 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %16[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %81 = pto.vsub %result_14, %80, %66 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %82 = pto.vexp %81, %66 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %16[%71], %67 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %mask_6, %scalar_out_7 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
        %68 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %68, %72, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %73, %74[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %10, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %68, %72, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.addptr %33, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %73, %74[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %13, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %68, %72, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.addptr %34, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %73, %74[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %16, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vcadd %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %73 = pto.vadd %68, %72, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.addptr %35, %69 : <f32, ub> -> <f32, ub>
          pto.vsts %73, %74[%c0], %mask_6 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %69 = arith.index_cast %arg8 : i16 to index
          %70 = arith.muli %69, %c8 : index
          %71 = pto.addptr %7, %70 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %71[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.addptr %3, %69 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %73 = pto.vdup %result_8, %mask_2 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %74 = pto.vdiv %result, %73, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %74, %71[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %36 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %62 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %63 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %64 = pto.pand %63, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %result = pto.vlds %7[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %67 = pto.vadd %result, %62, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %67, %7[%66], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %67 = pto.addptr %10, %66 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.addptr %33, %65 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vdiv %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %70, %67[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %37 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %62 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %63 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %64 = pto.pand %63, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %result = pto.vlds %10[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %67 = pto.vadd %result, %62, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %67, %10[%66], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %67 = pto.addptr %13, %66 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.addptr %34, %65 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vdiv %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %70, %67[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %38 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %62 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %63 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %64 = pto.pand %63, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %result = pto.vlds %13[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %67 = pto.vadd %result, %62, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %67, %13[%66], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %65 = arith.index_cast %arg8 : i16 to index
          %66 = arith.muli %65, %c8 : index
          %67 = pto.addptr %16, %66 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.addptr %35, %65 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %70 = pto.vdiv %result, %69, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %70, %67[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %39 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      %40 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %62 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %63 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %64 = pto.pand %63, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %result = pto.vlds %16[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.vadd %result, %62, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %68, %16[%67], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %65 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %7, %67 : <f32, ub> -> <f32, ub>
          pto.vsts %65, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %7, %67 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %68[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %10, %67 : <f32, ub> -> <f32, ub>
          pto.vsts %65, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %10, %67 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %68[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %13, %67 : <f32, ub> -> <f32, ub>
          pto.vsts %65, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %13, %67 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %68[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %16, %67 : <f32, ub> -> <f32, ub>
          pto.vsts %65, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %68 = pto.addptr %16, %67 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %68[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %68[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %66 = arith.index_cast %arg8 : i16 to index
          %67 = arith.muli %66, %c8 : index
          %result = pto.vlds %7[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %10[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.vadd %result, %result_4, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %13[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %16[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.vadd %result_5, %result_6, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %69, %18[%67], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %70 = pto.vadd %68, %69, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %71 = pto.vadd %70, %62, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %71, %40[%67], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %41 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %62 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %63 = pto.pand %62, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %64 = arith.index_cast %arg8 : i16 to index
          %65 = arith.muli %64, %c8 : index
          %result = pto.vlds %7[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %40[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = pto.vdiv %result, %result_2, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %66, %7[%65], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %42 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %62 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %63 = pto.pand %62, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %64 = arith.index_cast %arg8 : i16 to index
          %65 = arith.muli %64, %c8 : index
          %result = pto.vlds %10[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %40[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = pto.vdiv %result, %result_2, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %66, %10[%65], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %43 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %62 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %63 = pto.pand %62, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %64 = arith.index_cast %arg8 : i16 to index
          %65 = arith.muli %64, %c8 : index
          %result = pto.vlds %13[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %40[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = pto.vdiv %result, %result_2, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %66, %13[%65], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %44 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %61 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %62 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %63 = pto.pand %62, %mask, %61 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %result_7 = pto.vlds %16[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %40[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %81 = pto.vdiv %result_7, %result_8, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %81, %16[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        %64 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %65 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
        %66 = pto.vdup %cst, %61 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %67 = pto.castptr %c4032_i64 : i64 -> !pto.ptr<f32, ub>
        %68 = pto.castptr %c4288_i64 : i64 -> !pto.ptr<f32, ub>
        %69 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
        %70 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
        %71 = pto.castptr %c768_i64 : i64 -> !pto.ptr<f32, ub>
        %72 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
        %73 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        %74 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c18_i16 step %c2_i16  : i16 {
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %7, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %64, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_7 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %79 = pto.vadd %result_7, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %79, %22[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %10, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %64, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_8 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %80 = pto.vadd %result_8, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %80, %26[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %13, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %64, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_9 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %81 = pto.vadd %result_9, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %81, %30[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %16, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %64, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_10 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadd %result_10, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %67[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %7, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %22, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %10, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %26, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %13, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %30, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %16, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %67, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %result_15 = pto.vlds %18[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %22[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %89 = pto.vadd %result_15, %result_16, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %26[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %30[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vadd %result_17, %result_18, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %90, %68[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %91 = pto.vadd %89, %90, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vadd %91, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %92, %67[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %93 = pto.vdiv %result_15, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %93, %18[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %94 = pto.vdiv %result_16, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %94, %22[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %95 = pto.vdiv %result_17, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %95, %26[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %96 = pto.vdiv %result_18, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %96, %30[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %33, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_11 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vadd %result_11, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %83, %69[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %33, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_12 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %84 = pto.vadd %result_12, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %70[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %33, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_13 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %85 = pto.vadd %result_13, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %85, %71[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vcadd %result_15, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %65, %90, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.addptr %33, %87 : <f32, ub> -> <f32, ub>
            pto.vsts %91, %92[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_14 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %86 = pto.vadd %result_14, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %86, %72[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %18, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %69, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %73, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %22, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %70, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %69, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %26, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %71, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %70, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %89 = pto.addptr %30, %88 : <f32, ub> -> <f32, ub>
            %result_15 = pto.vlds %89[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.addptr %72, %87 : <f32, ub> -> <f32, ub>
            %result_16 = pto.vlds %90[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %91 = pto.vdup %result_16, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vdiv %result_15, %91, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.addptr %71, %88 : <f32, ub> -> <f32, ub>
            pto.vsts %92, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %87 = arith.index_cast %arg9 : i16 to index
            %88 = arith.muli %87, %c8 : index
            %result_15 = pto.vlds %73[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %69[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %89 = pto.vadd %result_15, %result_16, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %70[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %71[%88] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %90 = pto.vadd %result_17, %result_18, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %90, %74[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %91 = pto.vadd %89, %90, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %91, %72[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %92 = pto.vadd %91, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %92, %40[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %93 = pto.vdiv %result_15, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %93, %7[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %94 = pto.vdiv %result_16, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %94, %10[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %95 = pto.vdiv %result_17, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %95, %13[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %96 = pto.vdiv %result_18, %92, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %96, %16[%88], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %65, %82, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %64, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %75 = pto.vadd %result, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %75, %40[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %65, %82, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %64, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_4 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %76 = pto.vadd %result_4, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %76, %18[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %65, %82, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %64, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_5 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %77 = pto.vadd %result_5, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %77, %22[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %83 = pto.vadd %65, %82, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.addptr %64, %79 : <f32, ub> -> <f32, ub>
          pto.vsts %83, %84[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_6 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %78 = pto.vadd %result_6, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %78, %26[%c0], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %7, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %40, %79 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vdiv %result_7, %83, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %10, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %18, %79 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vdiv %result_7, %83, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %22, %79 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vdiv %result_7, %83, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %81 = pto.addptr %16, %80 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %81[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.addptr %26, %79 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %82[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %83 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vdiv %result_7, %83, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %79 = arith.index_cast %arg8 : i16 to index
          %80 = arith.muli %79, %c8 : index
          %result_7 = pto.vlds %7[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %10[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %81 = pto.vadd %result_7, %result_8, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %13[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %16[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %82 = pto.vadd %result_9, %result_10, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %82, %18[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %83 = pto.vadd %81, %82, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %84 = pto.vadd %83, %66, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %84, %40[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %85 = pto.vdiv %result_7, %84, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %85, %7[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %86 = pto.vdiv %result_8, %84, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %86, %10[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %87 = pto.vdiv %result_9, %84, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %87, %13[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %88 = pto.vdiv %result_10, %84, %61 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %88, %16[%80], %63 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %45 = arith.muli %0, %c128 : index
      %46 = pto.addptr %arg3, %45 : <f32, gm> -> <f32, gm>
      %47 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %48 = pto.addptr %46, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %47, %48, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %49 = arith.addi %45, %c4 : index
      %50 = pto.addptr %arg3, %49 : <f32, gm> -> <f32, gm>
      %51 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %52 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %51, %52, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %53 = arith.addi %45, %c8 : index
      %54 = pto.addptr %arg3, %53 : <f32, gm> -> <f32, gm>
      %55 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      %56 = pto.addptr %54, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %55, %56, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %57 = arith.addi %45, %c12 : index
      %58 = pto.addptr %arg3, %57 : <f32, gm> -> <f32, gm>
      %59 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      %60 = pto.addptr %58, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %59, %60, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
