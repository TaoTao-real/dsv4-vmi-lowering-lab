module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @proj_a_mm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: index) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022336_i64 = arith.constant 8796093022336 : i64
      %c35184380479488_i64 = arith.constant 35184380479488 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2305843011361702016_i64 = arith.constant 2305843011361702016 : i64
      %c-6917529025493073792_i64 = arith.constant -6917529025493073792 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c1024 = arith.constant 1024 : index
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c256 = arith.constant 256 : index
      %c15 = arith.constant 15 : index
      %c2 = arith.constant 2 : index
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %false = arith.constant false
      %c3840 = arith.constant 3840 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      %0 = arith.muli %arg3, %c4096 : index
      %1 = pto.addptr %arg0, %0 : <bf16, gm> -> <bf16, gm>
      %2 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %1, %2, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %3 = arith.muli %arg4, %c1024 : index
      %4 = arith.addi %3, %arg5 : index
      %5 = arith.muli %4, %c4096 : index
      %6 = pto.addptr %arg1, %5 : <bf16, gm> -> <bf16, gm>
      %7 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %6, %7, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      pto.load_cbuf_to_ca %2, %8, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      pto.load_cbuf_to_cb %7, %9, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
      %10 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0a>
      pto.load_cbuf_to_ca %2, %10, %c0_i64, %c128_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      %11 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      pto.load_cbuf_to_cb %7, %11, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
      %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %13 = pto.get_ctrl : i64
      %14 = pto.sbitset0 %13, %c45_i64 : i64, i64 -> i64
      %15 = pto.sbitset0 %14, %c46_i64 : i64, i64 -> i64
      %16 = pto.sbitset0 %15, %c47_i64 : i64, i64 -> i64
      %17 = pto.sbitset0 %16, %c51_i64 : i64, i64 -> i64
      pto.set_ctrl %17 : i64
      pto.mad_raw %8, %9, %12, %c-6917529025493073792_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %13 : i64
      pto.barrier <PIPE_M>
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
      pto.set_ctrl %17 : i64
      pto.mad_raw %10, %11, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %13 : i64
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %19 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, l1>
      scf.for %arg7 = %c1 to %c15 step %c2 {
        %26 = arith.muli %arg7, %c256 : index
        %27 = arith.addi %26, %c256 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %28 = arith.addi %0, %26 : index
        %29 = pto.addptr %arg0, %28 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %29, %2, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        %30 = arith.addi %0, %27 : index
        %31 = pto.addptr %arg0, %30 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %31, %7, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %32 = arith.addi %5, %26 : index
        %33 = pto.addptr %arg1, %32 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %33, %18, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
        %34 = arith.addi %5, %27 : index
        %35 = pto.addptr %arg1, %34 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %35, %19, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_ca %2, %8, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.load_cbuf_to_cb %18, %9, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.load_cbuf_to_ca %2, %10, %c0_i64, %c128_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.load_cbuf_to_cb %18, %11, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.barrier <PIPE_M>
        pto.set_ctrl %17 : i64
        pto.mad_raw %8, %9, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %13 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.barrier <PIPE_M>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
        pto.set_ctrl %17 : i64
        pto.mad_raw %10, %11, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %13 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.load_cbuf_to_ca %7, %8, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.load_cbuf_to_cb %19, %9, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.load_cbuf_to_ca %7, %10, %c0_i64, %c128_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.load_cbuf_to_cb %19, %11, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
        pto.barrier <PIPE_M>
        pto.set_ctrl %17 : i64
        pto.mad_raw %8, %9, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %13 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.barrier <PIPE_M>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
        pto.set_ctrl %17 : i64
        pto.mad_raw %10, %11, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %13 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      }
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
      %20 = arith.addi %0, %c3840 : index
      %21 = pto.addptr %arg0, %20 : <bf16, gm> -> <bf16, gm>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %21, %2, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID5>]
      %22 = arith.addi %5, %c3840 : index
      %23 = pto.addptr %arg1, %22 : <bf16, gm> -> <bf16, gm>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %23, %7, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.load_cbuf_to_ca %2, %8, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID6>]
      pto.load_cbuf_to_cb %7, %9, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
      pto.load_cbuf_to_ca %2, %10, %c0_i64, %c128_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.load_cbuf_to_cb %7, %11, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
      pto.barrier <PIPE_M>
      pto.set_ctrl %17 : i64
      pto.mad_raw %8, %9, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %13 : i64
      pto.barrier <PIPE_M>
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
      pto.set_ctrl %17 : i64
      pto.mad_raw %10, %11, %12, %c2305843011361702016_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %13 : i64
      pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %24 = arith.addi %arg6, %arg5 : index
      pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %25 = pto.addptr %arg2, %24 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %12, %25, %c35184380479488_i64, %c8796093022336_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
