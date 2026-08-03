module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @merge_norm(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<f32, gm>, %arg6: index, %arg7: i32, %arg8: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c1024_i64 = arith.constant 1024 : i64
      %c67776_i64 = arith.constant 67776 : i64
      %c65856_i64 = arith.constant 65856 : i64
      %c65920_i64 = arith.constant 65920 : i64
      %c65984_i64 = arith.constant 65984 : i64
      %c98752_i64 = arith.constant 98752 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32832_i64 = arith.constant 32832 : i64
      %c33088_i64 = arith.constant 33088 : i64
      %c32896_i64 = arith.constant 32896 : i64
      %c32960_i64 = arith.constant 32960 : i64
      %c33024_i64 = arith.constant 33024 : i64
      %c64 = arith.constant 64 : index
      %c1 = arith.constant 1 : index
      %c4096 = arith.constant 4096 : index
      %c512 = arith.constant 512 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %c48 = arith.constant 48 : index
      %c3 = arith.constant 3 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant 0.000000e+00 : bf16
      %c8 = arith.constant 8 : index
      %c1_i64 = arith.constant 1 : i64
      %c896_i64 = arith.constant 896 : i64
      %c16_i64 = arith.constant 16 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c256_i64 = arith.constant 256 : i64
      %c4_i64 = arith.constant 4 : i64
      %c512_i32 = arith.constant 512 : i32
      %c16_i32 = arith.constant 16 : i32
      %0 = arith.index_cast %arg7 : i32 to index
      %1 = arith.muli %0, %c192 : index
      %2 = arith.muli %0, %c64 : index
      %3 = arith.cmpi slt, %0, %c128 : index
      %4 = pto.castptr %c67776_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg9 = %c0 to %c4 step %c1 {
        %6 = arith.muli %arg9, %c16 : index
        %7 = arith.addi %2, %6 : index
        scf.if %3 {
          %11 = arith.muli %arg9, %c48 : index
          %12 = arith.addi %1, %11 : index
          %13 = pto.addptr %arg2, %12 : <f32, gm> -> <f32, gm>
          %14 = pto.castptr %c65856_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %13, %14, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %15 = pto.addptr %arg3, %12 : <f32, gm> -> <f32, gm>
          %16 = pto.castptr %c65920_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %15, %16, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %17 = arith.muli %12, %c512 : index
          %18 = pto.addptr %arg4, %17 : <f32, gm> -> <f32, gm>
          %19 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
          pto.copy_gm_to_ubuf %18, %19, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %20 = pto.castptr %c98752_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c64_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg10 = %c1 to %c3 step %c1 {
            %24 = arith.muli %arg10, %c16 : index
            %25 = arith.addi %12, %24 : index
            %26 = pto.addptr %arg2, %25 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %26, %20, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %27 = pto.addptr %arg3, %25 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %27, %21, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %28 = arith.muli %25, %c512 : index
            %29 = pto.addptr %arg4, %28 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %29, %22, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
              %30 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
              %result_1 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %32 = pto.vmax %result, %result_1, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %33 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
              %34 = pto.addptr %33, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %32, %34[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_2 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %35 = pto.vsub %result_2, %result_3, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %36 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<f32, ub>
              %37 = pto.addptr %36, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %35, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_4 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %38 = pto.vexp %result_4, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %39 = pto.castptr %c32896_i64 : i64 -> !pto.ptr<f32, ub>
              %40 = pto.addptr %39, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %38, %40[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_5 = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %41 = pto.vsub %result_5, %result_6, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %41, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_7 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %42 = pto.vexp %result_7, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %43 = pto.castptr %c32960_i64 : i64 -> !pto.ptr<f32, ub>
              %44 = pto.addptr %43, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %42, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_8 = pto.vlds %40[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %45 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
              %result_9 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %46 = pto.vmul %result_8, %result_9, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %46, %37[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_10 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %47 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
              %result_11 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %48 = pto.vmul %result_10, %result_11, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %49 = pto.castptr %c33024_i64 : i64 -> !pto.ptr<f32, ub>
              %50 = pto.addptr %49, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %48, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_12 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_13 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %51 = pto.vadd %result_12, %result_13, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %50[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %52 = arith.index_cast %arg11 : i16 to index
                %53 = arith.muli %52, %c512 : index
                %54 = pto.addptr %39, %52 : <f32, ub> -> <f32, ub>
                %55 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %56 = arith.index_cast %arg12 : i16 to index
                  %57 = arith.index_cast %arg13 : index to i32
                  %mask_16, %scalar_out_17 = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                  %58 = arith.index_cast %scalar_out_17 : i32 to index
                  %59 = arith.addi %53, %56 : index
                  %60 = pto.addptr %19, %59 : <f32, ub> -> <f32, ub>
                  %result_18 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_19 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %61 = pto.vdup %result_19, %mask_16 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %62 = pto.vmul %result_18, %61, %mask_16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %63 = pto.addptr %36, %59 : <f32, ub> -> <f32, ub>
                  pto.vsts %62, %63[%c0], %mask_16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %58 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %52 = arith.index_cast %arg11 : i16 to index
                %53 = arith.muli %52, %c512 : index
                %54 = pto.addptr %43, %52 : <f32, ub> -> <f32, ub>
                %55 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %56 = arith.index_cast %arg12 : i16 to index
                  %57 = arith.index_cast %arg13 : index to i32
                  %mask_16, %scalar_out_17 = pto.plt_b32 %57 : i32 -> !pto.mask<b32>, i32
                  %58 = arith.index_cast %scalar_out_17 : i32 to index
                  %59 = arith.addi %53, %56 : index
                  %60 = pto.addptr %22, %59 : <f32, ub> -> <f32, ub>
                  %result_18 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %result_19 = pto.vlds %54[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %61 = pto.vdup %result_19, %mask_16 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %62 = pto.vmul %result_18, %61, %mask_16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  pto.vsts %62, %60[%c0], %mask_16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %58 : index
                }
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              scf.for %arg11 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
                %52 = arith.index_cast %arg11 : i16 to index
                %53 = arith.muli %52, %c512 : index
                %54 = scf.for %arg12 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg13 = %c512) -> (index)  : i16 {
                  %55 = arith.index_cast %arg12 : i16 to index
                  %56 = arith.index_cast %arg13 : index to i32
                  %mask_16, %scalar_out_17 = pto.plt_b32 %56 : i32 -> !pto.mask<b32>, i32
                  %57 = arith.index_cast %scalar_out_17 : i32 to index
                  %58 = arith.addi %53, %55 : index
                  %59 = pto.addptr %36, %58 : <f32, ub> -> <f32, ub>
                  %result_18 = pto.vlds %59[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %60 = pto.addptr %22, %58 : <f32, ub> -> <f32, ub>
                  %result_19 = pto.vlds %60[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                  %61 = pto.vadd %result_18, %result_19, %mask_16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                  %62 = pto.addptr %19, %58 : <f32, ub> -> <f32, ub>
                  pto.vsts %61, %62[%c0], %mask_16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                  scf.yield %57 : index
                }
              } {pto.tilelib.candidate = "template_tadd", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadd"}
              %result_14 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_14, %45[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_15 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_15, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          }
          %23 = pto.addptr %arg5, %6 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %23, %22, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
            %24 = pto.addptr %14, %c0 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.vsub %result, %result, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<f32, ub>
            %27 = pto.addptr %26, %c0 : <f32, ub> -> <f32, ub>
            pto.vsts %25, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_1 = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
            %result_2 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = pto.vadd %result_1, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %29, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_3 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_4 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %30 = pto.vsub %result_3, %result_4, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %30, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_5 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vexp %result_5, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %31, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %32 = pto.addptr %16, %c0 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %33 = pto.vadd %result_6, %result_7, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %33, %28[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg10 : i16 to index
              %36 = arith.muli %35, %c512 : index
              %37 = pto.addptr %22, %35 : <f32, ub> -> <f32, ub>
              %38 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %39 = arith.index_cast %arg11 : i16 to index
                %40 = arith.index_cast %arg12 : index to i32
                %mask_10, %scalar_out_11 = pto.plt_b32 %40 : i32 -> !pto.mask<b32>, i32
                %41 = arith.index_cast %scalar_out_11 : i32 to index
                %42 = arith.addi %36, %39 : index
                %43 = pto.addptr %19, %42 : <f32, ub> -> <f32, ub>
                %result_12 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_13 = pto.vlds %37[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vdup %result_13, %mask_10 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %45 = pto.vdiv %result_12, %44, %mask_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %45, %43[%c0], %mask_10 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %41 : index
              }
            } {pto.tilelib.candidate = "template_trowexpanddiv", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpanddiv"}
            %mask_8, %scalar_out_9 = pto.plt_b32 %c512_i32 : i32 -> !pto.mask<b32>, i32
            %34 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %35 = arith.index_cast %arg10 : i16 to index
              %36 = arith.muli %35, %c512 : index
              scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16  : i16 {
                %37 = arith.index_cast %arg11 : i16 to index
                %38 = arith.addi %36, %37 : index
                %39 = pto.addptr %19, %38 : <f32, ub> -> <f32, ub>
                %result_10 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %40 = pto.vcvt %result_10, %mask_8 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %41 = pto.addptr %34, %38 : <bf16, ub> -> <bf16, ub>
                pto.vsts %40, %41[%c0], %mask_8 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              }
            } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
        } else {
          pto.vecscope {
            %11 = pto.castptr %c65984_i64 : i64 -> !pto.ptr<f32, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b32 %18 : i32 -> !pto.mask<b32>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %21 = arith.addi %15, %17 : index
                %22 = pto.addptr %11, %21 : <f32, ub> -> <f32, ub>
                pto.vsts %20, %22[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %12 = pto.castptr %c33088_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b16 %18 : i32 -> !pto.mask<b16>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = pto.vdup %cst_0, %mask : bf16, !pto.mask<b16> -> !pto.vreg<128xbf16>
                %21 = arith.addi %15, %17 : index
                %22 = pto.addptr %12, %21 : <bf16, ub> -> <bf16, ub>
                pto.vsts %20, %22[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
            %13 = pto.castptr %c64_i64 : i64 -> !pto.ptr<bf16, ub>
            scf.for %arg10 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %14 = arith.index_cast %arg10 : i16 to index
              %15 = arith.muli %14, %c512 : index
              %16 = scf.for %arg11 = %c0_i16 to %c512_i16 step %c128_i16 iter_args(%arg12 = %c512) -> (index)  : i16 {
                %17 = arith.index_cast %arg11 : i16 to index
                %18 = arith.index_cast %arg12 : index to i32
                %mask, %scalar_out = pto.plt_b16 %18 : i32 -> !pto.mask<b16>, i32
                %19 = arith.index_cast %scalar_out : i32 to index
                %20 = arith.addi %15, %17 : index
                %21 = pto.addptr %12, %20 : <bf16, ub> -> <bf16, ub>
                %result = pto.vlds %21[%c0] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %22 = pto.addptr %13, %20 : <bf16, ub> -> <bf16, ub>
                pto.vsts %result, %22[%c0], %mask : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b16>
                scf.yield %19 : index
              }
            } {pto.tilelib.candidate = "template_tmov_basic", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
          }
        }
        %8 = arith.muli %7, %c64 : index
        %9 = pto.addptr %arg0, %8 : <f32, gm> -> <f32, gm>
        %10 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %5, %10, %c0_i64, %c16_i64, %c256_i64, %c0_i64, %c256_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        scf.for %arg10 = %c0 to %c16 step %c1 {
          %11 = arith.addi %6, %arg10 : index
          %12 = arith.divsi %11, %c8 : index
          %13 = arith.muli %12, %c128 : index
          %14 = arith.addi %13, %0 : index
          %15 = arith.muli %12, %c8 : index
          %16 = arith.subi %11, %15 : index
          %17 = arith.muli %16, %c512 : index
          %18 = arith.index_cast %arg10 : index to i64
          %19 = arith.muli %18, %c1024_i64 : i64
          %20 = arith.addi %19, %c64_i64 : i64
          %21 = pto.castptr %20 : i64 -> !pto.ptr<bf16, ub>
          %22 = arith.muli %14, %c4096 : index
          %23 = arith.addi %22, %17 : index
          %24 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
          %25 = pto.addptr %21, %c0 : <bf16, ub> -> <bf16, ub>
          %26 = pto.addptr %24, %c0 : <bf16, gm> -> <bf16, gm>
          pto.copy_ubuf_to_gm %25, %26, %c0_i64, %c1_i64, %c896_i64, %c0_i64, %c0_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
}

