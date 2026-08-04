module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @kv_score_proj_0(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c1099512676864_i64 = arith.constant 1099512676864 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
      %c2305843009213693952_i64 = arith.constant 2305843009213693952 : i64
      %c536870912_i64 = arith.constant 536870912 : i64
      %c2097152_i64 = arith.constant 2097152 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c2_i64 = arith.constant 2 : i64
      %c16_i64 = arith.constant 16 : i64
      %c15_i64 = arith.constant 15 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c65537_i64 = arith.constant 65537 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c98304_i64 = arith.constant 98304 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c512 = arith.constant 512 : index
      %c32_i64 = arith.constant 32 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %false = arith.constant false
      %c65536 = arith.constant 65536 : index
      %c131072 = arith.constant 131072 : index
      %c4096 = arith.constant 4096 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.divsi %0, %c8 : index
      %2 = arith.muli %1, %c16 : index
      %3 = arith.remsi %0, %c8 : index
      %4 = arith.muli %3, %c32 : index
      %5 = arith.subi %c8, %2 : index
      %6 = arith.muli %1, %c65536 : index
      %7 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<bf16, l1>
      %8 = arith.index_cast %5 {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : index to i64
      %9 = arith.shli %8, %c32_i64 : i64
      %10 = arith.ori %9, %c65537_i64 : i64
      %11 = arith.muli %3, %c131072 : index
      %12 = pto.castptr %c98304_i64 : i64 -> !pto.ptr<bf16, l1>
      %13 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, l1>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %15 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l1>
      %16 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<bf16, l1>
      %17 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l0a>
      %18 = arith.index_cast %5 {pto.tilelib.candidate = "template_tmov_m2l", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"} : index to i64
      %19 = arith.addi %18, %c15_i64 : i64
      %20 = arith.divui %19, %c16_i64 : i64
      %21 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %23 = arith.index_cast %5 {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : index to i64
      %24 = pto.get_ctrl : i64
      %25 = pto.sbitset0 %24, %c45_i64 : i64, i64 -> i64
      %26 = pto.sbitset0 %25, %c46_i64 : i64, i64 -> i64
      %27 = pto.sbitset0 %26, %c47_i64 : i64, i64 -> i64
      %28 = pto.sbitset0 %27, %c51_i64 : i64, i64 -> i64
      %29 = arith.ori %23, %c2097152_i64 : i64
      %30 = arith.ori %29, %c536870912_i64 : i64
      %31 = arith.ori %30, %c2305843009213693952_i64 : i64
      %32 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, l0c>
      scf.for %arg7 = %c0 to %c8 step %c2 {
        %37 = arith.muli %arg7, %c512 : index
        %38 = arith.addi %37, %c512 : index
        %39 = arith.addi %6, %37 : index
        %40 = pto.addptr %arg0, %39 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %10 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %40, %7, %c0_i64, %c8192_i64, %c0_i64, %8, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %41 = arith.addi %11, %37 : index
        %42 = pto.addptr %arg1, %41 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %42, %12, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %43 = pto.addptr %arg2, %41 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %43, %13, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %44 = arith.addi %6, %38 : index
        %45 = pto.addptr %arg0, %44 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %10 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %45, %14, %c0_i64, %c8192_i64, %c0_i64, %8, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %46 = arith.addi %11, %38 : index
        %47 = pto.addptr %arg1, %46 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %47, %15, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %48 = pto.addptr %arg2, %46 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %48, %16, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %49 = arith.cmpi eq, %37, %c0 : index
        scf.if %49 {
          %50 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %50, %c0_i64, %c0_i64, %20, %c32_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %51 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %12, %51, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          %52 = arith.index_cast %5 {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : index to i64
          pto.set_ctrl %28 : i64
          %53 = arith.ori %52, %c2097152_i64 : i64
          %54 = arith.ori %53, %c536870912_i64 : i64
          %55 = arith.ori %54, %c2305843009213693952_i64 : i64
          %56 = arith.ori %55, %c-9223372036854775808_i64 : i64
          pto.mad_raw %50, %51, %22, %56 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %24 : i64
          pto.load_cbuf_to_cb %13, %51, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %28 : i64
          pto.mad_raw %50, %51, %32, %56 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %24 : i64
        } else {
          %50 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %7, %50, %c0_i64, %c0_i64, %20, %c32_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %51 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %12, %51, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %28 : i64
          pto.mad_raw %50, %51, %22, %31 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %24 : i64
          pto.load_cbuf_to_cb %13, %51, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %28 : i64
          pto.mad_raw %50, %51, %32, %31 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %24 : i64
        }
        pto.load_cbuf_to_ca %14, %17, %c0_i64, %c0_i64, %20, %c32_i64, %20, %20 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %15, %21, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %28 : i64
        pto.mad_raw %17, %21, %22, %31 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %24 : i64
        pto.load_cbuf_to_cb %16, %21, %c0_i64, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c2_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %28 : i64
        pto.mad_raw %17, %21, %32, %31 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %24 : i64
      }
      %33 = arith.muli %1, %c4096 : index
      %34 = arith.addi %33, %4 : index
      %35 = pto.addptr %arg3, %34 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %22, %35, %c1099512676864_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      %36 = pto.addptr %arg4, %34 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %32, %36, %c1099512676864_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      return
    }
  }
}
