module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_state_update(%arg0: !pto.ptr<i64, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: i32, %arg9: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c512_i64 = arith.constant 512 : i64
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c512 = arith.constant 512 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %0 = arith.index_cast %arg8 : i32 to index
      %1 = arith.remsi %0, %c4 : index
      %2 = arith.divsi %0, %c4 : index
      %3 = arith.muli %1, %c64 : index
      %4 = arith.cmpi slt, %2, %c128 : index
      scf.if %4 {
        %5 = pto.load_scalar %arg0[%2] : !pto.ptr<i64, gm> -> i64
        %6 = arith.index_cast %5 : i64 to index
        %7 = arith.cmpi sge, %6, %c0 : index
        scf.if %7 {
          %8 = pto.load_scalar %arg1[%2] : !pto.ptr<i32, gm> -> i32
          %9 = arith.index_cast %8 : i32 to index
          %10 = arith.remsi %9, %c4 : index
          %11 = arith.muli %10, %c256 : index
          %12 = arith.addi %11, %3 : index
          %13 = pto.addptr %arg2, %12 : <f32, gm> -> <f32, gm>
          %14 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
          %15 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
          %16 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %17 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
          %18 = pto.addptr %arg3, %c0 : <f32, gm> -> <f32, gm>
          %19 = pto.addptr %17, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %18, %19, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %20 = pto.alloc_tile addr = %c512_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.vecscope {
            %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %42 = pto.vdup %cst, %41 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = pto.vmul %result, %42, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %43, %17[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %21 = arith.muli %2, %c256 : index
          %22 = arith.addi %21, %3 : index
          %23 = pto.addptr %arg4, %22 : <f32, gm> -> <f32, gm>
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
          %26 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %25, %26, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %27 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %41 = pto.vadd %result, %result_0, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %41, %24[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %28 = arith.muli %6, %c512 : index
          %29 = arith.addi %28, %3 : index
          %30 = pto.addptr %arg5, %29 : <f32, gm> -> <f32, gm>
          %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %26, %31, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          %32 = pto.addptr %arg6, %22 : <f32, gm> -> <f32, gm>
          %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %33, %26, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %34 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %41 = pto.vadd %result, %result_0, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %41, %14[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %35 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %41 = pto.vadd %result, %result_0, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %41, %14[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %36 = arith.addi %3, %c256 : index
          %37 = arith.addi %28, %36 : index
          %38 = pto.addptr %arg5, %37 : <f32, gm> -> <f32, gm>
          %39 = pto.addptr %38, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_ubuf_to_gm %16, %39, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

