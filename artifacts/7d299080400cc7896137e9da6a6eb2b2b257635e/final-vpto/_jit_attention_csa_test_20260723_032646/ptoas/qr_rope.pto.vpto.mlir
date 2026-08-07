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
        %37 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg6 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %12, %39 : <f32, ub> -> <f32, ub>
          pto.vsts %37, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %37 = arith.index_cast %arg6 : index to i32
        pto.store %37, %13[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.addptr %13, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %37[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %38 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %38, %39[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_2 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %42 = pto.vdup %cst_0, %41 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_3 = pto.vlds %12[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_3, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %12[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = pto.vmul %49, %42, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %14[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %14, %48 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %51 = pto.addptr %13, %48 : <i32, ub> -> <i32, ub>
          pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %13, %48 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %49[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %50 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.addptr %14, %48 : <f32, ub> -> <f32, ub>
          pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %43 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %14, %48 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %51 = pto.addptr %43, %48 : <i32, ub> -> <i32, ub>
          pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %44 = pto.vdup %cst_1, %41 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.vdup %cst, %41 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_3 = pto.vlds %14[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_3, %44, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %12[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vsub %result_4, %49, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %14[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = pto.vadd %result_4, %45, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmul %50, %44, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %15[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %53 = pto.vsub %51, %52, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %12[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %46 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %49 = pto.addptr %12, %48 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vcvt %result_3, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %51 = pto.addptr %46, %48 : <i32, ub> -> <i32, ub>
          pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %47 = arith.index_cast %arg6 : i16 to index
          %48 = arith.muli %47, %c64 : index
          %result_3 = pto.vlds %14[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_3, %44, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %14[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %16 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %17 = pto.castptr %c29184_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %37 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %47 = pto.addptr %14, %46 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vsub %result_5, %37, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %47[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask_2, %scalar_out_3 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %38 = pto.vdup %cst, %mask_2 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.muli %45, %c32 : index
          %47 = pto.addptr %15, %46 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %47[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %39 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %41 = pto.pand %39, %mask_2, %40 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.muli %45, %c32 : index
          %result_5 = pto.vlds %15[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_5, %result, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %17[%46], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.muli %45, %c32 : index
          %47 = pto.addptr %15, %46 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %47[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %result_4 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.muli %45, %c32 : index
          %result_5 = pto.vlds %15[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_5, %result_4, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %5[%46], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %42 = pto.castptr %c28928_i64 : i64 -> !pto.ptr<f32, ub>
        %43 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
        %44 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.index_cast %45 : index to i64
          %47 = arith.muli %46, %c128_i64 : i64
          %48 = arith.addi %47, %c29184_i64 : i64
          %49 = arith.muli %46, %c256_i64 : i64
          %50 = arith.addi %49, %c8192_i64 : i64
          %51 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
          %52 = pto.castptr %50 : i64 -> !pto.ptr<i32, ub>
          %53 = pto.addptr %52, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %53[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %54 = pto.vgather2 %51, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = arith.addi %49, %c16384_i64 : i64
          %56 = pto.castptr %55 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %56[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg6 : i16 to index
          %46 = arith.index_cast %45 : index to i64
          %47 = arith.muli %46, %c128_i64 : i64
          %48 = arith.addi %47, %c24576_i64 : i64
          %49 = arith.muli %46, %c256_i64 : i64
          %50 = arith.addi %49, %c8192_i64 : i64
          %51 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
          %52 = pto.castptr %50 : i64 -> !pto.ptr<i32, ub>
          %53 = pto.addptr %52, %c0 : <i32, ub> -> <i32, ub>
          %result_5 = pto.vlds %53[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %54 = pto.vgather2 %51, %result_5, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = arith.addi %49, %c29184_i64 : i64
          %56 = pto.castptr %55 : i64 -> !pto.ptr<f32, ub>
          %result_6 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %56[%c0], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %17[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %14[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result, %result_2, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %14[%40], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      %19 = arith.muli %0, %c4096 : index
      %20 = pto.addptr %arg2, %19 : <f32, gm> -> <f32, gm>
      %21 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
      %23 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %22, %23, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %24 = pto.alloc_tile addr = %c8192_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
      %25 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %21[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %41, %25[%40], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %26 = pto.addptr %arg3, %19 : <bf16, gm> -> <bf16, gm>
      %27 = pto.addptr %25, %c0 : <bf16, ub> -> <bf16, ub>
      %28 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %27, %28, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      %29 = arith.addi %19, %c64 : index
      %30 = pto.addptr %arg2, %29 : <f32, gm> -> <f32, gm>
      %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %31, %23, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.index_cast %39 : index to i64
          %41 = arith.muli %40, %c256_i64 : i64
          %42 = arith.addi %41, %c8192_i64 : i64
          %43 = arith.addi %41, %c37376_i64 : i64
          %44 = pto.castptr %42 : i64 -> !pto.ptr<f32, ub>
          %45 = pto.castptr %43 : i64 -> !pto.ptr<i32, ub>
          %46 = pto.addptr %45, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %46[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %47 = pto.vgather2 %44, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %47, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %48 = arith.addi %41, %c29184_i64 : i64
          %49 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %49[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %21[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %15[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result, %result_2, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %17[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %14[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_3, %result_4, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %14[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %43 = pto.vadd %41, %42, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %12[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %32 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xbf16, valid=?x?>
      %33 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %12[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %37 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %41, %33[%40], %38 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %34 = pto.addptr %arg3, %29 : <bf16, gm> -> <bf16, gm>
      %35 = pto.addptr %33, %c0 : <bf16, ub> -> <bf16, ub>
      %36 = pto.addptr %34, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %35, %36, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
