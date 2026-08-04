module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @kv_and_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<i64, gm>, %arg5: !pto.ptr<f32, gm>) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c8256_i64 = arith.constant 8256 : i64
      %c16448_i64 = arith.constant 16448 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16 = arith.constant 16 : index
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %c2 = arith.constant 2 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c3 = arith.constant 3 : index
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c128_i32 = arith.constant 128 : i32
      %c255_i16 = arith.constant 255 : i16
      %c64 = arith.constant 64 : index
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c16_i32 = arith.constant 16 : i32
      %c256 = arith.constant 256 : index
      %cst_2 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %0 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f32, ub>
      %1 = pto.addptr %arg0, %c0 : <f32, gm> -> <f32, gm>
      %2 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %1, %2, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %3 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %10 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %11 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %12 = arith.index_cast %arg6 : i16 to index
          %13 = arith.muli %12, %c128 : index
          %result = pto.vlds %0[%13] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %14 = arith.addi %13, %c64 : index
          %result_3 = pto.vlds %0[%14] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %15 = pto.vcvt %result, %10 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %16 = pto.vcvt %result_3, %10 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %15, %3[%13], %11 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %16, %3[%14], %11 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %4 = pto.alloc_tile addr = %c8256_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      %5 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %10 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %25 = arith.index_cast %arg7 : i16 to index
            %26 = arith.addi %24, %25 : index
            %27 = pto.addptr %3, %26 : <bf16, ub> -> <bf16, ub>
            %result_8 = pto.vlds %27[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %28 = pto.vcvt %result_8, %10 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %29 = pto.addptr %0, %26 : <f32, ub> -> <f32, ub>
            pto.vsts %28, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          %25 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %26 = arith.index_cast %arg7 : i16 to index
            %27 = arith.index_cast %arg8 : index to i32
            %mask_8, %scalar_out_9 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
            %28 = arith.index_cast %scalar_out_9 : i32 to index
            %29 = arith.addi %24, %26 : index
            %30 = pto.addptr %0, %29 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vabs %result_10, %mask_8 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.addptr %5, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %28 : index
          }
        } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %11 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.vdup %cst_2, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.pand %13, %mask_3, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          %result_8 = pto.vlds %5[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %24, %c64 : index
          %result_9 = pto.vlds %5[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vmax %result_8, %result_9, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vcmax %26, %12 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmax %27, %15, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %11[%23], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %17, %6[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %19 = pto.vmax %result, %result_7, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.pand %18, %mask_5, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %19, %5[%c0], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %21 = pto.vdup %cst_0, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %21, %22[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %10 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %11 = pto.vdiv %result, %result_3, %10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %12 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.pand %12, %mask, %10 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %11, %5[%c0], %13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %14 = pto.vdup %cst_1, %10 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.vdiv %14, %result_4, %10 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %15, %7[%c0], %13 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg6 : i16 to index
          %17 = arith.muli %16, %c128 : index
          %18 = pto.addptr %5, %16 : <f32, ub> -> <f32, ub>
          %19 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %20 = arith.index_cast %arg7 : i16 to index
            %21 = arith.index_cast %arg8 : index to i32
            %mask_5, %scalar_out_6 = pto.plt_b32 %21 : i32 -> !pto.mask<b32>, i32
            %22 = arith.index_cast %scalar_out_6 : i32 to index
            %23 = arith.addi %17, %20 : index
            %24 = pto.addptr %0, %23 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.vdup %result_7, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.vmul %result, %25, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %26, %24[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %22 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %10 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg6 : i16 to index
          %17 = arith.muli %16, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %18 = arith.index_cast %arg7 : i16 to index
            %19 = arith.addi %17, %18 : index
            %20 = pto.addptr %0, %19 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %21 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %22 = pto.addptr %10, %19 : <i32, ub> -> <i32, ub>
            pto.vsts %21, %22[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %11 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
        %12 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg6 : i16 to index
          %17 = arith.muli %16, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %18 = arith.index_cast %arg7 : i16 to index
            %19 = arith.addi %17, %18 : index
            %20 = pto.addptr %10, %19 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %20[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %21 = pto.vcvt %result, %11 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %22 = pto.vcvt %21, %11 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %23 = pto.addptr %12, %19 : <f16, ub> -> <f16, ub>
            pto.vsts %22, %23[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %13 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %14 = pto.vdup %c255_i16, %13 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %15 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %16 = arith.index_cast %arg6 : i16 to index
          %17 = arith.muli %16, %c128 : index
          %18 = pto.addptr %12, %17 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %18[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %19 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %20 = pto.vand %19, %14, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %21 = pto.vcvt %20, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %22 = pto.vcvt %21, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %23 = pto.addptr %15, %17 : <i8, ub> -> <i8, ub>
          pto.vsts %22, %23[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %10 = arith.muli %arg6, %c2 : index
        %11 = pto.load_scalar %arg3[%10] : !pto.ptr<i32, gm> -> i32
        %12 = arith.index_cast %11 : i32 to index
        %13 = arith.remsi %12, %c4 : index
        %14 = arith.cmpi sge, %13, %c2 : index
        scf.if %14 {
          %15 = arith.subi %c3, %13 : index
          %16 = arith.muli %arg6, %c128 : index
          %17 = pto.addptr %arg0, %16 : <f32, gm> -> <f32, gm>
          %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %18, %6, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %19 = arith.addi %10, %15 : index
          %20 = pto.load_scalar %arg4[%19] : !pto.ptr<i64, gm> -> i64
          %21 = arith.index_cast %20 : i64 to index
          %22 = arith.cmpi sge, %21, %c0 : index
          scf.if %22 {
            %23 = arith.muli %arg6, %c256 : index
            %24 = pto.addptr %arg2, %23 : <f32, gm> -> <f32, gm>
            %25 = pto.addptr %24, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %6, %25, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %26 = arith.index_cast %arg6 : index to i64
            %27 = arith.muli %26, %c128_i64 : i64
            %28 = arith.addi %27, %c8256_i64 : i64
            %29 = pto.castptr %28 : i64 -> !pto.ptr<i8, ub>
            %30 = arith.muli %21, %c128 : index
            %31 = pto.addptr %arg1, %30 : <i8, gm> -> <i8, gm>
            %32 = pto.addptr %29, %c0 : <i8, ub> -> <i8, ub>
            %33 = pto.addptr %31, %c0 : <i8, gm> -> <i8, gm>
            pto.copy_ubuf_to_gm %32, %33, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
            %34 = pto.tgetval ins(%9, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
            pto.store_scalar %34, %arg5[%21] : !pto.ptr<f32, gm>, f32
          }
        }
      }
      return
    }
  }
}
