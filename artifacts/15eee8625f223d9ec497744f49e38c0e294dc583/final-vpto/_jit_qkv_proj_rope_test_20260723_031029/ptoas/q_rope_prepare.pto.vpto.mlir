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
      %cst_2 = arith.constant -1.000000e+00 : f32
      %c512 = arith.constant 512 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %2 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %21 = pto.vdup %cst, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg8 : i16 to index
          %23 = arith.muli %22, %c64 : index
          pto.vsts %21, %2[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %3 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg8 = %c0 to %c64 step %c1 {
        %19 = arith.index_cast %arg8 : index to i32
        pto.store %19, %3[%arg8] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %4 = pto.castptr %c10752_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vcvt %result, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %20, %4[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %result_3 = pto.vlds %2[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result_3, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %2[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %26 = pto.vmuls %25, %cst_0, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %4[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %result_3 = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vcvt %result_3, %19 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %25, %3[%24], %21 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %result_3 = pto.vlds %3[%24] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %25 = pto.vcvt %result_3, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %4[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %26 = pto.vcvt %25, %19 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %26, %22[%24], %21 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg8 : i16 to index
          %24 = arith.muli %23, %c64 : index
          %result_3 = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmuls %result_3, %cst_1, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %2[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vsub %result_4, %25, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %4[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %27 = pto.vadds %result_4, %cst, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmuls %26, %cst_1, %21 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %5[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = pto.vsub %27, %28, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %2[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %6 = pto.alloc_tile addr = %c8704_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xi32, valid=?x?>
      %7 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<i32, ub>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg8 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %result = pto.vlds %2[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result, %19 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %23, %7[%22], %20 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %4[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_3, %cst_1, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %4[%22], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %8 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg8 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %result = pto.vlds %4[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vadds %result, %cst_2, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %4[%21], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %9 = arith.muli %0, %c512 : index
      %10 = pto.addptr %arg0, %9 : <bf16, gm> -> <bf16, gm>
      %11 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %12 = pto.addptr %arg1, %9 : <bf16, gm> -> <bf16, gm>
      %13 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg8 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %22 = pto.addptr %11, %21 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %22[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %23 = pto.vcvt %result, %19 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %24 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %20 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg8 : i16 to index
          %25 = arith.muli %24, %c64 : index
          %26 = pto.addptr %13, %25 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %26[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %27 = pto.vcvt %result, %19 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %28 = pto.addptr %20, %25 : <f32, ub> -> <f32, ub>
          pto.vsts %27, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %21 = pto.castptr %c8448_i64 : i64 -> !pto.ptr<f32, ub>
        %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
        %23 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg8 : i16 to index
          %25 = arith.index_cast %24 : index to i64
          %26 = arith.muli %25, %c256_i64 : i64
          %27 = arith.addi %26, %c2048_i64 : i64
          %28 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
          %29 = pto.castptr %26 : i64 -> !pto.ptr<i32, ub>
          %30 = pto.addptr %29, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = pto.vgather2 %28, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = arith.addi %26, %c6144_i64 : i64
          %33 = pto.castptr %32 : i64 -> !pto.ptr<f32, ub>
          %result_3 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_3, %33[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.castptr %c8448_i64 : i64 -> !pto.ptr<f32, ub>
        %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg8 : i16 to index
          %23 = arith.index_cast %22 : index to i64
          %24 = arith.muli %23, %c256_i64 : i64
          %25 = arith.addi %24, %c4096_i64 : i64
          %26 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          %27 = pto.castptr %24 : i64 -> !pto.ptr<i32, ub>
          %28 = pto.addptr %27, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %29 = pto.vgather2 %26, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = arith.addi %24, %c2048_i64 : i64
          %31 = pto.castptr %30 : i64 -> !pto.ptr<f32, ub>
          %result_3 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_3, %31[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %14 = pto.alloc_tile addr = %c10752_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg8 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg8 : i16 to index
          %22 = arith.muli %21, %c64 : index
          %result = pto.vlds %5[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %4[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmul %result, %result_3, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %4[%22], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      %15 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.addptr %arg2, %9 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %17 = pto.addptr %arg3, %9 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %4, %17, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %18 = pto.addptr %arg4, %9 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %7, %18, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
