module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @proj_b_mm(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c140737489408000_i64 = arith.constant 140737489408000 : i64
      %c2305843013509185552_i64 = arith.constant 2305843013509185552 : i64
      %c-6917529023345590256_i64 = arith.constant -6917529023345590256 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c1_i64 = arith.constant 1 : i64
      %c1099511693313_i64 = arith.constant 1099511693313 : i64
      %c68719542273_i64 = arith.constant 68719542273 : i64
      %c0_i64 = arith.constant 0 : i64
      %c69632_i64 = arith.constant 69632 : i64
      %c73728_i64 = arith.constant 73728 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c1 = arith.constant 1 : index
      %c8192 = arith.constant 8192 : index
      %c4096 = arith.constant 4096 : index
      %c512 = arith.constant 512 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c4 = arith.constant 4 : index
      %c16_i64 = arith.constant 16 : i64
      %c256_i64 = arith.constant 256 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c512 : index
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      %3 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l1>
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
      %5 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l0b>
      %6 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i8, l0a>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %9 = pto.get_ctrl : i64
      %10 = pto.sbitset0 %9, %c45_i64 : i64, i64 -> i64
      %11 = pto.sbitset0 %10, %c46_i64 : i64, i64 -> i64
      %12 = pto.sbitset0 %11, %c47_i64 : i64, i64 -> i64
      %13 = pto.sbitset0 %12, %c51_i64 : i64, i64 -> i64
      %14 = arith.muli %arg5, %c4096 : index
      scf.for %arg8 = %c0 to %c2 step %c1 {
        %15 = arith.muli %arg8, %c256 : index
        %16 = arith.addi %1, %15 : index
        %17 = arith.muli %16, %c8192 : index
        scf.for %arg9 = %c0 to %c4 step %c2 {
          %20 = arith.muli %arg9, %c256 : index
          %21 = arith.addi %arg4, %20 : index
          %22 = arith.addi %20, %c256 : index
          %23 = arith.addi %arg4, %22 : index
          %24 = arith.cmpi eq, %arg9, %c0 : index
          scf.if %24 {
            %28 = pto.addptr %arg1, %arg4 : <i8, gm> -> <i8, gm>
            %29 = pto.castptr %c69632_i64 : i64 -> !pto.ptr<i8, l1>
            pto.set_mte2_nz_para %c68719542273_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %28, %29, %c0_i64, %c8192_i64, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %30 = arith.addi %17, %arg4 : index
            %31 = pto.addptr %arg2, %30 : <i8, gm> -> <i8, gm>
            %32 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<i8, l1>
            pto.set_mte2_nz_para %c1099511693313_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %31, %32, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %33 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l0a>
            pto.load_cbuf_to_ca %29, %33, %c0_i64, %c0_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %32, %5, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            %34 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<i8, l0a>
            pto.load_cbuf_to_ca %29, %34, %c0_i64, %c128_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %32, %7, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_ctrl %13 : i64
            pto.mad_raw %33, %5, %8, %c-6917529023345590256_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %9 : i64
            pto.set_ctrl %13 : i64
            pto.mad_raw %34, %7, %8, %c2305843013509185552_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %9 : i64
          } else {
            %28 = pto.addptr %arg1, %21 : <i8, gm> -> <i8, gm>
            %29 = pto.castptr %c69632_i64 : i64 -> !pto.ptr<i8, l1>
            pto.set_mte2_nz_para %c68719542273_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %28, %29, %c0_i64, %c8192_i64, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %30 = arith.addi %17, %21 : index
            %31 = pto.addptr %arg2, %30 : <i8, gm> -> <i8, gm>
            %32 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<i8, l1>
            pto.set_mte2_nz_para %c1099511693313_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %31, %32, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %33 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l0a>
            pto.load_cbuf_to_ca %29, %33, %c0_i64, %c0_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %32, %5, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            %34 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<i8, l0a>
            pto.load_cbuf_to_ca %29, %34, %c0_i64, %c128_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %32, %7, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_ctrl %13 : i64
            pto.mad_raw %33, %5, %8, %c2305843013509185552_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %9 : i64
            pto.set_ctrl %13 : i64
            pto.mad_raw %34, %7, %8, %c2305843013509185552_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %9 : i64
          }
          %25 = pto.addptr %arg1, %23 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c68719542273_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %25, %2, %c0_i64, %c8192_i64, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %26 = arith.addi %17, %23 : index
          %27 = pto.addptr %arg2, %26 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c1099511693313_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %27, %3, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.load_cbuf_to_ca %2, %4, %c0_i64, %c0_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %3, %5, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_ca %2, %6, %c0_i64, %c128_i64, %c1_i64, %c4_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %3, %7, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %13 : i64
          pto.mad_raw %4, %5, %8, %c2305843013509185552_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
          pto.set_ctrl %9 : i64
          pto.set_ctrl %13 : i64
          pto.mad_raw %6, %7, %8, %c2305843013509185552_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
          pto.set_ctrl %9 : i64
        }
        %18 = arith.addi %14, %16 : index
        %19 = pto.addptr %arg0, %18 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %8, %19, %c140737489408000_i64, %c8796093022224_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
      }
      return
    }
  }
}
