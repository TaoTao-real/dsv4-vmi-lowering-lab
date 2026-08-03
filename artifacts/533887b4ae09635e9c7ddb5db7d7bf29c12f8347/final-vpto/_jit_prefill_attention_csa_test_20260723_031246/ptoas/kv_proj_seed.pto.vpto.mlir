module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_proj_seed(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c512_i64 = arith.constant 512 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c8192 = arith.constant 8192 : index
      %0 = arith.divsi %arg1, %c16 : index
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg2 = %c0 to %0 step %c1 {
        %3 = arith.muli %arg2, %c8192 : index
        scf.for %arg3 = %c0 to %c4 step %c1 {
          %4 = arith.muli %arg3, %c128 : index
          pto.vecscope {
            scf.for %arg4 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %8 = arith.index_cast %arg4 : i16 to index
              %9 = arith.muli %8, %c128 : index
              %10 = scf.for %arg5 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg6 = %c128) -> (index)  : i16 {
                %11 = arith.index_cast %arg5 : i16 to index
                %12 = arith.index_cast %arg6 : index to i32
                %mask, %scalar_out = pto.plt_b32 %12 : i32 -> !pto.mask<b32>, i32
                %13 = arith.index_cast %scalar_out : i32 to index
                %14 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %15 = arith.addi %9, %11 : index
                %16 = pto.addptr %1, %15 : <f32, ub> -> <f32, ub>
                pto.vsts %14, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %13 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          }
          %5 = arith.addi %3, %4 : index
          %6 = pto.addptr %arg0, %5 : <f32, gm> -> <f32, gm>
          %7 = pto.addptr %6, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %2, %7, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c2048_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

