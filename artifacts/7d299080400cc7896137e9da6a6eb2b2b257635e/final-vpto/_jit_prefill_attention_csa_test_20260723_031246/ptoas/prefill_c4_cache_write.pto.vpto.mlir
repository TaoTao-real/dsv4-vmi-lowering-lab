module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_c4_cache_write(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c512 = arith.constant 512 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c0 = arith.constant 0 : index
      %c4064 = arith.constant 4064 : index
      %c1_i64 = arith.constant 1 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c16 : index
      scf.for %arg5 = %c0 to %c16 step %c1 {
        %2 = arith.addi %1, %arg5 : index
        %3 = pto.load_scalar %arg1[%2] : !pto.ptr<i32, gm> -> i32
        %4 = arith.index_cast %3 : i32 to index
        %5 = arith.cmpi sge, %4, %c0 : index
        scf.if %5 {
          %6 = arith.muli %2, %c512 : index
          %7 = pto.addptr %arg2, %6 : <f32, gm> -> <f32, gm>
          %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %9 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
          %10 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %9, %10, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %11 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x512xbf16, valid=?x?>
          %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          pto.vecscope {
            %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_0 = pto.vlds %8[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_1 = pto.vlds %8[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_2 = pto.vlds %8[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %8[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %8[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %8[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %8[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %18 = pto.vcvt %result, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %19 = pto.vcvt %result_0, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %20 = pto.vcvt %result_1, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %21 = pto.vcvt %result_2, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %22 = pto.vcvt %result_3, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %23 = pto.vcvt %result_4, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %24 = pto.vcvt %result_5, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %25 = pto.vcvt %result_6, %17 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %26 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            pto.vsts %18, %12[%c0], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %19, %12[%c64], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %20, %12[%c128], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %21, %12[%c192], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %22, %12[%c256], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %23, %12[%c320], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %24, %12[%c384], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            pto.vsts %25, %12[%c448], %26 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          }
          %13 = arith.muli %4, %c512 : index
          %14 = pto.addptr %arg0, %13 : <bf16, gm> -> <bf16, gm>
          %15 = pto.addptr %12, %c0 : <bf16, ub> -> <bf16, ub>
          %16 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        } else {
          %6 = arith.addi %2, %c4064 : index
          %7 = arith.muli %6, %c512 : index
          %8 = pto.addptr %arg0, %7 : <bf16, gm> -> <bf16, gm>
          %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
          %10 = pto.addptr %8, %c0 : <bf16, gm> -> <bf16, gm>
          %11 = pto.addptr %9, %c0 : <bf16, ub> -> <bf16, ub>
          pto.copy_gm_to_ubuf %10, %11, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.copy_ubuf_to_gm %11, %10, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
