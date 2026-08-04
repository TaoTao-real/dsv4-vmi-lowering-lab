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
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %7, %27 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %30, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %21 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %arg5, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.pand %21, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result, %23, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %25 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %8, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %8[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result, %result_2, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %7, %27 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vexp %result, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %9 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.vdup %cst, %21 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %21 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c8 : index
          %result = pto.vlds %7[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result, %22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %7[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c8 : index
          %result = pto.vlds %7[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vdiv %22, %result, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %8[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
      }
      %10 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.vdup %cst_0, %21 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %21 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg10 : i16 to index
          %26 = arith.muli %25, %c8 : index
          %result = pto.vlds %8[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result, %22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %7[%26], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %11 = arith.muli %0, %c64 : index
      %12 = pto.addptr %arg3, %11 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %7, %12, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c32_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %13 = pto.addptr %arg1, %c4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %13, %4, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = arith.addi %5, %c4 : index
      %15 = pto.addptr %arg2, %14 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %15, %7, %c0_i64, %c8_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %7, %27 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %30, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.vdup %arg6, %21 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %21 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result, %22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %25 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %8, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpand", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpand"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %8[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result, %result_2, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %28 = pto.addptr %7, %27 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vexp %result, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texp_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texp"}
      }
      %16 = pto.alloc_tile addr = %c320_i64 valid_row = %c8 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x8xf32, valid=?x?>
      pto.vecscope {
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.vdup %cst, %21 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %21 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result, %22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %7[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vdiv %22, %result, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %8[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trecip", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trecip"}
        %25 = pto.vdup %cst_1, %21 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg10 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg10 : i16 to index
          %27 = arith.muli %26, %c8 : index
          %result = pto.vlds %8[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result, %25, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %7[%27], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %17 = arith.muli %0, %c32 : index
      %18 = pto.addptr %arg4, %17 : <f32, gm> -> <f32, gm>
      %19 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %20 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c8_i64, %c16_i64, %c0_i64, %c16_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
