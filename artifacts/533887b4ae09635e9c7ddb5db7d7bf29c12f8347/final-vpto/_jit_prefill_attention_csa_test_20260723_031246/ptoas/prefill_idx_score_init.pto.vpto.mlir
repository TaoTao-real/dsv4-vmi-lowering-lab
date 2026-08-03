module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_init(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c2048_i16 = arith.constant 2048 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c8192_i64 = arith.constant 8192 : i64
      %c16_i64 = arith.constant 16 : i64
      %cst = arith.constant -3.40282347E+38 : f32
      %c0_i64 = arith.constant 0 : i64
      %c2048 = arith.constant 2048 : index
      %c0 = arith.constant 0 : index
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %5 = arith.index_cast %arg2 : i16 to index
          %6 = arith.muli %5, %c2048 : index
          %7 = scf.for %arg3 = %c0_i16 to %c2048_i16 step %c64_i16 iter_args(%arg4 = %c2048) -> (index)  : i16 {
            %8 = arith.index_cast %arg3 : i16 to index
            %9 = arith.index_cast %arg4 : index to i32
            %mask, %scalar_out = pto.plt_b32 %9 : i32 -> !pto.mask<b32>, i32
            %10 = arith.index_cast %scalar_out : i32 to index
            %11 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %12 = arith.addi %6, %8 : index
            %13 = pto.addptr %0, %12 : <f32, ub> -> <f32, ub>
            pto.vsts %11, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %10 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %1 = arith.muli %arg1, %c2048 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      %4 = pto.addptr %2, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %4, %c0_i64, %c16_i64, %c8192_i64, %c0_i64, %c8192_i64, %c8192_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

