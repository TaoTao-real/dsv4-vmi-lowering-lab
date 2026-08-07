module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @score_mat(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i8, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022336_i64 = arith.constant 8796093022336 : i64
      %c274886296576_i64 = arith.constant 274886296576 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-6917529026566815616_i64 = arith.constant -6917529026566815616 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c2_i64 = arith.constant 2 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c256 = arith.constant 256 : index
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c4 = arith.constant 4 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c2 = arith.constant 2 : index
      %c127 = arith.constant 127 : index
      %c0 = arith.constant 0 : index
      %c4096 = arith.constant 4096 : index
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %false = arith.constant false
      %c16384 = arith.constant 16384 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.divsi %0, %c2 : index
      %2 = arith.muli %1, %c2 : index
      %3 = arith.subi %0, %2 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      %4 = pto.load_scalar %arg0[%1] : !pto.ptr<i32, gm> -> i32
      %5 = arith.index_cast %4 : i32 to index
      %6 = arith.divsi %5, %c4 : index
      %7 = arith.addi %6, %c127 : index
      %8 = arith.divsi %7, %c128 : index
      %9 = arith.muli %1, %c128 : index
      %10 = arith.muli %3, %c64 : index
      %11 = arith.addi %9, %10 : index
      %12 = arith.muli %11, %c128 : index
      %13 = pto.addptr %arg1, %12 : <i8, gm> -> <i8, gm>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      pto.set_mte2_nz_para %c274877972481_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %13, %14, %c0_i64, %c128_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
      %15 = arith.divsi %8, %c2 : index
      %16 = arith.muli %15, %c2 : index
      %17 = arith.muli %1, %c64 : index
      %18 = arith.muli %0, %c4096 : index
      %19 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i8, l1>
      %20 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<i8, l1>
      %21 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<i8, l0a>
      %22 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i8, l0b>
      %23 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %24 = pto.get_ctrl : i64
      %25 = pto.sbitset0 %24, %c45_i64 : i64, i64 -> i64
      %26 = pto.sbitset0 %25, %c46_i64 : i64, i64 -> i64
      %27 = pto.sbitset0 %26, %c47_i64 : i64, i64 -> i64
      %28 = pto.sbitset0 %27, %c51_i64 : i64, i64 -> i64
      %29 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
      %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
      scf.for %arg7 = %c0 to %16 step %c2 {
        %33 = arith.muli %arg7, %c128 : index
        %34 = arith.addi %17, %arg7 : index
        %35 = pto.load_scalar %arg3[%34] : !pto.ptr<i32, gm> -> i32
        %36 = arith.index_cast %35 : i32 to index
        %37 = arith.addi %18, %33 : index
        %38 = arith.addi %33, %c128 : index
        %39 = arith.addi %arg7, %c1 : index
        %40 = arith.addi %17, %39 : index
        %41 = pto.load_scalar %arg3[%40] : !pto.ptr<i32, gm> -> i32
        %42 = arith.index_cast %41 : i32 to index
        %43 = arith.addi %18, %38 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        %44 = arith.muli %36, %c16384 : index
        %45 = pto.addptr %arg4, %44 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %45, %19, %c0_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %46 = arith.muli %42, %c16384 : index
        %47 = pto.addptr %arg4, %46 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %47, %20, %c0_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.load_cbuf_to_ca %19, %21, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.load_cbuf_to_cb %14, %22, %c0_i64, %c0_i64, %c8_i64, %c2_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
        pto.set_ctrl %28 : i64
        pto.mad_raw %21, %22, %23, %c-6917529026566815616_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %24 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
        %48 = arith.muli %37, %c64 : index
        %49 = pto.addptr %arg2, %48 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %23, %49, %c274886296576_i64, %c8796093022336_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_ca %20, %29, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.load_cbuf_to_cb %14, %30, %c0_i64, %c0_i64, %c8_i64, %c2_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
        pto.set_ctrl %28 : i64
        pto.mad_raw %29, %30, %23, %c-6917529026566815616_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %24 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
        %50 = arith.muli %43, %c64 : index
        %51 = pto.addptr %arg2, %50 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %23, %51, %c274886296576_i64, %c8796093022336_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      }
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      %31 = arith.subi %8, %16 : index
      %32 = arith.cmpi eq, %31, %c1 : index
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
      scf.if %32 {
        %33 = arith.muli %15, %c256 : index
        %34 = arith.addi %17, %16 : index
        %35 = pto.load_scalar %arg3[%34] : !pto.ptr<i32, gm> -> i32
        %36 = arith.index_cast %35 : i32 to index
        %37 = arith.addi %18, %33 : index
        %38 = arith.muli %36, %c16384 : index
        %39 = pto.addptr %arg4, %38 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %39, %19, %c0_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.load_cbuf_to_ca %19, %21, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %14, %22, %c0_i64, %c0_i64, %c8_i64, %c2_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.set_ctrl %28 : i64
        pto.mad_raw %21, %22, %23, %c-6917529026566815616_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %24 : i64
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
        %40 = arith.muli %37, %c64 : index
        %41 = pto.addptr %arg2, %40 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %23, %41, %c274886296576_i64, %c8796093022336_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
      }
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
