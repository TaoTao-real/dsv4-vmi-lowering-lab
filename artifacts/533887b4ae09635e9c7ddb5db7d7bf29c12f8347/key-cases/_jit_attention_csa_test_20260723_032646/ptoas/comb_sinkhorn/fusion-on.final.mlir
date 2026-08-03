module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @comb_sinkhorn(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: f32, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      %c18 = arith.constant 18 : index
      %c2 = arith.constant 2 : index
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
      %36 = pto.castptr %c1920_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        %86 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %3, %89 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmul %result, %93, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vadd %result, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %93, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %3, %89 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmul %result, %93, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vadd %result, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %93, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %3, %89 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmul %result, %93, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vadd %result, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %93, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %3, %89 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vdup %result_6, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmul %result, %93, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vmuls %result, %arg4, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %86, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vadd %result, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %93, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.vdup %cst_0, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %87, %91[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %87, %91[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %87, %91[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %87, %91[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %91[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        %mask_4, %scalar_out_5 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
        %88 = pto.vbr %cst_0 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %7, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vsel %92, %88, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmax %88, %93, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %33, %89 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %10, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vsel %92, %88, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmax %88, %93, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %34, %89 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %13, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vsel %92, %88, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmax %88, %93, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %35, %89 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %91 = pto.addptr %16, %90 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %91[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vcmax %result, %mask_2 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %93 = pto.vsel %92, %88, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vmax %88, %93, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %36, %89 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_4 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
      }
      %37 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %87 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pand %86, %mask, %87 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %33[%89] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = pto.vdup %result, %87 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = arith.muli %89, %c8 : index
          %result_2 = pto.vlds %7[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vsub %result_2, %90, %87 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %7[%91], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      }
      %38 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %7[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vexp %result, %86 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %7[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %39 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %34[%89] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = pto.vdup %result, %86 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = arith.muli %89, %c8 : index
          %result_2 = pto.vlds %10[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vsub %result_2, %90, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %10[%91], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      }
      %40 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %10[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vexp %result, %86 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %10[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %41 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %35[%89] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = pto.vdup %result, %86 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = arith.muli %89, %c8 : index
          %result_2 = pto.vlds %13[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vsub %result_2, %90, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %13[%91], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      }
      %42 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %13[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vexp %result, %86 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %13[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %43 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %result = pto.vlds %36[%89] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %90 = pto.vdup %result, %86 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %91 = arith.muli %89, %c8 : index
          %result_2 = pto.vlds %16[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vsub %result_2, %90, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %16[%91], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandsub"}
      }
      %44 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %16[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vexp %result, %86 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %16[%91], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
        %89 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %7, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vadd %89, %93, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %3, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %10, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vadd %89, %93, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %33, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %13, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vadd %89, %93, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %34, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %16, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vcadd %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %94 = pto.vadd %89, %93, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.addptr %35, %90 : <f32, ub> -> <f32, ub>
          pto.vsts %94, %95[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %7, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.addptr %3, %90 : <f32, ub> -> <f32, ub>
          %result_4 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %94 = pto.vdup %result_4, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.vdiv %result, %94, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %95, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %45 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %7[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %7[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %10, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.addptr %33, %90 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %94 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.vdiv %result, %94, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %95, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %46 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %10[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %10[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %13, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.addptr %34, %90 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %94 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.vdiv %result, %94, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %95, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %47 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %13[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %13[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %92 = pto.addptr %16, %91 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %92[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.addptr %35, %90 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %94 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %95 = pto.vdiv %result, %94, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %95, %92[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %48 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=3>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %result = pto.vlds %16[%92] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %93 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %93, %16[%92], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        %90 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %7, %92 : <f32, ub> -> <f32, ub>
          pto.vsts %90, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c4_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %7, %92 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %93[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %10, %92 : <f32, ub> -> <f32, ub>
          pto.vsts %90, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %10, %92 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %93[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %13, %92 : <f32, ub> -> <f32, ub>
          pto.vsts %90, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %13, %92 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %93[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %16, %92 : <f32, ub> -> <f32, ub>
          pto.vsts %90, %93[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %91 = arith.index_cast %arg8 : i16 to index
          %92 = arith.muli %91, %c8 : index
          %93 = pto.addptr %16, %92 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %93[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result, %93[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tfillpad", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tfillpad"}
      }
      %49 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      %50 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %7[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %10[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %50[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %51 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %13[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %16[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %18[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %52 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %18[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %50[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %53 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %50[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %54 = pto.alloc_tile addr = %c1984_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %7[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %7[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %55 = pto.alloc_tile addr = %c2240_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %10[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %10[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %56 = pto.alloc_tile addr = %c2752_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %13[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %13[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %57 = pto.alloc_tile addr = %c3008_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %16[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %16[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %58 = pto.castptr %c4032_i64 : i64 -> !pto.ptr<f32, ub>
      %59 = pto.castptr %c4288_i64 : i64 -> !pto.ptr<f32, ub>
      %60 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      %61 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
      %62 = pto.castptr %c768_i64 : i64 -> !pto.ptr<f32, ub>
      %63 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, ub>
      %64 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %65 = pto.castptr %c1280_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c18 step %c2 {
        pto.vecscope {
          %98 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
          %99 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %7, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %99, %111, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %98, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %100 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %101 = pto.vdup %cst, %100 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %102 = pto.vadd %result, %101, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %103 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %104 = pto.pand %103, %mask, %100 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %102, %22[%c0], %104 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %10, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %99, %111, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %98, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_4 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %105 = pto.vadd %result_4, %101, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %105, %26[%c0], %104 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %13, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %99, %111, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %98, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_5 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %106 = pto.vadd %result_5, %101, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %106, %30[%c0], %104 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %16, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %99, %111, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %98, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_6 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %107 = pto.vadd %result_6, %101, %100 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %107, %58[%c0], %104 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %7, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.addptr %22, %108 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %111[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %112 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vdiv %result_7, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.addptr %18, %109 : <f32, ub> -> <f32, ub>
            pto.vsts %113, %114[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %10, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.addptr %26, %108 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %111[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %112 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vdiv %result_7, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.addptr %22, %109 : <f32, ub> -> <f32, ub>
            pto.vsts %113, %114[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %13, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.addptr %30, %108 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %111[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %112 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vdiv %result_7, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.addptr %26, %109 : <f32, ub> -> <f32, ub>
            pto.vsts %113, %114[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %108 = arith.index_cast %arg9 : i16 to index
            %109 = arith.muli %108, %c8 : index
            %110 = pto.addptr %16, %109 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.addptr %58, %108 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %111[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %112 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vdiv %result_7, %112, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.addptr %30, %109 : <f32, ub> -> <f32, ub>
            pto.vsts %113, %114[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        }
        %86 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %18[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %22[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %58[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %87 = pto.alloc_tile addr = %c4288_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %26[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %30[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %59[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %88 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %58[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %59[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %58[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %89 = pto.alloc_tile addr = %c4032_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %99 = pto.vdup %cst, %98 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %100 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %101 = pto.pand %100, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %58[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vadd %result, %99, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %58[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        }
        %90 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %18[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %58[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %18[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
        %91 = pto.alloc_tile addr = %c3264_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %22[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %58[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %22[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
        %92 = pto.alloc_tile addr = %c3520_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %26[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %58[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %26[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
        %93 = pto.alloc_tile addr = %c3776_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %result_7 = pto.vlds %30[%108] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %58[%108] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %109 = pto.vdiv %result_7, %result_8, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %109, %30[%108], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          %101 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
          %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %18, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %101, %110, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.addptr %33, %107 : <f32, ub> -> <f32, ub>
            pto.vsts %111, %112[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %102 = pto.vdup %cst, %98 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %103 = pto.vadd %result, %102, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %103, %60[%c0], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %22, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %101, %110, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.addptr %33, %107 : <f32, ub> -> <f32, ub>
            pto.vsts %111, %112[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_4 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %104 = pto.vadd %result_4, %102, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %104, %61[%c0], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %26, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %101, %110, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.addptr %33, %107 : <f32, ub> -> <f32, ub>
            pto.vsts %111, %112[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_5 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %105 = pto.vadd %result_5, %102, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %105, %62[%c0], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %30, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %101, %110, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.addptr %33, %107 : <f32, ub> -> <f32, ub>
            pto.vsts %111, %112[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result_6 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %106 = pto.vadd %result_6, %102, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %106, %63[%c0], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %18, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.addptr %60, %107 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vdiv %result_7, %111, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %64, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %22, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.addptr %61, %107 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vdiv %result_7, %111, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %60, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %26, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.addptr %62, %107 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vdiv %result_7, %111, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %61, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %107 = arith.index_cast %arg9 : i16 to index
            %108 = arith.muli %107, %c8 : index
            %109 = pto.addptr %30, %108 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %109[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %110 = pto.addptr %63, %107 : <f32, ub> -> <f32, ub>
            %result_8 = pto.vlds %110[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %111 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vdiv %result_7, %111, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.addptr %62, %108 : <f32, ub> -> <f32, ub>
            pto.vsts %112, %113[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        }
        %94 = pto.alloc_tile addr = %c1024_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %64[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %60[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %63[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %95 = pto.alloc_tile addr = %c1280_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %61[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %62[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %65[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %96 = pto.alloc_tile addr = %c1024_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %99 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %100 = pto.pand %99, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %101 = arith.index_cast %arg9 : i16 to index
            %102 = arith.muli %101, %c8 : index
            %result = pto.vlds %63[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %65[%102] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %103 = pto.vadd %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %103, %63[%102], %100 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        }
        %97 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
        pto.vecscope {
          %98 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %99 = pto.vdup %cst, %98 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %100 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %101 = pto.pand %100, %mask, %98 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %63[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vadd %result, %99, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %50[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %64[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %50[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %7[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %60[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %50[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %10[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %61[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %50[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %13[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %102 = arith.index_cast %arg9 : i16 to index
            %103 = arith.muli %102, %c8 : index
            %result = pto.vlds %62[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %50[%103] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %104 = pto.vdiv %result, %result_2, %98 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %104, %16[%103], %101 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        }
      }
      pto.vecscope {
        %86 = pto.castptr %c1792_i64 : i64 -> !pto.ptr<f32, ub>
        %87 = pto.vbr %cst_1 : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %mask_2, %scalar_out_3 = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"} : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %7, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %100 = pto.vadd %87, %99, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.addptr %86, %96 : <f32, ub> -> <f32, ub>
          pto.vsts %100, %101[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %88 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %89 = pto.vdup %cst, %88 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %90 = pto.vadd %result, %89, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %91 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %92 = pto.pand %91, %mask, %88 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %90, %50[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %10, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %100 = pto.vadd %87, %99, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.addptr %86, %96 : <f32, ub> -> <f32, ub>
          pto.vsts %100, %101[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_4 = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %93 = pto.vadd %result_4, %89, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %93, %18[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %13, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %100 = pto.vadd %87, %99, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.addptr %86, %96 : <f32, ub> -> <f32, ub>
          pto.vsts %100, %101[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_5 = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %94 = pto.vadd %result_5, %89, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %94, %22[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %16, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.vcadd %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %100 = pto.vadd %87, %99, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.addptr %86, %96 : <f32, ub> -> <f32, ub>
          pto.vsts %100, %101[%c0], %mask_2 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowsum", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        %result_6 = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %95 = pto.vadd %result_6, %89, %88 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %95, %26[%c0], %92 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %7, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.addptr %50, %96 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %99[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %100 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.vdiv %result_7, %100, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %101, %98[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %10, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.addptr %18, %96 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %99[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %100 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.vdiv %result_7, %100, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %101, %98[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %13, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.addptr %22, %96 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %99[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %100 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.vdiv %result_7, %100, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %101, %98[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %96 = arith.index_cast %arg8 : i16 to index
          %97 = arith.muli %96, %c8 : index
          %98 = pto.addptr %16, %97 : <f32, ub> -> <f32, ub>
          %result_7 = pto.vlds %98[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %99 = pto.addptr %26, %96 : <f32, ub> -> <f32, ub>
          %result_8 = pto.vlds %99[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %100 = pto.vdup %result_8, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %101 = pto.vdiv %result_7, %100, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %101, %98[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
      }
      %66 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %7[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %10[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %50[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %67 = pto.alloc_tile addr = %c2496_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %13[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %16[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %18[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %68 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %87 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %88 = pto.pand %87, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %89 = arith.index_cast %arg8 : i16 to index
          %90 = arith.muli %89, %c8 : index
          %result = pto.vlds %50[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %18[%90] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %91 = pto.vadd %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %91, %50[%90], %88 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %69 = pto.alloc_tile addr = %c1536_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?, pad=1>
      pto.vecscope {
        %86 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %87 = pto.vdup %cst, %86 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %88 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %89 = pto.pand %88, %mask, %86 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vadd %result, %87, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %50[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %7[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %7[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %10[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %10[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %13[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %13[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %90 = arith.index_cast %arg8 : i16 to index
          %91 = arith.muli %90, %c8 : index
          %result = pto.vlds %16[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %50[%91] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %92 = pto.vdiv %result, %result_2, %86 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %92, %16[%91], %89 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tdiv", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tdiv"}
      }
      %70 = arith.muli %0, %c128 : index
      %71 = pto.addptr %arg3, %70 : <f32, gm> -> <f32, gm>
      %72 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %73 = pto.addptr %71, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %72, %73, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %74 = arith.addi %70, %c4 : index
      %75 = pto.addptr %arg3, %74 : <f32, gm> -> <f32, gm>
      %76 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %77 = pto.addptr %75, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %76, %77, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %78 = arith.addi %70, %c8 : index
      %79 = pto.addptr %arg3, %78 : <f32, gm> -> <f32, gm>
      %80 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      %81 = pto.addptr %79, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %80, %81, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %82 = arith.addi %70, %c12 : index
      %83 = pto.addptr %arg3, %82 : <f32, gm> -> <f32, gm>
      %84 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      %85 = pto.addptr %83, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %84, %85, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c64_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

