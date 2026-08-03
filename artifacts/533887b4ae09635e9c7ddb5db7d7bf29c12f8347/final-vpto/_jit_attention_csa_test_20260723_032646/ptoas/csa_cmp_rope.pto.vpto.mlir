module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @csa_cmp_rope(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c32_i32 = arith.constant 32 : i32
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %1 = pto.addptr %0, %c0 : <bf16, ub> -> <bf16, ub>
      %2 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg5 = %c0 to %c4 step %c1 {
        %4 = arith.muli %arg5, %c2 : index
        %5 = pto.load_scalar %arg2[%4] : !pto.ptr<i32, gm> -> i32
        %6 = arith.index_cast %5 : i32 to index
        %7 = arith.remsi %6, %c4 : index
        %8 = arith.subi %c4, %7 : index
        %9 = arith.addi %6, %8 : index
        %10 = arith.subi %9, %c4 : index
        %11 = arith.muli %10, %c64 : index
        %12 = pto.addptr %arg3, %11 : <bf16, gm> -> <bf16, gm>
        %13 = pto.addptr %12, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %13, %1, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %21 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %1[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %22 = pto.vcvt %result, %21 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          pto.vsts %22, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %14 = arith.muli %arg5, %c32 : index
        %15 = pto.addptr %arg0, %14 : <f32, gm> -> <f32, gm>
        %16 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %3, %16, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        %17 = pto.addptr %arg4, %11 : <bf16, gm> -> <bf16, gm>
        %18 = pto.addptr %17, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %18, %1, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %result = pto.vlds %1[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %21 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %22 = pto.vcvt %result, %21 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %22, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %19 = pto.addptr %arg1, %14 : <f32, gm> -> <f32, gm>
        %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %3, %20, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

