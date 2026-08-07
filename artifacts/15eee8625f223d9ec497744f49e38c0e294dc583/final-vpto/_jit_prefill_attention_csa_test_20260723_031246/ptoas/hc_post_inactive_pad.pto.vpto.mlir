module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_post_inactive_pad(%arg0: !pto.ptr<f32, gm>, %arg1: index, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i64 = arith.constant 0 : i64
      %c16384 = arith.constant 16384 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c256 = arith.constant 256 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c4096 = arith.constant 4096 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.remsi %0, %c4 : index
      %3 = arith.muli %1, %c16 : index
      %4 = arith.addi %arg1, %3 : index
      %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x256xf32, valid=?x?>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %7 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %8 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %9 = pto.vdup %cst, %8 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
          %10 = arith.index_cast %arg6 : i16 to index
          pto.vsts %9, %6[%10], %7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %7 = arith.addi %4, %arg6 : index
        %8 = arith.cmpi slt, %7, %arg3 : index
        scf.if %8 {
          %9 = arith.muli %2, %c4096 : index
          %10 = arith.muli %7, %c16384 : index
          scf.for %arg7 = %c0 to %c4096 step %c256 {
            %11 = arith.addi %9, %arg7 : index
            pto.barrier <PIPE_MTE3>
            %12 = arith.addi %10, %11 : index
            %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %6, %13, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
