module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @kv_hadamard(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
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
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c68719542273_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %arg0, %0, %c0_i64, %c256_i64, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      %1 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l1>
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %5 = pto.get_ctrl : i64
      %6 = pto.sbitset0 %5, %c45_i64 : i64, i64 -> i64
      %7 = pto.sbitset0 %6, %c46_i64 : i64, i64 -> i64
      %8 = pto.sbitset0 %7, %c47_i64 : i64, i64 -> i64
      %9 = pto.sbitset0 %8, %c51_i64 : i64, i64 -> i64
      scf.for %arg3 = %c0 to %c128 step %c64 {
        %10 = pto.addptr %arg2, %arg3 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %10, %1, %c0_i64, %c256_i64, %c0_i64, %c128_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %0, %2, %c0_i64, %c0_i64, %c1_i64, %c8_i64, %c1_i64, %c1_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %1, %3, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %9 : i64
        pto.mad_raw %2, %3, %4, %c-6917529026566815728_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %5 : i64
        %11 = pto.addptr %arg1, %arg3 : <f32, gm> -> <f32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %4, %11, %c549756863488_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      }
      return
    }
  }
}

