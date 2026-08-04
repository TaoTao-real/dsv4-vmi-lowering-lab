module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @q_rope_prepare(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c8704_i64 = arith.constant 8704 : i64
      %c10752_i64 = arith.constant 10752 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c8448_i64 = arith.constant 8448 : i64
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c64_i32 = arith.constant 64 : i32
      %c512 = arith.constant 512 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg8 : i16 to index
          %20 = arith.muli %19, %c64 : index
          %21 = pto.addptr %1, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %18, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %18 = arith.index_cast %arg8 : index to i32
        pto.store %18, %2[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %3 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %18[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_2 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst_0, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result_3 = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_3, %result_2, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %1[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = pto.vmul %29, %23, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %3[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %29 = pto.addptr %3, %28 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %31 = pto.addptr %2, %28 : <i32, ub> -> <i32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %29 = pto.addptr %2, %28 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.addptr %3, %28 : <f32, ub> -> <f32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %29 = pto.addptr %3, %28 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %31 = pto.addptr %24, %28 : <i32, ub> -> <i32, ub>
          pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %25 = pto.vdup %cst_1, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.vdup %cst, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg8 : i16 to index
          %28 = arith.muli %27, %c64 : index
          %result_3 = pto.vlds %3[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_3, %25, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %1[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vsub %result_4, %29, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %3[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.vadd %result_4, %26, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmul %30, %25, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %4[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %33 = pto.vsub %31, %32, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %1[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %5 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xi32, valid=?x?>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg8 : i16 to index
          %20 = arith.muli %19, %c64 : index
          %21 = pto.addptr %1, %20 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %23 = pto.addptr %18, %20 : <i32, ub> -> <i32, ub>
          pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %6 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %19 = pto.vdup %cst_1, %18 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg8 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %result = pto.vlds %3[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmul %result, %19, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %3[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %21 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg8 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %24 = pto.addptr %3, %23 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result, %21, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %7 = arith.muli %0, %c512 : index
      %8 = pto.addptr %arg0, %7 : <bf16, gm> -> <bf16, gm>
      %9 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %8, %9, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %10 = pto.addptr %arg1, %7 : <bf16, gm> -> <bf16, gm>
      %11 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %18 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %25 = pto.addptr %9, %24 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %25[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %26 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %27 = pto.addptr %4, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %26, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %19 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %25 = pto.addptr %11, %24 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %25[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %26 = pto.vcvt %result, %18 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %27 = pto.addptr %19, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %26, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %20 = pto.castptr %c8448_i64 : i64 -> !pto.ptr<f32, ub>
        %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
        %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.index_cast %23 : index to i64
          %25 = arith.muli %24, %c256_i64 : i64
          %26 = arith.addi %25, %c2048_i64 : i64
          %27 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %25 : i64 -> !pto.ptr<i32, ub>
          %29 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vgather2 %27, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %25, %c6144_i64 : i64
          %32 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %32[%c0], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.index_cast %23 : index to i64
          %25 = arith.muli %24, %c256_i64 : i64
          %26 = arith.addi %25, %c4096_i64 : i64
          %27 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          %28 = pto.castptr %25 : i64 -> !pto.ptr<i32, ub>
          %29 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = pto.vgather2 %27, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %21[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %25, %c2048_i64 : i64
          %32 = pto.castptr %31 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %32[%c0], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %12 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg8 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %result = pto.vlds %4[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %3[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmul %result, %result_2, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %3[%21], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %13 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.addptr %arg2, %7 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %15 = pto.addptr %arg3, %7 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %15, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %16 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<i32, ub>
      %17 = pto.addptr %arg4, %7 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %16, %17, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
