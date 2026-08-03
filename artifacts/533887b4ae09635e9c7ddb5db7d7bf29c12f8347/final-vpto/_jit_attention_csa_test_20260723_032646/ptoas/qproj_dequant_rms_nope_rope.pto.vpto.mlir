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
      %14 = pto.castptr %c67584_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c67616_i64 : i64 -> !pto.ptr<f32, ub>
      %16 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.castptr %c51200_i64 : i64 -> !pto.ptr<f32, ub>
      %18 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      %19 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.castptr %c100896_i64 : i64 -> !pto.ptr<f32, ub>
      %21 = pto.castptr %c100928_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.castptr %c68128_i64 : i64 -> !pto.ptr<bf16, ub>
      %23 = pto.castptr %c84512_i64 : i64 -> !pto.ptr<f32, ub>
      %24 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg12 = %c0 to %2 step %c1 {
        %25 = arith.muli %arg12, %c8 : index
        %26 = pto.addptr %arg1, %25 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %3, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %27 = arith.muli %arg12, %c512 : index
        %28 = pto.addptr %arg2, %27 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %28, %4, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %29 = pto.addptr %arg3, %27 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %29, %5, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %30 = pto.addptr %arg4, %27 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %30, %6, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c256_i64, %c256_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %31 = arith.muli %arg12, %c262144 : index
        scf.for %arg13 = %c0 to %c4 step %c2 {
          %32 = arith.addi %1, %arg13 : index
          %33 = arith.muli %32, %c512 : index
          %34 = arith.addi %arg13, %c1 : index
          %35 = arith.addi %1, %34 : index
          %36 = arith.muli %35, %c512 : index
          %37 = arith.addi %31, %33 : index
          %38 = pto.addptr %arg5, %37 : <i32, gm> -> <i32, gm>
          %39 = pto.addptr %38, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %39, %8, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %40 = pto.addptr %arg6, %33 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %40, %9, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %41 = arith.addi %31, %36 : index
          %42 = pto.addptr %arg5, %41 : <i32, gm> -> <i32, gm>
          %43 = pto.addptr %42, %c0 : <i32, gm> -> <i32, gm>
          pto.copy_gm_to_ubuf %43, %11, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %44 = pto.addptr %arg6, %36 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %44, %12, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %73 = arith.index_cast %arg15 : i16 to index
                %74 = arith.addi %72, %73 : index
                %75 = pto.addptr %7, %74 : <i32, ub> -> <i32, ub>
                %result_10 = pto.vlds %75[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %76 = pto.vcvt %result_10, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %77 = pto.addptr %13, %74 : <f32, ub> -> <f32, ub>
                pto.vsts %76, %77[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              %73 = pto.addptr %3, %71 : <f32, ub> -> <f32, ub>
              %74 = scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg16 = %c512) -> (index)  : i16 {
                %75 = arith.index_cast %arg15 : i16 to index
                %76 = arith.index_cast %arg16 : index to i32
                %mask_10, %scalar_out_11 = pto.plt_b32 %76 : i32 -> !pto.mask<b32>, i32
                %77 = arith.index_cast %scalar_out_11 : i32 to index
                %78 = arith.addi %72, %75 : index
                %79 = pto.addptr %13, %78 : <f32, ub> -> <f32, ub>
                %result_12 = pto.vlds %79[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_13 = pto.vlds %73[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %80 = pto.vdup %result_13, %mask_10 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %81 = pto.vmul %result_12, %80, %mask_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %81, %79[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %77 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %69 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_3 = pto.vlds %9[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %9[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %9[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_6 = pto.vlds %9[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %9[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %9[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %9[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %70 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              %result_10 = pto.vlds %13[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = arith.addi %72, %c64 : index
              %result_11 = pto.vlds %13[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %74 = arith.addi %72, %c128 : index
              %result_12 = pto.vlds %13[%74] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %75 = arith.addi %72, %c192 : index
              %result_13 = pto.vlds %13[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %72, %c256 : index
              %result_14 = pto.vlds %13[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %72, %c320 : index
              %result_15 = pto.vlds %13[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %72, %c384 : index
              %result_16 = pto.vlds %13[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %72, %c448 : index
              %result_17 = pto.vlds %13[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = pto.vmul %result_10, %result, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmul %result_11, %result_3, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vmul %result_12, %result_4, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vmul %result_13, %result_5, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %result_14, %result_6, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %result_15, %result_7, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_16, %result_8, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %result_17, %result_9, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %80, %13[%72], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %81, %13[%73], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %82, %13[%74], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %83, %13[%75], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %13[%76], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %13[%77], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %13[%78], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %13[%79], %69 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          }
          %45 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %result = pto.vlds %13[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %13[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %13[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %13[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %13[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %13[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %13[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = arith.addi %75, %c448 : index
              %result_9 = pto.vlds %13[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %83 = pto.vmul %result, %result, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %result_3, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %result_4, %result_4, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_5, %result_5, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %result_6, %result_6, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vmul %result_7, %result_7, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vmul %result_8, %result_8, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vmul %result_9, %result_9, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %83, %9[%75], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %9[%76], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %9[%77], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %9[%78], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %9[%79], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %88, %9[%80], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %89, %9[%81], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %90, %9[%82], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
            %71 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            %72 = pto.vdup %cst_2, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %71, %mask, %69 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %result = pto.vlds %9[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %9[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %9[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %9[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %9[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %9[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %9[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = arith.addi %75, %c448 : index
              %result_9 = pto.vlds %9[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %83 = pto.vadd %result, %result_3, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vadd %83, %result_4, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vadd %84, %result_5, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vadd %85, %result_6, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vadd %86, %result_7, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vadd %87, %result_8, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vadd %88, %result_9, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vcadd %89, %70 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vadd %90, %72, %71 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %91, %14[%74], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          }
          %46 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %70 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %71 = pto.vdup %cst, %70 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.vmul %result, %71, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %69, %mask, %70 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %72, %9[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %47 = pto.alloc_tile addr = %c34816_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.vdup %cst_0, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result, %70, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %72, %mask, %69 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %71, %9[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = pto.vsqrt %result_3, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vdup %cst_1, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vdiv %75, %74, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %76, %15[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %77 = arith.index_cast %arg14 : i16 to index
              %78 = arith.muli %77, %c512 : index
              %79 = pto.addptr %15, %77 : <f32, ub> -> <f32, ub>
              %80 = arith.muli %77, %c448 : index
              %81 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %82 = arith.index_cast %arg15 : i16 to index
                %83 = arith.index_cast %arg16 : index to i32
                %mask_4, %scalar_out_5 = pto.plt_b32 %83 : i32 -> !pto.mask<b32>, i32
                %84 = arith.index_cast %scalar_out_5 : i32 to index
                %85 = arith.addi %78, %82 : index
                %86 = pto.addptr %13, %85 : <f32, ub> -> <f32, ub>
                %result_6 = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %79[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %87 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %88 = pto.vmul %result_6, %87, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %89 = arith.addi %80, %82 : index
                %90 = pto.addptr %9, %89 : <f32, ub> -> <f32, ub>
                pto.vsts %88, %90[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %84 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %48 = pto.alloc_tile addr = %c34816_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c448 : index
              %result = pto.vlds %9[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %9[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %9[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %9[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %9[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %9[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %9[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = pto.vcvt %result, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %83 = pto.vcvt %result_3, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %84 = pto.vcvt %result_4, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %85 = pto.vcvt %result_5, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %86 = pto.vcvt %result_6, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %87 = pto.vcvt %result_7, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %88 = pto.vcvt %result_8, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %82, %16[%75], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %83, %16[%76], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %84, %16[%77], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %85, %16[%78], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %86, %16[%79], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %87, %16[%80], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %88, %16[%81], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %71 = pto.castptr %c3840_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %76 = pto.addptr %71, %75 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %76[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = pto.addptr %15, %74 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %77[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vmul %result, %78, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = arith.muli %74, %c64 : index
              %81 = pto.addptr %13, %80 : <f32, ub> -> <f32, ub>
              pto.vsts %79, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %72 = pto.castptr %c67872_i64 : i64 -> !pto.ptr<f32, ub>
            %73 = pto.addptr %72, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.index_cast %74 : index to i64
              %76 = arith.muli %75, %c256_i64 : i64
              %77 = arith.addi %76, %c2048_i64 : i64
              %78 = pto.castptr %77 : i64 -> !pto.ptr<f32, ub>
              %79 = pto.castptr %76 : i64 -> !pto.ptr<i32, ub>
              %80 = pto.addptr %79, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %80[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %81 = pto.vgather2 %78, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %81, %73[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %82 = arith.addi %76, %c51200_i64 : i64
              %83 = pto.castptr %82 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %83[%c0], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %49 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %13[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %13[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %50 = pto.alloc_tile addr = %c51200_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %17[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %5[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %17[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %51 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %13[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %17[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vadd %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %13[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %52 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %13[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vcvt %result, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %73, %18[%72], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %53 = pto.addptr %arg0, %37 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %16, %53, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %54 = arith.addi %33, %c448 : index
          %55 = arith.addi %31, %54 : index
          %56 = pto.addptr %arg0, %55 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %18, %56, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %73 = arith.index_cast %arg15 : i16 to index
                %74 = arith.addi %72, %73 : index
                %75 = pto.addptr %10, %74 : <i32, ub> -> <i32, ub>
                %result_10 = pto.vlds %75[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %76 = pto.vcvt %result_10, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %77 = pto.addptr %19, %74 : <f32, ub> -> <f32, ub>
                pto.vsts %76, %77[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              %73 = pto.addptr %3, %71 : <f32, ub> -> <f32, ub>
              %74 = scf.for %arg15 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg16 = %c512) -> (index)  : i16 {
                %75 = arith.index_cast %arg15 : i16 to index
                %76 = arith.index_cast %arg16 : index to i32
                %mask_10, %scalar_out_11 = pto.plt_b32 %76 : i32 -> !pto.mask<b32>, i32
                %77 = arith.index_cast %scalar_out_11 : i32 to index
                %78 = arith.addi %72, %75 : index
                %79 = pto.addptr %19, %78 : <f32, ub> -> <f32, ub>
                %result_12 = pto.vlds %79[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_13 = pto.vlds %73[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %80 = pto.vdup %result_13, %mask_10 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %81 = pto.vmul %result_12, %80, %mask_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %81, %79[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %77 : index
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
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c512 : index
              %result_10 = pto.vlds %19[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = arith.addi %72, %c64 : index
              %result_11 = pto.vlds %19[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %74 = arith.addi %72, %c128 : index
              %result_12 = pto.vlds %19[%74] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %75 = arith.addi %72, %c192 : index
              %result_13 = pto.vlds %19[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %72, %c256 : index
              %result_14 = pto.vlds %19[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %72, %c320 : index
              %result_15 = pto.vlds %19[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %72, %c384 : index
              %result_16 = pto.vlds %19[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %72, %c448 : index
              %result_17 = pto.vlds %19[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = pto.vmul %result_10, %result, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %81 = pto.vmul %result_11, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %82 = pto.vmul %result_12, %result_4, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %83 = pto.vmul %result_13, %result_5, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %result_14, %result_6, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %result_15, %result_7, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_16, %result_8, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %result_17, %result_9, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %80, %19[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %81, %19[%73], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %82, %19[%74], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %83, %19[%75], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %19[%76], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %19[%77], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %19[%78], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %19[%79], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          }
          %57 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %result = pto.vlds %19[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %19[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %19[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %19[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %19[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %19[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %19[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = arith.addi %75, %c448 : index
              %result_9 = pto.vlds %19[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %83 = pto.vmul %result, %result, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vmul %result_3, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vmul %result_4, %result_4, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_5, %result_5, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vmul %result_6, %result_6, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vmul %result_7, %result_7, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vmul %result_8, %result_8, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vmul %result_9, %result_9, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %83, %12[%75], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %84, %12[%76], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %85, %12[%77], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %86, %12[%78], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %87, %12[%79], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %88, %12[%80], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %89, %12[%81], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              pto.vsts %90, %12[%82], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
            %71 = pto.vdup %cst_2, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %72, %mask, %69 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %result = pto.vlds %12[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %12[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %12[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %12[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %12[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %12[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %12[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = arith.addi %75, %c448 : index
              %result_9 = pto.vlds %12[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %83 = pto.vadd %result, %result_3, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %84 = pto.vadd %83, %result_4, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %85 = pto.vadd %84, %result_5, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vadd %85, %result_6, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.vadd %86, %result_7, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %88 = pto.vadd %87, %result_8, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %89 = pto.vadd %88, %result_9, %70 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %90 = pto.vcadd %89, %70 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %91 = pto.vadd %90, %71, %72 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %91, %20[%74], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          }
          %58 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.vdup %cst, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vmul %result, %70, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %72, %mask, %69 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %71, %12[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %59 = pto.alloc_tile addr = %c68128_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
          pto.vecscope {
            %result = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.vdup %cst_0, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %71 = pto.vadd %result, %70, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %72 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
            %73 = pto.pand %72, %mask, %69 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            pto.vsts %71, %12[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_3 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = pto.vsqrt %result_3, %69 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %75 = pto.vdup %cst_1, %69 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
            %76 = pto.vdiv %75, %74, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %76, %21[%c0], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %77 = arith.index_cast %arg14 : i16 to index
              %78 = arith.muli %77, %c512 : index
              %79 = pto.addptr %21, %77 : <f32, ub> -> <f32, ub>
              %80 = arith.muli %77, %c448 : index
              %81 = scf.for %arg15 = %c0_i16 to %c448_i16 step %c64_i16 iter_args(%arg16 = %c448) -> (index)  : i16 {
                %82 = arith.index_cast %arg15 : i16 to index
                %83 = arith.index_cast %arg16 : index to i32
                %mask_4, %scalar_out_5 = pto.plt_b32 %83 : i32 -> !pto.mask<b32>, i32
                %84 = arith.index_cast %scalar_out_5 : i32 to index
                %85 = arith.addi %78, %82 : index
                %86 = pto.addptr %19, %85 : <f32, ub> -> <f32, ub>
                %result_6 = pto.vlds %86[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_7 = pto.vlds %79[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %87 = pto.vdup %result_7, %mask_4 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %88 = pto.vmul %result_6, %87, %mask_4 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %89 = arith.addi %80, %82 : index
                %90 = pto.addptr %12, %89 : <f32, ub> -> <f32, ub>
                pto.vsts %88, %90[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %84 : index
              }
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          %60 = pto.alloc_tile addr = %c68128_i64 valid_row = %c8 valid_col = %c448 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x448xbf16, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c448 : index
              %result = pto.vlds %12[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %76 = arith.addi %75, %c64 : index
              %result_3 = pto.vlds %12[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = arith.addi %75, %c128 : index
              %result_4 = pto.vlds %12[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = arith.addi %75, %c192 : index
              %result_5 = pto.vlds %12[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %79 = arith.addi %75, %c256 : index
              %result_6 = pto.vlds %12[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %80 = arith.addi %75, %c320 : index
              %result_7 = pto.vlds %12[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %81 = arith.addi %75, %c384 : index
              %result_8 = pto.vlds %12[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %82 = pto.vcvt %result, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %83 = pto.vcvt %result_3, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %84 = pto.vcvt %result_4, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %85 = pto.vcvt %result_5, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %86 = pto.vcvt %result_6, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %87 = pto.vcvt %result_7, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              %88 = pto.vcvt %result_8, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %82, %22[%75], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %83, %22[%76], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %84, %22[%77], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %85, %22[%78], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %86, %22[%79], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %87, %22[%80], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              pto.vsts %88, %22[%81], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
            %71 = pto.castptr %c20224_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.muli %74, %c512 : index
              %76 = pto.addptr %71, %75 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %76[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = pto.addptr %21, %74 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %77[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %78 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.vmul %result, %78, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %80 = arith.muli %74, %c64 : index
              %81 = pto.addptr %19, %80 : <f32, ub> -> <f32, ub>
              pto.vsts %79, %81[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
            %72 = pto.castptr %c101184_i64 : i64 -> !pto.ptr<f32, ub>
            %73 = pto.addptr %72, %c0 : <f32, ub> -> <f32, ub>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %74 = arith.index_cast %arg14 : i16 to index
              %75 = arith.index_cast %74 : index to i64
              %76 = arith.muli %75, %c256_i64 : i64
              %77 = arith.addi %76, %c18432_i64 : i64
              %78 = pto.castptr %77 : i64 -> !pto.ptr<f32, ub>
              %79 = pto.castptr %76 : i64 -> !pto.ptr<i32, ub>
              %80 = pto.addptr %79, %c0 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %80[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %81 = pto.vgather2 %78, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %81, %73[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %82 = arith.addi %76, %c84512_i64 : i64
              %83 = pto.castptr %82 : i64 -> !pto.ptr<f32, ub>
              %result_3 = pto.vlds %72[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %83[%c0], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %61 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %19[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %19[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %62 = pto.alloc_tile addr = %c84512_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %23[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %5[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vmul %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %23[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          }
          %63 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xf32, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %19[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %23[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vadd %result, %result_3, %69 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %73, %19[%72], %70 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          }
          %64 = pto.alloc_tile addr = %c18432_i64 valid_row = %c8 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x64xbf16, valid=?x?>
          pto.vecscope {
            %69 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %70 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            scf.for %arg14 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
              %71 = arith.index_cast %arg14 : i16 to index
              %72 = arith.muli %71, %c64 : index
              %result = pto.vlds %19[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %73 = pto.vcvt %result, %69 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
              pto.vsts %73, %24[%72], %70 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %65 = pto.addptr %arg0, %41 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %22, %65, %c0_i64, %c8_i64, %c896_i64, %c0_i64, %c65536_i64, %c896_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
          %66 = arith.addi %36, %c448 : index
          %67 = arith.addi %31, %66 : index
          %68 = pto.addptr %arg0, %67 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %24, %68, %c0_i64, %c8_i64, %c128_i64, %c0_i64, %c65536_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

