module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.entry, pto.kernel_kind = #pto.kernel_kind<vector>} {
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
      pto.vecscope {
        %16 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.muli %18, %c32 : index
          %20 = pto.addptr %16, %19 : <f32, ub> -> <f32, ub>
          pto.vsts %17, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %5 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %16 = arith.index_cast %arg6 : index to i32
        pto.store %16, %5[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.addptr %5, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %16[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %17 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
        %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %17, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        pto.mem_bar "VST_VLD"
        %20 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmul %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tcolexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_2, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result_2, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %25 = pto.addptr %5, %22 : <i32, ub> -> <i32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %5, %22 : <i32, ub> -> <i32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = pto.vcvt %result_2, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_2, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vadds %result_2, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tadds", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_2, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tmuls", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg6 : i16 to index
          %22 = arith.muli %21, %c32 : index
          %23 = pto.addptr %20, %22 : <f32, ub> -> <f32, ub>
          %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.addptr %18, %22 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tsub", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %17 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %18 = arith.index_cast %arg6 : i16 to index
          %19 = arith.muli %18, %c32 : index
          %20 = pto.addptr %16, %19 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %22 = pto.addptr %17, %19 : <i32, ub> -> <i32, ub>
          pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %6 = arith.muli %1, %c4 : index
      %7 = arith.muli %3, %c262144 : index
      %8 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = arith.muli %3, %c4096 : index
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %11 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %14 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %15 = pto.addptr %14, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %16 = arith.addi %6, %arg6 : index
        %17 = arith.divsi %16, %c8 : index
        %18 = arith.muli %17, %c8 : index
        %19 = arith.subi %16, %18 : index
        %20 = arith.muli %19, %c512 : index
        %21 = arith.addi %20, %c448 : index
        %22 = arith.muli %17, %c128 : index
        %23 = arith.addi %22, %4 : index
        %24 = arith.muli %16, %c64 : index
        %25 = arith.addi %7, %24 : index
        %26 = arith.muli %23, %c4096 : index
        scf.for %arg7 = %c0 to %c32 step %c16 {
          %27 = arith.muli %arg7, %c2 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          %28 = arith.addi %25, %27 : index
          %29 = pto.addptr %arg1, %28 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %29, %8, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %30 = arith.addi %9, %27 : index
          %31 = pto.addptr %arg2, %30 : <f32, gm> -> <f32, gm>
          %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %32, %11, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          %33 = pto.addptr %arg3, %30 : <f32, gm> -> <f32, gm>
          %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %34, %13, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %39 = pto.castptr %c24704_i64 : i64 -> !pto.ptr<f32, ub>
            %40 = pto.addptr %39, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %41 = arith.index_cast %arg8 : i16 to index
              %42 = arith.index_cast %41 : index to i64
              %43 = arith.muli %42, %c128_i64 : i64
              %44 = arith.addi %43, %c33024_i64 : i64
              %45 = arith.addi %43, %c24832_i64 : i64
              %46 = pto.castptr %44 : i64 -> !pto.ptr<f32, ub>
              %47 = pto.castptr %45 : i64 -> !pto.ptr<i32, ub>
              %48 = pto.addptr %47, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %49 = pto.vgather2 %46, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %49, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %50 = arith.addi %43, %c16384_i64 : i64
              pto.mem_bar "VST_VLD"
              %result_2 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.castptr %50 : i64 -> !pto.ptr<f32, ub>
              %52 = pto.addptr %51, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %result_2, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            }
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %39 = arith.index_cast %arg8 : i16 to index
              %40 = arith.muli %39, %c32 : index
              %41 = pto.addptr %8, %40 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %41[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.addptr %10, %40 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %43, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %39 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg8 : i16 to index
              %41 = arith.muli %40, %c32 : index
              %42 = pto.addptr %39, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.addptr %12, %41 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vmul %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %45 = pto.addptr %10, %41 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "template_tmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
            pto.mem_bar "VST_VLD"
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg8 : i16 to index
              %41 = arith.muli %40, %c32 : index
              %42 = pto.addptr %8, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.addptr %10, %41 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %44 = pto.vadd %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            pto.mem_bar "VST_VLD"
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %40 = arith.index_cast %arg8 : i16 to index
              %41 = arith.muli %40, %c32 : index
              %42 = pto.addptr %8, %41 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %44 = pto.addptr %14, %41 : <bf16, ub> -> <bf16, ub>
              pto.vsts %43, %44[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %35 = arith.addi %21, %27 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %36 = arith.addi %26, %35 : index
          %37 = pto.addptr %arg0, %36 : <bf16, gm> -> <bf16, gm>
          %38 = pto.addptr %37, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %15, %38, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c8192_i64, %c64_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
