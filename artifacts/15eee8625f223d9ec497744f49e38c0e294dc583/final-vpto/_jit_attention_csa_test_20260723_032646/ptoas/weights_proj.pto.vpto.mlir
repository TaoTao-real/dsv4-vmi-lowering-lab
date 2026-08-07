module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @weights_proj(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c274878956544_i64 = arith.constant 274878956544 : i64
      %c2305843010288484360_i64 = arith.constant 2305843010288484360 : i64
      %c-6917529026566291448_i64 = arith.constant -6917529026566291448 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c4_i64 = arith.constant 4 : i64
      %c16_i64 = arith.constant 16 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2199023321089_i64 = arith.constant 2199023321089 : i64
      %c34359803905_i64 = arith.constant 34359803905 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c1024 = arith.constant 1024 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c512 = arith.constant 512 : index
      %c64_i64 = arith.constant 64 : i64
      %c8_i64 = arith.constant 8 : i64
      %c512_i64 = arith.constant 512 : i64
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c1024 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %3 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l1>
      scf.for %arg5 = %c0 to %c2 step %c1 {
        %6 = arith.muli %arg5, %c512 : index
        %7 = arith.addi %1, %6 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        %8 = pto.addptr %arg0, %7 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c34359803905_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %8, %2, %c0_i64, %c8192_i64, %c0_i64, %c8_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %9 = arith.muli %7, %c64 : index
        %10 = pto.addptr %arg1, %9 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c2199023321089_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %10, %3, %c0_i64, %c128_i64, %c0_i64, %c512_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        %11 = arith.cmpi eq, %arg5, %c0 : index
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        scf.if %11 {
          %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %2, %12, %c0_i64, %c0_i64, %c1_i64, %c16_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %13 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %3, %13, %c0_i64, %c0_i64, %c4_i64, %c16_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          %14 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %2, %14, %c0_i64, %c256_i64, %c1_i64, %c16_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %3, %15, %c256_i64, %c0_i64, %c4_i64, %c16_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          pto.barrier <PIPE_M>
          %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
          %17 = pto.get_ctrl : i64
          %18 = pto.sbitset0 %17, %c45_i64 : i64, i64 -> i64
          %19 = pto.sbitset0 %18, %c46_i64 : i64, i64 -> i64
          %20 = pto.sbitset0 %19, %c47_i64 : i64, i64 -> i64
          %21 = pto.sbitset0 %20, %c51_i64 : i64, i64 -> i64
          pto.set_ctrl %21 : i64
          pto.mad_raw %12, %13, %16, %c-6917529026566291448_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %17 : i64
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.set_ctrl %21 : i64
          pto.mad_raw %14, %15, %16, %c2305843010288484360_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %17 : i64
        } else {
          %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %2, %12, %c0_i64, %c0_i64, %c1_i64, %c16_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %13 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %3, %13, %c0_i64, %c0_i64, %c4_i64, %c16_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
          %14 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %2, %14, %c0_i64, %c256_i64, %c1_i64, %c16_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %3, %15, %c256_i64, %c0_i64, %c4_i64, %c16_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
          pto.barrier <PIPE_M>
          %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
          %17 = pto.get_ctrl : i64
          %18 = pto.sbitset0 %17, %c45_i64 : i64, i64 -> i64
          %19 = pto.sbitset0 %18, %c46_i64 : i64, i64 -> i64
          %20 = pto.sbitset0 %19, %c47_i64 : i64, i64 -> i64
          %21 = pto.sbitset0 %20, %c51_i64 : i64, i64 -> i64
          pto.set_ctrl %21 : i64
          pto.mad_raw %12, %13, %16, %c2305843010288484360_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %17 : i64
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
          pto.set_ctrl %21 : i64
          pto.mad_raw %14, %15, %16, %c2305843010288484360_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %17 : i64
        }
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      }
      pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %5 = pto.addptr %arg2, %1 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %4, %5, %c274878956544_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
