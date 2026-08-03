module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c128_i64 = arith.constant 128 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c28672_i64 = arith.constant 28672 : i64
      %c37376_i64 = arith.constant 37376 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c29184_i64 = arith.constant 29184 : i64
      %c28928_i64 = arith.constant 28928 : i64
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c32_i64 = arith.constant 32 : i64
      %c512_i64 = arith.constant 512 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %c4096 = arith.constant 4096 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c32 : index
      %2 = arith.divsi %1, %c128 : index
      %3 = arith.muli %2, %c32 : index
      %4 = pto.addptr %arg0, %3 : <f32, gm> -> <f32, gm>
      %5 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %4, %c0 : <f32, gm> -> <f32, gm>
      %7 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %8 = pto.addptr %arg1, %3 : <f32, gm> -> <f32, gm>
      %9 = pto.castptr %c28672_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      %11 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %12 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %47 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg6 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %50 = pto.addptr %12, %49 : <f32, ub> -> <f32, ub>
          pto.vsts %47, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %47 = arith.index_cast %arg6 : index to i32
        pto.store %47, %13[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %47 = pto.addptr %13, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %47[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %48 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %48, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %15 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result_2 = pto.vlds %12[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result_2, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %12[%50], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.vdup %cst_0, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg6 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %12[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %48, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %14[%52], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg6 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %14, %52 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %55 = pto.addptr %13, %52 : <i32, ub> -> <i32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg6 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %13, %52 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %54 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %14, %52 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %50 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg6 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %14, %52 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %55 = pto.addptr %50, %52 : <i32, ub> -> <i32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.vdup %cst_1, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg6 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %14[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result, %48, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %14[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %12[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %14[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vsub %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %14[%50], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %19 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.vdup %cst, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg6 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %12[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vadd %result, %48, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %12[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %20 = pto.alloc_tile addr = %c16384_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %21 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.vdup %cst_1, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg6 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %14[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result, %48, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %21[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %22 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg6 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %12[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %21[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vsub %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %12[%51], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %49 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg6 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %52 = pto.addptr %12, %51 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %54 = pto.addptr %49, %51 : <i32, ub> -> <i32, ub>
          pto.vsts %53, %54[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %24 = pto.castptr %c29184_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.vdup %cst_1, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c64 : index
          %result_5 = pto.vlds %14[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vmul %result_5, %48, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %58, %14[%57], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %50 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c64 : index
          %58 = pto.addptr %14, %57 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %59 = pto.vsub %result_5, %50, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %59, %58[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %51 = pto.vdup %cst, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c32 : index
          %58 = pto.addptr %21, %57 : <f32, ub> -> <f32, ub>
          pto.vsts %51, %58[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %52 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %53 = pto.pand %52, %mask_2, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c32 : index
          %result_5 = pto.vlds %21[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vmul %result_5, %result, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %58, %24[%57], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c32 : index
          %58 = pto.addptr %21, %57 : <f32, ub> -> <f32, ub>
          pto.vsts %51, %58[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %result_4 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.muli %56, %c32 : index
          %result_5 = pto.vlds %21[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %58 = pto.vmul %result_5, %result_4, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %58, %5[%57], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %54 = pto.castptr %c28928_i64 : i64 -> !pto.ptr<f32, ub>
        %55 = pto.addptr %54, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.index_cast %56 : index to i64
          %58 = arith.muli %57, %c128_i64 : i64
          %59 = arith.addi %58, %c29184_i64 : i64
          %60 = arith.muli %57, %c256_i64 : i64
          %61 = arith.addi %60, %c8192_i64 : i64
          %62 = pto.castptr %59 : i64 -> !pto.ptr<f32, ub>
          %63 = pto.castptr %61 : i64 -> !pto.ptr<i32, ub>
          %64 = pto.addptr %63, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %64[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %65 = pto.vgather2 %62, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %65, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %66 = arith.addi %60, %c16384_i64 : i64
          %67 = pto.castptr %66 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %67[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %56 = arith.index_cast %arg6 : i16 to index
          %57 = arith.index_cast %56 : index to i64
          %58 = arith.muli %57, %c128_i64 : i64
          %59 = arith.addi %58, %c24576_i64 : i64
          %60 = arith.muli %57, %c256_i64 : i64
          %61 = arith.addi %60, %c8192_i64 : i64
          %62 = pto.castptr %59 : i64 -> !pto.ptr<f32, ub>
          %63 = pto.castptr %61 : i64 -> !pto.ptr<i32, ub>
          %64 = pto.addptr %63, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %64[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %65 = pto.vgather2 %62, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %65, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %66 = arith.addi %60, %c29184_i64 : i64
          %67 = pto.castptr %66 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %67[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %25 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %24[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %14[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %14[%50], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %26 = arith.muli %0, %c4096 : index
      %27 = pto.addptr %arg2, %26 : <f32, gm> -> <f32, gm>
      %28 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %29 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
      %30 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %29, %30, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %31 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
      %32 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %28[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result, %47 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %51, %32[%50], %48 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %33 = pto.addptr %arg3, %26 : <bf16, gm> -> <bf16, gm>
      %34 = pto.addptr %32, %c0 : <bf16, ub> -> <bf16, ub>
      %35 = pto.addptr %33, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %34, %35, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %36 = arith.addi %26, %c64 : index
      %37 = pto.addptr %arg2, %36 : <f32, gm> -> <f32, gm>
      %38 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %38, %30, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg6 : i16 to index
          %49 = arith.index_cast %48 : index to i64
          %50 = arith.muli %49, %c256_i64 : i64
          %51 = arith.addi %50, %c8192_i64 : i64
          %52 = arith.addi %50, %c37376_i64 : i64
          %53 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
          %54 = pto.castptr %52 : i64 -> !pto.ptr<i32, ub>
          %55 = pto.addptr %54, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %55[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %56 = pto.vgather2 %53, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %57 = arith.addi %50, %c29184_i64 : i64
          %58 = pto.castptr %57 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %58[%c0], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %39 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %28[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %21[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %12[%50], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %40 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %24[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %14[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %14[%50], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %41 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %12[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %14[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vadd %result, %result_2, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %12[%50], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %42 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
      %43 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %49 = arith.index_cast %arg6 : i16 to index
          %50 = arith.muli %49, %c64 : index
          %result = pto.vlds %12[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result, %47 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %51, %43[%50], %48 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %44 = pto.addptr %arg3, %36 : <bf16, gm> -> <bf16, gm>
      %45 = pto.addptr %43, %c0 : <bf16, ub> -> <bf16, ub>
      %46 = pto.addptr %44, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %45, %46, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

