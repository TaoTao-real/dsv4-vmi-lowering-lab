module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @hc_pre_linear(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c137440002560_i64 = arith.constant 137440002560 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
      %c2305843009213693952_i64 = arith.constant 2305843009213693952 : i64
      %c402653184_i64 = arith.constant 402653184 : i64
      %c1048576_i64 = arith.constant 1048576 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c2_i64 = arith.constant 2 : i64
      %c4_i64 = arith.constant 4 : i64
      %c16_i64 = arith.constant 16 : i64
      %c15_i64 = arith.constant 15 : i64
      %c103079280641_i64 = arith.constant 103079280641 : i64
      %c65537_i64 = arith.constant 65537 : i64
      %c32_i64 = arith.constant 32 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c24_i64 = arith.constant 24 : i64
      %c262144 = arith.constant 262144 : index
      %c512 = arith.constant 512 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c16 : index
      %3 = arith.remsi %0, %c4 : index
      %4 = arith.muli %3, %c4096 : index
      %5 = arith.subi %arg4, %2 : index
      %6 = arith.minsi %5, %c16 : index
      %7 = arith.muli %1, %c262144 : index
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l1>
      %9 = arith.index_cast %6 {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : index to i64
      %10 = arith.shli %9, %c32_i64 : i64
      %11 = arith.ori %10, %c65537_i64 : i64
      %12 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, l1>
      %13 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<f32, l1>
      %14 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, l1>
      %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0a>
      %16 = arith.index_cast %6 {pto.tilelib.candidate = "template_tmov_m2l", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index to i64
      %17 = arith.addi %16, %c15_i64 : i64
      %18 = arith.divui %17, %c16_i64 : i64
      %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0b>
      %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %21 = arith.index_cast %6 {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : index to i64
      %22 = pto.get_ctrl : i64
      %23 = pto.sbitset0 %22, %c45_i64 : i64, i64 -> i64
      %24 = pto.sbitset0 %23, %c46_i64 : i64, i64 -> i64
      %25 = pto.sbitset0 %24, %c47_i64 : i64, i64 -> i64
      %26 = pto.sbitset0 %25, %c51_i64 : i64, i64 -> i64
      %27 = arith.ori %21, %c1048576_i64 : i64
      %28 = arith.ori %27, %c402653184_i64 : i64
      %29 = arith.ori %28, %c2305843009213693952_i64 : i64
      scf.for %arg8 = %c0 to %c16 step %c2 {
        %32 = arith.muli %arg8, %c256 : index
        %33 = arith.addi %4, %32 : index
        %34 = arith.addi %32, %c256 : index
        %35 = arith.addi %4, %34 : index
        %36 = arith.addi %7, %33 : index
        %37 = pto.addptr %arg0, %36 : <f32, gm> -> <f32, gm>
        pto.set_mte2_nz_para %11 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %37, %8, %c0_i64, %c65536_i64, %c0_i64, %9, %c256_i64, %c0_i64, %false : !pto.ptr<f32, gm>, !pto.ptr<f32, l1>, i64, i64, i64, i64, i64, i64, i1
        %38 = pto.addptr %arg1, %33 : <f32, gm> -> <f32, gm>
        pto.set_mte2_nz_para %c103079280641_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %38, %12, %c0_i64, %c65536_i64, %c0_i64, %c24_i64, %c256_i64, %c0_i64, %false : !pto.ptr<f32, gm>, !pto.ptr<f32, l1>, i64, i64, i64, i64, i64, i64, i1
        %39 = arith.addi %7, %35 : index
        %40 = pto.addptr %arg0, %39 : <f32, gm> -> <f32, gm>
        pto.set_mte2_nz_para %11 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %40, %13, %c0_i64, %c65536_i64, %c0_i64, %9, %c256_i64, %c0_i64, %false : !pto.ptr<f32, gm>, !pto.ptr<f32, l1>, i64, i64, i64, i64, i64, i64, i1
        %41 = pto.addptr %arg1, %35 : <f32, gm> -> <f32, gm>
        pto.set_mte2_nz_para %c103079280641_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %41, %14, %c0_i64, %c65536_i64, %c0_i64, %c24_i64, %c256_i64, %c0_i64, %false : !pto.ptr<f32, gm>, !pto.ptr<f32, l1>, i64, i64, i64, i64, i64, i64, i1
        %42 = arith.cmpi eq, %arg8, %c0 : index
        scf.if %42 {
          %43 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, l0a>
          pto.load_cbuf_to_ca %8, %43, %c0_i64, %c0_i64, %18, %c32_i64, %18, %18 : !pto.ptr<f32, l1>, !pto.ptr<f32, l0a>, i64, i64, i64, i64, i64, i64
          %44 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, l0b>
          pto.load_cbuf_to_cb %12, %44, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c2_i64 {transpose = true} : !pto.ptr<f32, l1>, !pto.ptr<f32, l0b>, i64, i64, i64, i64, i64, i64
          %45 = arith.index_cast %6 {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : index to i64
          pto.set_ctrl %26 : i64
          %46 = arith.ori %45, %c1048576_i64 : i64
          %47 = arith.ori %46, %c402653184_i64 : i64
          %48 = arith.ori %47, %c2305843009213693952_i64 : i64
          %49 = arith.ori %48, %c-9223372036854775808_i64 : i64
          pto.mad_raw %43, %44, %20, %49 : !pto.ptr<f32, l0a>, !pto.ptr<f32, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %22 : i64
        } else {
          %43 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, l0a>
          pto.load_cbuf_to_ca %8, %43, %c0_i64, %c0_i64, %18, %c32_i64, %18, %18 : !pto.ptr<f32, l1>, !pto.ptr<f32, l0a>, i64, i64, i64, i64, i64, i64
          %44 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, l0b>
          pto.load_cbuf_to_cb %12, %44, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c2_i64 {transpose = true} : !pto.ptr<f32, l1>, !pto.ptr<f32, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %26 : i64
          pto.mad_raw %43, %44, %20, %29 : !pto.ptr<f32, l0a>, !pto.ptr<f32, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %22 : i64
        }
        pto.load_cbuf_to_ca %13, %15, %c0_i64, %c0_i64, %18, %c32_i64, %18, %18 : !pto.ptr<f32, l1>, !pto.ptr<f32, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %14, %19, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c2_i64 {transpose = true} : !pto.ptr<f32, l1>, !pto.ptr<f32, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %26 : i64
        pto.mad_raw %15, %19, %20, %29 : !pto.ptr<f32, l0a>, !pto.ptr<f32, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %22 : i64
      }
      %30 = arith.muli %1, %c512 : index
      %31 = pto.addptr %arg2, %30 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %20, %31, %c137440002560_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      return
    }
  }
}

