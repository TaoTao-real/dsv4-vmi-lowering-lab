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
        %30 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %31 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %32 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %30, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %4 = arith.muli %0, %c8192 : index
      %5 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<bf16, ub>
      %8 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, ub>
      %11 = pto.castptr %c512_i64 : i64 -> !pto.ptr<f32, ub>
      %12 = pto.castptr %c16896_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.castptr %c8704_i64 : i64 -> !pto.ptr<f32, ub>
      %14 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c33312_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg8 = %c0 to %c4 step %c2 {
        %30 = arith.muli %arg8, %c256 : index
        %31 = arith.addi %30, %c256 : index
        %32 = arith.addi %4, %30 : index
        %33 = pto.addptr %arg0, %32 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %35 = pto.addptr %arg1, %30 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %35, %7, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %36 = arith.addi %4, %31 : index
        %37 = pto.addptr %arg0, %36 : <f32, gm> -> <f32, gm>
        %38 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %38, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %39 = pto.addptr %arg1, %31 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %39, %10, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %40 = pto.alloc_tile addr = %c512_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = arith.muli %51, %c256 : index
            %result = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %52, %c64 : index
            %result_6 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %52, %c128 : index
            %result_7 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = arith.addi %52, %c192 : index
            %result_8 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result, %result, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_6, %result_6, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_7, %result_7, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_8, %result_8, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %11[%52], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %11[%53], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %11[%54], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %11[%55], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %48 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %49 = pto.vdup %cst, %47 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pand %48, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = arith.muli %51, %c256 : index
            %result = pto.vlds %11[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %52, %c64 : index
            %result_6 = pto.vlds %11[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %52, %c128 : index
            %result_7 = pto.vlds %11[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = arith.addi %52, %c192 : index
            %result_8 = pto.vlds %11[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %57, %result_8, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vcadd %58, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %59, %49, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %60, %12[%51], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %41 = pto.alloc_tile addr = %c8704_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %46 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %48 = pto.vadd %result, %result_6, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %49 = pto.pand %46, %mask, %47 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %48, %13[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_7, %scalar_out_8 = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = pto.addptr %7, %51 : <bf16, ub> -> <bf16, ub>
            %result_9 = pto.vlds %52[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %53 = pto.vcvt %result_9, %50 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %54 = pto.addptr %11, %51 : <f32, ub> -> <f32, ub>
            pto.vsts %53, %54[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        %42 = pto.alloc_tile addr = %c33408_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %11[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %11[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %11[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = arith.muli %51, %c256 : index
            %result_9 = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %52, %c64 : index
            %result_10 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %52, %c128 : index
            %result_11 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = arith.addi %52, %c192 : index
            %result_12 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_9, %result, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_10, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_11, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_12, %result_8, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %5[%52], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %5[%53], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %5[%54], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %5[%55], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = arith.muli %51, %c256 : index
            %53 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %54 = arith.index_cast %arg10 : i16 to index
              %55 = arith.index_cast %arg11 : index to i32
              %mask_9, %scalar_out_10 = pto.plt_b32 %55 : i32 -> !pto.mask<b32>, i32
              %56 = arith.index_cast %scalar_out_10 : i32 to index
              %57 = arith.addi %52, %54 : index
              %58 = pto.addptr %5, %57 : <f32, ub> -> <f32, ub>
              %result_11 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vabs %result_11, %mask_9 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %59, %58[%c0], %mask_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %56 : index
            }
          } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
          %48 = pto.vdup %cst_5, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pand %49, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %51 = arith.index_cast %arg9 : i16 to index
            %52 = arith.muli %51, %c256 : index
            %result_9 = pto.vlds %5[%52] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %53 = arith.addi %52, %c64 : index
            %result_10 = pto.vlds %5[%53] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %54 = arith.addi %52, %c128 : index
            %result_11 = pto.vlds %5[%54] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = arith.addi %52, %c192 : index
            %result_12 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = pto.vmax %result_9, %result_10, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmax %56, %result_11, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmax %57, %result_12, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vcmax %58, %47 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vmax %59, %48, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %60, %12[%51], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        }
        %43 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %12[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.vmax %result, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %49 = pto.pand %48, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %47, %5[%c0], %49 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %44 = pto.alloc_tile addr = %c16928_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %56 = arith.muli %55, %c256 : index
            %result_11 = pto.vlds %8[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %56, %c64 : index
            %result_12 = pto.vlds %8[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %56, %c128 : index
            %result_13 = pto.vlds %8[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = arith.addi %56, %c192 : index
            %result_14 = pto.vlds %8[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vmul %result_11, %result_11, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %result_12, %result_12, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %result_13, %result_13, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmul %result_14, %result_14, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %60, %14[%56], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %14[%57], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %14[%58], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %63, %14[%59], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %48 = pto.vdup %cst, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pand %49, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %56 = arith.muli %55, %c256 : index
            %result_11 = pto.vlds %14[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %56, %c64 : index
            %result_12 = pto.vlds %14[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %56, %c128 : index
            %result_13 = pto.vlds %14[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = arith.addi %56, %c192 : index
            %result_14 = pto.vlds %14[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_11, %result_12, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %60, %result_13, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %61, %result_14, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vcadd %62, %47 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %64 = pto.vadd %63, %48, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %64, %15[%55], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vadd %result, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_7, %scalar_out_8 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %53 = pto.pand %52, %mask_7, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %51, %2[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %mask_9, %scalar_out_10 = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %54 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %55 = arith.index_cast %arg9 : i16 to index
            %56 = pto.addptr %10, %55 : <bf16, ub> -> <bf16, ub>
            %result_11 = pto.vlds %56[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %57 = pto.vcvt %result_11, %54 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %58 = pto.addptr %14, %55 : <f32, ub> -> <f32, ub>
            pto.vsts %57, %58[%c0], %mask_9 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        %45 = pto.alloc_tile addr = %c42112_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %14[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %14[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %14[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %46 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result_13 = pto.vlds %8[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = arith.addi %55, %c64 : index
            %result_14 = pto.vlds %8[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %55, %c128 : index
            %result_15 = pto.vlds %8[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %55, %c192 : index
            %result_16 = pto.vlds %8[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_13, %result, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vmul %result_14, %result_6, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %result_15, %result_7, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %result_16, %result_8, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %8[%55], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %8[%56], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %8[%57], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %8[%58], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %56 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %57 = arith.index_cast %arg10 : i16 to index
              %58 = arith.index_cast %arg11 : index to i32
              %mask_13, %scalar_out_14 = pto.plt_b32 %58 : i32 -> !pto.mask<b32>, i32
              %59 = arith.index_cast %scalar_out_14 : i32 to index
              %60 = arith.addi %55, %57 : index
              %61 = pto.addptr %8, %60 : <f32, ub> -> <f32, ub>
              %result_15 = pto.vlds %61[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %62 = pto.vabs %result_15, %mask_13 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %62, %61[%c0], %mask_13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %59 : index
            }
          } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
          %48 = pto.vdup %cst_5, %46 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %50 = pto.pand %49, %mask, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result_13 = pto.vlds %8[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = arith.addi %55, %c64 : index
            %result_14 = pto.vlds %8[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %55, %c128 : index
            %result_15 = pto.vlds %8[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %55, %c192 : index
            %result_16 = pto.vlds %8[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmax %result_13, %result_14, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vmax %59, %result_15, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmax %60, %result_16, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vcmax %61, %47 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %63 = pto.vmax %62, %48, %49 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %63, %15[%54], %50 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
          %result_9 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_10 = pto.vlds %15[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %51 = pto.vmax %result_9, %result_10, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_11, %scalar_out_12 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %53 = pto.pand %52, %mask_11, %46 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %51, %3[%c0], %53 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %16 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %30 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %31 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %32 = pto.vdup %cst_0, %31 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %33 = pto.vmul %result, %32, %31 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.pand %30, %mask, %31 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %33, %5[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %17 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %18 = pto.castptr %c41600_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vdup %cst_1, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.vadd %result, %31, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %33 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %34 = pto.pand %33, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %32, %5[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_6 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %35 = pto.vsqrt %result_6, %30 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %36 = pto.vdup %cst_4, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %37 = pto.vdiv %36, %35, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %37, %18[%c0], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %38 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %38, %6[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %19 = pto.alloc_tile addr = %c42112_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vmul %result, %result_6, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pand %32, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %31, %8[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %20 = pto.alloc_tile addr = %c33408_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vmax %result, %result_6, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pand %32, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %31, %5[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %34 = pto.vdup %cst_3, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %34, %9[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %21 = pto.alloc_tile addr = %c0_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %30 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %31 = pto.vdiv %result, %result_6, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %32 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %33 = pto.pand %32, %mask, %30 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %31, %22[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_7 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %34 = pto.vdup %cst_4, %30 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %35 = pto.vdiv %34, %result_7, %30 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %35, %5[%c0], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %23 = pto.addptr %arg2, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %5, %23, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %24 = pto.castptr %c16928_i64 : i64 -> !pto.ptr<bf16, ub>
      %25 = pto.castptr %c25120_i64 : i64 -> !pto.ptr<bf16, ub>
      %26 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i8, ub>
      %27 = pto.addptr %26, %c0 : <i8, ub> -> <i8, ub>
      %28 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i8, ub>
      %29 = pto.addptr %28, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg8 = %c0 to %c1024 step %c512 {
        %30 = arith.addi %4, %arg8 : index
        %31 = pto.addptr %arg0, %30 : <f32, gm> -> <f32, gm>
        %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %32, %6, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %33 = pto.addptr %arg1, %arg8 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %33, %24, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %34 = arith.addi %arg8, %c256 : index
        %35 = arith.addi %4, %34 : index
        %36 = pto.addptr %arg0, %35 : <f32, gm> -> <f32, gm>
        %37 = pto.addptr %36, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %37, %9, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4096_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %38 = pto.addptr %arg1, %34 : <bf16, gm> -> <bf16, gm>
        pto.copy_gm_to_ubuf %38, %25, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2_i64, %c512_i64 : !pto.ptr<bf16, gm>, !pto.ptr<bf16, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %48 = arith.index_cast %arg9 : i16 to index
            %49 = pto.addptr %24, %48 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %49[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %50 = pto.vcvt %result, %47 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %51 = pto.addptr %11, %48 : <f32, ub> -> <f32, ub>
            pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %48 = arith.index_cast %arg9 : i16 to index
            %49 = arith.muli %48, %c256 : index
            %50 = pto.addptr %18, %48 : <f32, ub> -> <f32, ub>
            %51 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %52 = arith.index_cast %arg10 : i16 to index
              %53 = arith.index_cast %arg11 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %53 : i32 -> !pto.mask<b32>, i32
              %54 = arith.index_cast %scalar_out_7 : i32 to index
              %55 = arith.addi %49, %52 : index
              %56 = pto.addptr %5, %55 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.vdup %result_8, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vmul %result, %57, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %56[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %54 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %39 = pto.alloc_tile addr = %c33408_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %47 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %11[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %11[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %11[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %48 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result_13 = pto.vlds %5[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = arith.addi %55, %c64 : index
            %result_14 = pto.vlds %5[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %55, %c128 : index
            %result_15 = pto.vlds %5[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %55, %c192 : index
            %result_16 = pto.vlds %5[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_13, %result, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vmul %result_14, %result_6, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %result_15, %result_7, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %result_16, %result_8, %48 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %5[%55], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %5[%56], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %5[%57], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %5[%58], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %56 = pto.addptr %22, %54 : <f32, ub> -> <f32, ub>
            %57 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %58 = arith.index_cast %arg10 : i16 to index
              %59 = arith.index_cast %arg11 : index to i32
              %mask_13, %scalar_out_14 = pto.plt_b32 %59 : i32 -> !pto.mask<b32>, i32
              %60 = arith.index_cast %scalar_out_14 : i32 to index
              %61 = arith.addi %55, %58 : index
              %62 = pto.addptr %5, %61 : <f32, ub> -> <f32, ub>
              %result_15 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = pto.vdup %result_16, %mask_13 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result_15, %63, %mask_13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %62[%c0], %mask_13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %60 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %49 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<i32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %5, %57 : <f32, ub> -> <f32, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vcvt %result_13, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %60 = pto.addptr %49, %57 : <i32, ub> -> <i32, ub>
              pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %50 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %51 = pto.castptr %c33408_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %49, %57 : <i32, ub> -> <i32, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %59 = pto.vcvt %result_13, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vcvt %59, %50 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %61 = pto.addptr %51, %57 : <f16, ub> -> <f16, ub>
              pto.vsts %60, %61[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %52 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %mask_9, %scalar_out_10 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_11, %scalar_out_12 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %53 = pto.vdup %c255_i16, %52 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %51, %57 : <f16, ub> -> <f16, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %59 = pto.vcvt %result_13, %mask_9 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %60 = pto.vand %59, %53, %mask_11 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %61 = pto.vcvt %60, %mask_9 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %62 = pto.vcvt %61, %mask_9 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %63 = pto.addptr %26, %57 : <i8, ub> -> <i8, ub>
              pto.vsts %62, %63[%c0], %mask_11 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %40 = pto.addptr %arg4, %30 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %26, %40, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %41 = pto.addptr %arg3, %30 : <i8, gm> -> <i8, gm>
        %42 = pto.addptr %41, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %27, %42, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %47 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
          scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %48 = arith.index_cast %arg9 : i16 to index
            %49 = pto.addptr %25, %48 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %49[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %50 = pto.vcvt %result, %47 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %51 = pto.addptr %13, %48 : <f32, ub> -> <f32, ub>
            pto.vsts %50, %51[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %48 = arith.index_cast %arg9 : i16 to index
            %49 = arith.muli %48, %c256 : index
            %50 = pto.addptr %18, %48 : <f32, ub> -> <f32, ub>
            %51 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %52 = arith.index_cast %arg10 : i16 to index
              %53 = arith.index_cast %arg11 : index to i32
              %mask_6, %scalar_out_7 = pto.plt_b32 %53 : i32 -> !pto.mask<b32>, i32
              %54 = arith.index_cast %scalar_out_7 : i32 to index
              %55 = arith.addi %49, %52 : index
              %56 = pto.addptr %8, %55 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_8 = pto.vlds %50[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %57 = pto.vdup %result_8, %mask_6 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %58 = pto.vmul %result, %57, %mask_6 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %58, %56[%c0], %mask_6 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %54 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %43 = pto.alloc_tile addr = %c42112_i64 valid_row = %c8 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x256xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %13[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_6 = pto.vlds %13[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_7 = pto.vlds %13[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_8 = pto.vlds %13[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %47 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %48 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %result_13 = pto.vlds %8[%55] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %56 = arith.addi %55, %c64 : index
            %result_14 = pto.vlds %8[%56] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %57 = arith.addi %55, %c128 : index
            %result_15 = pto.vlds %8[%57] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %58 = arith.addi %55, %c192 : index
            %result_16 = pto.vlds %8[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %59 = pto.vmul %result_13, %result, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vmul %result_14, %result_6, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vmul %result_15, %result_7, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vmul %result_16, %result_8, %47 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %8[%55], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %8[%56], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %8[%57], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %8[%58], %48 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            %56 = pto.addptr %22, %54 : <f32, ub> -> <f32, ub>
            %57 = scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg11 = %c256) -> (index)  : i16 {
              %58 = arith.index_cast %arg10 : i16 to index
              %59 = arith.index_cast %arg11 : index to i32
              %mask_13, %scalar_out_14 = pto.plt_b32 %59 : i32 -> !pto.mask<b32>, i32
              %60 = arith.index_cast %scalar_out_14 : i32 to index
              %61 = arith.addi %55, %58 : index
              %62 = pto.addptr %8, %61 : <f32, ub> -> <f32, ub>
              %result_15 = pto.vlds %62[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_16 = pto.vlds %56[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %63 = pto.vdup %result_16, %mask_13 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %64 = pto.vmul %result_15, %63, %mask_13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %64, %62[%c0], %mask_13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %60 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          %49 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<i32, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %8, %57 : <f32, ub> -> <f32, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %59 = pto.vcvt %result_13, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %60 = pto.addptr %49, %57 : <i32, ub> -> <i32, ub>
              pto.vsts %59, %60[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %50 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %51 = pto.castptr %c42112_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %49, %57 : <i32, ub> -> <i32, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %59 = pto.vcvt %result_13, %50 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %60 = pto.vcvt %59, %50 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %61 = pto.addptr %51, %57 : <f16, ub> -> <f16, ub>
              pto.vsts %60, %61[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %mask_9, %scalar_out_10 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_11, %scalar_out_12 = pto.plt_b16 %c256_i32 : i32 -> !pto.mask<b16>, i32
          %52 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %53 = pto.vdup %c255_i16, %52 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg9 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %54 = arith.index_cast %arg9 : i16 to index
            %55 = arith.muli %54, %c256 : index
            scf.for %arg10 = %c0_i16 to %c256_i16 step %c128_i16  : i16 {
              %56 = arith.index_cast %arg10 : i16 to index
              %57 = arith.addi %55, %56 : index
              %58 = pto.addptr %51, %57 : <f16, ub> -> <f16, ub>
              %result_13 = pto.vlds %58[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %59 = pto.vcvt %result_13, %mask_9 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %60 = pto.vand %59, %53, %mask_11 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %61 = pto.vcvt %60, %mask_9 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %62 = pto.vcvt %61, %mask_9 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %63 = pto.addptr %28, %57 : <i8, ub> -> <i8, ub>
              pto.vsts %62, %63[%c0], %mask_11 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            }
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %44 = pto.addptr %arg4, %35 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %28, %44, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        %45 = pto.addptr %arg3, %35 : <i8, gm> -> <i8, gm>
        %46 = pto.addptr %45, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %29, %46, %c0_i64, %c8_i64, %c256_i64, %c0_i64, %c1024_i64, %c256_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}

