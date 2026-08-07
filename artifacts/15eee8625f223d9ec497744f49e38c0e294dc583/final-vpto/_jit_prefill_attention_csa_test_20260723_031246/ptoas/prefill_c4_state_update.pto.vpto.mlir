module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_state_update(%arg0: !pto.ptr<i64, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c256_i64 = arith.constant 256 : i64
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %c2048 = arith.constant 2048 : index
      %c4 = arith.constant 4 : index
      %c1024 = arith.constant 1024 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.cmpi slt, %0, %c128 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      scf.if %1 {
        %2 = pto.load_scalar %arg0[%0] : !pto.ptr<i64, gm> -> i64
        %3 = arith.index_cast %2 : i64 to index
        %4 = arith.cmpi sge, %3, %c0 : index
        scf.if %4 {
          %5 = pto.load_scalar %arg1[%0] : !pto.ptr<i32, gm> -> i32
          %6 = arith.index_cast %5 : i32 to index
          %7 = arith.remsi %6, %c4 : index
          %8 = pto.castptr %c128_i64 : i64 -> !pto.ptr<f32, ub>
          %9 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
          %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %result = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %18 = pto.vmuls %result, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %18, %10[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %11 = arith.muli %7, %c1024 : index
          %12 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
          %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
          %14 = arith.muli %0, %c1024 : index
          %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          %17 = arith.muli %3, %c2048 : index
          scf.for %arg10 = %c0 to %c32 step %c1 {
            %18 = arith.muli %arg10, %c32 : index
            pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
            %19 = arith.addi %11, %18 : index
            %20 = pto.addptr %arg4, %19 : <f32, gm> -> <f32, gm>
            %21 = pto.addptr %20, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %21, %13, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %22 = arith.addi %14, %18 : index
            %23 = pto.addptr %arg5, %22 : <f32, gm> -> <f32, gm>
            %24 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %24, %16, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
            pto.vecscope {
              %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %34 = pto.vadd %result, %result_0, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %34, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
            %25 = arith.addi %17, %18 : index
            %26 = pto.addptr %arg3, %25 : <f32, gm> -> <f32, gm>
            %27 = pto.addptr %26, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %16, %27, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
            pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
            %28 = pto.addptr %arg6, %22 : <f32, gm> -> <f32, gm>
            %29 = pto.addptr %28, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %29, %16, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
            pto.vecscope {
              %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %34 = pto.vadd %result, %result_0, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %34, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_1 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %35 = pto.vadd %result_1, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %35, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
            %30 = arith.addi %18, %c1024 : index
            pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
            %31 = arith.addi %17, %30 : index
            %32 = pto.addptr %arg3, %31 : <f32, gm> -> <f32, gm>
            %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %13, %33, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          }
        }
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
