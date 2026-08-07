module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_touch(%arg0: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c0 = arith.constant 0 : index
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %1 = pto.addptr %arg0, %c0 : <bf16, gm> -> <bf16, gm>
      %2 = pto.addptr %0, %c0 : <bf16, ub> -> <bf16, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c1024_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.copy_ubuf_to_gm %2, %1, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c1024_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
