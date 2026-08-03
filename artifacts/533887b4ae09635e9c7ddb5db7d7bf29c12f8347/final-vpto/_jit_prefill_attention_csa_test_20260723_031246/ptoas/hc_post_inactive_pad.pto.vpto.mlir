module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_post_inactive_pad(%arg0: !pto.ptr<f32, gm>, %arg1: index, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c0_i16 = arith.constant 0 : i16
      %c1024_i64 = arith.constant 1024 : i64
      %c1_i64 = arith.constant 1 : i64
      %c4096 = arith.constant 4096 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0_i64 = arith.constant 0 : i64
      %c16384 = arith.constant 16384 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %6 = scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg7 = %c256) -> (index)  : i16 {
          %7 = arith.index_cast %arg6 : i16 to index
          %8 = arith.index_cast %arg7 : index to i32
          %mask, %scalar_out = pto.plt_b32 %8 : i32 -> !pto.mask<b32>, i32
          %9 = arith.index_cast %scalar_out : i32 to index
          %10 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %11 = pto.addptr %0, %7 : <f32, ub> -> <f32, ub>
          pto.vsts %10, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.yield %9 : index
        }
      }
      %1 = arith.index_cast %arg4 : i32 to index
      %2 = arith.divsi %1, %c4 : index
      %3 = arith.remsi %1, %c4 : index
      %4 = arith.muli %2, %c16 : index
      %5 = arith.addi %arg1, %4 : index
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %6 = arith.addi %5, %arg6 : index
        %7 = arith.cmpi slt, %6, %arg3 : index
        scf.if %7 {
          %8 = arith.muli %3, %c4096 : index
          %9 = arith.muli %6, %c16384 : index
          scf.for %arg7 = %c0 to %c4096 step %c256 {
            %10 = arith.addi %8, %arg7 : index
            %11 = arith.addi %9, %10 : index
            %12 = pto.addptr %arg0, %11 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %0, %12, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}

