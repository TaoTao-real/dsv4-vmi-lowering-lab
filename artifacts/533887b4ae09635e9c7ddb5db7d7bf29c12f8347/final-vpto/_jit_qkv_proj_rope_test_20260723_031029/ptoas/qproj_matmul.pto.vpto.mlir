module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qproj_matmul(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c140737489420288_i64 = arith.constant 140737489420288 : i64
      %c2305843026393694224_i64 = arith.constant 2305843026393694224 : i64
      %c-6917529010461081584_i64 = arith.constant -6917529010461081584 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c64_i64 = arith.constant 64 : i64
      %c1_i64 = arith.constant 1 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c68719542273_i64 = arith.constant 68719542273 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c133120_i64 = arith.constant 133120 : i64
      %c135168_i64 = arith.constant 135168 : i64
      %c1536_i64 = arith.constant 1536 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c512_i64 = arith.constant 512 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c128 = arith.constant 128 : index
      %c32768 = arith.constant 32768 : index
      %c1 = arith.constant 1 : index
      %c1024 = arith.constant 1024 : index
      %c2 = arith.constant 2 : index
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c8 = arith.constant 8 : index
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %c16_i64 = arith.constant 16 : i64
      %c128_i64 = arith.constant 128 : i64
      %false = arith.constant false
      %c16384 = arith.constant 16384 : index
      %c4194304 = arith.constant 4194304 : index
      %c524288 = arith.constant 524288 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c2 : index
      %2 = arith.divsi %arg3, %c16 : index
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      %4 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i8, l1>
      %5 = pto.castptr %c133120_i64 : i64 -> !pto.ptr<i8, l1>
      %6 = pto.castptr %c135168_i64 : i64 -> !pto.ptr<i8, l1>
      %7 = pto.castptr %c512_i64 : i64 -> !pto.ptr<i8, l0a>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
      %9 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<i8, l0a>
      %10 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l0b>
      %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %12 = pto.get_ctrl : i64
      %13 = pto.sbitset0 %12, %c45_i64 : i64, i64 -> i64
      %14 = pto.sbitset0 %13, %c46_i64 : i64, i64 -> i64
      %15 = pto.sbitset0 %14, %c47_i64 : i64, i64 -> i64
      %16 = pto.sbitset0 %15, %c51_i64 : i64, i64 -> i64
      scf.for %arg6 = %c0 to %c2 step %c1 {
        %17 = arith.addi %1, %arg6 : index
        %18 = arith.muli %17, %c1024 : index
        scf.for %arg7 = %c0 to %2 step %c1 {
          %19 = arith.muli %arg7, %c16384 : index
          scf.for %arg8 = %c0 to %c8 step %c2 {
            %23 = arith.muli %arg8, %c128 : index
            %24 = arith.addi %23, %c128 : index
            %25 = arith.addi %19, %23 : index
            %26 = pto.addptr %arg1, %25 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c68719542273_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %26, %3, %c0_i64, %c1024_i64, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %27 = arith.muli %arg8, %c4194304 : index
            %28 = arith.addi %27, %18 : index
            %29 = pto.addptr %arg2, %28 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c549755879425_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %29, %4, %c0_i64, %c32768_i64, %c0_i64, %c128_i64, %c1024_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %30 = arith.addi %19, %24 : index
            %31 = pto.addptr %arg1, %30 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c68719542273_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %31, %5, %c0_i64, %c1024_i64, %c0_i64, %c16_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %32 = arith.muli %24, %c32768 : index
            %33 = arith.addi %32, %18 : index
            %34 = pto.addptr %arg2, %33 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c549755879425_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %34, %6, %c0_i64, %c32768_i64, %c0_i64, %c128_i64, %c1024_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            %35 = arith.cmpi eq, %23, %c0 : index
            scf.if %35 {
              %36 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<i8, l0a>
              %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
              scf.for %arg9 = %c0 to %c128 step %c64 {
                %38 = arith.index_cast %arg9 : index to i32
                %39 = arith.extsi %38 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_ca %3, %36, %c0_i64, %39, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
                %40 = arith.extsi %38 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_cb %4, %8, %40, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
                %41 = arith.addi %arg9, %c32 : index
                %42 = arith.index_cast %41 : index to i32
                %43 = arith.extsi %42 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_ca %3, %37, %c0_i64, %43, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
                %44 = arith.extsi %42 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_cb %4, %10, %44, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
                %45 = arith.cmpi eq, %arg9, %c0 : index
                scf.if %45 {
                  pto.set_ctrl %16 : i64
                  pto.mad_raw %36, %8, %11, %c-6917529010461081584_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                  pto.set_ctrl %12 : i64
                } else {
                  pto.set_ctrl %16 : i64
                  pto.mad_raw %36, %8, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                  pto.set_ctrl %12 : i64
                }
                pto.set_ctrl %16 : i64
                pto.mad_raw %37, %10, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                pto.set_ctrl %12 : i64
              }
            } else {
              %36 = pto.castptr %c1536_i64 : i64 -> !pto.ptr<i8, l0a>
              %37 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
              scf.for %arg9 = %c0 to %c128 step %c64 {
                %38 = arith.index_cast %arg9 : index to i32
                %39 = arith.extsi %38 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_ca %3, %36, %c0_i64, %39, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
                %40 = arith.extsi %38 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_cb %4, %8, %40, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
                %41 = arith.addi %arg9, %c32 : index
                %42 = arith.index_cast %41 : index to i32
                %43 = arith.extsi %42 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_ca %3, %37, %c0_i64, %43, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
                %44 = arith.extsi %42 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
                pto.load_cbuf_to_cb %4, %10, %44, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
                pto.set_ctrl %16 : i64
                pto.mad_raw %36, %8, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                pto.set_ctrl %12 : i64
                pto.set_ctrl %16 : i64
                pto.mad_raw %37, %10, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                pto.set_ctrl %12 : i64
              }
            }
            scf.for %arg9 = %c0 to %c128 step %c64 {
              %36 = arith.index_cast %arg9 : index to i32
              %37 = arith.extsi %36 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %5, %7, %c0_i64, %37, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %38 = arith.extsi %36 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %6, %8, %38, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              %39 = arith.addi %arg9, %c32 : index
              %40 = arith.index_cast %39 : index to i32
              %41 = arith.extsi %40 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %5, %9, %c0_i64, %41, %c1_i64, %c1_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %42 = arith.extsi %40 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %6, %10, %42, %c0_i64, %c64_i64, %c1_i64, %c64_i64, %c64_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              pto.set_ctrl %16 : i64
              pto.mad_raw %7, %8, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
              pto.set_ctrl %12 : i64
              pto.set_ctrl %16 : i64
              pto.mad_raw %9, %10, %11, %c2305843026393694224_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
              pto.set_ctrl %12 : i64
            }
          }
          %20 = arith.muli %arg7, %c524288 : index
          %21 = arith.addi %20, %18 : index
          %22 = pto.addptr %arg0, %21 : <i32, gm> -> <i32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %11, %22, %c140737489420288_i64, %c8796093022224_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
        }
      }
      return
    }
  }
}

