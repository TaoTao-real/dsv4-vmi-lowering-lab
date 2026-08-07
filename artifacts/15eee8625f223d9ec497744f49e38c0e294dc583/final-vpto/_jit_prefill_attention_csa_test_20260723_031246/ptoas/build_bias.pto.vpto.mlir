module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @build_bias(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %cst_1 = arith.constant 3.40282347E+38 : f32
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c16_i64 = arith.constant 16 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c1536_i64 = arith.constant 1536 : i64
      %cst_2 = arith.constant -1.000000e+00 : f32
      %c2048_i64 = arith.constant 2048 : i64
      %c512_i64 = arith.constant 512 : i64
      %c2048 = arith.constant 2048 : index
      %c6144 = arith.constant 6144 : index
      %c8192 = arith.constant 8192 : index
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c2048 : index
      %2 = pto.addptr %arg0, %1 : <i32, gm> -> <i32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %4 = pto.addptr %2, %c0 : <i32, gm> -> <i32, gm>
      %5 = pto.addptr %3, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %4, %5, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c128 : index
          %result = pto.vlds %3[%22] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %23 = arith.addi %22, %c64 : index
          %result_3 = pto.vlds %3[%23] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = pto.vcvt %result, %20 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vcvt %result_3, %20 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %6[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %25, %6[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c128 : index
          %result = pto.vlds %6[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %22, %c64 : index
          %result_3 = pto.vlds %6[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = pto.vadds %result, %cst, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %25 = pto.vadds %result_3, %cst, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vmaxs %24, %cst_0, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vmaxs %25, %cst_0, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmins %26, %cst, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vmins %27, %cst, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vadds %28, %cst_2, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadds %29, %cst_2, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %30, %6[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %31, %6[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg5 : i16 to index
          %21 = arith.muli %20, %c128 : index
          %result = pto.vlds %6[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = arith.addi %21, %c64 : index
          %result_3 = pto.vlds %6[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = pto.vmuls %result, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vmuls %result_3, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %6[%21], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %24, %6[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %8 = arith.muli %0, %c6144 : index
      %9 = pto.addptr %arg1, %8 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %11 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %10, %11, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c1536_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %12 = arith.muli %0, %c8192 : index
      %13 = pto.addptr %arg2, %12 : <i32, gm> -> <i32, gm>
      %14 = pto.addptr %13, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %14, %5, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c1024_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c256 : index
          %result = pto.vlds %3[%22] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %23 = arith.addi %22, %c64 : index
          %result_3 = pto.vlds %3[%23] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = arith.addi %22, %c128 : index
          %result_4 = pto.vlds %3[%24] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %25 = arith.addi %22, %c192 : index
          %result_5 = pto.vlds %3[%25] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %26 = pto.vcvt %result, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vcvt %result_3, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vcvt %result_4, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vcvt %result_5, %19 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %26, %6[%22], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %27, %6[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %6[%24], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %6[%25], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %21 = arith.index_cast %arg5 : i16 to index
          %22 = arith.muli %21, %c256 : index
          %result = pto.vlds %6[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %22, %c64 : index
          %result_3 = pto.vlds %6[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %22, %c128 : index
          %result_4 = pto.vlds %6[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %22, %c192 : index
          %result_5 = pto.vlds %6[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vadds %result, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vadds %result_3, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vadds %result_4, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vadds %result_5, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vmaxs %26, %cst_0, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vmaxs %27, %cst_0, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmaxs %28, %cst_0, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmaxs %29, %cst_0, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmins %30, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmins %31, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmins %32, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmins %33, %cst, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vadds %34, %cst_2, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vadds %35, %cst_2, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vadds %36, %cst_2, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vadds %37, %cst_2, %20 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %38, %6[%22], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %6[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %6[%24], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %6[%25], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg5 : i16 to index
          %21 = arith.muli %20, %c256 : index
          %result = pto.vlds %6[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = arith.addi %21, %c64 : index
          %result_3 = pto.vlds %6[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %21, %c128 : index
          %result_4 = pto.vlds %6[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %21, %c192 : index
          %result_5 = pto.vlds %6[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmuls %result, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vmuls %result_3, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vmuls %result_4, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmuls %result_5, %cst_1, %19 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %6[%21], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %26, %6[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %27, %6[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %6[%24], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.barrier <PIPE_MTE3>
      %16 = arith.addi %8, %c128 : index
      %17 = pto.addptr %arg1, %16 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %10, %18, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c1536_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
