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
        %40 = arith.muli %arg9, %c16 : index
        %41 = arith.addi %5, %40 : index
        %42 = pto.addptr %arg0, %41 : <f32, gm> -> <f32, gm>
        %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %43, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %44 = pto.addptr %arg1, %41 : <f32, gm> -> <f32, gm>
        %45 = pto.addptr %44, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %45, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %46 = arith.muli %41, %c512 : index
        %47 = pto.addptr %arg2, %46 : <f32, gm> -> <f32, gm>
        %48 = pto.addptr %47, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %48, %24, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %49 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
          %50 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
          %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %52 = pto.vmax %result, %result_2, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
          %53 = pto.pand %50, %mask, %51 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %52, %49[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %54 = pto.vsub %result, %52, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.castptr %c69760_i64 : i64 -> !pto.ptr<f32, ub>
          %56 = pto.vexp %54, %51 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %56, %55[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %57 = pto.vsub %result_2, %52, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.castptr %c70016_i64 : i64 -> !pto.ptr<f32, ub>
          %59 = pto.vexp %57, %51 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %59, %58[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %60 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
          %result_3 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %61 = pto.vmul %56, %result_3, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %61, %60[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %62 = pto.vmul %59, %result_4, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %63 = pto.castptr %c70272_i64 : i64 -> !pto.ptr<f32, ub>
          %64 = pto.vadd %61, %62, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %64, %63[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %68 = arith.index_cast %arg10 : i16 to index
            %69 = arith.muli %68, %c512 : index
            %70 = pto.addptr %55, %68 : <f32, ub> -> <f32, ub>
            %71 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
              %72 = arith.index_cast %arg11 : i16 to index
              %73 = arith.index_cast %arg12 : index to i32
              %mask_7, %scalar_out_8 = pto.plt_b32 %73 : i32 -> !pto.mask<b32>, i32
              %74 = arith.index_cast %scalar_out_8 : i32 to index
              %75 = arith.addi %69, %72 : index
              %76 = pto.addptr %16, %75 : <f32, ub> -> <f32, ub>
              %result_9 = pto.vlds %76[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = pto.vdup %result_10, %mask_7 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vmul %result_9, %77, %mask_7 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %79 = pto.addptr %60, %75 : <f32, ub> -> <f32, ub>
              pto.vsts %78, %79[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %74 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %68 = arith.index_cast %arg10 : i16 to index
            %69 = arith.muli %68, %c512 : index
            %70 = pto.addptr %58, %68 : <f32, ub> -> <f32, ub>
            %71 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
              %72 = arith.index_cast %arg11 : i16 to index
              %73 = arith.index_cast %arg12 : index to i32
              %mask_7, %scalar_out_8 = pto.plt_b32 %73 : i32 -> !pto.mask<b32>, i32
              %74 = arith.index_cast %scalar_out_8 : i32 to index
              %75 = arith.addi %69, %72 : index
              %76 = pto.addptr %23, %75 : <f32, ub> -> <f32, ub>
              %result_9 = pto.vlds %76[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_10 = pto.vlds %70[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %77 = pto.vdup %result_10, %mask_7 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %78 = pto.vmul %result_9, %77, %mask_7 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %78, %76[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %74 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %65 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %68 = arith.index_cast %arg10 : i16 to index
            %69 = arith.muli %68, %c512 : index
            %result_7 = pto.vlds %60[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %70 = arith.addi %69, %c64 : index
            %result_8 = pto.vlds %60[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %71 = arith.addi %69, %c128 : index
            %result_9 = pto.vlds %60[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %72 = arith.addi %69, %c192 : index
            %result_10 = pto.vlds %60[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %73 = arith.addi %69, %c256 : index
            %result_11 = pto.vlds %60[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %74 = arith.addi %69, %c320 : index
            %result_12 = pto.vlds %60[%74] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %75 = arith.addi %69, %c384 : index
            %result_13 = pto.vlds %60[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %76 = arith.addi %69, %c448 : index
            %result_14 = pto.vlds %60[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %23[%69] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_16 = pto.vlds %23[%70] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_17 = pto.vlds %23[%71] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_18 = pto.vlds %23[%72] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_19 = pto.vlds %23[%73] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_20 = pto.vlds %23[%74] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_21 = pto.vlds %23[%75] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_22 = pto.vlds %23[%76] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %77 = pto.vadd %result_7, %result_15, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %78 = pto.vadd %result_8, %result_16, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %79 = pto.vadd %result_9, %result_17, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %80 = pto.vadd %result_10, %result_18, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %81 = pto.vadd %result_11, %result_19, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %82 = pto.vadd %result_12, %result_20, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %83 = pto.vadd %result_13, %result_21, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %84 = pto.vadd %result_14, %result_22, %51 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %77, %16[%69], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %78, %16[%70], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %79, %16[%71], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %80, %16[%72], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %81, %16[%73], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %82, %16[%74], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %83, %16[%75], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %84, %16[%76], %65 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tadd_block64", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
          %66 = pto.addptr %63, %c0 : <f32, ub> -> <f32, ub>
          %result_5 = pto.vlds %66[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_5, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %67 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
          %result_6 = pto.vlds %67[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_6, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %25 = pto.addptr %arg3, %4 : <f32, gm> -> <f32, gm>
      pto.copy_gm_to_ubuf %25, %23, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %26 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %40 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %42 = pto.vsub %result, %result, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %43 = pto.pand %40, %mask, %41 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %42, %26[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %44 = pto.vadd %42, %result_2, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %45 = pto.vsub %44, %result, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %46 = pto.vexp %45, %41 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %47 = pto.vadd %result_3, %46, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %47, %23[%c0], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %27 = pto.alloc_tile addr = %c70912_i64 valid_row = %c16 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x512xf32, valid=?x?>
      pto.vecscope {
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg9 : i16 to index
          %45 = arith.muli %44, %c512 : index
          %46 = pto.addptr %23, %44 : <f32, ub> -> <f32, ub>
          %47 = scf.for %arg10 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg11 = %c512) -> (index)  : i16 {
            %48 = arith.index_cast %arg10 : i16 to index
            %49 = arith.index_cast %arg11 : index to i32
            %mask_2, %scalar_out_3 = pto.plt_b32 %49 : i32 -> !pto.mask<b32>, i32
            %50 = arith.index_cast %scalar_out_3 : i32 to index
            %51 = arith.addi %45, %48 : index
            %52 = pto.addptr %16, %51 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %52[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = pto.vdup %result_4, %mask_2 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vdiv %result, %53, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %54, %52[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %50 : index
          }
        } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
        %40 = pto.castptr %c128_i64 : i64 -> !pto.ptr<bf16, ub>
        %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg9 : i16 to index
          %45 = arith.muli %44, %c512 : index
          %result = pto.vlds %16[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = arith.addi %45, %c64 : index
          %result_2 = pto.vlds %16[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = arith.addi %45, %c128 : index
          %result_3 = pto.vlds %16[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = arith.addi %45, %c192 : index
          %result_4 = pto.vlds %16[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = arith.addi %45, %c256 : index
          %result_5 = pto.vlds %16[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = arith.addi %45, %c320 : index
          %result_6 = pto.vlds %16[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = arith.addi %45, %c384 : index
          %result_7 = pto.vlds %16[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %52 = arith.addi %45, %c448 : index
          %result_8 = pto.vlds %16[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %53 = pto.vcvt %result, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %54 = pto.vcvt %result_2, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %55 = pto.vcvt %result_3, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %56 = pto.vcvt %result_4, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %57 = pto.vcvt %result_5, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %58 = pto.vcvt %result_6, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %59 = pto.vcvt %result_7, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %60 = pto.vcvt %result_8, %41 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %53, %40[%45], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %54, %40[%46], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %55, %40[%47], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %56, %40[%48], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %57, %40[%49], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %58, %40[%50], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %59, %40[%51], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %60, %40[%52], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %43 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %44 = arith.index_cast %arg9 : i16 to index
          %45 = arith.muli %44, %c64 : index
          %46 = pto.addptr %26, %45 : <f32, ub> -> <f32, ub>
          pto.vsts %43, %46[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %28 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<i32, ub>
      scf.for %arg9 = %c0 to %c64 step %c1 {
        %40 = arith.index_cast %arg9 : index to i32
        pto.store %40, %28[%arg9] : !pto.ptr<i32, ub>, i32
      } {pto.tilelib.candidate = "template_tci", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tci"}
      %29 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %40 = pto.addptr %28, %c0 : <i32, ub> -> <i32, ub>
        %result = pto.vlds %40[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
        %41 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %42 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %41, %42[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result_2 = pto.vlds %29[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %45 = pto.vdup %cst_0, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result_3 = pto.vlds %26[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_3, %result_2, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %50, %26[%49], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %51 = pto.vmul %50, %45, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %51, %29[%49], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %50 = pto.addptr %29, %49 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_3, %mask {rnd = "Z", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %52 = pto.addptr %28, %49 : <i32, ub> -> <i32, ub>
          pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %50 = pto.addptr %28, %49 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %50[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %51 = pto.vcvt %result_3, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.addptr %29, %49 : <f32, ub> -> <f32, ub>
          pto.vsts %51, %52[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %46 = pto.vdup %cst_1, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %47 = pto.vdup %cst, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %48 = arith.index_cast %arg9 : i16 to index
          %49 = arith.muli %48, %c64 : index
          %result_3 = pto.vlds %29[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_3, %46, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %26[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vsub %result_4, %50, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vadd %result_4, %47, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %52, %26[%49], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %53 = pto.vmul %51, %46, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %53, %29[%49], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
      }
      %30 = pto.alloc_tile addr = %c32896_i64 valid_row = %c16 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x64xf32, valid=?x?>
      pto.vecscope {
        %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %41 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg9 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %result = pto.vlds %26[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %29[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vsub %result, %result_2, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %26[%44], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tsub", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsub"}
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %42 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %43 = arith.index_cast %arg9 : i16 to index
          %44 = arith.muli %43, %c64 : index
          %45 = pto.addptr %26, %44 : <f32, ub> -> <f32, ub>
          %result = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result, %mask {rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
          %47 = pto.addptr %42, %44 : <i32, ub> -> <i32, ub>
          pto.vsts %46, %47[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %31 = arith.muli %1, %c64 : index
      %32 = pto.addptr %arg4, %31 : <f32, gm> -> <f32, gm>
      %33 = pto.castptr %c69760_i64 : i64 -> !pto.ptr<f32, ub>
      %34 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
      %35 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %34, %35, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %36 = pto.addptr %arg5, %31 : <f32, gm> -> <f32, gm>
      %37 = pto.castptr %c70016_i64 : i64 -> !pto.ptr<f32, ub>
      %38 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
      %39 = pto.addptr %37, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %38, %39, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %40 = pto.castptr %c70528_i64 : i64 -> !pto.ptr<f32, ub>
        %41 = pto.addptr %40, %c0 : <f32, ub> -> <f32, ub>
        %42 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg9 : i16 to index
          %46 = arith.index_cast %45 : index to i64
          %47 = arith.muli %46, %c2048_i64 : i64
          %48 = arith.addi %47, %c72704_i64 : i64
          %49 = arith.muli %46, %c256_i64 : i64
          %50 = arith.addi %49, %c32896_i64 : i64
          %51 = pto.castptr %48 : i64 -> !pto.ptr<f32, ub>
          %52 = pto.castptr %50 : i64 -> !pto.ptr<i32, ub>
          %53 = pto.addptr %52, %c0 : <i32, ub> -> <i32, ub>
          %result_3 = pto.vlds %53[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %54 = pto.vgather2 %51, %result_3, %mask : !pto.ptr<f32, ub>, !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %54, %41[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %55 = arith.addi %49, %c65664_i64 : i64
          %56 = pto.castptr %55 : i64 -> !pto.ptr<f32, ub>
          %result_4 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          pto.vsts %result_4, %56[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg9 : i16 to index
          %46 = arith.muli %45, %c512 : index
          %47 = arith.addi %46, %c448 : index
          %48 = pto.addptr %16, %47 : <f32, ub> -> <f32, ub>
          %result_3 = pto.vlds %48[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = arith.muli %45, %c64 : index
          %50 = pto.addptr %26, %49 : <f32, ub> -> <f32, ub>
          pto.vsts %result_3, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "template_textract_vec2vec_nd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"}
        %result = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %43 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg9 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result_3 = pto.vlds %26[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_3, %result, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result_4 = pto.vlds %29[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result_4, %result_2, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %26[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %49 = pto.vadd %47, %48, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %16[%46], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %44 = pto.castptr %c70912_i64 : i64 -> !pto.ptr<bf16, ub>
        scf.for %arg9 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %45 = arith.index_cast %arg9 : i16 to index
          %46 = arith.muli %45, %c64 : index
          %result_3 = pto.vlds %16[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.vcvt %result_3, %43 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %47, %44[%46], %42 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg9 = %c0 to %c16 step %c1 {
        %40 = arith.addi %4, %arg9 : index
        %41 = arith.divsi %40, %c8 : index
        %42 = arith.muli %41, %c8 : index
        %43 = arith.subi %40, %42 : index
        %44 = arith.addi %42, %1 : index
        %45 = arith.muli %43, %c512 : index
        %46 = arith.index_cast %arg9 : index to i64
        %47 = arith.muli %46, %c1024_i64 : i64
        %48 = arith.addi %47, %c128_i64 : i64
        %49 = pto.castptr %48 : i64 -> !pto.ptr<bf16, ub>
        %50 = arith.muli %44, %c4096 : index
        %51 = arith.addi %50, %45 : index
        %52 = pto.addptr %arg6, %51 : <bf16, gm> -> <bf16, gm>
        %53 = pto.addptr %49, %c0 : <bf16, ub> -> <bf16, ub>
        %54 = pto.addptr %52, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %53, %54, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        %55 = arith.muli %46, %c128_i64 : i64
        %56 = arith.addi %55, %c70912_i64 : i64
        %57 = arith.addi %45, %c448 : index
        %58 = pto.castptr %56 : i64 -> !pto.ptr<bf16, ub>
        %59 = arith.addi %50, %57 : index
        %60 = pto.addptr %arg6, %59 : <bf16, gm> -> <bf16, gm>
        %61 = pto.addptr %58, %c0 : <bf16, ub> -> <bf16, ub>
        %62 = pto.addptr %60, %c0 : <bf16, gm> -> <bf16, gm>
        pto.copy_ubuf_to_gm %61, %62, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
