module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: !pto.ptr<bf16, gm>, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c256_i64 = arith.constant 256 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c72704_i64 = arith.constant 72704 : i64
      %c70784_i64 = arith.constant 70784 : i64
      %c70848_i64 = arith.constant 70848 : i64
      %c70912_i64 = arith.constant 70912 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c32896_i64 = arith.constant 32896 : i64
      %c69760_i64 = arith.constant 69760 : i64
      %c70016_i64 = arith.constant 70016 : i64
      %c70272_i64 = arith.constant 70272 : i64
      %c70528_i64 = arith.constant 70528 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c64 = arith.constant 64 : index
      %c8 = arith.constant 8 : index
      %c4096 = arith.constant 4096 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c80 = arith.constant 80 : index
      %c0 = arith.constant 0 : index
      %c5 = arith.constant 5 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 5.000000e-01 : f32
      %cst_1 = arith.constant 2.000000e+00 : f32
      %c448 = arith.constant 448 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c896_i64 = arith.constant 896 : i64
      %c64_i32 = arith.constant 64 : i32
      %c16_i64 = arith.constant 16 : i64
      %c40960 = arith.constant 40960 : index
      %c16_i32 = arith.constant 16 : i32
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.divsi %0, %c4 : index
      %2 = arith.muli %1, %c4 : index
      %3 = arith.subi %0, %2 : index
      %4 = arith.muli %3, %c16 : index
      %5 = arith.muli %0, %c80 : index
      %6 = pto.addptr %arg0, %5 : <f32, gm> -> <f32, gm>
      %7 = pto.castptr %c70784_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.addptr %6, %c0 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %8, %9, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %10 = pto.addptr %arg1, %5 : <f32, gm> -> <f32, gm>
      %11 = pto.castptr %c70848_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.addptr %10, %c0 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %12, %13, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %14 = arith.muli %0, %c40960 : index
      %15 = pto.addptr %arg2, %14 : <f32, gm> -> <f32, gm>
      %16 = pto.castptr %c70912_i64 : i64 -> !pto.ptr<f32, ub>
      %17 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %17, %18, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %20 = pto.addptr %19, %c0 : <f32, ub> -> <f32, ub>
      %21 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
      %22 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
      %23 = pto.castptr %c128_i64 : i64 -> !pto.ptr<f32, ub>
      %24 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg9 = %c1 to %c5 step %c1 {
        %48 = arith.muli %arg9, %c16 : index
        %49 = arith.addi %5, %48 : index
        %50 = pto.addptr %arg0, %49 : <f32, gm> -> <f32, gm>
        %51 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %51, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %52 = pto.addptr %arg1, %49 : <f32, gm> -> <f32, gm>
        %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %53, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %54 = arith.muli %49, %c512 : index
        %55 = pto.addptr %arg2, %54 : <f32, gm> -> <f32, gm>
        %56 = pto.addptr %55, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %56, %24, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %57 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
          %58 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %59 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %60 = pto.vmax %result, %result_2, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %61 = pto.pand %58, %mask, %59 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %60, %57[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %62 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
          %result_3 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %63 = pto.vsub %result_3, %result_4, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %63, %62[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %64 = pto.castptr %c69760_i64 : i64 -> !pto.ptr<f32, ub>
          %result_5 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %65 = pto.vexp %result_5, %59 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %65, %64[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_6 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = pto.vsub %result_6, %result_7, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %66, %62[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %67 = pto.castptr %c70016_i64 : i64 -> !pto.ptr<f32, ub>
          %result_8 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.vexp %result_8, %59 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %68, %67[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_9 = pto.vlds %64[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %69 = pto.vmul %result_9, %result_10, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %69, %62[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %70 = pto.castptr %c70272_i64 : i64 -> !pto.ptr<f32, ub>
          %result_11 = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %71 = pto.vmul %result_11, %result_12, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %71, %70[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_13 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %72 = pto.vadd %result_13, %result_14, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %72, %70[%c0], %61 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %76 = arith.index_cast %arg10 : i16 to index
            %77 = arith.muli %76, %c512 : index
            %78 = pto.addptr %64, %76 : <f32, ub> -> <f32, ub>
            %79 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
              %80 = arith.index_cast %arg11 : i16 to index
              %81 = arith.index_cast %arg12 : index to i32
              %mask_17, %scalar_out_18 = pto.plt_b32 %81 : i32 -> !pto.mask<b32>, i32
              %82 = arith.index_cast %scalar_out_18 : i32 to index
              %83 = arith.addi %77, %80 : index
              %84 = pto.addptr %16, %83 : <f32, ub> -> <f32, ub>
              %result_19 = pto.vlds %84[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %78[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %85 = pto.vdup %result_20, %mask_17 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_19, %85, %mask_17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %87 = pto.addptr %62, %83 : <f32, ub> -> <f32, ub>
              pto.vsts %86, %87[%c0], %mask_17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %82 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %76 = arith.index_cast %arg10 : i16 to index
            %77 = arith.muli %76, %c512 : index
            %78 = pto.addptr %67, %76 : <f32, ub> -> <f32, ub>
            %79 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
              %80 = arith.index_cast %arg11 : i16 to index
              %81 = arith.index_cast %arg12 : index to i32
              %mask_17, %scalar_out_18 = pto.plt_b32 %81 : i32 -> !pto.mask<b32>, i32
              %82 = arith.index_cast %scalar_out_18 : i32 to index
              %83 = arith.addi %77, %80 : index
              %84 = pto.addptr %23, %83 : <f32, ub> -> <f32, ub>
              %result_19 = pto.vlds %84[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_20 = pto.vlds %78[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %85 = pto.vdup %result_20, %mask_17 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %86 = pto.vmul %result_19, %85, %mask_17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %86, %84[%c0], %mask_17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %82 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %73 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %76 = arith.index_cast %arg10 : i16 to index
            %77 = arith.muli %76, %c512 : index
            %result_17 = pto.vlds %62[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %78 = arith.addi %77, %c64 : index
            %result_18 = pto.vlds %62[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %79 = arith.addi %77, %c128 : index
            %result_19 = pto.vlds %62[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %80 = arith.addi %77, %c192 : index
            %result_20 = pto.vlds %62[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %81 = arith.addi %77, %c256 : index
            %result_21 = pto.vlds %62[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %82 = arith.addi %77, %c320 : index
            %result_22 = pto.vlds %62[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %83 = arith.addi %77, %c384 : index
            %result_23 = pto.vlds %62[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %84 = arith.addi %77, %c448 : index
            %result_24 = pto.vlds %62[%84] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_25 = pto.vlds %23[%77] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_26 = pto.vlds %23[%78] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_27 = pto.vlds %23[%79] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_28 = pto.vlds %23[%80] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_29 = pto.vlds %23[%81] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_30 = pto.vlds %23[%82] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_31 = pto.vlds %23[%83] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_32 = pto.vlds %23[%84] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %85 = pto.vadd %result_17, %result_25, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %86 = pto.vadd %result_18, %result_26, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %87 = pto.vadd %result_19, %result_27, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %88 = pto.vadd %result_20, %result_28, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %89 = pto.vadd %result_21, %result_29, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %90 = pto.vadd %result_22, %result_30, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %91 = pto.vadd %result_23, %result_31, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %92 = pto.vadd %result_24, %result_32, %59 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %85, %16[%77], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %86, %16[%78], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %87, %16[%79], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %88, %16[%80], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %89, %16[%81], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %90, %16[%82], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %91, %16[%83], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %92, %16[%84], %73 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          %74 = pto.addptr %70, %c0 : <f32, ub> -> <f32, ub>
          %result_15 = pto.vlds %74[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_15, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %75 = pto.addptr %57, %c0 : <f32, ub> -> <f32, ub>
          %result_16 = pto.vlds %75[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_16, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %25 = pto.addptr %arg3, %4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %25, %23, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %26 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %48 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %50 = pto.vsub %result, %result, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %51 = pto.pand %48, %mask, %49 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %50, %26[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_2 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %52 = pto.vadd %result_2, %result_3, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %52, %23[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %53 = pto.vsub %result_4, %result_5, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %53, %23[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %54 = pto.vexp %result_6, %49 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %54, %23[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %55 = pto.vadd %result_7, %result_8, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %55, %23[%c0], %51 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %59 = arith.index_cast %arg9 : i16 to index
          %60 = arith.muli %59, %c512 : index
          %61 = pto.addptr %23, %59 : <f32, ub> -> <f32, ub>
          %62 = scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg11 = %c512) -> (index)  : i16 {
            %63 = arith.index_cast %arg10 : i16 to index
            %64 = arith.index_cast %arg11 : index to i32
            %mask_11, %scalar_out_12 = pto.plt_b32 %64 : i32 -> !pto.mask<b32>, i32
            %65 = arith.index_cast %scalar_out_12 : i32 to index
            %66 = arith.addi %60, %63 : index
            %67 = pto.addptr %16, %66 : <f32, ub> -> <f32, ub>
            %result_13 = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %68 = pto.vdup %result_14, %mask_11 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %69 = pto.vdiv %result_13, %68, %mask_11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %69, %67[%c0], %mask_11 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %65 : index
          }
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %56 = pto.castptr %c128_i64 : i64 -> !pto.ptr<bf16, ub>
        %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %59 = arith.index_cast %arg9 : i16 to index
          %60 = arith.muli %59, %c512 : index
          %result_11 = pto.vlds %16[%60] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %61 = arith.addi %60, %c64 : index
          %result_12 = pto.vlds %16[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %62 = arith.addi %60, %c128 : index
          %result_13 = pto.vlds %16[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %63 = arith.addi %60, %c192 : index
          %result_14 = pto.vlds %16[%63] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %64 = arith.addi %60, %c256 : index
          %result_15 = pto.vlds %16[%64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %65 = arith.addi %60, %c320 : index
          %result_16 = pto.vlds %16[%65] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %66 = arith.addi %60, %c384 : index
          %result_17 = pto.vlds %16[%66] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %67 = arith.addi %60, %c448 : index
          %result_18 = pto.vlds %16[%67] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %68 = pto.vcvt %result_11, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %69 = pto.vcvt %result_12, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %70 = pto.vcvt %result_13, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %71 = pto.vcvt %result_14, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %72 = pto.vcvt %result_15, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %73 = pto.vcvt %result_16, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %74 = pto.vcvt %result_17, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %75 = pto.vcvt %result_18, %49 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %68, %56[%60], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %69, %56[%61], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %70, %56[%62], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %71, %56[%63], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %72, %56[%64], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %73, %56[%65], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %74, %56[%66], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %75, %56[%67], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask_9, %scalar_out_10 = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %58 = pto.vdup %cst, %mask_9 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %59 = arith.index_cast %arg9 : i16 to index
          %60 = arith.muli %59, %c64 : index
          %61 = pto.addptr %26, %60 : <f32, ub> -> <f32, ub>
          pto.vsts %58, %61[%c0], %mask_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %27 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %48 = arith.index_cast %arg9 : index to i32
        pto.store %48, %27[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %28 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %48 = pto.addptr %27, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %48[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %49 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.addptr %28, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %49, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %29 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %49 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg9 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_2 = pto.vlds %26[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_2, %result, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %26[%51], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %30 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_0, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %26[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %28[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %28, %52 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %55 = pto.addptr %27, %52 : <i32, ub> -> <i32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %27, %52 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %54 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.addptr %28, %52 : <f32, ub> -> <f32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %31 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_1, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %28[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %28[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %32 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg9 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result = pto.vlds %26[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %28[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vsub %result, %result_2, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %28[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
      }
      %33 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %26[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %26[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %34 = pto.alloc_tile addr = %c65664_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.vdup %cst_1, %48 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %28[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vmul %result, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %28[%52], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %35 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %26[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %28[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vsub %result, %result_2, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %26[%52], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %50 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %53 = pto.addptr %26, %52 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %53[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %54 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %55 = pto.addptr %50, %52 : <i32, ub> -> <i32, ub>
          pto.vsts %54, %55[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %36 = arith.muli %1, %c64 : index
      %37 = pto.addptr %arg4, %36 : <f32, gm> -> <f32, gm>
      %38 = pto.castptr %c69760_i64 : i64 -> !pto.ptr<f32, ub>
      %39 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
      %40 = pto.addptr %38, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %39, %40, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %41 = pto.addptr %arg5, %36 : <f32, gm> -> <f32, gm>
      %42 = pto.castptr %c70016_i64 : i64 -> !pto.ptr<f32, ub>
      %43 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
      %44 = pto.addptr %42, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %43, %44, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %48 = pto.castptr %c70528_i64 : i64 -> !pto.ptr<f32, ub>
        %49 = pto.addptr %48, %c0 : <f32, ub> -> <f32, ub>
        %50 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.index_cast %51 : index to i64
          %53 = arith.muli %52, %c2048_i64 : i64
          %54 = arith.addi %53, %c72704_i64 : i64
          %55 = arith.muli %52, %c256_i64 : i64
          %56 = arith.addi %55, %c32896_i64 : i64
          %57 = pto.castptr %54 : i64 -> !pto.ptr<f32, ub>
          %58 = pto.castptr %56 : i64 -> !pto.ptr<i32, ub>
          %59 = pto.addptr %58, %c0 : <i32, ub> -> <i32, ub>
          %result = pto.vlds %59[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %60 = pto.vgather2 %57, %result, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %60, %49[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %61 = arith.addi %55, %c65664_i64 : i64
          %62 = pto.castptr %61 : i64 -> !pto.ptr<f32, ub>
          %result_2 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_2, %62[%c0], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c512 : index
          %53 = arith.addi %52, %c448 : index
          %54 = pto.addptr %16, %53 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %55 = arith.muli %51, %c64 : index
          %56 = pto.addptr %26, %55 : <f32, ub> -> <f32, ub>
          pto.vsts %result, %56[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_textract_vec2vec_nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"}
      }
      %45 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %38[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg9 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_2 = pto.vlds %26[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_2, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %16[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %46 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %42[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %50 = arith.index_cast %arg9 : i16 to index
          %51 = arith.muli %50, %c64 : index
          %result_2 = pto.vlds %28[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_2, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %26[%51], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %47 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %49 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %16[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %26[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vadd %result, %result_2, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %16[%52], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
        %50 = pto.castptr %c70912_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %51 = arith.index_cast %arg9 : i16 to index
          %52 = arith.muli %51, %c64 : index
          %result = pto.vlds %16[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result, %48 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %53, %50[%52], %49 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg9 = %c0 to %c16 step %c1 {
        %48 = arith.addi %4, %arg9 : index
        %49 = arith.divsi %48, %c8 : index
        %50 = arith.muli %49, %c8 : index
        %51 = arith.subi %48, %50 : index
        %52 = arith.addi %50, %1 : index
        %53 = arith.muli %51, %c512 : index
        %54 = arith.index_cast %arg9 : index to i64
        %55 = arith.muli %54, %c1024_i64 : i64
        %56 = arith.addi %55, %c128_i64 : i64
        %57 = pto.castptr %56 : i64 -> !pto.ptr<bf16, ub>
        %58 = arith.muli %52, %c4096 : index
        %59 = arith.addi %58, %53 : index
        %60 = pto.addptr %arg6, %59 : <bf16, gm> -> <bf16, gm>
        %61 = pto.addptr %57, %c0 : <bf16, ub> -> <bf16, ub>
        %62 = pto.addptr %60, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %61, %62, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        %63 = arith.muli %54, %c128_i64 : i64
        %64 = arith.addi %63, %c70912_i64 : i64
        %65 = arith.addi %53, %c448 : index
        %66 = pto.castptr %64 : i64 -> !pto.ptr<bf16, ub>
        %67 = arith.addi %58, %65 : index
        %68 = pto.addptr %arg6, %67 : <bf16, gm> -> <bf16, gm>
        %69 = pto.addptr %66, %c0 : <bf16, ub> -> <bf16, ub>
        %70 = pto.addptr %68, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %69, %70, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

