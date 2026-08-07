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
          %11 = pto.alloc_tile addr = %c128_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
          pto.vecscope {
            %19 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %21 = pto.vdup %cst, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %22 = pto.vmul %result, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %23 = pto.pand %19, %mask, %20 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %22, %8[%c0], %23 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %12 = arith.muli %7, %c1024 : index
          %13 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
          %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
          %15 = arith.muli %0, %c1024 : index
          %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %17 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
          %18 = arith.muli %3, %c2048 : index
          scf.for %arg10 = %c0 to %c32 step %c1 {
            %19 = arith.muli %arg10, %c32 : index
            %20 = arith.addi %12, %19 : index
            %21 = pto.addptr %arg4, %20 : <f32, gm> -> <f32, gm>
            %22 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %22, %14, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %23 = arith.addi %15, %19 : index
            %24 = pto.addptr %arg5, %23 : <f32, gm> -> <f32, gm>
            %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %25, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %26 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %38 = pto.vadd %result, %result_0, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %40 = pto.pand %39, %mask, %37 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %38, %16[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %27 = arith.addi %18, %19 : index
            %28 = pto.addptr %arg3, %27 : <f32, gm> -> <f32, gm>
            %29 = pto.addptr %28, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %17, %29, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %30 = pto.addptr %arg6, %23 : <f32, gm> -> <f32, gm>
            %31 = pto.addptr %30, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %31, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %38 = pto.vadd %result, %result_0, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %40 = pto.pand %39, %mask, %37 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %38, %13[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %32 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?>
            pto.vecscope {
              %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %37 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %38 = pto.vadd %result, %result_0, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %40 = pto.pand %39, %mask, %37 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %38, %13[%c0], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %33 = arith.addi %19, %c1024 : index
            %34 = arith.addi %18, %33 : index
            %35 = pto.addptr %arg3, %34 : <f32, gm> -> <f32, gm>
            %36 = pto.addptr %35, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %14, %36, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
}
