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
        %13 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %14 = arith.index_cast %arg4 : i16 to index
          %15 = arith.muli %14, %c64 : index
          %16 = pto.addptr %0, %15 : <f32, ub> -> <f32, ub>
          pto.vsts %13, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg4 = %c0 to %c64 step %c1 {
        %13 = arith.index_cast %arg4 : index to i32
        pto.store %13, %1[%arg4] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %2 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.addptr %1, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %13[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %14 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %14, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_2 = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %17 = pto.vdup %cst_0, %16 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %result_3 = pto.vlds %0[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmul %result_3, %result_2, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %0[%21], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %23 = pto.vmul %22, %17, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %2[%21], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %22 = pto.addptr %2, %21 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %24 = pto.addptr %1, %21 : <i32, ub> -> <i32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %22 = pto.addptr %1, %21 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %22[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %23 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.addptr %2, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %22 = pto.addptr %2, %21 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %24 = pto.addptr %18, %21 : <i32, ub> -> <i32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %19 = pto.vdup %cst_1, %16 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg4 : i16 to index
          %21 = arith.muli %20, %c64 : index
          %result_3 = pto.vlds %2[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmul %result_3, %19, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %2[%21], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %0[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vsub %result_4, %22, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %0[%21], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %4 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.vdup %cst_1, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg4 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %result = pto.vlds %0[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vmul %result, %14, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %0[%18], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %16 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg4 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %19 = pto.addptr %0, %18 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vsub %result, %16, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %20, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg4 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %19 = pto.addptr %0, %18 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %20, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
      }
      %5 = pto.castptr %c6656_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.addptr %arg0, %c0 : <bf16, gm> -> <bf16, gm>
      %7 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %14 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %15 = arith.index_cast %arg4 : i16 to index
          %16 = arith.muli %15, %c32 : index
          %17 = pto.addptr %5, %16 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %17[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %18 = pto.vcvt %result, %13 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %19 = pto.addptr %14, %16 : <f32, ub> -> <f32, ub>
          pto.vsts %18, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %8 = pto.addptr %arg1, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_gm_to_ubuf %8, %7, %c0_i64, %c8_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        %14 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.muli %18, %c32 : index
          %20 = pto.addptr %5, %19 : <bf16, ub> -> <bf16, ub>
          %result = pto.vlds %20[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %21 = pto.vcvt %result, %13 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %22 = pto.addptr %14, %19 : <f32, ub> -> <f32, ub>
          pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %15 = pto.castptr %c4352_i64 : i64 -> !pto.ptr<f32, ub>
        %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
        %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg4 : i16 to index
          %19 = arith.index_cast %18 : index to i64
          %20 = arith.muli %19, %c128_i64 : i64
          %21 = arith.addi %20, %c2048_i64 : i64
          %22 = arith.muli %19, %c256_i64 : i64
          %23 = pto.castptr %21 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.castptr %22 : i64 -> !pto.ptr<i32, ub>
          %25 = pto.addptr %24, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %25[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %26 = pto.vgather2 %23, %result, %mask_2 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %16[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %27 = arith.addi %22, %c6656_i64 : i64
          %28 = pto.castptr %27 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %28[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %9 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %9, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
        %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg4 : i16 to index
          %17 = arith.index_cast %16 : index to i64
          %18 = arith.muli %17, %c128_i64 : i64
          %19 = arith.addi %18, %c3072_i64 : i64
          %20 = arith.muli %17, %c256_i64 : i64
          %21 = pto.castptr %19 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %20 : i64 -> !pto.ptr<i32, ub>
          %23 = pto.addptr %22, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = pto.vgather2 %21, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %14[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %25 = arith.addi %20, %c6656_i64 : i64
          %26 = pto.castptr %25 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %26[%c0], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %10 = pto.alloc_tile addr = %c4608_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
      pto.vecscope {
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %15 = arith.index_cast %arg4 : i16 to index
          %16 = arith.muli %15, %c64 : index
          %result = pto.vlds %2[%16] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %0[%16] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = pto.vmul %result, %result_2, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %17, %0[%16], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %11 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      %12 = pto.addptr %arg3, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %11, %12, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
