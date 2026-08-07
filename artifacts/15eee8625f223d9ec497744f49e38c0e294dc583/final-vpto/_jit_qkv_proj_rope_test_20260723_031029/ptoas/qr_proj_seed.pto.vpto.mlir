module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_proj_seed(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c512_i64 = arith.constant 512 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c16384 = arith.constant 16384 : index
      %c64 = arith.constant 64 : index
      %0 = arith.divsi %arg1, %c16 : index
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg2 = %c0 to %0 step %c1 {
        %3 = arith.muli %arg2, %c16384 : index
        scf.for %arg3 = %c0 to %c8 step %c1 {
          %4 = arith.muli %arg3, %c128 : index
          %5 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
          pto.vecscope {
            %9 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %10 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %11 = pto.vdup %cst, %10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            scf.for %arg4 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %12 = arith.index_cast %arg4 : i16 to index
              %13 = arith.muli %12, %c128 : index
              pto.vsts %11, %1[%13], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %14 = arith.addi %13, %c64 : index
              pto.vsts %11, %1[%14], %9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          }
          pto.barrier <PIPE_MTE3>
          %6 = arith.addi %3, %4 : index
          %7 = pto.addptr %arg0, %6 : <f32, gm> -> <f32, gm>
          %8 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %2, %8, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c4096_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
