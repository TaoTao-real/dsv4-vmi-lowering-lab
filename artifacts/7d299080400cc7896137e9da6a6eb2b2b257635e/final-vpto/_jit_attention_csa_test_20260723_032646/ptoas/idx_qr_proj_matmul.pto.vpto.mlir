module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @idx_qr_proj_matmul(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022224_i64 = arith.constant 8796093022224 : i64
      %c35184373145600_i64 = arith.constant 35184373145600 : i64
      %c2305843017803890696_i64 = arith.constant 2305843017803890696 : i64
      %c-6917529019050885112_i64 = arith.constant -6917529019050885112 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c32_i64 = arith.constant 32 : i64
      %c2_i64 = arith.constant 2 : i64
      %c1_i64 = arith.constant 1 : i64
      %c1099511693313_i64 = arith.constant 1099511693313 : i64
      %c34359803905_i64 = arith.constant 34359803905 : i64
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c135168_i64 = arith.constant 135168 : i64
      %c139264_i64 = arith.constant 139264 : i64
      %c3072_i64 = arith.constant 3072 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c8192 = arith.constant 8192 : index
      %c1024 = arith.constant 1024 : index
      %c0 = arith.constant 0 : index
      %c512 = arith.constant 512 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c512_i64 = arith.constant 512 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %false = arith.constant false
      %c2097152 = arith.constant 2097152 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c1024 : index
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      %3 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l1>
      %4 = pto.castptr %c135168_i64 : i64 -> !pto.ptr<i8, l1>
      %5 = pto.castptr %c139264_i64 : i64 -> !pto.ptr<i8, l1>
      %6 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<i8, l0a>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
      %8 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i8, l0a>
      %9 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l0b>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %11 = pto.get_ctrl : i64
      %12 = pto.sbitset0 %11, %c45_i64 : i64, i64 -> i64
      %13 = pto.sbitset0 %12, %c46_i64 : i64, i64 -> i64
      %14 = pto.sbitset0 %13, %c47_i64 : i64, i64 -> i64
      %15 = pto.sbitset0 %14, %c51_i64 : i64, i64 -> i64
      scf.for %arg5 = %c0 to %c1024 step %c512 {
        %16 = arith.addi %1, %arg5 : index
        scf.for %arg6 = %c0 to %c4 step %c2 {
          %18 = arith.muli %arg6, %c256 : index
          %19 = arith.addi %18, %c256 : index
          %20 = pto.addptr %arg1, %18 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c34359803905_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %20, %2, %c0_i64, %c1024_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %21 = arith.muli %arg6, %c2097152 : index
          %22 = arith.addi %21, %16 : index
          %23 = pto.addptr %arg2, %22 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c1099511693313_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %23, %3, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c512_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %24 = pto.addptr %arg1, %19 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c34359803905_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %24, %4, %c0_i64, %c1024_i64, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %25 = arith.muli %19, %c8192 : index
          %26 = arith.addi %25, %16 : index
          %27 = pto.addptr %arg2, %26 : <i8, gm> -> <i8, gm>
          pto.set_mte2_nz_para %c1099511693313_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %27, %5, %c0_i64, %c8192_i64, %c0_i64, %c256_i64, %c512_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %28 = arith.cmpi eq, %18, %c0 : index
          scf.if %28 {
            %29 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<i8, l0a>
            %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
            scf.for %arg7 = %c0 to %c256 step %c128 {
              %31 = arith.index_cast %arg7 : index to i32
              %32 = arith.extsi %31 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %2, %29, %c0_i64, %32, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %33 = arith.extsi %31 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %3, %7, %33, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              %34 = arith.addi %arg7, %c64 : index
              %35 = arith.index_cast %34 : index to i32
              %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %2, %30, %c0_i64, %36, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %3, %9, %37, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              %38 = arith.cmpi eq, %arg7, %c0 : index
              scf.if %38 {
                pto.set_ctrl %15 : i64
                pto.mad_raw %29, %7, %10, %c-6917529019050885112_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                pto.set_ctrl %11 : i64
              } else {
                pto.set_ctrl %15 : i64
                pto.mad_raw %29, %7, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
                pto.set_ctrl %11 : i64
              }
              pto.set_ctrl %15 : i64
              pto.mad_raw %30, %9, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
              pto.set_ctrl %11 : i64
            }
          } else {
            %29 = pto.castptr %c3072_i64 : i64 -> !pto.ptr<i8, l0a>
            %30 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
            scf.for %arg7 = %c0 to %c256 step %c128 {
              %31 = arith.index_cast %arg7 : index to i32
              %32 = arith.extsi %31 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %2, %29, %c0_i64, %32, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %33 = arith.extsi %31 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %3, %7, %33, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              %34 = arith.addi %arg7, %c64 : index
              %35 = arith.index_cast %34 : index to i32
              %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_ca %2, %30, %c0_i64, %36, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
              %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
              pto.load_cbuf_to_cb %3, %9, %37, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
              pto.set_ctrl %15 : i64
              pto.mad_raw %29, %7, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
              pto.set_ctrl %11 : i64
              pto.set_ctrl %15 : i64
              pto.mad_raw %30, %9, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
              pto.set_ctrl %11 : i64
            }
          }
          scf.for %arg7 = %c0 to %c256 step %c128 {
            %29 = arith.index_cast %arg7 : index to i32
            %30 = arith.extsi %29 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %4, %6, %c0_i64, %30, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            %31 = arith.extsi %29 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %7, %31, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            %32 = arith.addi %arg7, %c64 : index
            %33 = arith.index_cast %32 : index to i32
            %34 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %4, %8, %c0_i64, %34, %c1_i64, %c2_i64, %c1_i64, %c1_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            %35 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %9, %35, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_ctrl %15 : i64
            pto.mad_raw %6, %7, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %11 : i64
            pto.set_ctrl %15 : i64
            pto.mad_raw %8, %9, %10, %c2305843017803890696_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %11 : i64
          }
        }
        %17 = pto.addptr %arg0, %16 : <i32, gm> -> <i32, gm>
        pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
        pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
        pto.copy_matrix_cc_to_gm %10, %17, %c35184373145600_i64, %c8796093022224_i64 : !pto.ptr<i32, l0c>, !pto.ptr<i32, gm>, i64, i64
      }
      return
    }
  }
}
