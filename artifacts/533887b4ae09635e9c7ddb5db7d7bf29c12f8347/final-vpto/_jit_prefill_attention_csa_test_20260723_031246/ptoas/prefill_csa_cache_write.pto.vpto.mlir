module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_csa_cache_write(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i64, gm>, %arg2: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      scf.for %arg3 = %c0 to %c128 step %c1 {
        %0 = pto.load_scalar %arg1[%arg3] : !pto.ptr<i64, gm> -> i64
        %1 = arith.index_cast %0 : i64 to index
        %2 = arith.cmpi sge, %1, %c0 : index
        scf.if %2 {
          %3 = arith.muli %arg3, %c512 : index
          %4 = pto.addptr %arg2, %3 : <bf16, gm> -> <bf16, gm>
          %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %6 = pto.addptr %4, %c0 : <bf16, gm> -> <bf16, gm>
          %7 = pto.addptr %5, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %8 = arith.muli %1, %c512 : index
          %9 = pto.addptr %arg0, %8 : <bf16, gm> -> <bf16, gm>
          %10 = pto.addptr %9, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %7, %10, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

