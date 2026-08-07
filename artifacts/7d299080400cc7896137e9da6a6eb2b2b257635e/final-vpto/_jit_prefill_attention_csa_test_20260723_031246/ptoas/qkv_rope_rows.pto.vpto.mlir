module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qkv_rope_rows(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c8 : index
      scf.for %arg8 = %c0 to %c8 step %c1 {
        %2 = arith.addi %1, %arg8 : index
        %3 = arith.cmpi slt, %2, %c128 : index
        scf.if %3 {
          %4 = pto.load_scalar %arg2[%2] : !pto.ptr<i32, gm> -> i32
          %5 = arith.index_cast %4 : i32 to index
          %6 = arith.muli %5, %c64 : index
          %7 = pto.addptr %arg3, %6 : <bf16, gm> -> <bf16, gm>
          %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %9 = pto.addptr %7, %c0 : <bf16, gm> -> <bf16, gm>
          %10 = pto.addptr %8, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %11 = arith.muli %2, %c64 : index
          %12 = pto.addptr %arg0, %11 : <bf16, gm> -> <bf16, gm>
          %13 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %10, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %14 = pto.addptr %arg4, %6 : <bf16, gm> -> <bf16, gm>
          %15 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %15, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %16 = pto.addptr %arg1, %11 : <bf16, gm> -> <bf16, gm>
          %17 = pto.addptr %16, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %10, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
