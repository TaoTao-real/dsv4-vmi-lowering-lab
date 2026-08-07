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
      %c64_i32 = arith.constant 64 : i32
      %c512_i64 = arith.constant 512 : i64
      %cst_2 = arith.constant -1.000000e+00 : f32
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
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %8 = pto.addptr %arg1, %3 : <f32, gm> -> <f32, gm>
      %9 = pto.castptr %c28672_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      %11 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %12 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %13 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %39 = pto.vdup %cst, %38 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c64 : index
          pto.vsts %39, %13[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c64 step %c1 {
        %37 = arith.index_cast %arg6 : index to i32
        pto.store %37, %14[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %14[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.vcvt %result, %37 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        pto.vsts %38, %15[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg6 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_3 = pto.vlds %13[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_3, %38, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %13[%42], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vmuls %43, %cst_0, %39 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %44, %15[%42], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg6 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_3 = pto.vlds %15[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result_3, %37 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %43, %14[%42], %39 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %40 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %41 = arith.index_cast %arg6 : i16 to index
          %42 = arith.muli %41, %c64 : index
          %result_3 = pto.vlds %14[%42] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %43 = pto.vcvt %result_3, %37 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %15[%42], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vcvt %43, %37 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %44, %40[%42], %39 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %16 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result = pto.vlds %15[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmuls %result, %cst_1, %37 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %13[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vsub %result_3, %42, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %15[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %44 = pto.vadds %result_3, %cst, %37 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmuls %43, %cst_1, %37 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %16[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = pto.vsub %44, %45, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %46, %13[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %39 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result = pto.vlds %13[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vcvt %result, %38 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %42, %39[%41], %37 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          %result_3 = pto.vlds %15[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmuls %result_3, %cst_1, %37 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %43, %15[%41], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %17 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %37 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %15[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vadds %result, %cst_2, %37 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %15[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsubs", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %38 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c32 : index
          %41 = pto.addptr %16, %40 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.castptr %c29184_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c32 : index
          %41 = pto.addptr %16, %40 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.addptr %37, %40 : <f32, ub> -> <f32, ub>
          pto.vsts %42, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %38 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c32 : index
          %41 = pto.addptr %16, %40 : <f32, ub> -> <f32, ub>
          pto.vsts %38, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c32 : index
          %42 = pto.addptr %16, %41 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result, %result_5, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.addptr %5, %41 : <f32, ub> -> <f32, ub>
          pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        %mask_3, %scalar_out_4 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.castptr %c28928_i64 : i64 -> !pto.ptr<f32, ub>
        %38 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
        %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c128_i64 : i64
          %43 = arith.addi %42, %c29184_i64 : i64
          %44 = arith.muli %41, %c256_i64 : i64
          %45 = arith.addi %44, %c8192_i64 : i64
          %46 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask_3 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %38[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c16384_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.index_cast %40 : index to i64
          %42 = arith.muli %41, %c128_i64 : i64
          %43 = arith.addi %42, %c24576_i64 : i64
          %44 = arith.muli %41, %c256_i64 : i64
          %45 = arith.addi %44, %c8192_i64 : i64
          %46 = pto.castptr %43 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
          %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %49 = pto.vgather2 %46, %result, %mask_3 : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %38[%c0], %mask_3 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %50 = arith.addi %44, %c29184_i64 : i64
          %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %51[%c0], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      %19 = pto.castptr %c29184_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %19[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result, %result_3, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %15[%40], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %20 = arith.muli %0, %c4096 : index
      %21 = pto.addptr %arg2, %20 : <f32, gm> -> <f32, gm>
      %22 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %23 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
      %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %23, %24, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %37 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %38 = arith.index_cast %arg6 : i16 to index
          %39 = arith.muli %38, %c64 : index
          %40 = pto.addptr %22, %39 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %42 = pto.addptr %37, %39 : <bf16, ub> -> <bf16, ub>
          pto.vsts %41, %42[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %25 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      %26 = pto.addptr %arg3, %20 : <bf16, gm> -> <bf16, gm>
      %27 = pto.addptr %25, %c0 : <bf16, ub> -> <bf16, ub>
      %28 = pto.addptr %26, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %27, %28, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %29 = arith.addi %20, %c64 : index
      %30 = pto.addptr %arg2, %29 : <f32, gm> -> <f32, gm>
      %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %31, %24, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
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
          %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_3, %49[%c0], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %38 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %39 = arith.index_cast %arg6 : i16 to index
          %40 = arith.muli %39, %c64 : index
          %result = pto.vlds %22[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %16[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result, %result_3, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %41, %13[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %19[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %15[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_4, %result_5, %38 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %15[%40], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %32 = pto.alloc_tile addr = %c37376_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.vecscope {
        %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %38 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %result = pto.vlds %13[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %15[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = pto.vadd %result, %result_3, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %42, %13[%41], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %39 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg6 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %40 = arith.index_cast %arg6 : i16 to index
          %41 = arith.muli %40, %c64 : index
          %42 = pto.addptr %13, %41 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %44 = pto.addptr %39, %41 : <bf16, ub> -> <bf16, ub>
          pto.vsts %43, %44[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %33 = pto.castptr %c37376_i64 : i64 -> !pto.ptr<bf16, ub>
      %34 = pto.addptr %arg3, %29 : <bf16, gm> -> <bf16, gm>
      %35 = pto.addptr %33, %c0 : <bf16, ub> -> <bf16, ub>
      %36 = pto.addptr %34, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %35, %36, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
