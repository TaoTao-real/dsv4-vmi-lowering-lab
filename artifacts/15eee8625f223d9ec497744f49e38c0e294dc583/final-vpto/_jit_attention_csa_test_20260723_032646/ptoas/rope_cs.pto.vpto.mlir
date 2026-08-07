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
      %cst_2 = arith.constant -1.000000e+00 : f32
      %c64_i32 = arith.constant 64 : i32
      %0 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      %1 = pto.castptr %c4608_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %14 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.vdup %cst, %15 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg4 : i16 to index
          %18 = arith.muli %17, %c64 : index
          pto.vsts %16, %1[%18], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg4 = %c0 to %c64 step %c1 {
        %14 = arith.index_cast %arg4 : index to i32
        pto.store %14, %2[%arg4] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %3 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %2[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.vcvt %result, %14 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %15, %3[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c64 : index
          %result_3 = pto.vlds %1[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vmul %result_3, %15, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %20, %1[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %21 = pto.vmuls %20, %cst_0, %16 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %3[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c64 : index
          %result_3 = pto.vlds %3[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vcvt %result_3, %14 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %20, %2[%19], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %17 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c64 : index
          %result_3 = pto.vlds %2[%19] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %20 = pto.vcvt %result_3, %14 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %20, %3[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %21 = pto.vcvt %20, %14 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %21, %17[%19], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c64 : index
          %result_3 = pto.vlds %3[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vmuls %result_3, %cst_1, %16 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %20, %3[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %1[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vsub %result_4, %20, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %1[%19], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %14 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %15 = arith.index_cast %arg4 : i16 to index
          %16 = arith.muli %15, %c64 : index
          %result = pto.vlds %1[%16] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = pto.vmuls %result, %cst_1, %14 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %18 = pto.vadds %17, %cst_2, %14 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %18, %1[%16], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %4 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg4 : i16 to index
          %17 = arith.muli %16, %c64 : index
          %result = pto.vlds %1[%17] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %18 = pto.vneg %result, %14 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %18, %1[%17], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tneg", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %5 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %arg0, %c0 : <bf16, gm> -> <bf16, gm>
      %7 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %15 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg4 : i16 to index
          %17 = arith.muli %16, %c32 : index
          %18 = pto.addptr %5, %17 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %18[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %19 = pto.vcvt %result, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %20 = pto.addptr %15, %17 : <f32, ub> -> <f32, ub>
          pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %8 = pto.addptr %arg1, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %8, %7, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %15 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.muli %19, %c32 : index
          %21 = pto.addptr %5, %20 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %21[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %22 = pto.vcvt %result, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %23 = pto.addptr %15, %20 : <f32, ub> -> <f32, ub>
          pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_3, %scalar_out_4 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
        %17 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg4 : i16 to index
          %20 = arith.index_cast %19 : index to i64
          %21 = arith.muli %20, %c128_i64 : i64
          %22 = arith.addi %21, %c2048_i64 : i64
          %23 = arith.muli %20, %c256_i64 : i64
          %24 = pto.castptr %22 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.castptr %23 : i64 -> !pto.ptr<i32, ub>
          %26 = pto.addptr %25, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %26[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %27 = pto.vgather2 %24, %result, %mask_3 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %17[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = arith.addi %23, %c6656_i64 : i64
          %29 = pto.castptr %28 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %29[%c0], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      %9 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %9, %10, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        %15 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg4 : i16 to index
          %18 = arith.index_cast %17 : index to i64
          %19 = arith.muli %18, %c128_i64 : i64
          %20 = arith.addi %19, %c3072_i64 : i64
          %21 = arith.muli %18, %c256_i64 : i64
          %22 = pto.castptr %20 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.castptr %21 : i64 -> !pto.ptr<i32, ub>
          %24 = pto.addptr %23, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %25 = pto.vgather2 %22, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %26 = arith.addi %21, %c6656_i64 : i64
          %27 = pto.castptr %26 : i64 -> !pto.ptr<f32, ub>
          %result_3 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_3, %27[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %11 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg4 : i16 to index
          %17 = arith.muli %16, %c64 : index
          %result = pto.vlds %3[%17] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %1[%17] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %18 = pto.vmul %result, %result_3, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %18, %1[%17], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %12 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      %13 = pto.addptr %arg3, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %12, %13, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
