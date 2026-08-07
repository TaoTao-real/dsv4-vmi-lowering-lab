// -----// IR Dump After PTOVmiLoopFusion (pto-vmi-loop-fusion) //----- //
module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
  func.func @qk_pv_aic(%arg0: memref<?xf32, #pto.address_space<gm>>, %arg1: memref<?xf32, #pto.address_space<gm>>, %arg2: memref<?xf32, #pto.address_space<gm>>, %arg3: memref<?xi32, #pto.address_space<gm>>, %arg4: memref<?xf32, #pto.address_space<gm>>, %arg5: memref<?xi32, #pto.address_space<gm>>, %arg6: memref<?xi32, #pto.address_space<gm>>, %arg7: memref<?xbf16, #pto.address_space<gm>>, %arg8: memref<?xi32, #pto.address_space<gm>>, %arg9: memref<?xi32, #pto.address_space<gm>>, %arg10: memref<?xbf16, #pto.address_space<gm>>, %arg11: memref<?xbf16, #pto.address_space<gm>>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
    %c32768 = arith.constant 32768 : index
    %c128_i64 = arith.constant 128 : i64
    %c16_i64 = arith.constant 16 : i64
    %false = arith.constant false
    %c1_i64 = arith.constant 1 : i64
    %c512_i64 = arith.constant 512 : i64
    %c16 = arith.constant 16 : index
    %c256 = arith.constant 256 : index
    %c64 = arith.constant 64 : index
    %c320 = arith.constant 320 : index
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c24 = arith.constant 24 : index
    %c32 = arith.constant 32 : index
    %c128 = arith.constant 128 : index
    %c5 = arith.constant 5 : index
    %c512 = arith.constant 512 : index
    %c1 = arith.constant 1 : index
    %c32768_i64 = arith.constant 32768 : i64
    %c8192_i64 = arith.constant 8192 : i64
    %c0_i64 = arith.constant 0 : i64
    %c196608_i64 = arith.constant 196608 : i64
    %c65536_i64 = arith.constant 65536 : i64
    %c80 = arith.constant 80 : index
    %c160 = arith.constant 160 : index
    %c240 = arith.constant 240 : index
    %c0_i32 = arith.constant 0 : i32
    %c63 = arith.constant 63 : index
    %c32_i64 = arith.constant 32 : i64
    %c1024_i64 = arith.constant 1024 : i64
    %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
    %1 = arith.index_cast %arg12 : i32 to index
    %2 = arith.subi %c63, %1 : index
    %3 = arith.divsi %2, %c24 : index
    pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
    pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
    pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
    pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
    scf.for %arg14 = %c0 to %3 step %c1 {
      %4 = arith.muli %arg14, %c24 : index
      %5 = arith.addi %1, %4 : index
      %6 = pto.load_scalar %arg3[%5] : memref<?xi32, #pto.address_space<gm>> -> i32
      %7 = arith.index_cast %6 : i32 to index
      %8 = arith.divsi %7, %c5 : index
      %9 = arith.muli %8, %c5 : index
      %10 = arith.subi %7, %9 : index
      %11 = arith.divsi %8, %c2 : index
      %12 = arith.muli %8, %c320 : index
      %13 = arith.muli %10, %c128 : index
      %14 = pto.load_scalar %arg5[%7] : memref<?xi32, #pto.address_space<gm>> -> i32
      %15 = arith.index_cast %14 : i32 to index
      %16 = arith.cmpi sgt, %15, %c0 : index
      scf.if %16 {
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        scf.for %arg15 = %c0 to %c128 step %c1 {
          %61 = arith.addi %13, %arg15 : index
          %62 = arith.cmpi slt, %61, %c128 : index
          scf.if %62 {
            %63 = arith.muli %8, %c128 : index
            %64 = arith.addi %63, %61 : index
            %65 = pto.load_scalar %arg6[%64] : memref<?xi32, #pto.address_space<gm>> -> i32
            %66 = arith.index_cast %65 : i32 to index
            %67 = arith.cmpi sge, %66, %c0 : index
            scf.if %67 {
              %68 = arith.index_cast %arg15 : index to i64
              %69 = arith.muli %68, %c32_i64 : i64
              %70 = arith.addi %69, %c65536_i64 : i64
              %71 = arith.muli %66, %c512 : index
              %72 = pto.castptr %arg7 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
              %73 = pto.addptr %72, %71 : <bf16, gm> -> <bf16, gm>
              %74 = pto.pointer_cast(%70) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
              %75 = pto.castptr %74 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
              pto.mte_gm_l1_frac %73, %75, nd2nz, shape(%c1_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c1_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
            } else {
              %68 = arith.index_cast %arg15 : index to i64
              %69 = arith.muli %68, %c32_i64 : i64
              %70 = arith.addi %69, %c65536_i64 : i64
              %71 = pto.castptr %arg7 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
              %72 = pto.pointer_cast(%70) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
              %73 = pto.castptr %72 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
              pto.mte_gm_l1_frac %71, %73, nd2nz, shape(%c1_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c1_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
            }
          } else {
            %63 = arith.subi %61, %c128 : index
            %64 = arith.cmpi slt, %63, %c512 : index
            scf.if %64 {
              %65 = arith.muli %8, %c512 : index
              %66 = arith.addi %65, %63 : index
              %67 = pto.load_scalar %arg8[%66] : memref<?xi32, #pto.address_space<gm>> -> i32
              %68 = arith.index_cast %67 : i32 to index
              %69 = arith.cmpi sge, %68, %c0 : index
              scf.if %69 {
                %70 = arith.divsi %68, %c128 : index
                %71 = arith.muli %11, %c32 : index
                %72 = arith.addi %71, %70 : index
                %73 = pto.load_scalar %arg9[%72] : memref<?xi32, #pto.address_space<gm>> -> i32
                %74 = arith.index_cast %73 : i32 to index
                %75 = arith.muli %74, %c128 : index
                %76 = arith.remsi %68, %c128 : index
                %77 = arith.addi %75, %76 : index
                %78 = arith.index_cast %arg15 : index to i64
                %79 = arith.muli %78, %c32_i64 : i64
                %80 = arith.addi %79, %c65536_i64 : i64
                %81 = arith.muli %77, %c512 : index
                %82 = pto.castptr %arg10 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
                %83 = pto.addptr %82, %81 : <bf16, gm> -> <bf16, gm>
                %84 = pto.pointer_cast(%80) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
                %85 = pto.castptr %84 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
                pto.mte_gm_l1_frac %83, %85, nd2nz, shape(%c1_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c1_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
              } else {
                %70 = arith.index_cast %arg15 : index to i64
                %71 = arith.muli %70, %c32_i64 : i64
                %72 = arith.addi %71, %c65536_i64 : i64
                %73 = pto.castptr %arg7 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
                %74 = pto.pointer_cast(%72) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
                %75 = pto.castptr %74 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
                pto.mte_gm_l1_frac %73, %75, nd2nz, shape(%c1_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c1_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
              }
            } else {
              %65 = arith.index_cast %arg15 : index to i64
              %66 = arith.muli %65, %c32_i64 : i64
              %67 = arith.addi %66, %c65536_i64 : i64
              %68 = pto.castptr %arg7 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
              %69 = pto.pointer_cast(%67) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
              %70 = pto.castptr %69 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
              pto.mte_gm_l1_frac %68, %70, nd2nz, shape(%c1_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c1_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
            }
          }
        }
        %17 = arith.muli %8, %c64 : index
        %18 = arith.muli %8, %c32768 : index
        %19 = pto.castptr %arg11 : memref<?xbf16, #pto.address_space<gm>> -> !pto.ptr<bf16, gm>
        %20 = pto.addptr %19, %18 : <bf16, gm> -> <bf16, gm>
        %21 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
        %22 = pto.castptr %21 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
        pto.mte_gm_l1_frac %20, %22, nd2nz, shape(%c32_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c32_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        %23 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        scf.for %arg15 = %c0 to %c512 step %c256 {
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.barrier <PIPE_MTE1>
          %61 = arith.index_cast %arg15 : index to i32
          %62 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
          %63 = pto.castptr %62 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %64 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %65 = pto.castptr %64 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %66 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %63, %65, %c32_i64, %c128_i64, %c0_i64, %66 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %67 = pto.pointer_cast(%c65536_i64) %c512, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<512x128xbf16, #pto.address_space<mat>>
          %68 = pto.castptr %67 : memref<512x128xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %69 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %70 = pto.castptr %69 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %71 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %68, %70, %c128_i64, %c128_i64, %71, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract", transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          %72 = arith.addi %arg15, %c128 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %73 = arith.index_cast %72 : index to i32
          %74 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
          %75 = pto.castptr %74 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %76 = pto.pointer_cast(%c8192_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %77 = pto.castptr %76 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %78 = arith.extsi %73 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %75, %77, %c32_i64, %c128_i64, %c0_i64, %78 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %79 = pto.pointer_cast(%c65536_i64) %c512, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<512x128xbf16, #pto.address_space<mat>>
          %80 = pto.castptr %79 : memref<512x128xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %81 = pto.pointer_cast(%c32768_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %82 = pto.castptr %81 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %83 = arith.extsi %73 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %80, %82, %c128_i64, %c128_i64, %83, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract", transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          %84 = arith.cmpi eq, %arg15, %c0 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          scf.if %84 {
            pto.barrier <PIPE_M>
            %91 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
            %92 = pto.castptr %91 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %93 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
            %94 = pto.castptr %93 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %95 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
            %96 = pto.castptr %95 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad %92, %94, %96, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          } else {
            pto.barrier <PIPE_M>
            %91 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
            %92 = pto.castptr %91 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %93 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
            %94 = pto.castptr %93 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %95 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
            %96 = pto.castptr %95 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad_acc %92, %94, %96, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          }
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          %85 = pto.pointer_cast(%c8192_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %86 = pto.castptr %85 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %87 = pto.pointer_cast(%c32768_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %88 = pto.castptr %87 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %89 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
          %90 = pto.castptr %89 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
          pto.mad_acc %86, %88, %90, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
        pto.tpush(%23, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
        %24 = arith.addi %17, %c32 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %25 = arith.muli %24, %c512 : index
        %26 = pto.addptr %19, %25 : <bf16, gm> -> <bf16, gm>
        %27 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
        %28 = pto.castptr %27 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
        pto.mte_gm_l1_frac %26, %28, nd2nz, shape(%c32_i64, %c512_i64), src_layout(%c1024_i64), dst_group(%c1_i64, %c1_i64, %c32_i64, %c0_i64), ctrl(%c0_i64, %false) {pto.tilelib.candidate = "template_tload_gm_to_mat_nd2nz", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tload"} : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, nd2nz, shape i64, i64, src_layout(i64), dst_group i64, i64, i64, i64, ctrl i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        %29 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        scf.for %arg15 = %c0 to %c512 step %c256 {
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          pto.barrier <PIPE_MTE1>
          %61 = arith.index_cast %arg15 : index to i32
          %62 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
          %63 = pto.castptr %62 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %64 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %65 = pto.castptr %64 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %66 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %63, %65, %c32_i64, %c128_i64, %c0_i64, %66 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %67 = pto.pointer_cast(%c65536_i64) %c512, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<512x128xbf16, #pto.address_space<mat>>
          %68 = pto.castptr %67 : memref<512x128xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %69 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %70 = pto.castptr %69 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %71 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %68, %70, %c128_i64, %c128_i64, %71, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract", transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
          %72 = arith.addi %arg15, %c128 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
          %73 = arith.index_cast %72 : index to i32
          %74 = pto.pointer_cast(%c196608_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<mat>>
          %75 = pto.castptr %74 : memref<32x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %76 = pto.pointer_cast(%c8192_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %77 = pto.castptr %76 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %78 = arith.extsi %73 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %75, %77, %c32_i64, %c128_i64, %c0_i64, %78 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %79 = pto.pointer_cast(%c65536_i64) %c512, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<512x128xbf16, #pto.address_space<mat>>
          %80 = pto.castptr %79 : memref<512x128xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %81 = pto.pointer_cast(%c32768_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %82 = pto.castptr %81 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %83 = arith.extsi %73 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %80, %82, %c128_i64, %c128_i64, %83, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract", transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
          %84 = arith.cmpi eq, %arg15, %c0 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
          scf.if %84 {
            pto.barrier <PIPE_M>
            %91 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
            %92 = pto.castptr %91 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %93 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
            %94 = pto.castptr %93 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %95 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
            %96 = pto.castptr %95 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad %92, %94, %96, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          } else {
            pto.barrier <PIPE_M>
            %91 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
            %92 = pto.castptr %91 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %93 = pto.pointer_cast(%c0_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
            %94 = pto.castptr %93 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %95 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
            %96 = pto.castptr %95 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad_acc %92, %94, %96, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          }
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID3>]
          %85 = pto.pointer_cast(%c8192_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, #pto.address_space<left>>
          %86 = pto.castptr %85 : memref<32x128xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %87 = pto.pointer_cast(%c32768_i64) %c128, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x128xbf16, #pto.address_space<right>>
          %88 = pto.castptr %87 : memref<128x128xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %89 = pto.pointer_cast(%c0_i64) %c32, %c128 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, #pto.address_space<acc>>
          %90 = pto.castptr %89 : memref<32x128xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
          pto.mad_acc %86, %88, %90, %c32_i64, %c128_i64, %c128_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID4>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID5>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID1>]
        pto.tpush(%29, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
        %30 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
        %31 = pto.bind_tile %30 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
        %32 = pto.materialize_tile %31, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
        pto.tpop(%32, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID6>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID2>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
        scf.for %arg15 = %c0 to %c128 step %c64 {
          pto.barrier <PIPE_MTE1>
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          %61 = arith.index_cast %arg15 : index to i32
          %62 = pto.castptr %31 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %63 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %64 = pto.castptr %63 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %65 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %62, %64, %c32_i64, %c32_i64, %c0_i64, %65 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %66 = pto.pointer_cast(%c65536_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
          %67 = pto.castptr %66 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %68 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %69 = pto.castptr %68 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %70 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %67, %69, %c32_i64, %c512_i64, %70, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
          %71 = arith.addi %arg15, %c32 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          %72 = arith.index_cast %71 : index to i32
          %73 = pto.pointer_cast(%c8192_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %74 = pto.castptr %73 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %75 = arith.extsi %72 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %62, %74, %c32_i64, %c32_i64, %c0_i64, %75 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %76 = pto.pointer_cast(%c65536_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
          %77 = pto.castptr %76 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %78 = pto.pointer_cast(%c32768_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %79 = pto.castptr %78 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %80 = arith.extsi %72 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %77, %79, %c32_i64, %c512_i64, %80, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
          %81 = arith.cmpi eq, %arg15, %c0 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID4>]
          scf.if %81 {
            pto.barrier <PIPE_M>
            %88 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
            %89 = pto.castptr %88 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %90 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
            %91 = pto.castptr %90 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %92 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
            %93 = pto.castptr %92 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad %89, %91, %93, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          } else {
            pto.barrier <PIPE_M>
            %88 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
            %89 = pto.castptr %88 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %90 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
            %91 = pto.castptr %90 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %92 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
            %93 = pto.castptr %92 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad_acc %89, %91, %93, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          }
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID5>]
          %82 = pto.pointer_cast(%c8192_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %83 = pto.castptr %82 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %84 = pto.pointer_cast(%c32768_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %85 = pto.castptr %84 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %86 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
          %87 = pto.castptr %86 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
          pto.mad_acc %83, %85, %87, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID7>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
        pto.tfree(%0 : !pto.pipe) {split = 0}
        %33 = arith.muli %10, %c16 : index
        %34 = arith.addi %12, %33 : index
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID2>]
        pto.barrier <PIPE_FIX>
        %35 = pto.pointer_cast(%c0_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
        %36 = pto.castptr %35 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
        %37 = arith.muli %34, %c512 : index
        %38 = pto.castptr %arg2 : memref<?xf32, #pto.address_space<gm>> -> !pto.ptr<f32, gm>
        %39 = pto.addptr %38, %37 : <f32, gm> -> <f32, gm>
        pto.mte_l0c_gm %36, %39, %c16_i64, %c512_i64, %c32_i64, %c512_i64, %c0_i64, %c0_i64, nz2nd {pto.tilelib.candidate = "template_tstore_acc_to_gm_nz2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        %40 = arith.addi %12, %c80 : index
        %41 = arith.addi %40, %33 : index
        pto.barrier <PIPE_FIX>
        %42 = pto.pointer_cast(%c1024_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
        %43 = pto.castptr %42 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
        %44 = arith.muli %41, %c512 : index
        %45 = pto.addptr %38, %44 : <f32, gm> -> <f32, gm>
        pto.mte_l0c_gm %43, %45, %c16_i64, %c512_i64, %c32_i64, %c512_i64, %c0_i64, %c0_i64, nz2nd {pto.tilelib.candidate = "template_tstore_acc_to_gm_nz2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
        %46 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
        %47 = pto.bind_tile %46 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
        %48 = pto.materialize_tile %47, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
        pto.tpop(%48, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID3>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        scf.for %arg15 = %c0 to %c128 step %c64 {
          pto.barrier <PIPE_MTE1>
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          %61 = arith.index_cast %arg15 : index to i32
          %62 = pto.castptr %47 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %63 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %64 = pto.castptr %63 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %65 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %62, %64, %c32_i64, %c32_i64, %c0_i64, %65 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %66 = pto.pointer_cast(%c65536_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
          %67 = pto.castptr %66 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %68 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %69 = pto.castptr %68 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %70 = arith.extsi %61 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %67, %69, %c32_i64, %c512_i64, %70, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
          %71 = arith.addi %arg15, %c32 : index
          pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
          %72 = arith.index_cast %71 : index to i32
          %73 = pto.pointer_cast(%c8192_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %74 = pto.castptr %73 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %75 = arith.extsi %72 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0a %62, %74, %c32_i64, %c32_i64, %c0_i64, %75 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64
          %76 = pto.pointer_cast(%c65536_i64) %c128, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<128x512xbf16, #pto.address_space<mat>>
          %77 = pto.castptr %76 : memref<128x512xbf16, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          %78 = pto.pointer_cast(%c32768_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %79 = pto.castptr %78 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %80 = arith.extsi %72 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
          pto.mte_l1_l0b %77, %79, %c32_i64, %c512_i64, %80, %c0_i64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
          %81 = arith.cmpi eq, %arg15, %c0 : index
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID6>]
          scf.if %81 {
            pto.barrier <PIPE_M>
            %88 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
            %89 = pto.castptr %88 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %90 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
            %91 = pto.castptr %90 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %92 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
            %93 = pto.castptr %92 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad %89, %91, %93, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          } else {
            pto.barrier <PIPE_M>
            %88 = pto.pointer_cast(%c0_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
            %89 = pto.castptr %88 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
            %90 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
            %91 = pto.castptr %90 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
            %92 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
            %93 = pto.castptr %92 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
            pto.mad_acc %89, %91, %93, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          }
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
          pto.barrier <PIPE_M>
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID7>]
          %82 = pto.pointer_cast(%c8192_i64) %c32, %c32 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x32xbf16, #pto.address_space<left>>
          %83 = pto.castptr %82 : memref<32x32xbf16, #pto.address_space<left>> -> !pto.ptr<bf16, l0a>
          %84 = pto.pointer_cast(%c32768_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<col_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xbf16, #pto.address_space<right>>
          %85 = pto.castptr %84 : memref<32x512xbf16, #pto.address_space<right>> -> !pto.ptr<bf16, l0b>
          %86 = pto.pointer_cast(%c0_i64) %c32, %c512 {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
          %87 = pto.castptr %86 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
          pto.mad_acc %83, %85, %87, %c32_i64, %c512_i64, %c32_i64 disable_gemv {pto.tilelib.candidate = "template_tmatmul_acc", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmatmul.acc"} : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64, i64, i64
          pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        }
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
        pto.tfree(%0 : !pto.pipe) {split = 0}
        %49 = arith.addi %12, %c160 : index
        %50 = arith.addi %49, %33 : index
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID3>]
        pto.barrier <PIPE_FIX>
        %51 = pto.pointer_cast(%c0_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
        %52 = pto.castptr %51 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
        %53 = arith.muli %50, %c512 : index
        %54 = pto.addptr %38, %53 : <f32, gm> -> <f32, gm>
        pto.mte_l0c_gm %52, %54, %c16_i64, %c512_i64, %c32_i64, %c512_i64, %c0_i64, %c0_i64, nz2nd {pto.tilelib.candidate = "template_tstore_acc_to_gm_nz2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        %55 = arith.addi %12, %c240 : index
        %56 = arith.addi %55, %33 : index
        pto.barrier <PIPE_FIX>
        %57 = pto.pointer_cast(%c1024_i64) {config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=1024, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x512xf32, #pto.address_space<acc>>
        %58 = pto.castptr %57 : memref<32x512xf32, #pto.address_space<acc>> -> !pto.ptr<f32, l0c>
        %59 = arith.muli %56, %c512 : index
        %60 = pto.addptr %38, %59 : <f32, gm> -> <f32, gm>
        pto.mte_l0c_gm %58, %60, %c16_i64, %c512_i64, %c32_i64, %c512_i64, %c0_i64, %c0_i64, nz2nd {pto.tilelib.candidate = "template_tstore_acc_to_gm_nz2nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tstore"} : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      }
    }
    pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
    pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID1>]
    pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
    return
  }
}
