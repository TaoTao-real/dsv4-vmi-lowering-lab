module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @weights_proj_reduce(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024 = arith.constant 1024 : index
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c64 = arith.constant 64 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 0.0110485433 : f32
      %c0 = arith.constant 0 : index
      %c2048 = arith.constant 2048 : index
      %c3072 = arith.constant 3072 : index
      %c16_i64 = arith.constant 16 : i64
      %c256_i64 = arith.constant 256 : i64
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %3 = pto.addptr %arg0, %c1024 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      pto.vecscope {
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg2 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %result = pto.vlds %0[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %4[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vadd %result, %result_0, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %0[%18], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %8 = pto.addptr %arg0, %c2048 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %9, %6, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg2 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %result = pto.vlds %0[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %4[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vadd %result, %result_0, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %0[%18], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      %11 = pto.addptr %arg0, %c3072 : <f32, gm> -> <f32, gm>
      %12 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %12, %6, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
      pto.vecscope {
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg2 : i16 to index
          %18 = arith.muli %17, %c64 : index
          %result = pto.vlds %0[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %4[%18] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vadd %result, %result_0, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %0[%18], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
      }
      %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg2 : i16 to index
          %17 = arith.muli %16, %c64 : index
          %result = pto.vlds %0[%17] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %18 = pto.vmuls %result, %cst, %15 : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %18, %0[%17], %15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %14 = pto.addptr %arg1, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %2, %14, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
