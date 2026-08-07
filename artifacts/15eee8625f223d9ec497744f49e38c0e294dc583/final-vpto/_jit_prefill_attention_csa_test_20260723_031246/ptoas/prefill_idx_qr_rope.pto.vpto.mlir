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
      %c64_i32 = arith.constant 64 : i32
      %c512_i64 = arith.constant 512 : i64
      %cst_2 = arith.constant -1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c64 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %2 = arith.muli %0, %c32 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c33280_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %7 = pto.addptr %arg1, %2 : <f32, gm> -> <f32, gm>
      %8 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %11 = pto.alloc_tile addr = %c41472_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %12 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.muli %24, %c64 : index
          pto.vsts %23, %12[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %21 = arith.index_cast %arg6 : index to i32
        pto.store %21, %13[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %13[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.vcvt %result, %21 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %22, %14[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result_3 = pto.vlds %12[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmul %result_3, %22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %12[%26], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = pto.vmuls %27, %cst_0, %23 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %14[%26], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result_3 = pto.vlds %14[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vcvt %result_3, %21 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %27, %13[%26], %23 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %24 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c64 : index
          %result_3 = pto.vlds %13[%26] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %27 = pto.vcvt %result_3, %21 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %14[%26], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = pto.vcvt %27, %21 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %28, %24[%26], %23 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %15 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %result = pto.vlds %14[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vmuls %result, %cst_1, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %12[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vsub %result_3, %26, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %14[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = pto.vadds %result_3, %cst, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vmuls %27, %cst_1, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %15[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = pto.vsub %28, %29, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %12[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %23 = pto.castptr %c41472_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %result = pto.vlds %12[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vcvt %result, %22 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %26, %23[%25], %21 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %14[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmuls %result_3, %cst_1, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %14[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %result = pto.vlds %14[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vadds %result, %cst_2, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %14[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %15, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.castptr %c25088_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %15, %24 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vmul %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.addptr %21, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %26, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %22 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %25 = pto.addptr %15, %24 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.muli %24, %c32 : index
          %26 = pto.addptr %15, %25 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmul %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.addptr %4, %25 : <f32, ub> -> <f32, ub>
          pto.vsts %27, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %mask_3, %scalar_out_4 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.index_cast %24 : index to i64
          %26 = arith.muli %25, %c128_i64 : i64
          %27 = arith.addi %26, %c25088_i64 : i64
          %28 = arith.muli %25, %c256_i64 : i64
          %29 = arith.addi %28, %c8192_i64 : i64
          %30 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.castptr %29 : i64 -> !pto.ptr<i32, ub>
          %32 = pto.addptr %31, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %33 = pto.vgather2 %30, %result, %mask_3 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %22[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = arith.addi %28, %c16384_i64 : i64
          %35 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %35[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.index_cast %24 : index to i64
          %26 = arith.muli %25, %c128_i64 : i64
          %27 = arith.addi %26, %c33280_i64 : i64
          %28 = arith.muli %25, %c256_i64 : i64
          %29 = arith.addi %28, %c8192_i64 : i64
          %30 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.castptr %29 : i64 -> !pto.ptr<i32, ub>
          %32 = pto.addptr %31, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %32[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %33 = pto.vgather2 %30, %result, %mask_3 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %22[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = arith.addi %28, %c25088_i64 : i64
          %35 = pto.castptr %34 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %35[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %17 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %18 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
      %19 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      %20 = pto.addptr %19, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c64 step %c32 {
        %21 = arith.addi %1, %arg6 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %22 = arith.muli %21, %c128 : index
        %23 = arith.addi %22, %c64 : index
        %24 = pto.addptr %arg3, %23 : <f32, gm> -> <f32, gm>
        %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %18, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
          %31 = pto.addptr %30, %c0 : <f32, ub> -> <f32, ub>
          %32 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg7 : i16 to index
            %36 = arith.index_cast %35 : index to i64
            %37 = arith.muli %36, %c256_i64 : i64
            %38 = arith.addi %37, %c8192_i64 : i64
            %39 = arith.addi %37, %c41472_i64 : i64
            %40 = pto.castptr %38 : i64 -> !pto.ptr<f32, ub>
            %41 = pto.castptr %39 : i64 -> !pto.ptr<i32, ub>
            %42 = pto.addptr %41, %c0 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %42[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %43 = pto.vgather2 %40, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %44 = arith.addi %37, %c33280_i64 : i64
            %45 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
            %result_3 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            pto.vsts %result_3, %45[%c0], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %33 = pto.castptr %c25088_i64 : i64 -> !pto.ptr<f32, ub>
          %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %35 = arith.index_cast %arg7 : i16 to index
            %36 = arith.muli %35, %c64 : index
            %result = pto.vlds %17[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %15[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vmul %result, %result_3, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %17[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_4 = pto.vlds %4[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %14[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vmul %result_4, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %33[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = pto.vmul %38, %result_6, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %39, %4[%36], %32 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        %26 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
        pto.vecscope {
          %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %31 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg7 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %result = pto.vlds %17[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %4[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %34 = pto.vadd %result, %result_3, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %34, %17[%33], %31 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg7 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
            %32 = arith.index_cast %arg7 : i16 to index
            %33 = arith.muli %32, %c64 : index
            %34 = pto.addptr %17, %33 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %36 = pto.addptr %19, %33 : <bf16, ub> -> <bf16, ub>
            pto.vsts %35, %36[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %27 = arith.muli %21, %c64 : index
        %28 = pto.addptr %arg2, %27 : <bf16, gm> -> <bf16, gm>
        %29 = pto.addptr %28, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %20, %29, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
