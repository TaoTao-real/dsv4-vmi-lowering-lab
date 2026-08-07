module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_rms_norm_quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<bf16, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<i8, gm>, %arg5: index, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c33344_i64 = arith.constant 33344 : i64
      %c33376_i64 = arith.constant 33376 : i64
      %c33408_i64 = arith.constant 33408 : i64
      %c41600_i64 = arith.constant 41600 : i64
      %c42112_i64 = arith.constant 42112 : i64
      %c0_i64 = arith.constant 0 : i64
      %c512_i64 = arith.constant 512 : i64
      %c8704_i64 = arith.constant 8704 : i64
      %c16896_i64 = arith.constant 16896 : i64
      %c16928_i64 = arith.constant 16928 : i64
      %c25120_i64 = arith.constant 25120 : i64
      %c33312_i64 = arith.constant 33312 : i64
      %c128 = arith.constant 128 : index
      %c1024 = arith.constant 1024 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c256 = arith.constant 256 : index
      %cst_0 = arith.constant 9.765625E-4 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %cst_2 = arith.constant 9.99999974E-5 : f32
      %cst_3 = arith.constant 1.270000e+02 : f32
      %c512 = arith.constant 512 : index
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %c2_i64 = arith.constant 2 : i64
      %c8_i64 = arith.constant 8 : i64
      %c256_i64 = arith.constant 256 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c128_i32 = arith.constant 128 : i32
      %c256_i32 = arith.constant 256 : i32
      %c255_i16 = arith.constant 255 : i16
      %c64 = arith.constant 64 : index
      %c4096_i64 = arith.constant 4096 : i64
      %cst_4 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c8192 = arith.constant 8192 : index
      %c192 = arith.constant 192 : index
      %c1_i32 = arith.constant 1 : i32
      %cst_5 = arith.constant 0xFF800000 : f32
      %0 = arith.index_cast %arg6 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.castptr %c33344_i64 : i64 -> !pto.ptr<f32, ub>
      %3 = pto.castptr %c33376_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %23 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %24 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %22, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = arith.muli %0, %c8192 : index
      %5 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<bf16, ub>
      %8 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      scf.for %arg8 = %c0 to %c4 step %c2 {
        %22 = arith.muli %arg8, %c256 : index
        %23 = arith.addi %22, %c256 : index
        %24 = arith.addi %4, %22 : index
        %25 = pto.addptr %arg0, %24 : <f32, gm> -> <f32, gm>
        %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %26, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %27 = pto.addptr %arg1, %22 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %27, %7, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %28 = arith.addi %4, %23 : index
        %29 = pto.addptr %arg0, %28 : <f32, gm> -> <f32, gm>
        %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %30, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %31 = pto.addptr %arg1, %23 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %31, %10, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %32 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
          %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.castptr %c16896_i64 : i64 -> !pto.ptr<f32, ub>
          %35 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %36 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %37 = pto.vdup %cst, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %38 = pto.pand %35, %mask, %36 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_25, %result_25, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_26, %result_26, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_27, %result_27, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_28, %result_28, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %32[%51], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %32[%52], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %32[%53], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %32[%54], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %59 = pto.vadd %55, %56, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %57, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %60, %58, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vcadd %61, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vadd %62, %37, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %63, %34[%50], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %39 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.vadd %result, %result_6, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_7, %scalar_out_8 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %42 = pto.pand %40, %mask_7, %36 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %41, %39[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_9, %scalar_out_10 = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %43 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = pto.addptr %7, %50 : <bf16, ub> -> <bf16, ub>
            %result_25 = pto.vlds %51[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %52 = pto.vcvt %result_25, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %53 = pto.addptr %32, %50 : <f32, ub> -> <f32, ub>
            pto.vsts %52, %53[%c0], %mask_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %result_11 = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_12 = pto.vlds %32[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_13 = pto.vlds %32[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_14 = pto.vlds %32[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_25, %result_11, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_26, %result_12, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_27, %result_13, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_28, %result_14, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %5[%51], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %5[%52], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %5[%53], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %5[%54], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %52 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %53 = arith.index_cast %arg10 : i16 to index
              %54 = arith.index_cast %arg11 : index to i32
              %mask_25, %scalar_out_26 = pto.plt_b32 %54 : i32 -> !pto.mask<b32>, i32
              %55 = arith.index_cast %scalar_out_26 : i32 to index
              %56 = arith.addi %51, %53 : index
              %57 = pto.addptr %5, %56 : <f32, ub> -> <f32, ub>
              %result_27 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vabs %result_27, %mask_25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %57[%c0], %mask_25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %55 : index
            }
          } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
          %44 = pto.vdup %cst_5, %36 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmax %result_25, %result_26, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmax %55, %result_27, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmax %56, %result_28, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vcmax %57, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmax %58, %44, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %34[%50], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
          %result_15 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_16 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vmax %result_15, %result_16, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %45, %5[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %46 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<f32, ub>
          %47 = pto.castptr %c33312_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %8[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %8[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %8[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %8[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_25, %result_25, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_26, %result_26, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_27, %result_27, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_28, %result_28, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %46[%51], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %46[%52], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %46[%53], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %46[%54], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %59 = pto.vadd %55, %56, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %57, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %60, %58, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vcadd %61, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vadd %62, %37, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %63, %47[%50], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result_17 = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_18 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.vadd %result_17, %result_18, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %48, %2[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = pto.addptr %10, %50 : <bf16, ub> -> <bf16, ub>
            %result_25 = pto.vlds %51[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %52 = pto.vcvt %result_25, %43 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %53 = pto.addptr %46, %50 : <f32, ub> -> <f32, ub>
            pto.vsts %52, %53[%c0], %mask_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          %result_19 = pto.vlds %46[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_20 = pto.vlds %46[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_21 = pto.vlds %46[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_22 = pto.vlds %46[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %8[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %8[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %8[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %8[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_25, %result_19, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_26, %result_20, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_27, %result_21, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_28, %result_22, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %8[%51], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %8[%52], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %8[%53], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %8[%54], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %52 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %53 = arith.index_cast %arg10 : i16 to index
              %54 = arith.index_cast %arg11 : index to i32
              %mask_25, %scalar_out_26 = pto.plt_b32 %54 : i32 -> !pto.mask<b32>, i32
              %55 = arith.index_cast %scalar_out_26 : i32 to index
              %56 = arith.addi %51, %53 : index
              %57 = pto.addptr %8, %56 : <f32, ub> -> <f32, ub>
              %result_27 = pto.vlds %57[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %58 = pto.vabs %result_27, %mask_25 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %57[%c0], %mask_25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %55 : index
            }
          } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %50 = arith.index_cast %arg9 : i16 to index
            %51 = arith.muli %50, %c256 : index
            %result_25 = pto.vlds %8[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = arith.addi %51, %c64 : index
            %result_26 = pto.vlds %8[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %51, %c128 : index
            %result_27 = pto.vlds %8[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %51, %c192 : index
            %result_28 = pto.vlds %8[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vmax %result_25, %result_26, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmax %55, %result_27, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmax %56, %result_28, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vcmax %57, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmax %58, %44, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %47[%50], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
          %result_23 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_24 = pto.vlds %47[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %49 = pto.vmax %result_23, %result_24, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %49, %3[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %22 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %24 = pto.vdup %cst_0, %23 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.vmul %result, %24, %23 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pand %22, %mask, %23 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %25, %5[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %11 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %12 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst_1, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.vadd %result, %23, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %26 = pto.pand %25, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %24, %5[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %27 = pto.vsqrt %result_6, %22 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %28 = pto.vdup %cst_4, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %29 = pto.vdiv %28, %27, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %29, %12[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %30 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %30, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.vmul %result_7, %result_8, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %31, %8[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_9 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %32 = pto.vmax %result_9, %31, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %32, %5[%c0], %26 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %33 = pto.vdup %cst_3, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %33, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %13 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdiv %result, %result_6, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.pand %24, %mask, %22 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %23, %14[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %26 = pto.vdup %cst_4, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.vdiv %26, %result_7, %22 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %27, %5[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %15 = pto.addptr %arg2, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %5, %15, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %16 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<bf16, ub>
      %17 = pto.castptr %c25120_i64 : i64 -> !pto.ptr<bf16, ub>
      %18 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i8, ub>
      %19 = pto.addptr %18, %c0 : <i8, ub> -> <i8, ub>
      %20 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i8, ub>
      %21 = pto.addptr %20, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg8 = %c0 to %c1024 step %c512 {
        %22 = arith.addi %4, %arg8 : index
        %23 = pto.addptr %arg0, %22 : <f32, gm> -> <f32, gm>
        %24 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %24, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %25 = pto.addptr %arg1, %arg8 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %25, %16, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = arith.addi %arg8, %c256 : index
        %27 = arith.addi %4, %26 : index
        %28 = pto.addptr %arg0, %27 : <f32, gm> -> <f32, gm>
        %29 = pto.addptr %28, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %29, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %30 = pto.addptr %arg1, %26 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %30, %17, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %39 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %40 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %41 = arith.index_cast %arg9 : i16 to index
            %42 = pto.addptr %16, %41 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %42[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %43 = pto.vcvt %result, %39 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %44 = pto.addptr %40, %41 : <f32, ub> -> <f32, ub>
            pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %41 = arith.index_cast %arg9 : i16 to index
            %42 = arith.muli %41, %c256 : index
            %43 = pto.addptr %12, %41 : <f32, ub> -> <f32, ub>
            %44 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg10 : i16 to index
              %46 = arith.index_cast %arg11 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out_7 : i32 to index
              %48 = arith.addi %42, %45 : index
              %49 = pto.addptr %5, %48 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vdup %result_8, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result, %50, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %49[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %31 = pto.alloc_tile addr = %c33408_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %39 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
          %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %39[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %39[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            %result_13 = pto.vlds %5[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = arith.addi %48, %c64 : index
            %result_14 = pto.vlds %5[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = arith.addi %48, %c128 : index
            %result_15 = pto.vlds %5[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = arith.addi %48, %c192 : index
            %result_16 = pto.vlds %5[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_13, %result, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_14, %result_6, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_15, %result_7, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_16, %result_8, %41 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %52, %5[%48], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %5[%49], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %5[%50], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %5[%51], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            %49 = pto.addptr %14, %47 : <f32, ub> -> <f32, ub>
            %50 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %51 = arith.index_cast %arg10 : i16 to index
              %52 = arith.index_cast %arg11 : index to i32
              %mask_13, %scalar_out_14 = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
              %53 = arith.index_cast %scalar_out_14 : i32 to index
              %54 = arith.addi %48, %51 : index
              %55 = pto.addptr %5, %54 : <f32, ub> -> <f32, ub>
              %result_15 = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vdup %result_16, %mask_13 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vmul %result_15, %56, %mask_13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %57, %55[%c0], %mask_13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %53 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %42 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %5, %50 : <f32, ub> -> <f32, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vcvt %result_13, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %53 = pto.addptr %42, %50 : <i32, ub> -> <i32, ub>
              pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %43 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %44 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %42, %50 : <i32, ub> -> <i32, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %52 = pto.vcvt %result_13, %43 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vcvt %52, %43 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %54 = pto.addptr %44, %50 : <f16, ub> -> <f16, ub>
              pto.vsts %53, %54[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %45 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %mask_9, %scalar_out_10 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_11, %scalar_out_12 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %46 = pto.vdup %c255_i16, %45 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %44, %50 : <f16, ub> -> <f16, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %52 = pto.vcvt %result_13, %mask_9 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %53 = pto.vand %52, %46, %mask_11 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %54 = pto.vcvt %53, %mask_9 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %55 = pto.vcvt %54, %mask_9 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %56 = pto.addptr %18, %50 : <i8, ub> -> <i8, ub>
              pto.vsts %55, %56[%c0], %mask_11 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %32 = pto.addptr %arg4, %22 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %18, %32, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %33 = pto.addptr %arg3, %22 : <i8, gm> -> <i8, gm>
        %34 = pto.addptr %33, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %19, %34, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %39 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          %40 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %41 = arith.index_cast %arg9 : i16 to index
            %42 = pto.addptr %17, %41 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %42[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %43 = pto.vcvt %result, %39 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %44 = pto.addptr %40, %41 : <f32, ub> -> <f32, ub>
            pto.vsts %43, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %41 = arith.index_cast %arg9 : i16 to index
            %42 = arith.muli %41, %c256 : index
            %43 = pto.addptr %12, %41 : <f32, ub> -> <f32, ub>
            %44 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %45 = arith.index_cast %arg10 : i16 to index
              %46 = arith.index_cast %arg11 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %46 : i32 -> !pto.mask<b32>, i32
              %47 = arith.index_cast %scalar_out_7 : i32 to index
              %48 = arith.addi %42, %45 : index
              %49 = pto.addptr %8, %48 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %43[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %50 = pto.vdup %result_8, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %51 = pto.vmul %result, %50, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %51, %49[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %47 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %35 = pto.alloc_tile addr = %c42112_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %39 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
          %result = pto.vlds %39[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %39[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %39[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %39[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %41 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            %result_13 = pto.vlds %8[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = arith.addi %48, %c64 : index
            %result_14 = pto.vlds %8[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = arith.addi %48, %c128 : index
            %result_15 = pto.vlds %8[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = arith.addi %48, %c192 : index
            %result_16 = pto.vlds %8[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_13, %result, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_14, %result_6, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_15, %result_7, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_16, %result_8, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %52, %8[%48], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %8[%49], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %8[%50], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %8[%51], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            %49 = pto.addptr %14, %47 : <f32, ub> -> <f32, ub>
            %50 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %51 = arith.index_cast %arg10 : i16 to index
              %52 = arith.index_cast %arg11 : index to i32
              %mask_13, %scalar_out_14 = pto.plt_b32 %52 : i32 -> !pto.mask<b32>, i32
              %53 = arith.index_cast %scalar_out_14 : i32 to index
              %54 = arith.addi %48, %51 : index
              %55 = pto.addptr %8, %54 : <f32, ub> -> <f32, ub>
              %result_15 = pto.vlds %55[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %49[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %56 = pto.vdup %result_16, %mask_13 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.vmul %result_15, %56, %mask_13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %57, %55[%c0], %mask_13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %53 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %42 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %8, %50 : <f32, ub> -> <f32, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %52 = pto.vcvt %result_13, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %53 = pto.addptr %42, %50 : <i32, ub> -> <i32, ub>
              pto.vsts %52, %53[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %43 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %44 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %42, %50 : <i32, ub> -> <i32, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %52 = pto.vcvt %result_13, %43 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %53 = pto.vcvt %52, %43 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %54 = pto.addptr %44, %50 : <f16, ub> -> <f16, ub>
              pto.vsts %53, %54[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %mask_9, %scalar_out_10 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_11, %scalar_out_12 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %45 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %46 = pto.vdup %c255_i16, %45 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %47 = arith.index_cast %arg9 : i16 to index
            %48 = arith.muli %47, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %49 = arith.index_cast %arg10 : i16 to index
              %50 = arith.addi %48, %49 : index
              %51 = pto.addptr %44, %50 : <f16, ub> -> <f16, ub>
              %result_13 = pto.vlds %51[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %52 = pto.vcvt %result_13, %mask_9 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %53 = pto.vand %52, %46, %mask_11 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %54 = pto.vcvt %53, %mask_9 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %55 = pto.vcvt %54, %mask_9 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %56 = pto.addptr %20, %50 : <i8, ub> -> <i8, ub>
              pto.vsts %55, %56[%c0], %mask_11 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %36 = pto.addptr %arg4, %27 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %20, %36, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %37 = pto.addptr %arg3, %27 : <i8, gm> -> <i8, gm>
        %38 = pto.addptr %37, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %21, %38, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
