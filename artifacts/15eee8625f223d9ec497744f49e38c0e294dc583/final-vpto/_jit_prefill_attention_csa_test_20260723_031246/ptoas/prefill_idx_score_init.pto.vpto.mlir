module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_init(%arg0: !pto.ptr<f32, gm>, %arg1: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %c0_i64 = arith.constant 0 : i64
      %c2048 = arith.constant 2048 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant -3.40282347E+38 : f32
      %c0 = arith.constant 0 : index
      %c16_i64 = arith.constant 16 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c512 = arith.constant 512 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %c1024 = arith.constant 1024 : index
      %c1088 = arith.constant 1088 : index
      %c1152 = arith.constant 1152 : index
      %c1216 = arith.constant 1216 : index
      %c1280 = arith.constant 1280 : index
      %c1344 = arith.constant 1344 : index
      %c1408 = arith.constant 1408 : index
      %c1472 = arith.constant 1472 : index
      %c1536 = arith.constant 1536 : index
      %c1600 = arith.constant 1600 : index
      %c1664 = arith.constant 1664 : index
      %c1728 = arith.constant 1728 : index
      %c1792 = arith.constant 1792 : index
      %c1856 = arith.constant 1856 : index
      %c1920 = arith.constant 1920 : index
      %c1984 = arith.constant 1984 : index
      %0 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c2048 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x2048xf32, valid=?x?>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %6 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %7 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %8 = pto.vdup %cst, %7 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg2 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %9 = arith.index_cast %arg2 : i16 to index
          %10 = arith.muli %9, %c2048 : index
          pto.vsts %8, %1[%10], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %11 = arith.addi %10, %c64 : index
          pto.vsts %8, %1[%11], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %12 = arith.addi %10, %c128 : index
          pto.vsts %8, %1[%12], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %13 = arith.addi %10, %c192 : index
          pto.vsts %8, %1[%13], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %14 = arith.addi %10, %c256 : index
          pto.vsts %8, %1[%14], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %15 = arith.addi %10, %c320 : index
          pto.vsts %8, %1[%15], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %16 = arith.addi %10, %c384 : index
          pto.vsts %8, %1[%16], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %17 = arith.addi %10, %c448 : index
          pto.vsts %8, %1[%17], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %18 = arith.addi %10, %c512 : index
          pto.vsts %8, %1[%18], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %19 = arith.addi %10, %c576 : index
          pto.vsts %8, %1[%19], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %20 = arith.addi %10, %c640 : index
          pto.vsts %8, %1[%20], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %21 = arith.addi %10, %c704 : index
          pto.vsts %8, %1[%21], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %22 = arith.addi %10, %c768 : index
          pto.vsts %8, %1[%22], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %23 = arith.addi %10, %c832 : index
          pto.vsts %8, %1[%23], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %24 = arith.addi %10, %c896 : index
          pto.vsts %8, %1[%24], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %25 = arith.addi %10, %c960 : index
          pto.vsts %8, %1[%25], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %26 = arith.addi %10, %c1024 : index
          pto.vsts %8, %1[%26], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %27 = arith.addi %10, %c1088 : index
          pto.vsts %8, %1[%27], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = arith.addi %10, %c1152 : index
          pto.vsts %8, %1[%28], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = arith.addi %10, %c1216 : index
          pto.vsts %8, %1[%29], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = arith.addi %10, %c1280 : index
          pto.vsts %8, %1[%30], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %10, %c1344 : index
          pto.vsts %8, %1[%31], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = arith.addi %10, %c1408 : index
          pto.vsts %8, %1[%32], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %33 = arith.addi %10, %c1472 : index
          pto.vsts %8, %1[%33], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %34 = arith.addi %10, %c1536 : index
          pto.vsts %8, %1[%34], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = arith.addi %10, %c1600 : index
          pto.vsts %8, %1[%35], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %36 = arith.addi %10, %c1664 : index
          pto.vsts %8, %1[%36], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %37 = arith.addi %10, %c1728 : index
          pto.vsts %8, %1[%37], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %38 = arith.addi %10, %c1792 : index
          pto.vsts %8, %1[%38], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %39 = arith.addi %10, %c1856 : index
          pto.vsts %8, %1[%39], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %40 = arith.addi %10, %c1920 : index
          pto.vsts %8, %1[%40], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %41 = arith.addi %10, %c1984 : index
          pto.vsts %8, %1[%41], %6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %2 = arith.muli %arg1, %c2048 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %4, %5, %c0_i64, %c16_i64, %c8192_i64, %c0_i64, %c8192_i64, %c8192_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
