module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qproj_dequant_rms_nope_rope(%arg0: !pto.ptr<bf16, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<i32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: index, %arg8: index, %arg9: index, %arg10: i32, %arg11: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c448_i16 = arith.constant 448 : i16
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
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
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c512_i32 = arith.constant 512 : i32
      %c131072_i64 = arith.constant 131072 : i64
      %c262144 = arith.constant 262144 : index
      %c64_i32 = arith.constant 64 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %cst_2 = arith.constant 0.000000e+00 : f32
      %c1_i32 = arith.constant 1 : i32
      %c8_i32 = arith.constant 8 : i32
      %0 = arith.index_cast %arg10 : i32 to index
      %1 = arith.muli %0, %c4 : index
      %2 = arith.divsi %arg9, %c8 : index
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
      %16 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
      %18 = pto.castptr %c100928_i64 : i64 -> !pto.ptr<f32, ub>
      %19 = pto.castptr %c68128_i64 : i64 -> !pto.ptr<bf16, ub>
      %20 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg12 = %c0 to %2 step %c1 {
        %21 = arith.muli %arg12, %c8 : index
        %22 = pto.addptr %arg1, %21 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %22, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %23 = arith.muli %arg12, %c512 : index
        %24 = pto.addptr %arg2, %23 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %25 = pto.addptr %arg3, %23 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = pto.addptr %arg4, %23 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %26, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %27 = arith.muli %arg12, %c262144 : index
        scf.for %arg13 = %c0 to %c4 step %c2 {
          %28 = arith.addi %1, %arg13 : index
          %29 = arith.muli %28, %c512 : index
          %30 = arith.addi %arg13, %c1 : index
          %31 = arith.addi %1, %30 : index
          %32 = arith.muli %31, %c512 : index
          %33 = arith.addi %27, %29 : index
          %34 = pto.addptr %arg5, %33 : <i32, gm> -> <i32, gm>
          %35 = pto.addptr %34, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %35, %8, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %36 = pto.addptr %arg6, %29 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %36, %9, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %37 = arith.addi %27, %32 : index
          %38 = pto.addptr %arg5, %37 : <i32, gm> -> <i32, gm>
          %39 = pto.addptr %38, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %39, %11, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %40 = pto.addptr %arg6, %32 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %40, %12, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %67 = arith.index_cast %arg15 : i16 to index
                %68 = arith.addi %66, %67 : index
                %69 = pto.addptr %7, %68 : <i32, ub> -> <i32, ub>
                %result_15 = pto.vlds %69[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %70 = pto.vcvt %result_15, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %71 = pto.addptr %13, %68 : <f32, ub> -> <f32, ub>
                pto.vsts %70, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              %67 = pto.addptr %3, %65 : <f32, ub> -> <f32, ub>
              %68 = scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg16 = %c512) -> (index)  : i16 {
                %69 = arith.index_cast %arg15 : i16 to index
                %70 = arith.index_cast %arg16 : index to i32
                %mask_15, %scalar_out_16 = pto.plt_b32 %70 : i32 -> !pto.mask<b32>, i32
                %71 = arith.index_cast %scalar_out_16 : i32 to index
                %72 = arith.addi %66, %69 : index
                %73 = pto.addptr %13, %72 : <f32, ub> -> <f32, ub>
                %result_17 = pto.vlds %73[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_18 = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.vdup %result_18, %mask_15 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = pto.vmul %result_17, %74, %mask_15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %75, %73[%c0], %mask_15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %71 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %55 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %9[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %9[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %9[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %9[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %9[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %9[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %9[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.castptr %c67584_i64 : i64 -> !pto.ptr<f32, ub>
            %57 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            %58 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %59 = pto.vdup %cst_2, %58 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask_10, %scalar_out_11 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
            %60 = pto.pand %57, %mask_10, %58 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              %result_15 = pto.vlds %13[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %66, %c64 : index
              %result_16 = pto.vlds %13[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %66, %c128 : index
              %result_17 = pto.vlds %13[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = arith.addi %66, %c192 : index
              %result_18 = pto.vlds %13[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %70 = arith.addi %66, %c256 : index
              %result_19 = pto.vlds %13[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %71 = arith.addi %66, %c320 : index
              %result_20 = pto.vlds %13[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %72 = arith.addi %66, %c384 : index
              %result_21 = pto.vlds %13[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = arith.addi %66, %c448 : index
              %result_22 = pto.vlds %13[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result_15, %result, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmul %result_16, %result_3, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmul %result_17, %result_4, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vmul %result_18, %result_5, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vmul %result_19, %result_6, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vmul %result_20, %result_7, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vmul %result_21, %result_8, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmul %result_22, %result_9, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %13[%66], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %13[%67], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %13[%68], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %13[%69], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %78, %13[%70], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %79, %13[%71], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %80, %13[%72], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %81, %13[%73], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %82 = pto.vmul %74, %74, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vmul %75, %75, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %76, %76, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %77, %77, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %78, %78, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %79, %79, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vmul %80, %80, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vmul %81, %81, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %82, %9[%66], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %83, %9[%67], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %9[%68], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %9[%69], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %9[%70], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %9[%71], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %88, %9[%72], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %89, %9[%73], %55 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %90 = pto.vadd %82, %83, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vadd %90, %84, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vadd %91, %85, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vadd %92, %86, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vadd %93, %87, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vadd %94, %88, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vadd %95, %89, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vcadd %96, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vadd %97, %59, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %98, %56[%65], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %61 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %result_12 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %62 = pto.vdup %cst, %58 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmul %result_12, %62, %58 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask_13, %scalar_out_14 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %64 = pto.pand %61, %mask_13, %58 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %63, %9[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %41 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.vdup %cst_0, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %59 = pto.pand %58, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %57, %9[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vsqrt %result_3, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vdup %cst_1, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vdiv %61, %60, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %14[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %63 = arith.index_cast %arg14 : i16 to index
              %64 = arith.muli %63, %c512 : index
              %65 = pto.addptr %14, %63 : <f32, ub> -> <f32, ub>
              %66 = arith.muli %63, %c448 : index
              %67 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %68 = arith.index_cast %arg15 : i16 to index
                %69 = arith.index_cast %arg16 : index to i32
                %mask_4, %scalar_out_5 = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
                %70 = arith.index_cast %scalar_out_5 : i32 to index
                %71 = arith.addi %64, %68 : index
                %72 = pto.addptr %13, %71 : <f32, ub> -> <f32, ub>
                %result_6 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %65[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %73 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %74 = pto.vmul %result_6, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = arith.addi %66, %68 : index
                %76 = pto.addptr %9, %75 : <f32, ub> -> <f32, ub>
                pto.vsts %74, %76[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %70 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %42 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c448 : index
              %result = pto.vlds %9[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = arith.addi %62, %c64 : index
              %result_3 = pto.vlds %9[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %62, %c128 : index
              %result_4 = pto.vlds %9[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %62, %c192 : index
              %result_5 = pto.vlds %9[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %62, %c256 : index
              %result_6 = pto.vlds %9[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %62, %c320 : index
              %result_7 = pto.vlds %9[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %62, %c384 : index
              %result_8 = pto.vlds %9[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vcvt %result, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %70 = pto.vcvt %result_3, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %71 = pto.vcvt %result_4, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %72 = pto.vcvt %result_5, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %73 = pto.vcvt %result_6, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %74 = pto.vcvt %result_7, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %75 = pto.vcvt %result_8, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %69, %15[%62], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %70, %15[%63], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %71, %15[%64], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %72, %15[%65], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %73, %15[%66], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %74, %15[%67], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %75, %15[%68], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %57 = pto.castptr %c3840_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c512 : index
              %63 = pto.addptr %57, %62 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.addptr %14, %61 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vmul %result, %65, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = arith.muli %61, %c64 : index
              %68 = pto.addptr %13, %67 : <f32, ub> -> <f32, ub>
              pto.vsts %66, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %58 = pto.castptr %c67872_i64 : i64 -> !pto.ptr<f32, ub>
            %59 = pto.addptr %58, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.index_cast %61 : index to i64
              %63 = arith.muli %62, %c256_i64 : i64
              %64 = arith.addi %63, %c2048_i64 : i64
              %65 = pto.castptr %64 : i64 -> !pto.ptr<f32, ub>
              %66 = pto.castptr %63 : i64 -> !pto.ptr<i32, ub>
              %67 = pto.addptr %66, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %67[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %68 = pto.vgather2 %65, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %68, %59[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %69 = arith.addi %63, %c51200_i64 : i64
              %70 = pto.castptr %69 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %70[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %60 = pto.castptr %c51200_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c64 : index
              %result = pto.vlds %13[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = pto.vmul %result, %result_3, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %60[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %5[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result_4, %result_5, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %60[%62], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %65 = pto.vadd %63, %64, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %65, %13[%62], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          %43 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %57 = arith.index_cast %arg14 : i16 to index
              %58 = arith.muli %57, %c64 : index
              %result = pto.vlds %13[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vcvt %result, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %59, %16[%58], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %44 = pto.addptr %arg0, %33 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %15, %44, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %45 = arith.addi %29, %c448 : index
          %46 = arith.addi %27, %45 : index
          %47 = pto.addptr %arg0, %46 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %16, %47, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %67 = arith.index_cast %arg15 : i16 to index
                %68 = arith.addi %66, %67 : index
                %69 = pto.addptr %10, %68 : <i32, ub> -> <i32, ub>
                %result_15 = pto.vlds %69[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %70 = pto.vcvt %result_15, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %71 = pto.addptr %17, %68 : <f32, ub> -> <f32, ub>
                pto.vsts %70, %71[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              %67 = pto.addptr %3, %65 : <f32, ub> -> <f32, ub>
              %68 = scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg16 = %c512) -> (index)  : i16 {
                %69 = arith.index_cast %arg15 : i16 to index
                %70 = arith.index_cast %arg16 : index to i32
                %mask_15, %scalar_out_16 = pto.plt_b32 %70 : i32 -> !pto.mask<b32>, i32
                %71 = arith.index_cast %scalar_out_16 : i32 to index
                %72 = arith.addi %66, %69 : index
                %73 = pto.addptr %17, %72 : <f32, ub> -> <f32, ub>
                %result_17 = pto.vlds %73[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_18 = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %74 = pto.vdup %result_18, %mask_15 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = pto.vmul %result_17, %74, %mask_15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %75, %73[%c0], %mask_15 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %71 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %12[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %12[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %12[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %12[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %12[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %12[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %12[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.castptr %c100896_i64 : i64 -> !pto.ptr<f32, ub>
            %56 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %58 = pto.vdup %cst_2, %56 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            %mask_10, %scalar_out_11 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
            %60 = pto.pand %59, %mask_10, %56 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %65 = arith.index_cast %arg14 : i16 to index
              %66 = arith.muli %65, %c512 : index
              %result_15 = pto.vlds %17[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %66, %c64 : index
              %result_16 = pto.vlds %17[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %66, %c128 : index
              %result_17 = pto.vlds %17[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = arith.addi %66, %c192 : index
              %result_18 = pto.vlds %17[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %70 = arith.addi %66, %c256 : index
              %result_19 = pto.vlds %17[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %71 = arith.addi %66, %c320 : index
              %result_20 = pto.vlds %17[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %72 = arith.addi %66, %c384 : index
              %result_21 = pto.vlds %17[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = arith.addi %66, %c448 : index
              %result_22 = pto.vlds %17[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %74 = pto.vmul %result_15, %result, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %75 = pto.vmul %result_16, %result_3, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %76 = pto.vmul %result_17, %result_4, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %77 = pto.vmul %result_18, %result_5, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vmul %result_19, %result_6, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vmul %result_20, %result_7, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = pto.vmul %result_21, %result_8, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmul %result_22, %result_9, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %74, %17[%66], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %75, %17[%67], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %76, %17[%68], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %77, %17[%69], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %78, %17[%70], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %79, %17[%71], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %80, %17[%72], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %81, %17[%73], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %82 = pto.vmul %74, %74, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vmul %75, %75, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %76, %76, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %77, %77, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %78, %78, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %79, %79, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vmul %80, %80, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vmul %81, %81, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %82, %12[%66], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %83, %12[%67], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %12[%68], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %12[%69], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %12[%70], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %12[%71], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %88, %12[%72], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %89, %12[%73], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %90 = pto.vadd %82, %83, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vadd %90, %84, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %92 = pto.vadd %91, %85, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %93 = pto.vadd %92, %86, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %94 = pto.vadd %93, %87, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %95 = pto.vadd %94, %88, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %96 = pto.vadd %95, %89, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %97 = pto.vcadd %96, %57 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %98 = pto.vadd %97, %58, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %98, %55[%65], %60 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            %result_12 = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %61 = pto.vdup %cst, %56 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %result_12, %61, %56 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask_13, %scalar_out_14 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %64 = pto.pand %63, %mask_13, %56 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %62, %12[%c0], %64 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %48 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.vdup %cst_0, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %59 = pto.pand %58, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %57, %12[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_3 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vsqrt %result_3, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vdup %cst_1, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vdiv %61, %60, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %18[%c0], %59 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %63 = arith.index_cast %arg14 : i16 to index
              %64 = arith.muli %63, %c512 : index
              %65 = pto.addptr %18, %63 : <f32, ub> -> <f32, ub>
              %66 = arith.muli %63, %c448 : index
              %67 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %68 = arith.index_cast %arg15 : i16 to index
                %69 = arith.index_cast %arg16 : index to i32
                %mask_4, %scalar_out_5 = pto.plt_b32 %69 : i32 -> !pto.mask<b32>, i32
                %70 = arith.index_cast %scalar_out_5 : i32 to index
                %71 = arith.addi %64, %68 : index
                %72 = pto.addptr %17, %71 : <f32, ub> -> <f32, ub>
                %result_6 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %65[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %73 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %74 = pto.vmul %result_6, %73, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = arith.addi %66, %68 : index
                %76 = pto.addptr %12, %75 : <f32, ub> -> <f32, ub>
                pto.vsts %74, %76[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %70 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %49 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c448 : index
              %result = pto.vlds %12[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = arith.addi %62, %c64 : index
              %result_3 = pto.vlds %12[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = arith.addi %62, %c128 : index
              %result_4 = pto.vlds %12[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = arith.addi %62, %c192 : index
              %result_5 = pto.vlds %12[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %66 = arith.addi %62, %c256 : index
              %result_6 = pto.vlds %12[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %67 = arith.addi %62, %c320 : index
              %result_7 = pto.vlds %12[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %68 = arith.addi %62, %c384 : index
              %result_8 = pto.vlds %12[%68] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %69 = pto.vcvt %result, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %70 = pto.vcvt %result_3, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %71 = pto.vcvt %result_4, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %72 = pto.vcvt %result_5, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %73 = pto.vcvt %result_6, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %74 = pto.vcvt %result_7, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %75 = pto.vcvt %result_8, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %69, %19[%62], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %70, %19[%63], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %71, %19[%64], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %72, %19[%65], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %73, %19[%66], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %74, %19[%67], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %75, %19[%68], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %57 = pto.castptr %c20224_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c512 : index
              %63 = pto.addptr %57, %62 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %63[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.addptr %18, %61 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %65 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %66 = pto.vmul %result, %65, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %67 = arith.muli %61, %c64 : index
              %68 = pto.addptr %17, %67 : <f32, ub> -> <f32, ub>
              pto.vsts %66, %68[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %58 = pto.castptr %c101184_i64 : i64 -> !pto.ptr<f32, ub>
            %59 = pto.addptr %58, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.index_cast %61 : index to i64
              %63 = arith.muli %62, %c256_i64 : i64
              %64 = arith.addi %63, %c18432_i64 : i64
              %65 = pto.castptr %64 : i64 -> !pto.ptr<f32, ub>
              %66 = pto.castptr %63 : i64 -> !pto.ptr<i32, ub>
              %67 = pto.addptr %66, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %67[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %68 = pto.vgather2 %65, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %68, %59[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %69 = arith.addi %63, %c84512_i64 : i64
              %70 = pto.castptr %69 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %70[%c0], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %60 = pto.castptr %c84512_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %61 = arith.index_cast %arg14 : i16 to index
              %62 = arith.muli %61, %c64 : index
              %result = pto.vlds %17[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = pto.vmul %result, %result_3, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %result_4 = pto.vlds %60[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_5 = pto.vlds %5[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result_4, %result_5, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %60[%62], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %65 = pto.vadd %63, %64, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %65, %17[%62], %56 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          }
          %50 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
          pto.vecscope {
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %57 = arith.index_cast %arg14 : i16 to index
              %58 = arith.muli %57, %c64 : index
              %result = pto.vlds %17[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vcvt %result, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %59, %20[%58], %56 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %51 = pto.addptr %arg0, %37 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %19, %51, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %52 = arith.addi %32, %c448 : index
          %53 = arith.addi %27, %52 : index
          %54 = pto.addptr %arg0, %53 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %20, %54, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}
