module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_pre_rms(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c32832_i64 = arith.constant 32832 : i64
      %c49280_i64 = arith.constant 49280 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c82048_i64 = arith.constant 82048 : i64
      %c98432_i64 = arith.constant 98432 : i64
      %c131200_i64 = arith.constant 131200 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c49248_i64 = arith.constant 49248 : i64
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c4 = arith.constant 4 : index
      %c512 = arith.constant 512 : index
      %c1024 = arith.constant 1024 : index
      %c1536 = arith.constant 1536 : index
      %cst_0 = arith.constant 6.10351563E-5 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i64 = arith.constant 8 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c8_i32 = arith.constant 8 : i32
      %c131072 = arith.constant 131072 : index
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %10 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %11 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %10, %11[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c131072 : index
      %4 = pto.castptr %c49280_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c82048_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.castptr %c98432_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c4 {
        %10 = arith.muli %arg6, %c512 : index
        %11 = arith.addi %10, %c512 : index
        %12 = arith.addi %10, %c1024 : index
        %13 = arith.addi %10, %c1536 : index
        %14 = arith.addi %3, %10 : index
        %15 = pto.addptr %arg0, %14 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %15, %4, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %16 = arith.addi %3, %11 : index
        %17 = pto.addptr %arg0, %16 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %17, %5, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %18 = arith.addi %3, %12 : index
        %19 = pto.addptr %arg0, %18 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %19, %6, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %20 = arith.addi %3, %13 : index
        %21 = pto.addptr %arg0, %20 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %21, %7, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %23 = pto.castptr %c131200_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %26 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %27 = pto.pand %24, %mask, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result_12 = pto.vlds %4[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_13 = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %38, %c128 : index
            %result_14 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %38, %c192 : index
            %result_15 = pto.vlds %4[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %38, %c256 : index
            %result_16 = pto.vlds %4[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %38, %c320 : index
            %result_17 = pto.vlds %4[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %38, %c384 : index
            %result_18 = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %38, %c448 : index
            %result_19 = pto.vlds %4[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_12, %result_12, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_13, %result_13, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_14, %result_14, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_15, %result_15, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_16, %result_16, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_17, %result_17, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_18, %result_18, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_19, %result_19, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %4[%38], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %4[%39], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %4[%40], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %4[%41], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %4[%42], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %4[%43], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %4[%44], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %4[%45], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = pto.vadd %46, %47, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %48, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %55, %49, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %50, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %51, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %58, %52, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %53, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcadd %60, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %23[%37], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %28 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vadd %result, %result_3, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %30 = pto.pand %28, %mask_4, %25 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %29, %4[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result_12 = pto.vlds %5[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_13 = pto.vlds %5[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %38, %c128 : index
            %result_14 = pto.vlds %5[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %38, %c192 : index
            %result_15 = pto.vlds %5[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %38, %c256 : index
            %result_16 = pto.vlds %5[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %38, %c320 : index
            %result_17 = pto.vlds %5[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %38, %c384 : index
            %result_18 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %38, %c448 : index
            %result_19 = pto.vlds %5[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_12, %result_12, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_13, %result_13, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_14, %result_14, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_15, %result_15, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_16, %result_16, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_17, %result_17, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_18, %result_18, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_19, %result_19, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %5[%38], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %5[%39], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %5[%40], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %5[%41], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %5[%42], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %5[%43], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %5[%44], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %5[%45], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = pto.vadd %46, %47, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %48, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %55, %49, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %50, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %51, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %58, %52, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %53, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcadd %60, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %31[%37], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_6 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result_6, %result_7, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %5[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %33 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result_12 = pto.vlds %6[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_13 = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %38, %c128 : index
            %result_14 = pto.vlds %6[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %38, %c192 : index
            %result_15 = pto.vlds %6[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %38, %c256 : index
            %result_16 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %38, %c320 : index
            %result_17 = pto.vlds %6[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %38, %c384 : index
            %result_18 = pto.vlds %6[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %38, %c448 : index
            %result_19 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_12, %result_12, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_13, %result_13, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_14, %result_14, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_15, %result_15, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_16, %result_16, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_17, %result_17, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_18, %result_18, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_19, %result_19, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %6[%38], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %6[%39], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %6[%40], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %6[%41], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %6[%42], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %6[%43], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %6[%44], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %6[%45], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = pto.vadd %46, %47, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %48, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %55, %49, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %50, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %51, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %58, %52, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %53, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcadd %60, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %33[%37], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_8 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_9 = pto.vlds %33[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result_8, %result_9, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %6[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %35 = pto.castptr %c49248_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result_12 = pto.vlds %7[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %39 = arith.addi %38, %c64 : index
            %result_13 = pto.vlds %7[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %38, %c128 : index
            %result_14 = pto.vlds %7[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %38, %c192 : index
            %result_15 = pto.vlds %7[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %38, %c256 : index
            %result_16 = pto.vlds %7[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %38, %c320 : index
            %result_17 = pto.vlds %7[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %38, %c384 : index
            %result_18 = pto.vlds %7[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %38, %c448 : index
            %result_19 = pto.vlds %7[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = pto.vmul %result_12, %result_12, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_13, %result_13, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_14, %result_14, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_15, %result_15, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_16, %result_16, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_17, %result_17, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_18, %result_18, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_19, %result_19, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %7[%38], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %7[%39], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %7[%40], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %7[%41], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %7[%42], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %7[%43], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %7[%44], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %7[%45], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %54 = pto.vadd %46, %47, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %48, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %55, %49, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %50, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %51, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %58, %52, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %53, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vcadd %60, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %26, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %62, %35[%37], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_10 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_11 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vadd %result_10, %result_11, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %2[%c0], %30 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %10 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %11 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %12 = pto.vdup %cst_0, %11 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %13 = pto.vmul %result, %12, %11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pand %10, %mask, %11 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %13, %4[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %10 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %11 = pto.vdup %cst_1, %10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %12 = pto.vadd %result, %11, %10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %13 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pand %13, %mask, %10 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %12, %4[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.vsqrt %result_3, %10 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vdup %cst_2, %10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vdiv %16, %15, %10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %6[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.addptr %arg1, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %9, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
