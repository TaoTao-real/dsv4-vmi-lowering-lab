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
      %c32_i32 = arith.constant 32 : i32
      %c256_i64 = arith.constant 256 : i64
      %c262144 = arith.constant 262144 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c64 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      %5 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.muli %18, %c32 : index
          %20 = pto.addptr %5, %19 : <f32, ub> -> <f32, ub>
          pto.vsts %17, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %17 = arith.index_cast %arg6 : index to i32
        pto.store %17, %6[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %7 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.addptr %6, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %17[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %18 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %18, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmul %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result_2, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vcvt %result_2, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %24 = pto.addptr %6, %21 : <i32, ub> -> <i32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %6, %21 : <i32, ub> -> <i32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %23 = pto.vcvt %result_2, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result_2, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vadds %result_2, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result_2, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c32 : index
          %22 = pto.addptr %5, %21 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.addptr %7, %21 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.muli %18, %c32 : index
          %20 = pto.addptr %5, %19 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %22 = pto.addptr %17, %19 : <i32, ub> -> <i32, ub>
          pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %8 = arith.muli %1, %c4 : index
      %9 = arith.muli %3, %c262144 : index
      %10 = arith.muli %3, %c4096 : index
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
      %13 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      %15 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %17 = arith.addi %8, %arg6 : index
        %18 = arith.divsi %17, %c8 : index
        %19 = arith.muli %18, %c8 : index
        %20 = arith.subi %17, %19 : index
        %21 = arith.muli %20, %c512 : index
        %22 = arith.addi %21, %c448 : index
        %23 = arith.muli %18, %c128 : index
        %24 = arith.addi %23, %4 : index
        %25 = arith.muli %17, %c64 : index
        %26 = arith.addi %9, %25 : index
        %27 = arith.muli %24, %c4096 : index
        scf.for %arg7 = %c0 to %c32 step %c16 {
          %28 = arith.muli %arg7, %c2 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          %29 = arith.addi %26, %28 : index
          %30 = pto.addptr %arg1, %29 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %30, %7, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %31 = arith.addi %10, %28 : index
          %32 = pto.addptr %arg2, %31 : <f32, gm> -> <f32, gm>
          %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %33, %12, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %34 = pto.addptr %arg3, %31 : <f32, gm> -> <f32, gm>
          %35 = pto.addptr %34, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %35, %14, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %40 = pto.castptr %c24704_i64 : i64 -> !pto.ptr<f32, ub>
            %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %42 = arith.index_cast %arg8 : i16 to index
              %43 = arith.index_cast %42 : index to i64
              %44 = arith.muli %43, %c128_i64 : i64
              %45 = arith.addi %44, %c33024_i64 : i64
              %46 = arith.addi %44, %c24832_i64 : i64
              %47 = pto.castptr %45 : i64 -> !pto.ptr<f32, ub>
              %48 = pto.castptr %46 : i64 -> !pto.ptr<i32, ub>
              %49 = pto.addptr %48, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %49[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %50 = pto.vgather2 %47, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %50, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %51 = arith.addi %44, %c16384_i64 : i64
              %result_2 = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.castptr %51 : i64 -> !pto.ptr<f32, ub>
              %53 = pto.addptr %52, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %result_2, %53[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg8 : i16 to index
              %41 = arith.muli %40, %c32 : index
              %42 = pto.addptr %7, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.addptr %11, %41 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %40 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %41 = arith.index_cast %arg8 : i16 to index
              %42 = arith.muli %41, %c32 : index
              %43 = pto.addptr %40, %42 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.addptr %13, %42 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.addptr %11, %42 : <f32, ub> -> <f32, ub>
              pto.vsts %45, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %41 = arith.index_cast %arg8 : i16 to index
              %42 = arith.muli %41, %c32 : index
              %43 = pto.addptr %7, %42 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.addptr %11, %42 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %45, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %41 = arith.index_cast %arg8 : i16 to index
              %42 = arith.muli %41, %c32 : index
              %43 = pto.addptr %7, %42 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %45 = pto.addptr %15, %42 : <bf16, ub> -> <bf16, ub>
              pto.vsts %44, %45[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %36 = arith.addi %22, %28 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %37 = arith.addi %27, %36 : index
          %38 = pto.addptr %arg0, %37 : <bf16, gm> -> <bf16, gm>
          %39 = pto.addptr %38, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %16, %39, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c8192_i64, %c64_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
