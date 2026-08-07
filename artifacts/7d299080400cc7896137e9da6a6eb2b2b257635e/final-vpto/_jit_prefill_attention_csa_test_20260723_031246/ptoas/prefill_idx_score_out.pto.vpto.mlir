module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_out(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c128_i64 = arith.constant 128 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c0 = arith.constant 0 : index
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c128_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %3 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %2, %3, %c0_i64, %c128_i64, %c1024_i64, %c0_i64, %c1024_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
