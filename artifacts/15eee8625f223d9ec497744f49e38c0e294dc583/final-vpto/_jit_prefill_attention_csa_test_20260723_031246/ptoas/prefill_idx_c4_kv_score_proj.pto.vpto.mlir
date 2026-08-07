module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_kv_score_proj(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<bf16, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022336_i64 = arith.constant 8796093022336 : i64
      %c1099520017408_i64 = arith.constant 1099520017408 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2305843010287960192_i64 = arith.constant 2305843010287960192 : i64
      %c-6917529026566815616_i64 = arith.constant -6917529026566815616 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c262144_i64 = arith.constant 262144 : i64
      %c393216_i64 = arith.constant 393216 : i64
      %c458752_i64 = arith.constant 458752 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c128 = arith.constant 128 : index
      %c256 = arith.constant 256 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c2 = arith.constant 2 : index
      %c512 = arith.constant 512 : index
      %c128_i64 = arith.constant 128 : i64
      %c64_i64 = arith.constant 64 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %false = arith.constant false
      %c262144 = arith.constant 262144 : index
      %0 = arith.index_cast %arg5 : i32 to index
      %1 = arith.muli %0, %c64 : index
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      %2 = pto.castptr %c262144_i64 : i64 -> !pto.ptr<bf16, l1>
      %3 = arith.muli %0, %c262144 : index
      %4 = pto.castptr %c393216_i64 : i64 -> !pto.ptr<bf16, l1>
      %5 = pto.castptr %c458752_i64 : i64 -> !pto.ptr<bf16, l1>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %7 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<bf16, l1>
      %8 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %10 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
      %11 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0a>
      %12 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<bf16, l0b>
      %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %14 = pto.get_ctrl : i64
      %15 = pto.sbitset0 %14, %c45_i64 : i64, i64 -> i64
      %16 = pto.sbitset0 %15, %c46_i64 : i64, i64 -> i64
      %17 = pto.sbitset0 %16, %c47_i64 : i64, i64 -> i64
      %18 = pto.sbitset0 %17, %c51_i64 : i64, i64 -> i64
      %19 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, l0c>
      scf.for %arg7 = %c0 to %c8 step %c2 {
        %22 = arith.muli %arg7, %c512 : index
        %23 = arith.addi %22, %c512 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        %24 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %24, %2, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %25 = arith.addi %3, %22 : index
        %26 = pto.addptr %arg1, %25 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %26, %4, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %27 = pto.addptr %arg2, %25 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %27, %5, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %28 = pto.addptr %arg0, %23 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %28, %6, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %29 = arith.addi %3, %23 : index
        %30 = pto.addptr %arg1, %29 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %30, %7, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        %31 = pto.addptr %arg2, %29 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %31, %8, %c0_i64, %c8192_i64, %c0_i64, %c64_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        %32 = arith.cmpi eq, %22, %c0 : index
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        scf.if %32 {
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          %34 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l0b>
          scf.for %arg8 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_MTE1>
            %35 = arith.index_cast %arg8 : index to i32
            %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %9, %c0_i64, %36, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %4, %33, %37, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            %38 = arith.addi %arg8, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %39 = arith.index_cast %38 : index to i32
            %40 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %11, %c0_i64, %40, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %41 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %4, %34, %41, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            %42 = arith.cmpi eq, %arg8, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
            scf.if %42 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %18 : i64
              pto.mad_raw %9, %33, %13, %c-6917529026566815616_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %14 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %18 : i64
              pto.mad_raw %9, %33, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %14 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
            pto.set_ctrl %18 : i64
            pto.mad_raw %11, %34, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          scf.for %arg8 = %c0 to %c512 step %c256 {
            pto.barrier <PIPE_MTE1>
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            %35 = arith.index_cast %arg8 : index to i32
            %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %9, %c0_i64, %36, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %33, %37, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            %38 = arith.addi %arg8, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
            %39 = arith.index_cast %38 : index to i32
            %40 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %11, %c0_i64, %40, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %41 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %34, %41, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            %42 = arith.cmpi eq, %arg8, %c0 : index
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
            scf.if %42 {
              pto.barrier <PIPE_M>
              pto.set_ctrl %18 : i64
              pto.mad_raw %9, %33, %19, %c-6917529026566815616_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %14 : i64
            } else {
              pto.barrier <PIPE_M>
              pto.set_ctrl %18 : i64
              pto.mad_raw %9, %33, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %14 : i64
            }
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
            pto.set_ctrl %18 : i64
            pto.mad_raw %11, %34, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
        } else {
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          %33 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          %34 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<bf16, l0b>
          scf.for %arg8 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
            %35 = arith.index_cast %arg8 : index to i32
            %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %9, %c0_i64, %36, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %4, %33, %37, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            %38 = arith.addi %arg8, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
            %39 = arith.index_cast %38 : index to i32
            %40 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %11, %c0_i64, %40, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %41 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %4, %34, %41, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
            pto.barrier <PIPE_M>
            pto.set_ctrl %18 : i64
            pto.mad_raw %9, %33, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
            pto.set_ctrl %18 : i64
            pto.mad_raw %11, %34, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          scf.for %arg8 = %c0 to %c512 step %c256 {
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            %35 = arith.index_cast %arg8 : index to i32
            %36 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %9, %c0_i64, %36, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %37 = arith.extsi %35 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %33, %37, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            %38 = arith.addi %arg8, %c128 : index
            pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
            %39 = arith.index_cast %38 : index to i32
            %40 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %2, %11, %c0_i64, %40, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %41 = arith.extsi %39 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %34, %41, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
            pto.barrier <PIPE_M>
            pto.set_ctrl %18 : i64
            pto.mad_raw %9, %33, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
            pto.barrier <PIPE_M>
            pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
            pto.set_ctrl %18 : i64
            pto.mad_raw %11, %34, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %14 : i64
            pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          }
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        }
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        scf.for %arg8 = %c0 to %c512 step %c256 {
          pto.barrier <PIPE_MTE1>
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          %33 = arith.index_cast %arg8 : index to i32
          %34 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_ca %6, %9, %c0_i64, %34, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %35 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_cb %7, %10, %35, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          %36 = arith.addi %arg8, %c128 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %37 = arith.index_cast %36 : index to i32
          %38 = arith.extsi %37 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_ca %6, %11, %c0_i64, %38, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %39 = arith.extsi %37 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_cb %7, %12, %39, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          pto.barrier <PIPE_M>
          pto.set_ctrl %18 : i64
          pto.mad_raw %9, %10, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %14 : i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.set_ctrl %18 : i64
          pto.mad_raw %11, %12, %13, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %14 : i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        scf.for %arg8 = %c0 to %c512 step %c256 {
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          %33 = arith.index_cast %arg8 : index to i32
          %34 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_ca %6, %9, %c0_i64, %34, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %35 = arith.extsi %33 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_cb %8, %10, %35, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          %36 = arith.addi %arg8, %c128 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %37 = arith.index_cast %36 : index to i32
          %38 = arith.extsi %37 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_ca %6, %11, %c0_i64, %38, %c8_i64, %c8_i64, %c8_i64, %c8_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %39 = arith.extsi %37 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.load_cbuf_to_cb %8, %12, %39, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          pto.barrier <PIPE_M>
          pto.set_ctrl %18 : i64
          pto.mad_raw %9, %10, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %14 : i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.set_ctrl %18 : i64
          pto.mad_raw %11, %12, %19, %c2305843010287960192_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %14 : i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      %20 = pto.addptr %arg3, %1 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %13, %20, %c1099520017408_i64, %c8796093022336_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      %21 = pto.addptr %arg4, %1 : <f32, gm> -> <f32, gm>
      pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
      pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
      pto.copy_matrix_cc_to_gm %19, %21, %c1099520017408_i64, %c8796093022336_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
