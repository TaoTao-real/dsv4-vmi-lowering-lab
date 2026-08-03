module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c64_i16 = arith.constant 64 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c24832_i64 = arith.constant 24832 : i64
      %c33024_i64 = arith.constant 33024 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24704_i64 = arith.constant 24704 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c2 = arith.constant 2 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c8 = arith.constant 8 : index
      %c512 = arith.constant 512 : index
      %c448 = arith.constant 448 : index
      %c16 = arith.constant 16 : index
      %c64_i64 = arith.constant 64 : i64
      %c256_i64 = arith.constant 256 : i64
      %c32_i32 = arith.constant 32 : i32
      %c262144 = arith.constant 262144 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c64 : index
      %5 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg6 : i16 to index
          %26 = arith.muli %25, %c32 : index
          %27 = pto.addptr %5, %26 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %24 = arith.index_cast %arg6 : index to i32
        pto.store %24, %6[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %7 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %24 = pto.addptr %6, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %25 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pand %24, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result_2 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_2, %result, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %5[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %9 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_0, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %7, %29 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %6, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %6, %29 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.addptr %7, %29 : <f32, ub> -> <f32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %10 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %11 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %26 = pto.pand %25, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c32 : index
          %result = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %7[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vsub %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %29, %7[%28], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %12 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vadd %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %5[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %13 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %25 = pto.vdup %cst_1, %24 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %27 = pto.pand %26, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result, %25, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %14 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.vecscope {
        %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %26 = pto.pand %25, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %result = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vsub %result, %result_2, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %5[%29], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %27 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg6 : i16 to index
          %29 = arith.muli %28, %c32 : index
          %30 = pto.addptr %5, %29 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %32 = pto.addptr %27, %29 : <i32, ub> -> <i32, ub>
          pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %15 = arith.muli %1, %c4 : index
      %16 = arith.muli %3, %c262144 : index
      %17 = arith.muli %3, %c4096 : index
      %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
      %20 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %21 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
      %22 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %23 = pto.addptr %22, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %24 = arith.addi %15, %arg6 : index
        %25 = arith.divsi %24, %c8 : index
        %26 = arith.muli %25, %c8 : index
        %27 = arith.subi %24, %26 : index
        %28 = arith.muli %27, %c512 : index
        %29 = arith.addi %28, %c448 : index
        %30 = arith.muli %25, %c128 : index
        %31 = arith.addi %30, %4 : index
        %32 = arith.muli %24, %c64 : index
        %33 = arith.addi %16, %32 : index
        %34 = arith.muli %31, %c4096 : index
        scf.for %arg7 = %c0 to %c32 step %c16 {
          %35 = arith.muli %arg7, %c2 : index
          %36 = arith.addi %33, %35 : index
          %37 = pto.addptr %arg1, %36 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %37, %7, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %38 = arith.addi %17, %35 : index
          %39 = pto.addptr %arg2, %38 : <f32, gm> -> <f32, gm>
          %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %40, %19, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %41 = pto.addptr %arg3, %38 : <f32, gm> -> <f32, gm>
          %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %42, %21, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %51 = pto.castptr %c24704_i64 : i64 -> !pto.ptr<f32, ub>
            %52 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
            %53 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %54 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %55 = pto.pand %54, %mask, %53 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %56 = arith.index_cast %arg8 : i16 to index
              %57 = arith.index_cast %56 : index to i64
              %58 = arith.muli %57, %c128_i64 : i64
              %59 = arith.addi %58, %c33024_i64 : i64
              %60 = arith.addi %58, %c24832_i64 : i64
              %61 = pto.castptr %59 : i64 -> !pto.ptr<f32, ub>
              %62 = pto.castptr %60 : i64 -> !pto.ptr<i32, ub>
              %63 = pto.addptr %62, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %63[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %64 = pto.vgather2 %61, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %65 = arith.addi %58, %c16384_i64 : i64
              %66 = pto.castptr %65 : i64 -> !pto.ptr<f32, ub>
              %result_2 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_2, %66[%c0], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %43 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.vecscope {
            %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %52 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %53 = pto.pand %52, %mask, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %54 = arith.index_cast %arg8 : i16 to index
              %55 = arith.muli %54, %c32 : index
              %result = pto.vlds %7[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %18[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vmul %result, %result_2, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %56, %7[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %44 = pto.alloc_tile addr = %c0_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.vecscope {
            %51 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
            %52 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %53 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %54 = pto.pand %53, %mask, %52 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %55 = arith.index_cast %arg8 : i16 to index
              %56 = arith.muli %55, %c32 : index
              %result = pto.vlds %51[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %20[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.vmul %result, %result_2, %52 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %57, %18[%56], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %45 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.vecscope {
            %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %52 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %53 = pto.pand %52, %mask, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %54 = arith.index_cast %arg8 : i16 to index
              %55 = arith.muli %54, %c32 : index
              %result = pto.vlds %7[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %18[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vadd %result, %result_2, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %56, %7[%55], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %46 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
          pto.vecscope {
            %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %52 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %53 = pto.pand %52, %52, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %54 = arith.index_cast %arg8 : i16 to index
              %55 = arith.muli %54, %c32 : index
              %result = pto.vlds %7[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vcvt %result, %51 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %56, %22[%55], %53 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %47 = arith.addi %29, %35 : index
          %48 = arith.addi %34, %47 : index
          %49 = pto.addptr %arg0, %48 : <bf16, gm> -> <bf16, gm>
          %50 = pto.addptr %49, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %23, %50, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c8192_i64, %c64_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

