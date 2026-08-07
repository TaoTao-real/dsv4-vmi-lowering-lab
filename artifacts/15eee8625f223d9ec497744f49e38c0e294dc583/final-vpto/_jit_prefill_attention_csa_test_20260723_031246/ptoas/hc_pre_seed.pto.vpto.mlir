module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_pre_seed(%arg0: !pto.ptr<f32, gm>, %arg1: index, %arg2: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i64 = arith.constant 0 : i64
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c8_i64 = arith.constant 8 : i64
      %c128_i64 = arith.constant 128 : i64
      %c32_i32 = arith.constant 32 : i32
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg3 = %c0 to %arg2 step %c8 {
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %3 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg4 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %4 = arith.index_cast %arg4 : i16 to index
            %5 = arith.muli %4, %c32 : index
            %6 = pto.addptr %0, %5 : <f32, ub> -> <f32, ub>
            pto.vsts %3, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %1 = arith.muli %arg3, %c32 : index
        %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %0, %2, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c128_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
