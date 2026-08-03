module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rope_cs(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c4608_i64 = arith.constant 4608 : i64
      %c6656_i64 = arith.constant 6656 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c3072_i64 = arith.constant 3072 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c4352_i64 = arith.constant 4352 : i64
      %c8 = arith.constant 8 : index
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %c8_i64 = arith.constant 8 : i64
      %c32_i32 = arith.constant 32 : i32
      %c64_i64 = arith.constant 64 : i64
      %c64_i32 = arith.constant 64 : i32
      %0 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c64 : index
          %20 = pto.addptr %0, %19 : <f32, ub> -> <f32, ub>
          pto.vsts %17, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg4 = %c0 to %c64 step %c1 {
        %17 = arith.index_cast %arg4 : index to i32
        pto.store %17, %1[%arg4] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %2 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.addptr %1, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %17[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %18 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %18, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.muli %19, %c64 : index
          %result_2 = pto.vlds %0[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vmul %result_2, %result, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %0[%20], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %5 = pto.alloc_tile addr = %c6656_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.vdup %cst_0, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %result = pto.vlds %0[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmul %result, %18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %2[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %23 = pto.addptr %2, %22 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %25 = pto.addptr %1, %22 : <i32, ub> -> <i32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %23 = pto.addptr %1, %22 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.addptr %2, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %23 = pto.addptr %2, %22 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %25 = pto.addptr %20, %22 : <i32, ub> -> <i32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %6 = pto.alloc_tile addr = %c6656_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.vdup %cst_1, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %result = pto.vlds %2[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmul %result, %18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %2[%21], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %7 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.muli %19, %c64 : index
          %result = pto.vlds %0[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %2[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vsub %result, %result_2, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %0[%20], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %8 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.vdup %cst_1, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %result = pto.vlds %0[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmul %result, %18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %0[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %20 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %23 = pto.addptr %0, %22 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vsub %result, %20, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg4 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %23 = pto.addptr %0, %22 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %9 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.addptr %arg0, %c0 : <bf16, gm> -> <bf16, gm>
      %11 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %18 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %9, %20 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %21[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %22 = pto.vcvt %result, %17 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %23 = pto.addptr %18, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %12 = pto.addptr %arg1, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %12, %11, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %18 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg4 : i16 to index
          %23 = arith.muli %22, %c32 : index
          %24 = pto.addptr %9, %23 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %24[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %25 = pto.vcvt %result, %17 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %26 = pto.addptr %18, %23 : <f32, ub> -> <f32, ub>
          pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
        %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg4 : i16 to index
          %23 = arith.index_cast %22 : index to i64
          %24 = arith.muli %23, %c128_i64 : i64
          %25 = arith.addi %24, %c2048_i64 : i64
          %26 = arith.muli %23, %c256_i64 : i64
          %27 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %26 : i64 -> !pto.ptr<i32, ub>
          %29 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vgather2 %27, %result, %mask_2 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %20[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %26, %c6656_i64 : i64
          %32 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %32[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %13 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %13, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.index_cast %20 : index to i64
          %22 = arith.muli %21, %c128_i64 : i64
          %23 = arith.addi %22, %c3072_i64 : i64
          %24 = arith.muli %21, %c256_i64 : i64
          %25 = pto.castptr %23 : i64 -> !pto.ptr<f32, ub>
          %26 = pto.castptr %24 : i64 -> !pto.ptr<i32, ub>
          %27 = pto.addptr %26, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %27[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %28 = pto.vgather2 %25, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %18[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = arith.addi %24, %c6656_i64 : i64
          %30 = pto.castptr %29 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %30[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %14 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.muli %19, %c64 : index
          %result = pto.vlds %2[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %0[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vmul %result, %result_2, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %0[%20], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %15 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      %16 = pto.addptr %arg3, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

