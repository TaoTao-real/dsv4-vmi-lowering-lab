module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qproj_dequant_rms_nope_rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: index, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c448_i16 = arith.constant 448 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c20224_i64 = arith.constant 20224 : i64
      %c256_i64 = arith.constant 256 : i64
      %c3840_i64 = arith.constant 3840 : i64
      %c101440_i64 = arith.constant 101440 : i64
      %c101472_i64 = arith.constant 101472 : i64
      %c103520_i64 = arith.constant 103520 : i64
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c34816_i64 = arith.constant 34816 : i64
      %c18432_i64 = arith.constant 18432 : i64
      %c68128_i64 = arith.constant 68128 : i64
      %c51200_i64 = arith.constant 51200 : i64
      %c67584_i64 = arith.constant 67584 : i64
      %c67616_i64 = arith.constant 67616 : i64
      %c67872_i64 = arith.constant 67872 : i64
      %c84512_i64 = arith.constant 84512 : i64
      %c100896_i64 = arith.constant 100896 : i64
      %c100928_i64 = arith.constant 100928 : i64
      %c101184_i64 = arith.constant 101184 : i64
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c4 = arith.constant 4 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c2 = arith.constant 2 : index
      %c512 = arith.constant 512 : index
      %cst = arith.constant 0.001953125 : f32
      %cst_0 = arith.constant 9.99999997E-7 : f32
      %c448 = arith.constant 448 : index
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c896_i64 = arith.constant 896 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c128_i64 = arith.constant 128 : i64
      %c64_i32 = arith.constant 64 : i32
      %cst_1 = arith.constant 0.000000e+00 : f32
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c131072_i64 = arith.constant 131072 : i64
      %c262144 = arith.constant 262144 : index
      %c8_i32 = arith.constant 8 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
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
      %c2048 = arith.constant 2048 : index
      %c2112 = arith.constant 2112 : index
      %c2176 = arith.constant 2176 : index
      %c2240 = arith.constant 2240 : index
      %c2304 = arith.constant 2304 : index
      %c2368 = arith.constant 2368 : index
      %c2432 = arith.constant 2432 : index
      %c2496 = arith.constant 2496 : index
      %c2560 = arith.constant 2560 : index
      %c2624 = arith.constant 2624 : index
      %c2688 = arith.constant 2688 : index
      %c2752 = arith.constant 2752 : index
      %c2816 = arith.constant 2816 : index
      %c2880 = arith.constant 2880 : index
      %c2944 = arith.constant 2944 : index
      %c3008 = arith.constant 3008 : index
      %c3072 = arith.constant 3072 : index
      %c3136 = arith.constant 3136 : index
      %c3200 = arith.constant 3200 : index
      %c3264 = arith.constant 3264 : index
      %c3328 = arith.constant 3328 : index
      %c3392 = arith.constant 3392 : index
      %c3456 = arith.constant 3456 : index
      %c3520 = arith.constant 3520 : index
      %c3584 = arith.constant 3584 : index
      %c3648 = arith.constant 3648 : index
      %c3712 = arith.constant 3712 : index
      %c3776 = arith.constant 3776 : index
      %c3840 = arith.constant 3840 : index
      %c3904 = arith.constant 3904 : index
      %c3968 = arith.constant 3968 : index
      %c4032 = arith.constant 4032 : index
      %c3 = arith.constant 3 : index
      %c5 = arith.constant 5 : index
      %c6 = arith.constant 6 : index
      %c7 = arith.constant 7 : index
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.muli %0, %c4 : index
      %2 = arith.divsi %arg9, %c8 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      %3 = pto.castptr %c101440_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.castptr %c101472_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.castptr %c103520_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %7 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<i32, ub>
      %8 = pto.addptr %7, %c0 : <i32, ub> -> <i32, ub>
      %9 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<i32, ub>
      %11 = pto.addptr %10, %c0 : <i32, ub> -> <i32, ub>
      %12 = pto.castptr %c68128_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c67616_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<bf16, ub>
      %16 = pto.castptr %c51200_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      %18 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.castptr %c100928_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.castptr %c68128_i64 : i64 -> !pto.ptr<bf16, ub>
      %21 = pto.castptr %c84512_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg12 = %c0 to %2 step %c1 {
        %23 = arith.muli %arg12, %c8 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %24 = pto.addptr %arg1, %23 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        %25 = arith.muli %arg12, %c512 : index
        %26 = pto.addptr %arg2, %25 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
        %27 = pto.addptr %arg3, %25 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %27, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %28 = pto.addptr %arg4, %25 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %28, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %29 = arith.muli %arg12, %c262144 : index
        scf.for %arg13 = %c0 to %c4 step %c2 {
          %30 = arith.addi %1, %arg13 : index
          %31 = arith.muli %30, %c512 : index
          %32 = arith.addi %arg13, %c1 : index
          %33 = arith.addi %1, %32 : index
          %34 = arith.muli %33, %c512 : index
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          %35 = arith.addi %29, %31 : index
          %36 = pto.addptr %arg5, %35 : <i32, gm> -> <i32, gm>
          %37 = pto.addptr %36, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %37, %8, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          %38 = pto.addptr %arg6, %31 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %38, %9, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
          %39 = arith.addi %29, %34 : index
          %40 = pto.addptr %arg5, %39 : <i32, gm> -> <i32, gm>
          %41 = pto.addptr %40, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %41, %11, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          %42 = pto.addptr %arg6, %34 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %42, %12, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c512 : index
              %result = pto.vlds %7[%60] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %61 = arith.addi %60, %c64 : index
              %result_3 = pto.vlds %7[%61] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %62 = arith.addi %60, %c128 : index
              %result_4 = pto.vlds %7[%62] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %63 = arith.addi %60, %c192 : index
              %result_5 = pto.vlds %7[%63] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %64 = arith.addi %60, %c256 : index
              %result_6 = pto.vlds %7[%64] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %65 = arith.addi %60, %c320 : index
              %result_7 = pto.vlds %7[%65] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %66 = arith.addi %60, %c384 : index
              %result_8 = pto.vlds %7[%66] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %67 = arith.addi %60, %c448 : index
              %result_9 = pto.vlds %7[%67] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %68 = pto.vcvt %result, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vcvt %result_3, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vcvt %result_4, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vcvt %result_5, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vcvt %result_6, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vcvt %result_7, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vcvt %result_8, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vcvt %result_9, %58 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %68, %13[%60], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %69, %13[%61], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %13[%62], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %13[%63], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %13[%64], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %13[%65], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %13[%66], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %13[%67], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %result = pto.vlds %3[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %60 = pto.vdup %result, %58 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = arith.muli %59, %c512 : index
              %result_3 = pto.vlds %13[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %62 = arith.addi %61, %c64 : index
              %result_4 = pto.vlds %13[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = arith.addi %61, %c128 : index
              %result_5 = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %61, %c192 : index
              %result_6 = pto.vlds %13[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %61, %c256 : index
              %result_7 = pto.vlds %13[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %61, %c320 : index
              %result_8 = pto.vlds %13[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %61, %c384 : index
              %result_9 = pto.vlds %13[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %61, %c448 : index
              %result_10 = pto.vlds %13[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vmul %result_3, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result_4, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vmul %result_5, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vmul %result_6, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result_7, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result_8, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmul %result_9, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmul %result_10, %60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %69, %13[%61], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %13[%62], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %13[%63], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %13[%64], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %13[%65], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %13[%66], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %13[%67], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %13[%68], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %9[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %9[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %9[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %9[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %9[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %9[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %9[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %134 = arith.index_cast %arg14 : i16 to index
              %135 = arith.muli %134, %c512 : index
              %result_77 = pto.vlds %13[%135] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %136 = arith.addi %135, %c64 : index
              %result_78 = pto.vlds %13[%136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %137 = arith.addi %135, %c128 : index
              %result_79 = pto.vlds %13[%137] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %138 = arith.addi %135, %c192 : index
              %result_80 = pto.vlds %13[%138] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %139 = arith.addi %135, %c256 : index
              %result_81 = pto.vlds %13[%139] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %140 = arith.addi %135, %c320 : index
              %result_82 = pto.vlds %13[%140] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %141 = arith.addi %135, %c384 : index
              %result_83 = pto.vlds %13[%141] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %142 = arith.addi %135, %c448 : index
              %result_84 = pto.vlds %13[%142] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %143 = pto.vmul %result_77, %result, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %144 = pto.vmul %result_78, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %145 = pto.vmul %result_79, %result_4, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %146 = pto.vmul %result_80, %result_5, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %147 = pto.vmul %result_81, %result_6, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %148 = pto.vmul %result_82, %result_7, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %149 = pto.vmul %result_83, %result_8, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %150 = pto.vmul %result_84, %result_9, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %143, %13[%135], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %144, %13[%136], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %145, %13[%137], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %146, %13[%138], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %147, %13[%139], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %148, %13[%140], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %149, %13[%141], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %150, %13[%142], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %151 = pto.vmul %143, %143, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %152 = pto.vmul %144, %144, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %153 = pto.vmul %145, %145, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %154 = pto.vmul %146, %146, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %155 = pto.vmul %147, %147, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %156 = pto.vmul %148, %148, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %157 = pto.vmul %149, %149, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %158 = pto.vmul %150, %150, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %151, %9[%135], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %152, %9[%136], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %153, %9[%137], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %154, %9[%138], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %155, %9[%139], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %156, %9[%140], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %157, %9[%141], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %158, %9[%142], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %59 = pto.castptr %c67584_i64 : i64 -> !pto.ptr<f32, ub>
            %result_10 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %9[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %9[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %9[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %9[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %9[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %9[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %9[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %9[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %9[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %9[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %9[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %9[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_23 = pto.vlds %9[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_24 = pto.vlds %9[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %9[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %9[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %9[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %9[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %9[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %9[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %9[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_32 = pto.vlds %9[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_33 = pto.vlds %9[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_34 = pto.vlds %9[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_35 = pto.vlds %9[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_36 = pto.vlds %9[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_37 = pto.vlds %9[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_38 = pto.vlds %9[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_39 = pto.vlds %9[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_40 = pto.vlds %9[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_41 = pto.vlds %9[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_42 = pto.vlds %9[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_43 = pto.vlds %9[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_44 = pto.vlds %9[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_45 = pto.vlds %9[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_46 = pto.vlds %9[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_47 = pto.vlds %9[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_48 = pto.vlds %9[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_49 = pto.vlds %9[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_50 = pto.vlds %9[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_51 = pto.vlds %9[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_52 = pto.vlds %9[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_53 = pto.vlds %9[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_54 = pto.vlds %9[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_55 = pto.vlds %9[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_56 = pto.vlds %9[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_57 = pto.vlds %9[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_58 = pto.vlds %9[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_59 = pto.vlds %9[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_60 = pto.vlds %9[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_61 = pto.vlds %9[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_62 = pto.vlds %9[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_63 = pto.vlds %9[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_64 = pto.vlds %9[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_65 = pto.vlds %9[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_66 = pto.vlds %9[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_67 = pto.vlds %9[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_68 = pto.vlds %9[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_69 = pto.vlds %9[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_70 = pto.vlds %9[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_71 = pto.vlds %9[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_72 = pto.vlds %9[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_73 = pto.vlds %9[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_10, %result_11, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %60, %result_12, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %result_13, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vadd %62, %result_14, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vadd %63, %result_15, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %65 = pto.vadd %64, %result_16, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vadd %65, %result_17, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vcadd %66, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_18, %result_19, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %68, %result_20, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %69, %result_21, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %70, %result_22, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %71, %result_23, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vadd %72, %result_24, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vadd %73, %result_25, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vcadd %74, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %result_26, %result_27, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vadd %76, %result_28, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %78 = pto.vadd %77, %result_29, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %78, %result_30, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %79, %result_31, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %80, %result_32, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.vadd %81, %result_33, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vcadd %82, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.vadd %result_34, %result_35, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %85 = pto.vadd %84, %result_36, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %86 = pto.vadd %85, %result_37, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vadd %86, %result_38, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %88 = pto.vadd %87, %result_39, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %89 = pto.vadd %88, %result_40, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %90 = pto.vadd %89, %result_41, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vcadd %90, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vadd %result_42, %result_43, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.vadd %92, %result_44, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %94 = pto.vadd %93, %result_45, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %95 = pto.vadd %94, %result_46, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %96 = pto.vadd %95, %result_47, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %97 = pto.vadd %96, %result_48, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %98 = pto.vadd %97, %result_49, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.vcadd %98, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %100 = pto.vadd %result_50, %result_51, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %101 = pto.vadd %100, %result_52, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %102 = pto.vadd %101, %result_53, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %103 = pto.vadd %102, %result_54, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %104 = pto.vadd %103, %result_55, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %105 = pto.vadd %104, %result_56, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %106 = pto.vadd %105, %result_57, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %107 = pto.vcadd %106, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vadd %result_58, %result_59, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vadd %108, %result_60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vadd %109, %result_61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %110, %result_62, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %111, %result_63, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vadd %112, %result_64, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.vadd %113, %result_65, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %115 = pto.vcadd %114, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %116 = pto.vadd %result_66, %result_67, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %117 = pto.vadd %116, %result_68, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %118 = pto.vadd %117, %result_69, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %119 = pto.vadd %118, %result_70, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %120 = pto.vadd %119, %result_71, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %121 = pto.vadd %120, %result_72, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %122 = pto.vadd %121, %result_73, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %123 = pto.vcadd %122, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %124 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            pto.vsts %67, %59[%c0], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %59[%c1], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %83, %59[%c2], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %91, %59[%c3], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %99, %59[%c4], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %107, %59[%c5], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %115, %59[%c6], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %123, %59[%c7], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %125 = pto.addptr %59, %c0 : <f32, ub> -> <f32, ub>
            %result_74 = pto.vlds %125[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %126 = pto.vmuls %result_74, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %127 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
            pto.vsts %126, %127[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_75 = pto.vlds %127[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %128 = pto.vadds %result_75, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %128, %127[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_76 = pto.vlds %127[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %129 = pto.vsqrt %result_76, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %130 = pto.vmuls %129, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %131 = pto.vadds %130, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %132 = pto.vdiv %131, %129, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %133 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
            pto.vsts %132, %133[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %43 = pto.alloc_tile addr = %c67616_i64 valid_row = %c8 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
          pto.vecscope {
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %57 = arith.index_cast %arg14 : i16 to index
              %58 = arith.muli %57, %c512 : index
              %59 = pto.addptr %14, %57 : <f32, ub> -> <f32, ub>
              %60 = arith.muli %57, %c448 : index
              %61 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %62 = arith.index_cast %arg15 : i16 to index
                %63 = arith.index_cast %arg16 : index to i32
                %mask, %scalar_out = pto.plt_b32 %63 : i32 -> !pto.mask<b32>, i32
                %64 = arith.index_cast %scalar_out : i32 to index
                %65 = arith.addi %58, %62 : index
                %66 = pto.addptr %13, %65 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %67 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %68 = pto.vmul %result, %67, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %69 = arith.addi %60, %62 : index
                %70 = pto.addptr %9, %69 : <f32, ub> -> <f32, ub>
                pto.vsts %68, %70[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %64 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %44 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c448 : index
              %result = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %63, %c64 : index
              %result_3 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %63, %c128 : index
              %result_4 = pto.vlds %9[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %63, %c192 : index
              %result_5 = pto.vlds %9[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %63, %c256 : index
              %result_6 = pto.vlds %9[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %63, %c320 : index
              %result_7 = pto.vlds %9[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = arith.addi %63, %c384 : index
              %result_8 = pto.vlds %9[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %70 = pto.vcvt %result, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %71 = pto.vcvt %result_3, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %72 = pto.vcvt %result_4, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %73 = pto.vcvt %result_5, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %74 = pto.vcvt %result_6, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %75 = pto.vcvt %result_7, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %76 = pto.vcvt %result_8, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %70, %15[%63], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %71, %15[%64], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %72, %15[%65], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %73, %15[%66], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %74, %15[%67], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %75, %15[%68], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %76, %15[%69], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %59 = pto.castptr %c3840_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c512 : index
              %64 = pto.addptr %59, %63 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.addptr %14, %62 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %65[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vmul %result, %66, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = arith.muli %62, %c64 : index
              %69 = pto.addptr %13, %68 : <f32, ub> -> <f32, ub>
              pto.vsts %67, %69[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %60 = pto.castptr %c67872_i64 : i64 -> !pto.ptr<f32, ub>
            %61 = pto.addptr %60, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.index_cast %62 : index to i64
              %64 = arith.muli %63, %c256_i64 : i64
              %65 = arith.addi %64, %c2048_i64 : i64
              %66 = pto.castptr %65 : i64 -> !pto.ptr<f32, ub>
              %67 = pto.castptr %64 : i64 -> !pto.ptr<i32, ub>
              %68 = pto.addptr %67, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %69 = pto.vgather2 %66, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %69, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %70 = arith.addi %64, %c51200_i64 : i64
              %71 = pto.castptr %70 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %71[%c0], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c64 : index
              %result = pto.vlds %13[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %13[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %16[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %5[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.vmul %result_4, %result_5, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %65, %16[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          %45 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c64 : index
              %result = pto.vlds %13[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %16[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %61 = pto.vadd %result, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %61, %13[%60], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c64 : index
              %61 = pto.addptr %13, %60 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %62 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %63 = pto.addptr %17, %60 : <bf16, ub> -> <bf16, ub>
              pto.vsts %62, %63[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          pto.barrier <PIPE_MTE3>
          %46 = pto.addptr %arg0, %35 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %15, %46, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %47 = arith.addi %31, %c448 : index
          pto.barrier <PIPE_MTE3>
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
          %48 = arith.addi %29, %47 : index
          %49 = pto.addptr %arg0, %48 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %17, %49, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
          pto.vecscope {
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c512 : index
              %result = pto.vlds %10[%60] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %61 = arith.addi %60, %c64 : index
              %result_3 = pto.vlds %10[%61] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %62 = arith.addi %60, %c128 : index
              %result_4 = pto.vlds %10[%62] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %63 = arith.addi %60, %c192 : index
              %result_5 = pto.vlds %10[%63] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %64 = arith.addi %60, %c256 : index
              %result_6 = pto.vlds %10[%64] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %65 = arith.addi %60, %c320 : index
              %result_7 = pto.vlds %10[%65] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %66 = arith.addi %60, %c384 : index
              %result_8 = pto.vlds %10[%66] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %67 = arith.addi %60, %c448 : index
              %result_9 = pto.vlds %10[%67] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %68 = pto.vcvt %result, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %69 = pto.vcvt %result_3, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vcvt %result_4, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vcvt %result_5, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vcvt %result_6, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vcvt %result_7, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vcvt %result_8, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vcvt %result_9, %57 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %68, %18[%60], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %69, %18[%61], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %18[%62], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %18[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %18[%64], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %18[%65], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %18[%66], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %18[%67], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %result = pto.vlds %3[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %60 = pto.vdup %result, %57 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %61 = arith.muli %59, %c512 : index
              %result_3 = pto.vlds %18[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %62 = arith.addi %61, %c64 : index
              %result_4 = pto.vlds %18[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = arith.addi %61, %c128 : index
              %result_5 = pto.vlds %18[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %61, %c192 : index
              %result_6 = pto.vlds %18[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %61, %c256 : index
              %result_7 = pto.vlds %18[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %61, %c320 : index
              %result_8 = pto.vlds %18[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %61, %c384 : index
              %result_9 = pto.vlds %18[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %61, %c448 : index
              %result_10 = pto.vlds %18[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vmul %result_3, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %70 = pto.vmul %result_4, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %71 = pto.vmul %result_5, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %72 = pto.vmul %result_6, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result_7, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result_8, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmul %result_9, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmul %result_10, %60, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %69, %18[%61], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %70, %18[%62], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %71, %18[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %72, %18[%64], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %73, %18[%65], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %74, %18[%66], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %18[%67], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %18[%68], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
          pto.vecscope {
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %12[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %12[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %134 = arith.index_cast %arg14 : i16 to index
              %135 = arith.muli %134, %c512 : index
              %result_77 = pto.vlds %18[%135] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %136 = arith.addi %135, %c64 : index
              %result_78 = pto.vlds %18[%136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %137 = arith.addi %135, %c128 : index
              %result_79 = pto.vlds %18[%137] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %138 = arith.addi %135, %c192 : index
              %result_80 = pto.vlds %18[%138] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %139 = arith.addi %135, %c256 : index
              %result_81 = pto.vlds %18[%139] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %140 = arith.addi %135, %c320 : index
              %result_82 = pto.vlds %18[%140] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %141 = arith.addi %135, %c384 : index
              %result_83 = pto.vlds %18[%141] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %142 = arith.addi %135, %c448 : index
              %result_84 = pto.vlds %18[%142] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %143 = pto.vmul %result_77, %result, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %144 = pto.vmul %result_78, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %145 = pto.vmul %result_79, %result_4, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %146 = pto.vmul %result_80, %result_5, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %147 = pto.vmul %result_81, %result_6, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %148 = pto.vmul %result_82, %result_7, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %149 = pto.vmul %result_83, %result_8, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %150 = pto.vmul %result_84, %result_9, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %143, %18[%135], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %144, %18[%136], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %145, %18[%137], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %146, %18[%138], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %147, %18[%139], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %148, %18[%140], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %149, %18[%141], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %150, %18[%142], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %151 = pto.vmul %143, %143, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %152 = pto.vmul %144, %144, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %153 = pto.vmul %145, %145, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %154 = pto.vmul %146, %146, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %155 = pto.vmul %147, %147, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %156 = pto.vmul %148, %148, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %157 = pto.vmul %149, %149, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %158 = pto.vmul %150, %150, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %151, %12[%135], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %152, %12[%136], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %153, %12[%137], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %154, %12[%138], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %155, %12[%139], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %156, %12[%140], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %157, %12[%141], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %158, %12[%142], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %59 = pto.castptr %c100896_i64 : i64 -> !pto.ptr<f32, ub>
            %result_10 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %12[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %12[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %12[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %12[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %12[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %12[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %12[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %12[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %12[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_23 = pto.vlds %12[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_24 = pto.vlds %12[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %12[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %12[%c1024] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %12[%c1088] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %12[%c1152] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %12[%c1216] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %12[%c1280] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %12[%c1344] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_32 = pto.vlds %12[%c1408] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_33 = pto.vlds %12[%c1472] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_34 = pto.vlds %12[%c1536] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_35 = pto.vlds %12[%c1600] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_36 = pto.vlds %12[%c1664] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_37 = pto.vlds %12[%c1728] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_38 = pto.vlds %12[%c1792] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_39 = pto.vlds %12[%c1856] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_40 = pto.vlds %12[%c1920] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_41 = pto.vlds %12[%c1984] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_42 = pto.vlds %12[%c2048] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_43 = pto.vlds %12[%c2112] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_44 = pto.vlds %12[%c2176] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_45 = pto.vlds %12[%c2240] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_46 = pto.vlds %12[%c2304] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_47 = pto.vlds %12[%c2368] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_48 = pto.vlds %12[%c2432] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_49 = pto.vlds %12[%c2496] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_50 = pto.vlds %12[%c2560] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_51 = pto.vlds %12[%c2624] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_52 = pto.vlds %12[%c2688] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_53 = pto.vlds %12[%c2752] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_54 = pto.vlds %12[%c2816] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_55 = pto.vlds %12[%c2880] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_56 = pto.vlds %12[%c2944] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_57 = pto.vlds %12[%c3008] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_58 = pto.vlds %12[%c3072] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_59 = pto.vlds %12[%c3136] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_60 = pto.vlds %12[%c3200] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_61 = pto.vlds %12[%c3264] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_62 = pto.vlds %12[%c3328] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_63 = pto.vlds %12[%c3392] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_64 = pto.vlds %12[%c3456] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_65 = pto.vlds %12[%c3520] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_66 = pto.vlds %12[%c3584] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_67 = pto.vlds %12[%c3648] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_68 = pto.vlds %12[%c3712] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_69 = pto.vlds %12[%c3776] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_70 = pto.vlds %12[%c3840] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_71 = pto.vlds %12[%c3904] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_72 = pto.vlds %12[%c3968] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_73 = pto.vlds %12[%c4032] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_10, %result_11, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %60, %result_12, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %result_13, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vadd %62, %result_14, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vadd %63, %result_15, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %65 = pto.vadd %64, %result_16, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %66 = pto.vadd %65, %result_17, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %67 = pto.vcadd %66, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %68 = pto.vadd %result_18, %result_19, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vadd %68, %result_20, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %70 = pto.vadd %69, %result_21, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %70, %result_22, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vadd %71, %result_23, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %73 = pto.vadd %72, %result_24, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %74 = pto.vadd %73, %result_25, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vcadd %74, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vadd %result_26, %result_27, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %77 = pto.vadd %76, %result_28, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %78 = pto.vadd %77, %result_29, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %78, %result_30, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %79, %result_31, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %80, %result_32, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.vadd %81, %result_33, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vcadd %82, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.vadd %result_34, %result_35, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %85 = pto.vadd %84, %result_36, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %86 = pto.vadd %85, %result_37, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vadd %86, %result_38, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %88 = pto.vadd %87, %result_39, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %89 = pto.vadd %88, %result_40, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %90 = pto.vadd %89, %result_41, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vcadd %90, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vadd %result_42, %result_43, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %93 = pto.vadd %92, %result_44, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %94 = pto.vadd %93, %result_45, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %95 = pto.vadd %94, %result_46, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %96 = pto.vadd %95, %result_47, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %97 = pto.vadd %96, %result_48, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %98 = pto.vadd %97, %result_49, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %99 = pto.vcadd %98, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %100 = pto.vadd %result_50, %result_51, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %101 = pto.vadd %100, %result_52, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %102 = pto.vadd %101, %result_53, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %103 = pto.vadd %102, %result_54, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %104 = pto.vadd %103, %result_55, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %105 = pto.vadd %104, %result_56, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %106 = pto.vadd %105, %result_57, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %107 = pto.vcadd %106, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %108 = pto.vadd %result_58, %result_59, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %109 = pto.vadd %108, %result_60, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %110 = pto.vadd %109, %result_61, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %111 = pto.vadd %110, %result_62, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %112 = pto.vadd %111, %result_63, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %113 = pto.vadd %112, %result_64, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %114 = pto.vadd %113, %result_65, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %115 = pto.vcadd %114, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %116 = pto.vadd %result_66, %result_67, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %117 = pto.vadd %116, %result_68, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %118 = pto.vadd %117, %result_69, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %119 = pto.vadd %118, %result_70, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %120 = pto.vadd %119, %result_71, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %121 = pto.vadd %120, %result_72, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %122 = pto.vadd %121, %result_73, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %123 = pto.vcadd %122, %58 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %124 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            pto.vsts %67, %59[%c0], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %75, %59[%c1], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %83, %59[%c2], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %91, %59[%c3], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %99, %59[%c4], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %107, %59[%c5], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %115, %59[%c6], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %123, %59[%c7], %124 {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %125 = pto.addptr %59, %c0 : <f32, ub> -> <f32, ub>
            %result_74 = pto.vlds %125[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %126 = pto.vmuls %result_74, %cst, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %127 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
            pto.vsts %126, %127[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_75 = pto.vlds %127[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %128 = pto.vadds %result_75, %cst_0, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %128, %127[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_76 = pto.vlds %127[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %129 = pto.vsqrt %result_76, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %130 = pto.vmuls %129, %cst_1, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %131 = pto.vadds %130, %cst_2, %mask : !pto.vreg<64xf32>, f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %132 = pto.vdiv %131, %129, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %133 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
            pto.vsts %132, %133[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %50 = pto.alloc_tile addr = %c100928_i64 valid_row = %c8 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1xf32, valid=?x?, blayout=col_major>
          pto.vecscope {
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %57 = arith.index_cast %arg14 : i16 to index
              %58 = arith.muli %57, %c512 : index
              %59 = pto.addptr %19, %57 : <f32, ub> -> <f32, ub>
              %60 = arith.muli %57, %c448 : index
              %61 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %62 = arith.index_cast %arg15 : i16 to index
                %63 = arith.index_cast %arg16 : index to i32
                %mask, %scalar_out = pto.plt_b32 %63 : i32 -> !pto.mask<b32>, i32
                %64 = arith.index_cast %scalar_out : i32 to index
                %65 = arith.addi %58, %62 : index
                %66 = pto.addptr %18, %65 : <f32, ub> -> <f32, ub>
                %result = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_3 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %67 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %68 = pto.vmul %result, %67, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %69 = arith.addi %60, %62 : index
                %70 = pto.addptr %12, %69 : <f32, ub> -> <f32, ub>
                pto.vsts %68, %70[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %64 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %51 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c448 : index
              %result = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %63, %c64 : index
              %result_3 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %63, %c128 : index
              %result_4 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %63, %c192 : index
              %result_5 = pto.vlds %12[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %63, %c256 : index
              %result_6 = pto.vlds %12[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %63, %c320 : index
              %result_7 = pto.vlds %12[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = arith.addi %63, %c384 : index
              %result_8 = pto.vlds %12[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %70 = pto.vcvt %result, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %71 = pto.vcvt %result_3, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %72 = pto.vcvt %result_4, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %73 = pto.vcvt %result_5, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %74 = pto.vcvt %result_6, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %75 = pto.vcvt %result_7, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %76 = pto.vcvt %result_8, %57 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %70, %20[%63], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %71, %20[%64], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %72, %20[%65], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %73, %20[%66], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %74, %20[%67], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %75, %20[%68], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %76, %20[%69], %58 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %59 = pto.castptr %c20224_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c512 : index
              %64 = pto.addptr %59, %63 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.addptr %19, %62 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %65[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = pto.vmul %result, %66, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %68 = arith.muli %62, %c64 : index
              %69 = pto.addptr %18, %68 : <f32, ub> -> <f32, ub>
              pto.vsts %67, %69[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %60 = pto.castptr %c101184_i64 : i64 -> !pto.ptr<f32, ub>
            %61 = pto.addptr %60, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.index_cast %62 : index to i64
              %64 = arith.muli %63, %c256_i64 : i64
              %65 = arith.addi %64, %c18432_i64 : i64
              %66 = pto.castptr %65 : i64 -> !pto.ptr<f32, ub>
              %67 = pto.castptr %64 : i64 -> !pto.ptr<i32, ub>
              %68 = pto.addptr %67, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %68[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %69 = pto.vgather2 %66, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %69, %61[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %70 = arith.addi %64, %c84512_i64 : i64
              %71 = pto.castptr %70 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %71[%c0], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %62 = arith.index_cast %arg14 : i16 to index
              %63 = arith.muli %62, %c64 : index
              %result = pto.vlds %18[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %18[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %21[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %5[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.vmul %result_4, %result_5, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %65, %21[%63], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          %52 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %57 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c64 : index
              %result = pto.vlds %18[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %21[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %61 = pto.vadd %result, %result_3, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %61, %18[%60], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %59 = arith.index_cast %arg14 : i16 to index
              %60 = arith.muli %59, %c64 : index
              %61 = pto.addptr %18, %60 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %62 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %63 = pto.addptr %22, %60 : <bf16, ub> -> <bf16, ub>
              pto.vsts %62, %63[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          pto.barrier <PIPE_MTE3>
          %53 = pto.addptr %arg0, %39 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %20, %53, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %54 = arith.addi %34, %c448 : index
          pto.barrier <PIPE_MTE3>
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          %55 = arith.addi %29, %54 : index
          %56 = pto.addptr %arg0, %55 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %22, %56, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      }
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID2>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
