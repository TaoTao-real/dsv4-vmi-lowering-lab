module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @proj_b_mm(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: index, %arg4: index, %arg5: index) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022336_i64 = arith.constant 8796093022336 : i64
      %c140737496748032_i64 = arith.constant 140737496748032 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2305843013509709952_i64 = arith.constant 2305843013509709952 : i64
      %c-6917529023345065856_i64 = arith.constant -6917529023345065856 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c16_i64 = arith.constant 16 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1099511693313_i64 = arith.constant 1099511693313 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c98304_i64 = arith.constant 98304 : i64
      %c0_i64 = arith.constant 0 : i64
      %c163840_i64 = arith.constant 163840 : i64
      %c1 = arith.constant 1 : index
      %c8192 = arith.constant 8192 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c512 = arith.constant 512 : index
      %c768 = arith.constant 768 : index
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %false = arith.constant false
      %0 = pto.addptr %arg1, %arg4 : <i8, gm> -> <i8, gm>
      %1 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l1>
      %2 = pto.castptr %c98304_i64 : i64 -> !pto.ptr<i8, l1>
      %3 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l0a>
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
      %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %6 = pto.get_ctrl : i64
      %7 = pto.sbitset0 %6, %c45_i64 : i64, i64 -> i64
      %8 = pto.sbitset0 %7, %c46_i64 : i64, i64 -> i64
      %9 = pto.sbitset0 %8, %c47_i64 : i64, i64 -> i64
      %10 = pto.sbitset0 %9, %c51_i64 : i64, i64 -> i64
      %11 = arith.addi %arg4, %c256 : index
      %12 = arith.addi %arg4, %c512 : index
      %13 = pto.addptr %arg1, %11 : <i8, gm> -> <i8, gm>
      %14 = pto.castptr %c163840_i64 : i64 -> !pto.ptr<i8, l1>
      %15 = pto.addptr %arg1, %12 : <i8, gm> -> <i8, gm>
      %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      %17 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
      %18 = arith.addi %arg4, %c768 : index
      %19 = pto.addptr %arg1, %18 : <i8, gm> -> <i8, gm>
      %20 = arith.muli %arg5, %c4096 : index
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %21 = arith.muli %arg6, %c256 : index
        %22 = arith.addi %arg3, %21 : index
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %0, %1, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %23 = arith.muli %22, %c8192 : index
        %24 = arith.addi %23, %arg4 : index
        %25 = pto.addptr %arg2, %24 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c1099511693313_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %25, %2, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %1, %3, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %2, %4, %c0_i64, %c0_i64, %c16_i64, %c8_i64, %c16_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %10 : i64
        pto.mad_raw %3, %4, %5, %c-6917529023345065856_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %6 : i64
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %13, %14, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %26 = arith.addi %23, %11 : index
        %27 = pto.addptr %arg2, %26 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c1099511693313_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %27, %2, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %15, %16, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %28 = arith.addi %23, %12 : index
        %29 = pto.addptr %arg2, %28 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c1099511693313_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %29, %1, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %14, %3, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %2, %4, %c0_i64, %c0_i64, %c16_i64, %c8_i64, %c16_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %10 : i64
        pto.mad_raw %3, %4, %5, %c2305843013509709952_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %6 : i64
        pto.load_cbuf_to_ca %16, %17, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %1, %4, %c0_i64, %c0_i64, %c16_i64, %c8_i64, %c16_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %10 : i64
        pto.mad_raw %17, %4, %5, %c2305843013509709952_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %6 : i64
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %19, %1, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %30 = arith.addi %23, %18 : index
        %31 = pto.addptr %arg2, %30 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c1099511693313_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %31, %2, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %1, %3, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %2, %4, %c0_i64, %c0_i64, %c16_i64, %c8_i64, %c16_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %10 : i64
        pto.mad_raw %3, %4, %5, %c2305843013509709952_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %6 : i64
        %32 = arith.addi %20, %22 : index
        %33 = pto.addptr %arg0, %32 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %5, %33, %c140737496748032_i64, %c8796093022336_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
      }
      return
    }
  }
}

