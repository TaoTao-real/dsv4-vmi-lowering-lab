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
      %c128 = arith.constant 128 : index
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
        %24 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %4 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %24 = arith.index_cast %arg6 : index to i32
        pto.store %24, %4[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %5 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.addptr %4, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %25 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %25, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %7 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pand %24, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result_2 = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_2, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %3[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %8 = pto.alloc_tile addr = %c49408_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_0, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %result = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %5[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %5, %30 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %33 = pto.addptr %4, %30 : <i32, ub> -> <i32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %4, %30 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %31[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %32 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.addptr %5, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %28 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %5, %30 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %33 = pto.addptr %28, %30 : <i32, ub> -> <i32, ub>
          pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %9 = pto.alloc_tile addr = %c49408_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %5[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %10 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %26 = pto.pand %25, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vsub %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %3[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %11 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %result = pto.vlds %3[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %3[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %28 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %3, %30 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result, %28, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %3, %30 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %12 = pto.addptr %arg0, %1 : <bf16, gm> -> <bf16, gm>
      %13 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<bf16, ub>
      %14 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
      %15 = pto.addptr %13, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %14, %15, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %25 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg6 : i16 to index
          %27 = arith.muli %26, %c16 : index
          %28 = pto.addptr %13, %27 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %28[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %29 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %30 = pto.addptr %25, %27 : <f32, ub> -> <f32, ub>
          pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %16 = pto.addptr %arg1, %1 : <bf16, gm> -> <bf16, gm>
      %17 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %17, %15, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %25 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c16 : index
          %33 = pto.addptr %13, %32 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %33[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %34 = pto.vcvt %result, %24 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %35 = pto.addptr %25, %32 : <f32, ub> -> <f32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        %28 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %29 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %30 = pto.pand %29, %mask_2, %28 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.index_cast %31 : index to i64
          %33 = arith.muli %32, %c64_i64 : i64
          %34 = arith.addi %33, %c16384_i64 : i64
          %35 = arith.muli %32, %c128_i64 : i64
          %36 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %37 = pto.castptr %35 : i64 -> !pto.ptr<i32, ub>
          %38 = pto.addptr %37, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %38[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %39 = pto.vgather2 %36, %result, %mask_2 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %39, %27[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = arith.addi %35, %c49408_i64 : i64
          %41 = pto.castptr %40 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %41[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %18 = pto.addptr %arg2, %2 : <f32, gm> -> <f32, gm>
      %19 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %19, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        %25 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
        %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %27 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %28 = pto.pand %27, %mask, %26 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c64_i64 : i64
          %32 = arith.addi %31, %c24576_i64 : i64
          %33 = arith.muli %30, %c128_i64 : i64
          %34 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.castptr %33 : i64 -> !pto.ptr<i32, ub>
          %36 = pto.addptr %35, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %36[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %37 = pto.vgather2 %34, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = arith.addi %33, %c49408_i64 : i64
          %39 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %39[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %20 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %26 = pto.pand %25, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %3[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %21 = pto.addptr %arg3, %2 : <f32, gm> -> <f32, gm>
      %22 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %22, %23, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

