module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qr_hadamard_matmul(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022272_i64 = arith.constant 8796093022272 : i64
      %c549760010240_i64 = arith.constant 549760010240 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-6917529025493073856_i64 = arith.constant -6917529025493073856 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c8192 = arith.constant 8192 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c8192 : index
      %2 = pto.addptr %arg0, %1 : <bf16, gm> -> <bf16, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c274877972481_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %2, %3, %c0_i64, %c256_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      %4 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l1>
      pto.set_mte2_nz_para %c549755879425_i64 : i64
      pto.copy_gm_to_cbuf_multi_nd2nz %arg1, %4, %c0_i64, %c256_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
      %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      pto.load_cbuf_to_ca %3, %5, %c0_i64, %c0_i64, %c4_i64, %c8_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %8 = pto.get_ctrl : i64
      %9 = pto.sbitset0 %8, %c45_i64 : i64, i64 -> i64
      %10 = pto.sbitset0 %9, %c46_i64 : i64, i64 -> i64
      %11 = pto.sbitset0 %10, %c47_i64 : i64, i64 -> i64
      %12 = pto.sbitset0 %11, %c51_i64 : i64, i64 -> i64
      pto.set_ctrl %12 : i64
      pto.mad_raw %5, %6, %7, %c-6917529025493073856_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
      pto.set_ctrl %8 : i64
      %13 = pto.addptr %arg2, %1 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %7, %13, %c549760010240_i64, %c8796093022272_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      return
    }
  }
}

