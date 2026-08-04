module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @kv_score_proj(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c4398047560704_i64 = arith.constant 4398047560704 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
      %c2305843009213693952_i64 = arith.constant 2305843009213693952 : i64
      %c1073741824_i64 = arith.constant 1073741824 : i64
      %c1048576_i64 = arith.constant 1048576 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c4_i64 = arith.constant 4 : i64
      %c16_i64 = arith.constant 16 : i64
      %c15_i64 = arith.constant 15 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c65537_i64 = arith.constant 65537 : i64
      %c32_i64 = arith.constant 32 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c147456_i64 = arith.constant 147456 : i64
      %c163840_i64 = arith.constant 163840 : i64
      %c229376_i64 = arith.constant 229376 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c512 = arith.constant 512 : index
      %c64_i64 = arith.constant 64 : i64
      %c512_i64 = arith.constant 512 : i64
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c65536 = arith.constant 65536 : index
      %c262144 = arith.constant 262144 : index
      %c16384 = arith.constant 16384 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.divsi %0, %c16 : index
      %2 = arith.muli %1, %c16 : index
      %3 = arith.remsi %0, %c16 : index
      %4 = arith.muli %3, %c64 : index
      %5 = arith.subi %c8, %2 : index
      %6 = arith.muli %1, %c65536 : index
      %7 = pto.castptr %c147456_i64 : i64 -> !pto.ptr<bf16, l1>
      %8 = arith.index_cast %5 {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : index to i64
      %9 = arith.shli %8, %c32_i64 : i64
      %10 = arith.ori %9, %c65537_i64 : i64
      %11 = arith.muli %3, %c262144 : index
      %12 = pto.castptr %c163840_i64 : i64 -> !pto.ptr<bf16, l1>
      %13 = pto.castptr %c229376_i64 : i64 -> !pto.ptr<bf16, l1>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %15 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l1>
      %16 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<bf16, l1>
      %17 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l0a>
      %18 = arith.index_cast %5 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : index to i64
      %19 = arith.addi %18, %c15_i64 : i64
      %20 = arith.divui %19, %c16_i64 : i64
      %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %22 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<bf16, l0a>
      %23 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %25 = arith.index_cast %5 {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : index to i64
      %26 = pto.get_ctrl : i64
      %27 = pto.sbitset0 %26, %c45_i64 : i64, i64 -> i64
      %28 = pto.sbitset0 %27, %c46_i64 : i64, i64 -> i64
      %29 = pto.sbitset0 %28, %c47_i64 : i64, i64 -> i64
      %30 = pto.sbitset0 %29, %c51_i64 : i64, i64 -> i64
      %31 = arith.ori %25, %c1048576_i64 : i64
      %32 = arith.ori %31, %c1073741824_i64 : i64
      %33 = arith.ori %32, %c2305843009213693952_i64 : i64
      %34 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, l0c>
      scf.for %arg7 = %c0 to %c8 step %c2 {
        %39 = arith.muli %arg7, %c512 : index
        %40 = arith.addi %39, %c512 : index
        %41 = arith.addi %6, %39 : index
        %42 = pto.addptr %arg0, %41 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %10 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %42, %7, %c0_i64, %c8192_i64, %c0_i64, %8, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %43 = arith.addi %11, %39 : index
        %44 = pto.addptr %arg1, %43 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %44, %12, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %45 = pto.addptr %arg2, %43 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %45, %13, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %46 = arith.addi %6, %40 : index
        %47 = pto.addptr %arg0, %46 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %10 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %47, %14, %c0_i64, %c8192_i64, %c0_i64, %8, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %48 = arith.addi %11, %40 : index
        %49 = pto.addptr %arg1, %48 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %49, %15, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %50 = pto.addptr %arg2, %48 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %50, %16, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %51 = arith.cmpi eq, %39, %c0 : index
        scf.if %51 {
          %52 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %52, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %12, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          %53 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %53, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %12, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          %54 = arith.index_cast %5 {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : index to i64
          pto.set_ctrl %30 : i64
          %55 = arith.ori %54, %c1048576_i64 : i64
          %56 = arith.ori %55, %c1073741824_i64 : i64
          %57 = arith.ori %56, %c2305843009213693952_i64 : i64
          %58 = arith.ori %57, %c-9223372036854775808_i64 : i64
          pto.mad_raw %52, %21, %24, %58 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %53, %23, %24, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.load_cbuf_to_ca %7, %52, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %13, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_ca %7, %53, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %13, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %52, %21, %34, %58 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %53, %23, %34, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
        } else {
          %52 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %52, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %12, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          %53 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %53, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %12, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %52, %21, %24, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %53, %23, %24, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.load_cbuf_to_ca %7, %52, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %13, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_ca %7, %53, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %13, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %52, %21, %34, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
          pto.set_ctrl %30 : i64
          pto.mad_raw %53, %23, %34, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %26 : i64
        }
        pto.load_cbuf_to_ca %14, %17, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %15, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_ca %14, %22, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %15, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %30 : i64
        pto.mad_raw %17, %21, %24, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %26 : i64
        pto.set_ctrl %30 : i64
        pto.mad_raw %22, %23, %24, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %26 : i64
        pto.load_cbuf_to_ca %14, %17, %c0_i64, %c0_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %16, %21, %c0_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_ca %14, %22, %c0_i64, %c256_i64, %20, %c16_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %16, %23, %c256_i64, %c0_i64, %c16_i64, %c4_i64, %c16_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %30 : i64
        pto.mad_raw %17, %21, %34, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %26 : i64
        pto.set_ctrl %30 : i64
        pto.mad_raw %22, %23, %34, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %26 : i64
      }
      %35 = arith.muli %1, %c16384 : index
      %36 = arith.addi %35, %4 : index
      %37 = pto.addptr %arg3, %36 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %24, %37, %c4398047560704_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      %38 = pto.addptr %arg4, %36 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %34, %38, %c4398047560704_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      return
    }
  }
}
