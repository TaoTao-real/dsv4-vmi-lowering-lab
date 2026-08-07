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
        %20 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %3, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %20, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %4 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %20 = arith.index_cast %arg6 : index to i32
        pto.store %20, %4[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %5 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.addptr %4, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %20[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %21 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %21, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %22 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result_2 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.pand %22, %mask, %23 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        %25 = pto.vdup %cst_0, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result_3 = pto.vlds %3[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_3, %result_2, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %3[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.vmul %30, %25, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %5[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %5, %29 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %4, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %4, %29 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.addptr %5, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %5, %29 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %26, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.vdup %cst_1, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result_3 = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_3, %27, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %5[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %3[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vsub %result_4, %30, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %3[%29], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %7 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %21 = pto.vdup %cst_1, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %23 = pto.pand %22, %mask, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %result = pto.vlds %3[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmul %result, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %3[%26], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %24 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vsub %result, %24, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %8 = pto.addptr %arg0, %1 : <bf16, gm> -> <bf16, gm>
      %9 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<bf16, ub>
      %10 = pto.addptr %8, %c0 : <bf16, gm> -> <bf16, gm>
      %11 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %21 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c16 : index
          %24 = pto.addptr %9, %23 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %24[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %25 = pto.vcvt %result, %20 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %26 = pto.addptr %21, %23 : <f32, ub> -> <f32, ub>
          pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %12 = pto.addptr %arg1, %1 : <bf16, gm> -> <bf16, gm>
      %13 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %13, %11, %c0_i64, %c128_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %21 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c16 : index
          %29 = pto.addptr %9, %28 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %29[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %30 = pto.vcvt %result, %20 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %31 = pto.addptr %21, %28 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
        %23 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %26 = pto.pand %25, %mask_2, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.index_cast %27 : index to i64
          %29 = arith.muli %28, %c64_i64 : i64
          %30 = arith.addi %29, %c16384_i64 : i64
          %31 = arith.muli %28, %c128_i64 : i64
          %32 = pto.castptr %30 : i64 -> !pto.ptr<f32, ub>
          %33 = pto.castptr %31 : i64 -> !pto.ptr<i32, ub>
          %34 = pto.addptr %33, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %34[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %35 = pto.vgather2 %32, %result, %mask_2 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %35, %23[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %36 = arith.addi %31, %c49408_i64 : i64
          %37 = pto.castptr %36 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %37[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %14 = pto.addptr %arg2, %2 : <f32, gm> -> <f32, gm>
      %15 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %15, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %24 = pto.pand %23, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.index_cast %25 : index to i64
          %27 = arith.muli %26, %c64_i64 : i64
          %28 = arith.addi %27, %c24576_i64 : i64
          %29 = arith.muli %26, %c128_i64 : i64
          %30 = pto.castptr %28 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.castptr %29 : i64 -> !pto.ptr<i32, ub>
          %32 = pto.addptr %31, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %33 = pto.vgather2 %30, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = arith.addi %29, %c49408_i64 : i64
          %35 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %35[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %16 = pto.alloc_tile addr = %c33024_i64 valid_row = %c128 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 128x32xf32, valid=?x?>
      pto.vecscope {
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %22 = pto.pand %21, %mask, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c128_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result = pto.vlds %5[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %3[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result, %result_2, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %3[%24], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %17 = pto.addptr %arg3, %2 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %19 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %18, %19, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
