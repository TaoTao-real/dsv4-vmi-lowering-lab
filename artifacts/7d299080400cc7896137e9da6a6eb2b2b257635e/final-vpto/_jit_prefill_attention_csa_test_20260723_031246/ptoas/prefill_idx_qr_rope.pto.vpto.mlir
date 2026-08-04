module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c33280_i64 = arith.constant 33280 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c41472_i64 = arith.constant 41472 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c25088_i64 = arith.constant 25088 : i64
      %c24832_i64 = arith.constant 24832 : i64
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c32_i64 = arith.constant 32 : i64
      %c512_i64 = arith.constant 512 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c64 : index
      %2 = arith.muli %0, %c32 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c33280_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %7 = pto.addptr %arg1, %2 : <f32, gm> -> <f32, gm>
      %8 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %11 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c64 : index
          %24 = pto.addptr %11, %23 : <f32, ub> -> <f32, ub>
          pto.vsts %21, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %21 = arith.index_cast %arg6 : index to i32
        pto.store %21, %12[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.addptr %12, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %21[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %22 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %24 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_2 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_0, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result_3 = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_3, %result_2, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %11[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = pto.vmul %33, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %13[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %13, %32 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %12, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %12, %32 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %33[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %34 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.addptr %13, %32 : <f32, ub> -> <f32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %27 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %13, %32 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %27, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %28 = pto.vdup %cst_1, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result_3 = pto.vlds %13[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_3, %28, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %11[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vsub %result_4, %33, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %13[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.vadd %result_4, %29, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %34, %28, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %14[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %37 = pto.vsub %35, %36, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %11[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %30 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %33 = pto.addptr %11, %32 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %35 = pto.addptr %30, %32 : <i32, ub> -> <i32, ub>
          pto.vsts %34, %35[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %31 = arith.index_cast %arg6 : i16 to index
          %32 = arith.muli %31, %c64 : index
          %result_3 = pto.vlds %13[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_3, %28, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %13[%32], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %16 = pto.castptr %c25088_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %21 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c64 : index
          %31 = pto.addptr %13, %30 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vsub %result_5, %21, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.vdup %cst, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %14, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %31[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %23 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.pand %23, %mask_2, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %result_5 = pto.vlds %14[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_5, %result, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %16[%30], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %31 = pto.addptr %14, %30 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %31[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %result_4 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.muli %29, %c32 : index
          %result_5 = pto.vlds %14[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result_5, %result_4, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %4[%30], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %26 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
        %28 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c128_i64 : i64
          %32 = arith.addi %31, %c25088_i64 : i64
          %33 = arith.muli %30, %c256_i64 : i64
          %34 = arith.addi %33, %c8192_i64 : i64
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %34 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %33, %c16384_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %40[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg6 : i16 to index
          %30 = arith.index_cast %29 : index to i64
          %31 = arith.muli %30, %c128_i64 : i64
          %32 = arith.addi %31, %c33280_i64 : i64
          %33 = arith.muli %30, %c256_i64 : i64
          %34 = arith.addi %33, %c8192_i64 : i64
          %35 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.castptr %34 : i64 -> !pto.ptr<i32, ub>
          %37 = pto.addptr %36, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %38 = pto.vgather2 %35, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %33, %c25088_i64 : i64
          %40 = pto.castptr %39 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %40[%c0], %28 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %17 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
      %19 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      %20 = pto.addptr %19, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c64 step %c32 {
        %21 = arith.addi %1, %arg6 : index
        %22 = arith.muli %21, %c128 : index
        %23 = arith.addi %22, %c64 : index
        %24 = pto.addptr %arg3, %23 : <f32, gm> -> <f32, gm>
        %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %18, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg7 : i16 to index
            %35 = arith.index_cast %34 : index to i64
            %36 = arith.muli %35, %c256_i64 : i64
            %37 = arith.addi %36, %c8192_i64 : i64
            %38 = arith.addi %36, %c41472_i64 : i64
            %39 = pto.castptr %37 : i64 -> !pto.ptr<f32, ub>
            %40 = pto.castptr %38 : i64 -> !pto.ptr<i32, ub>
            %41 = pto.addptr %40, %c0 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %42 = pto.vgather2 %39, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %42, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %43 = arith.addi %36, %c33280_i64 : i64
            %44 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
            %result_2 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_2, %44[%c0], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %34 = arith.index_cast %arg7 : i16 to index
            %35 = arith.muli %34, %c64 : index
            %result = pto.vlds %17[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %14[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vmul %result, %result_2, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %4[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %13[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result_3, %result_4, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %16[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vmul %37, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %38, %4[%35], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %39 = pto.vadd %36, %38, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %39, %17[%35], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %26 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
        pto.vecscope {
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg7 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %result = pto.vlds %17[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vcvt %result, %30 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %34, %19[%33], %31 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %27 = arith.muli %21, %c64 : index
        %28 = pto.addptr %arg2, %27 : <bf16, gm> -> <bf16, gm>
        %29 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %20, %29, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
