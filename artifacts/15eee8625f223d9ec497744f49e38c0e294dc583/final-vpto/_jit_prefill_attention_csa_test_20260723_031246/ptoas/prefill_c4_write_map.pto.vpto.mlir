module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_write_map(%arg0: !pto.ptr<i64, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c0_i64 = arith.constant 0 : i64
      %c128_i64 = arith.constant 128 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c0_i32 = arith.constant 0 : i32
      %c-1_i32 = arith.constant -1 : i32
      %c0 = arith.constant 0 : index
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %2 = pto.addptr %1, %c0 : <i32, ub> -> <i32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %9 = pto.vdup %c0_i32, %mask : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %9, %2[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %3 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xi32, valid=?x?>
      %4 = pto.castptr %c128_i64 : i64 -> !pto.ptr<i32, ub>
      %5 = pto.addptr %4, %c0 : <i32, ub> -> <i32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
        %9 = pto.vdup %c-1_i32, %mask : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
        pto.vsts %9, %5[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
      }
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      %6 = scf.for %arg5 = %c0 to %c128 step %c1 iter_args(%arg6 = %c0) -> (index) {
        %9 = pto.load_scalar %arg0[%arg5] : !pto.ptr<i64, gm> -> i64
        %10 = arith.index_cast %9 : i64 to index
        %11 = arith.cmpi sge, %10, %c0 : index
        %12 = scf.if %11 -> (index) {
          %13 = pto.load_scalar %arg1[%arg5] : !pto.ptr<i32, gm> -> i32
          pto.tsetval ins(%arg6, %13 : index, i32) outs(%0 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>)
          %14 = arith.trunci %9 : i64 to i32
          pto.tsetval ins(%arg6, %14 : index, i32) outs(%3 : !pto.tile_buf<vec, 1x32xi32, valid=?x?>)
          %15 = arith.addi %arg6, %c1 : index
          scf.yield %15 : index
        } else {
          scf.yield %arg6 : index
        }
        scf.yield %12 : index
      }
      pto.set_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_S>, <PIPE_MTE3>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
      %7 = pto.addptr %arg2, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %2, %7, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
      %8 = pto.addptr %arg3, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_ubuf_to_gm %5, %8, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
