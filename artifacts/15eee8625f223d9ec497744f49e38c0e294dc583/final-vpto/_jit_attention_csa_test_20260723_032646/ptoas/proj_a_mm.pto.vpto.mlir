module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @proj_a_mm(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c35184373139456_i64 = arith.constant 35184373139456 : i64
      %c2305843011361701896_i64 = arith.constant 2305843011361701896 : i64
      %c-6917529025493073912_i64 = arith.constant -6917529025493073912 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c1_i64 = arith.constant 1 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c34359803905_i64 = arith.constant 34359803905 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c1024 = arith.constant 1024 : index
      %c128 = arith.constant 128 : index
      %c256 = arith.constant 256 : index
      %c15 = arith.constant 15 : index
      %c2 = arith.constant 2 : index
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c3840 = arith.constant 3840 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c128 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      %2 = arith.muli %arg3, %c4096 : index
      %3 = pto.addptr %arg0, %2 : <bf16, gm> -> <bf16, gm>
      %4 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c34359803905_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %3, %4, %c0_i64, %c8192_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %5 = arith.muli %arg4, %c1024 : index
      %6 = arith.addi %5, %1 : index
      %7 = arith.muli %6, %c4096 : index
      %8 = pto.addptr %arg1, %7 : <bf16, gm> -> <bf16, gm>
      %9 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %8, %9, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
      %10 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
      pto.load_cbuf_to_ca %4, %10, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      pto.load_cbuf_to_cb %9, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
      %12 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<bf16, l0a>
      pto.load_cbuf_to_ca %4, %12, %c0_i64, %c128_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      %13 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      pto.load_cbuf_to_cb %9, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %15 = pto.get_ctrl : i64
      %16 = pto.sbitset0 %15, %c45_i64 : i64, i64 -> i64
      %17 = pto.sbitset0 %16, %c46_i64 : i64, i64 -> i64
      %18 = pto.sbitset0 %17, %c47_i64 : i64, i64 -> i64
      %19 = pto.sbitset0 %18, %c51_i64 : i64, i64 -> i64
      pto.set_ctrl %19 : i64
      pto.mad_raw %10, %11, %14, %c-6917529025493073912_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %15 : i64
      pto.barrier <PIPE_M>
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
      pto.set_ctrl %19 : i64
      pto.mad_raw %12, %13, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %15 : i64
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %21 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l1>
      %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %23 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l0a>
      scf.for %arg8 = %c1 to %c15 step %c2 {
        %30 = arith.muli %arg8, %c256 : index
        %31 = arith.addi %30, %c256 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %32 = arith.addi %2, %30 : index
        %33 = pto.addptr %arg0, %32 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c34359803905_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %33, %20, %c0_i64, %c8192_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        %34 = arith.addi %2, %31 : index
        %35 = pto.addptr %arg0, %34 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c34359803905_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %35, %21, %c0_i64, %c8192_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %36 = arith.addi %7, %30 : index
        %37 = pto.addptr %arg1, %36 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %37, %9, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
        %38 = arith.addi %7, %31 : index
        %39 = pto.addptr %arg1, %38 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %39, %4, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.load_cbuf_to_ca %20, %10, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_cb %9, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.load_cbuf_to_ca %20, %12, %c0_i64, %c128_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.load_cbuf_to_cb %9, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.barrier <PIPE_M>
        pto.set_ctrl %19 : i64
        pto.mad_raw %10, %11, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %15 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.barrier <PIPE_M>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
        pto.set_ctrl %19 : i64
        pto.mad_raw %12, %13, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %15 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.load_cbuf_to_ca %21, %22, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.load_cbuf_to_cb %4, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
        pto.load_cbuf_to_ca %21, %23, %c0_i64, %c128_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.load_cbuf_to_cb %4, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID3>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
        pto.barrier <PIPE_M>
        pto.set_ctrl %19 : i64
        pto.mad_raw %22, %11, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %15 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.barrier <PIPE_M>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
        pto.set_ctrl %19 : i64
        pto.mad_raw %23, %13, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %15 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
      }
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID4>]
      %24 = arith.addi %2, %c3840 : index
      %25 = pto.addptr %arg0, %24 : <bf16, gm> -> <bf16, gm>
      pto.set_mte2_nz_para %c34359803905_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %25, %4, %c0_i64, %c8192_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID5>]
      %26 = arith.addi %7, %c3840 : index
      %27 = pto.addptr %arg1, %26 : <bf16, gm> -> <bf16, gm>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %27, %9, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.load_cbuf_to_ca %4, %10, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID6>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
      pto.load_cbuf_to_cb %9, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
      pto.load_cbuf_to_ca %4, %12, %c0_i64, %c128_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      pto.load_cbuf_to_cb %9, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
      pto.barrier <PIPE_M>
      pto.set_ctrl %19 : i64
      pto.mad_raw %10, %11, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %15 : i64
      pto.barrier <PIPE_M>
      pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
      pto.set_ctrl %19 : i64
      pto.mad_raw %12, %13, %14, %c2305843011361701896_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %15 : i64
      pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %28 = arith.addi %arg5, %1 : index
      pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %29 = pto.addptr %arg2, %28 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %14, %29, %c35184373139456_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
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
