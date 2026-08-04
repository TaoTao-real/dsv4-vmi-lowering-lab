module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @csa_rope_step(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: !pto.ptr<bf16, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c256_i64 = arith.constant 256 : i64
      %c512_i64 = arith.constant 512 : i64
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c32_i32 = arith.constant 32 : i32
      %c64_i64 = arith.constant 64 : i64
      %c64_i32 = arith.constant 64 : i32
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %1 = pto.addptr %0, %c0 : <bf16, ub> -> <bf16, ub>
      %2 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
      %4 = pto.castptr %c512_i64 : i64 -> !pto.ptr<bf16, ub>
      %5 = pto.addptr %4, %c0 : <bf16, ub> -> <bf16, ub>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %8 = pto.castptr %c256_i64 : i64 -> !pto.ptr<bf16, ub>
      %9 = pto.addptr %8, %c0 : <bf16, ub> -> <bf16, ub>
      scf.for %arg7 = %c0 to %c4 step %c1 {
        %10 = arith.muli %arg7, %c2 : index
        %11 = pto.load_scalar %arg4[%10] : !pto.ptr<i32, gm> -> i32
        %12 = arith.index_cast %11 : i32 to index
        scf.for %arg8 = %c0 to %c2 step %c1 {
          %23 = arith.addi %10, %arg8 : index
          %24 = pto.load_scalar %arg4[%23] : !pto.ptr<i32, gm> -> i32
          %25 = arith.index_cast %24 : i32 to index
          %26 = arith.muli %25, %c64 : index
          %27 = pto.addptr %arg5, %26 : <bf16, gm> -> <bf16, gm>
          %28 = pto.addptr %27, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %28, %1, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %result = pto.vlds %1[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %37 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            pto.vsts %37, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %29 = pto.addptr %arg6, %26 : <bf16, gm> -> <bf16, gm>
          %30 = pto.addptr %29, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_gm_to_ubuf %30, %5, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %5[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %36 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
            %37 = pto.vcvt %result, %36 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            pto.vsts %37, %7[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_0 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vcvt %result_0, %mask {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %38, %9[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          }
          %31 = arith.muli %23, %c64 : index
          %32 = pto.addptr %arg0, %31 : <bf16, gm> -> <bf16, gm>
          %33 = pto.addptr %32, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %9, %33, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.vecscope {
            %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %36 = pto.vcvt %result, %mask {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %36, %9[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          }
          %34 = pto.addptr %arg1, %31 : <bf16, gm> -> <bf16, gm>
          %35 = pto.addptr %34, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %9, %35, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
        %13 = arith.muli %12, %c64 : index
        %14 = pto.addptr %arg5, %13 : <bf16, gm> -> <bf16, gm>
        %15 = pto.addptr %14, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %15, %1, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          %23 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %result = pto.vlds %1[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %24 = pto.vcvt %result, %23 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          pto.vsts %24, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %16 = arith.muli %arg7, %c32 : index
        %17 = pto.addptr %arg2, %16 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %3, %18, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        %19 = pto.addptr %arg6, %13 : <bf16, gm> -> <bf16, gm>
        %20 = pto.addptr %19, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %20, %1, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %result = pto.vlds %1[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
          %23 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %24 = pto.vcvt %result, %23 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
          pto.vsts %24, %3[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %21 = pto.addptr %arg3, %16 : <f32, gm> -> <f32, gm>
        %22 = pto.addptr %21, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %3, %22, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
