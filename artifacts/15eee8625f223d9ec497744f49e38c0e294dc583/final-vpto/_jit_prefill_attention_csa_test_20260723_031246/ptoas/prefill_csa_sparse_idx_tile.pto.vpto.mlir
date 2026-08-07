module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_csa_sparse_idx_tile(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c4096_i32 = arith.constant 4096 : i32
      %c0_i64 = arith.constant 0 : i64
      %c512_i64 = arith.constant 512 : i64
      %c128 = arith.constant 128 : index
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c0 = arith.constant 0 : index
      %c-1_i32 = arith.constant -1 : i32
      %c4 = arith.constant 4 : index
      %c1_i64 = arith.constant 1 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c64 = arith.constant 64 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c2 : index
      %2 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %3 = pto.castptr %c512_i64 : i64 -> !pto.ptr<i32, ub>
      %4 = pto.addptr %2, %c0 : <i32, ub> -> <i32, ub>
      %5 = pto.addptr %3, %c0 : <i32, ub> -> <i32, ub>
      scf.for %arg8 = %c0 to %c2 step %c1 {
        %6 = arith.addi %1, %arg8 : index
        %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x128xi32, valid=?x?>
        pto.vecscope {
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %18 = pto.vdup %c-1_i32, %17 : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %18, %2[%c0], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %2[%c64], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        }
        %8 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xi32, valid=?x?>
        pto.vecscope {
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %18 = pto.vdup %c-1_i32, %17 : i32, !pto.mask<b32> -> !pto.vreg<64xi32>
          pto.vsts %18, %3[%c0], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c64], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c128], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c192], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c256], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c320], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c384], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          pto.vsts %18, %3[%c448], %16 : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        }
        %9 = arith.cmpi slt, %6, %c128 : index
        scf.if %9 {
          %16 = pto.load_scalar %arg2[%6] : !pto.ptr<i32, gm> -> i32
          %17 = arith.index_cast %16 : i32 to index
          %18 = arith.addi %17, %c1 : index
          %19 = arith.minsi %18, %c128 : index
          %20 = arith.subi %17, %19 : index
          %21 = arith.addi %20, %c1 : index
          scf.for %arg9 = %c0 to %c128 step %c1 {
            %23 = arith.cmpi slt, %arg9, %19 : index
            scf.if %23 {
              %24 = arith.addi %21, %arg9 : index
              %25 = arith.divsi %24, %c128 : index
              %26 = pto.load_scalar %arg3[%25] : !pto.ptr<i32, gm> -> i32
              %27 = arith.index_cast %26 : i32 to index
              %28 = arith.cmpi sge, %27, %c0 : index
              scf.if %28 {
                %29 = arith.muli %27, %c128 : index
                %30 = arith.muli %25, %c128 : index
                %31 = arith.subi %24, %30 : index
                %32 = arith.addi %29, %31 : index
                %33 = arith.index_cast %32 : index to i32
                pto.tsetval ins(%arg9, %33 : index, i32) outs(%7 : !pto.tile_buf<vec, 1x128xi32, valid=?x?>)
              }
            }
          }
          %22 = arith.divsi %18, %c4 : index
          scf.for %arg9 = %c0 to %c512 step %c1 {
            %23 = arith.cmpi slt, %arg9, %22 : index
            scf.if %23 {
              %24 = arith.muli %6, %c512 : index
              %25 = arith.addi %24, %arg9 : index
              %26 = pto.load_scalar %arg4[%25] : !pto.ptr<i32, gm> -> i32
              %27 = arith.index_cast %26 : i32 to index
              %28 = arith.cmpi sge, %27, %c0 : index
              scf.if %28 {
                %29 = arith.cmpi slt, %26, %c4096_i32 : i32
                scf.if %29 {
                  pto.tsetval ins(%arg9, %26 : index, i32) outs(%8 : !pto.tile_buf<vec, 1x512xi32, valid=?x?>)
                }
              }
            }
          }
        }
        pto.barrier <PIPE_MTE3>
        %10 = arith.muli %6, %c128 : index
        %11 = pto.addptr %arg1, %10 : <i32, gm> -> <i32, gm>
        %12 = pto.addptr %11, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_ubuf_to_gm %4, %12, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
        %13 = arith.muli %6, %c512 : index
        %14 = pto.addptr %arg0, %13 : <i32, gm> -> <i32, gm>
        %15 = pto.addptr %14, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_ubuf_to_gm %5, %15, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<i32, ub>, !pto.ptr<i32, gm>, i64, i64, i64, i64, i64, i64
      }
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
