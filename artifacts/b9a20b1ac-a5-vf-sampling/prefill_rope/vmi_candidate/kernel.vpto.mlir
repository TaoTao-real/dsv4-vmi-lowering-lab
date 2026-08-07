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
      %c256_i64 = arith.constant 256 : i64
      %c262144 = arith.constant 262144 : index
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c64 : index
      %5 = pto.alloc_tile addr = %c24832_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %17 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %18 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pand %18, %mask, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c32 : index
          pto.vsts %20, %17[%23], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VST_VST"
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %6 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg6 = %c0 to %c32 step %c1 {
        %17 = arith.index_cast %arg6 : index to i32
        pto.store %17, %6[%arg6] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %17 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
        %18 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %result = pto.vlds %6[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vcvt %result, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pand %18, %mask, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %20, %17[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %22 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        pto.mem_bar "VST_VLD"
        %result_2 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %22[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result_3, %result_2, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %22[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %22[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmuls %result_3, %cst_0, %18 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %17[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %17[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vcvt %result_3, %19 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %25, %6[%24], %21 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %6[%24] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %25 = pto.vcvt %result_3, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %17[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %17[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmuls %result_3, %cst_1, %18 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %17[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %22[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %17[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result_3, %result_4, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %17[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %22[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vadds %result_3, %cst, %18 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %22[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %17[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmuls %result_3, %cst_1, %18 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %17[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        pto.mem_bar "VST_VLD"
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c32 : index
          %result_3 = pto.vlds %22[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %17[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vsub %result_3, %result_4, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %22[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.vecscope {
        %17 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<f32, ub>
        %18 = pto.castptr %c24832_i64 : i64 -> !pto.ptr<i32, ub>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
        %21 = pto.pand %20, %mask, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg6 : i16 to index
          %23 = arith.muli %22, %c32 : index
          %result = pto.vlds %17[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vcvt %result, %19 {rnd = "A", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %24, %18[%23], %21 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.mem_bar "VV_ALL"
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %7 = arith.muli %1, %c4 : index
      %8 = arith.muli %3, %c262144 : index
      %9 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = arith.muli %3, %c4096 : index
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
      %13 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
      %15 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.addptr %15, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %17 = arith.addi %7, %arg6 : index
        %18 = arith.divsi %17, %c8 : index
        %19 = arith.muli %18, %c8 : index
        %20 = arith.subi %17, %19 : index
        %21 = arith.muli %20, %c512 : index
        %22 = arith.addi %21, %c448 : index
        %23 = arith.muli %18, %c128 : index
        %24 = arith.addi %23, %4 : index
        %25 = arith.muli %17, %c64 : index
        %26 = arith.addi %8, %25 : index
        %27 = arith.muli %24, %c4096 : index
        scf.for %arg7 = %c0 to %c32 step %c16 {
          %28 = arith.muli %arg7, %c2 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          %29 = arith.addi %26, %28 : index
          %30 = pto.addptr %arg1, %29 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %30, %9, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c16384_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
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
            %41 = pto.castptr %c24704_i64 : i64 -> !pto.ptr<f32, ub>
            %42 = pto.addptr %41, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %43 = arith.index_cast %arg8 : i16 to index
              %44 = arith.index_cast %43 : index to i64
              %45 = arith.muli %44, %c128_i64 : i64
              %46 = arith.addi %45, %c33024_i64 : i64
              %47 = arith.addi %45, %c24832_i64 : i64
              %48 = pto.castptr %46 : i64 -> !pto.ptr<f32, ub>
              %49 = pto.castptr %47 : i64 -> !pto.ptr<i32, ub>
              %50 = pto.addptr %49, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %50[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %51 = pto.vgather2 %48, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %52 = arith.addi %45, %c16384_i64 : i64
              pto.mem_bar "VST_VLD"
              %result_2 = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %53 = pto.castptr %52 : i64 -> !pto.ptr<f32, ub>
              %54 = pto.addptr %53, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %result_2, %54[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            }
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %41 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %43 = pto.pand %41, %mask, %42 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %44 = arith.index_cast %arg8 : i16 to index
              %45 = arith.muli %44, %c32 : index
              %result = pto.vlds %9[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %11[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vmul %result, %result_2, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %9[%45], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %41 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
            %42 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %43 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %44 = pto.pand %43, %mask, %42 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %45 = arith.index_cast %arg8 : i16 to index
              %46 = arith.muli %45, %c32 : index
              %result = pto.vlds %41[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %13[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vmul %result, %result_2, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %47, %11[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
            pto.mem_bar "VST_VLD"
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %45 = arith.index_cast %arg8 : i16 to index
              %46 = arith.muli %45, %c32 : index
              %result = pto.vlds %9[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %11[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.vadd %result, %result_2, %42 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %47, %9[%46], %44 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %36 = pto.alloc_tile addr = %c33024_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xbf16, valid=?x?>
          pto.vecscope {
            %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %42 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %43 = pto.pand %42, %42, %41 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %44 = arith.index_cast %arg8 : i16 to index
              %45 = arith.muli %44, %c32 : index
              %result = pto.vlds %9[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vcvt %result, %41 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %46, %15[%45], %43 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.mem_bar "VV_ALL"
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %37 = arith.addi %22, %28 : index
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %38 = arith.addi %27, %37 : index
          %39 = pto.addptr %arg0, %38 : <bf16, gm> -> <bf16, gm>
          %40 = pto.addptr %39, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %16, %40, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c8192_i64, %c64_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        }
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
