module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @kv_proj_matmul(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: index, %arg4: index, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c2199024306176_i64 = arith.constant 2199024306176 : i64
      %c1_i64 = arith.constant 1 : i64
      %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
      %c2305843009213693952_i64 = arith.constant 2305843009213693952 : i64
      %c2147483648_i64 = arith.constant 2147483648 : i64
      %c524288_i64 = arith.constant 524288 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c16_i64 = arith.constant 16 : i64
      %c15_i64 = arith.constant 15 : i64
      %c1099511693313_i64 = arith.constant 1099511693313 : i64
      %c65537_i64 = arith.constant 65537 : i64
      %c32_i64 = arith.constant 32 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c73728_i64 = arith.constant 73728 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c12288_i64 = arith.constant 12288 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c128 = arith.constant 128 : index
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c1024 = arith.constant 1024 : index
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c65536 = arith.constant 65536 : index
      %c8192 = arith.constant 8192 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c128 : index
      %3 = arith.remsi %0, %c4 : index
      %4 = arith.muli %3, %c1024 : index
      %5 = arith.divsi %arg3, %c16 : index
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %7 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l1>
      %8 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<bf16, l1>
      %9 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<bf16, l1>
      %10 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l0a>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %12 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
      %13 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %15 = pto.get_ctrl : i64
      %16 = pto.sbitset0 %15, %c45_i64 : i64, i64 -> i64
      %17 = pto.sbitset0 %16, %c46_i64 : i64, i64 -> i64
      %18 = pto.sbitset0 %17, %c47_i64 : i64, i64 -> i64
      %19 = pto.sbitset0 %18, %c51_i64 : i64, i64 -> i64
      scf.for %arg8 = %c0 to %5 step %c1 {
        %20 = arith.muli %arg8, %c16 : index
        %21 = arith.subi %arg5, %20 : index
        %22 = arith.minsi %21, %c16 : index
        %23 = arith.muli %arg8, %c65536 : index
        %24 = arith.index_cast %22 {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : index to i64
        %25 = arith.shli %24, %c32_i64 : i64
        %26 = arith.ori %25, %c65537_i64 : i64
        %27 = arith.index_cast %22 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : index to i64
        %28 = arith.addi %27, %c15_i64 : i64
        %29 = arith.divui %28, %c16_i64 : i64
        %30 = arith.index_cast %22 {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : index to i64
        %31 = arith.ori %30, %c524288_i64 : i64
        %32 = arith.ori %31, %c2147483648_i64 : i64
        %33 = arith.ori %32, %c2305843009213693952_i64 : i64
        scf.for %arg9 = %c0 to %c4 step %c2 {
          %37 = arith.muli %arg9, %c256 : index
          %38 = arith.addi %4, %37 : index
          %39 = arith.addi %37, %c256 : index
          %40 = arith.addi %4, %39 : index
          %41 = arith.addi %23, %38 : index
          %42 = pto.addptr %arg1, %41 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %26 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %42, %6, %c0_i64, %c8192_i64, %c0_i64, %24, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %43 = arith.muli %38, %c512 : index
          %44 = arith.addi %43, %2 : index
          %45 = pto.addptr %arg2, %44 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c1099511693313_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %45, %7, %c0_i64, %c1024_i64, %c0_i64, %c256_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %46 = arith.addi %23, %40 : index
          %47 = pto.addptr %arg1, %46 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %26 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %47, %8, %c0_i64, %c8192_i64, %c0_i64, %24, %c256_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %48 = arith.muli %40, %c512 : index
          %49 = arith.addi %48, %2 : index
          %50 = pto.addptr %arg2, %49 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c1099511693313_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %50, %9, %c0_i64, %c1024_i64, %c0_i64, %c256_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %51 = arith.cmpi eq, %arg9, %c0 : index
          scf.if %51 {
            %52 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<bf16, l0a>
            pto.load_cbuf_to_ca %6, %52, %c0_i64, %c0_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %7, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %53 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
            pto.load_cbuf_to_ca %6, %53, %c0_i64, %c128_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %7, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %54 = arith.index_cast %22 {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : index to i64
            pto.set_ctrl %19 : i64
            %55 = arith.ori %54, %c524288_i64 : i64
            %56 = arith.ori %55, %c2147483648_i64 : i64
            %57 = arith.ori %56, %c2305843009213693952_i64 : i64
            %58 = arith.ori %57, %c-9223372036854775808_i64 : i64
            pto.mad_raw %52, %11, %14, %58 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %15 : i64
            pto.set_ctrl %19 : i64
            pto.mad_raw %53, %13, %14, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %15 : i64
          } else {
            %52 = pto.castptr %c12288_i64 : i64 -> !pto.ptr<bf16, l0a>
            pto.load_cbuf_to_ca %6, %52, %c0_i64, %c0_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %7, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %53 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
            pto.load_cbuf_to_ca %6, %53, %c0_i64, %c128_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %7, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_ctrl %19 : i64
            pto.mad_raw %52, %11, %14, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %15 : i64
            pto.set_ctrl %19 : i64
            pto.mad_raw %53, %13, %14, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %15 : i64
          }
          pto.load_cbuf_to_ca %8, %10, %c0_i64, %c0_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %9, %11, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_ca %8, %12, %c0_i64, %c128_i64, %29, %c8_i64, %29, %29 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          pto.load_cbuf_to_cb %9, %13, %c128_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %19 : i64
          pto.mad_raw %10, %11, %14, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %15 : i64
          pto.set_ctrl %19 : i64
          pto.mad_raw %12, %13, %14, %33 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %15 : i64
        }
        %34 = arith.muli %arg8, %c8192 : index
        %35 = arith.addi %34, %2 : index
        %36 = pto.addptr %arg0, %35 : <f32, gm> -> <f32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %14, %36, %c2199024306176_i64, %c8796093022224_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      }
      return
    }
  }
}
