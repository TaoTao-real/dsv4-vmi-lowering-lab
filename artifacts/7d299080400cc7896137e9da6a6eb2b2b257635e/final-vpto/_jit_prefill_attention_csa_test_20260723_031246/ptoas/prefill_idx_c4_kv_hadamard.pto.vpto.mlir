module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_kv_hadamard(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c549756863488_i64 = arith.constant 549756863488 : i64
      %c-6917529026566815728_i64 = arith.constant -6917529026566815728 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1_i64 = arith.constant 1 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c68719542273_i64 = arith.constant 68719542273 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c128 = arith.constant 128 : index
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %c16_i64 = arith.constant 16 : i64
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c64_i64 = arith.constant 64 : i64
      %c2048 = arith.constant 2048 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c2048 : index
      %2 = pto.addptr %arg1, %1 : <bf16, gm> -> <bf16, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %4 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l1>
      %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %8 = pto.get_ctrl : i64
      %9 = pto.sbitset0 %8, %c45_i64 : i64, i64 -> i64
      %10 = pto.sbitset0 %9, %c46_i64 : i64, i64 -> i64
      %11 = pto.sbitset0 %10, %c47_i64 : i64, i64 -> i64
      %12 = pto.sbitset0 %11, %c51_i64 : i64, i64 -> i64
      scf.for %arg5 = %c0 to %c128 step %c64 {
        pto.set_mte2_nz_para %c68719542273_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %2, %3, %c0_i64, %c256_i64, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %13 = pto.addptr %arg2, %arg5 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %13, %4, %c0_i64, %c256_i64, %c0_i64, %c128_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %3, %5, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %12 : i64
        pto.mad_raw %5, %6, %7, %c-6917529026566815728_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %8 : i64
        %14 = arith.addi %1, %arg5 : index
        %15 = pto.addptr %arg0, %14 : <f32, gm> -> <f32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %7, %15, %c549756863488_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      }
      return
    }
  }
}
