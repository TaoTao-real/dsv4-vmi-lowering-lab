module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_weights_proj_aiv(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i32 = arith.constant 0 : i32
      %c65536_i64 = arith.constant 65536 : i64
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.0110485433 : f32
      %c0 = arith.constant 0 : index
      %c32_i64 = arith.constant 32 : i64
      %c256_i64 = arith.constant 256 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048 = arith.constant 2048 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg3 : i32 to index
      %2 = pto.declare_tile_memref -> memref<32x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
      %3 = builtin.unrealized_conversion_cast %2 : memref<32x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
      %4 = pto.materialize_tile %2, %c32, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x64xf32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.tpop(%4, %0 : !pto.tile_buf<vec, 32x64xf32, valid=?x?>, !pto.pipe) {split = 0}
      pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %5 = pto.alloc_tile addr = %c65536_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
      pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
      %6 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %11 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
          %12 = arith.index_cast %arg5 : i16 to index
          %13 = arith.muli %12, %c64 : index
          %result = pto.vlds %3[%13] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %14 = pto.vmuls %result, %cst, %11 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %14, %6[%13], %11 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      pto.tfree(%0 : !pto.pipe) {split = 0}
      %7 = arith.muli %1, %c2048 : index
      %8 = pto.addptr %arg2, %7 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %9, %10, %c0_i64, %c32_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_weights_proj_aic(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c2305843010287566880_i64 = arith.constant 2305843010287566880 : i64
      %c-6917529026567208928_i64 = arith.constant -6917529026567208928 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c4_i64 = arith.constant 4 : i64
      %c2_i64 = arith.constant 2 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c0_i32 = arith.constant 0 : i32
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c6144_i64 = arith.constant 6144 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c32_i64 = arith.constant 32 : i64
      %false = arith.constant false
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %c131072 = arith.constant 131072 : index
      %c2048 = arith.constant 2048 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg3 : i32 to index
      %2 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x64xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      %3 = arith.muli %1, %c131072 : index
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l1>
      %5 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, l1>
      %6 = pto.castptr %c6144_i64 : i64 -> !pto.ptr<bf16, l1>
      %7 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l1>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %11 = pto.get_ctrl : i64
      %12 = pto.sbitset0 %11, %c45_i64 : i64, i64 -> i64
      %13 = pto.sbitset0 %12, %c46_i64 : i64, i64 -> i64
      %14 = pto.sbitset0 %13, %c47_i64 : i64, i64 -> i64
      %15 = pto.sbitset0 %14, %c51_i64 : i64, i64 -> i64
      scf.for %arg5 = %c0 to %c128 step %c2 {
        %16 = arith.muli %arg5, %c32 : index
        %17 = arith.addi %16, %c32 : index
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        %18 = arith.addi %3, %16 : index
        %19 = pto.addptr %arg0, %18 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %19, %4, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c32_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %20 = arith.muli %arg5, %c2048 : index
        %21 = pto.addptr %arg1, %20 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %21, %5, %c0_i64, %c128_i64, %c0_i64, %c32_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        %22 = arith.addi %3, %17 : index
        %23 = pto.addptr %arg0, %22 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %23, %6, %c0_i64, %c8192_i64, %c0_i64, %c32_i64, %c32_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        %24 = arith.muli %17, %c64 : index
        %25 = pto.addptr %arg1, %24 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c137439019009_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %25, %7, %c0_i64, %c128_i64, %c0_i64, %c32_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        %26 = arith.cmpi eq, %16, %c0 : index
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        scf.if %26 {
          %27 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %4, %27, %c0_i64, %c0_i64, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %28 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %5, %28, %c0_i64, %c0_i64, %c2_i64, %c4_i64, %c2_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
          pto.barrier <PIPE_M>
          pto.set_ctrl %15 : i64
          pto.mad_raw %27, %28, %10, %c-6917529026567208928_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %11 : i64
        } else {
          %27 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, l0a>
          pto.load_cbuf_to_ca %4, %27, %c0_i64, %c0_i64, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
          %28 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<bf16, l0b>
          pto.load_cbuf_to_cb %5, %28, %c0_i64, %c0_i64, %c2_i64, %c4_i64, %c2_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
          pto.barrier <PIPE_M>
          pto.set_ctrl %15 : i64
          pto.mad_raw %27, %28, %10, %c2305843010287566880_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
          pto.set_ctrl %11 : i64
        }
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_ca %6, %8, %c0_i64, %c0_i64, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID2>]
        pto.load_cbuf_to_cb %7, %9, %c0_i64, %c0_i64, %c2_i64, %c4_i64, %c2_i64, %c4_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID2>]
        pto.barrier <PIPE_M>
        pto.set_ctrl %15 : i64
        pto.mad_raw %8, %9, %10, %c2305843010287566880_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %11 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      }
      pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
      pto.tpush(%2, %0 : !pto.tile_buf<acc, 32x64xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
