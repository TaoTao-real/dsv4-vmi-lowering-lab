module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @csa_cache_writeback(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i64, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c8 : index
      scf.for %arg5 = %c0 to %c8 step %c1 {
        %2 = arith.addi %1, %arg5 : index
        %3 = pto.load_scalar %arg1[%2] : !pto.ptr<i64, gm> -> i64
        %4 = arith.index_cast %3 : i64 to index
        %5 = arith.cmpi sge, %4, %c0 : index
        scf.if %5 {
          %6 = arith.muli %2, %c512 : index
          %7 = pto.addptr %arg2, %6 : <bf16, gm> -> <bf16, gm>
          %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %9 = pto.addptr %7, %c0 : <bf16, gm> -> <bf16, gm>
          %10 = pto.addptr %8, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %11 = arith.muli %4, %c512 : index
          %12 = pto.addptr %arg0, %11 : <bf16, gm> -> <bf16, gm>
          %13 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %10, %13, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

