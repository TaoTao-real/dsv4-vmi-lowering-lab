module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_c4_cache_write(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c24576_i64 = arith.constant 24576 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c8160 = arith.constant 8160 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i32 = arith.constant 128 : i32
      %c255_i16 = arith.constant 255 : i16
      %c64 = arith.constant 64 : index
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c16_i64 = arith.constant 16 : i64
      %c512_i64 = arith.constant 512 : i64
      %c2048 = arith.constant 2048 : index
      %c16_i32 = arith.constant 16 : i32
      %cst_2 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c16 : index
      %2 = arith.muli %0, %c2048 : index
      %3 = pto.addptr %arg0, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %3, %c0 : <f32, gm> -> <f32, gm>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %5, %6, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %7 = pto.alloc_tile addr = %c8192_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xbf16, valid=?x?>
      %8 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %14 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          %result = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %24, %c64 : index
          %result_7 = pto.vlds %4[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vcvt %result, %15 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %27 = pto.vcvt %result_7, %15 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %26, %14[%24], %16 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %27, %14[%25], %16 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %25 = arith.index_cast %arg7 : i16 to index
            %26 = arith.addi %24, %25 : index
            %27 = pto.addptr %14, %26 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %27[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %28 = pto.vcvt %result, %17 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %29 = pto.addptr %4, %26 : <f32, ub> -> <f32, ub>
            pto.vsts %28, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          %25 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %26 = arith.index_cast %arg7 : i16 to index
            %27 = arith.index_cast %arg8 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
            %28 = arith.index_cast %scalar_out_8 : i32 to index
            %29 = arith.addi %24, %26 : index
            %30 = pto.addptr %4, %29 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vabs %result, %mask_7 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.addptr %8, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %28 : index
          }
        } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %18 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        %19 = pto.vdup %cst_2, %15 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.pand %18, %mask_3, %15 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c128 : index
          %result = pto.vlds %8[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %24, %c64 : index
          %result_7 = pto.vlds %8[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = pto.vmax %result, %result_7, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %27 = pto.vcmax %26, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmax %27, %19, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %28, %9[%23], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %21, %22[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %11 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %14 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.vmax %result, %result_3, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pand %14, %mask, %15 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %16, %8[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %18 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.addptr %11, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %18, %19[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %12 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %11[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.vdiv %result, %result_3, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pand %16, %mask, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %15, %8[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %18 = pto.vdup %cst_1, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %19 = pto.vdiv %18, %result_4, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %19, %11[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %13 = pto.alloc_tile addr = %c16384_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c128 : index
          %22 = pto.addptr %8, %20 : <f32, ub> -> <f32, ub>
          %23 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %24 = arith.index_cast %arg7 : i16 to index
            %25 = arith.index_cast %arg8 : index to i32
            %mask_5, %scalar_out_6 = pto.plt_b32 %25 : i32 -> !pto.mask<b32>, i32
            %26 = arith.index_cast %scalar_out_6 : i32 to index
            %27 = arith.addi %21, %24 : index
            %28 = pto.addptr %4, %27 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %29 = pto.vdup %result_7, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.vmul %result, %29, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %30, %28[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %26 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.addi %21, %22 : index
            %24 = pto.addptr %4, %23 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %26 = pto.addptr %14, %23 : <i32, ub> -> <i32, ub>
            pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %15 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
        %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.addi %21, %22 : index
            %24 = pto.addptr %14, %23 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %25 = pto.vcvt %result, %15 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %25, %15 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %27 = pto.addptr %16, %23 : <f16, ub> -> <f16, ub>
            pto.vsts %26, %27[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %17 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %18 = pto.vdup %c255_i16, %17 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %20 = arith.index_cast %arg6 : i16 to index
          %21 = arith.muli %20, %c128 : index
          %22 = pto.addptr %16, %21 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %22[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %23 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %24 = pto.vand %23, %18, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %25 = pto.vcvt %24, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %26 = pto.vcvt %25, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %27 = pto.addptr %19, %21 : <i8, ub> -> <i8, ub>
          pto.vsts %26, %27[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %14 = arith.addi %1, %arg6 : index
        %15 = pto.load_scalar %arg2[%14] : !pto.ptr<i32, gm> -> i32
        %16 = arith.index_cast %15 : i32 to index
        %17 = arith.cmpi sge, %16, %c0 : index
        scf.if %17 {
          %18 = arith.index_cast %arg6 : index to i64
          %19 = arith.muli %18, %c128_i64 : i64
          %20 = pto.castptr %19 : i64 -> !pto.ptr<i8, ub>
          %21 = arith.muli %16, %c128 : index
          %22 = pto.addptr %arg1, %21 : <i8, gm> -> <i8, gm>
          %23 = pto.addptr %20, %c0 : <i8, ub> -> <i8, ub>
          %24 = pto.addptr %22, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %23, %24, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %25 = pto.tgetval ins(%13, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          pto.store_scalar %25, %arg3[%16] : !pto.ptr<f32, gm>, f32
        } else {
          %18 = arith.addi %14, %c8160 : index
          %19 = arith.muli %18, %c128 : index
          %20 = pto.addptr %arg1, %19 : <i8, gm> -> <i8, gm>
          %21 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i8, ub>
          %22 = pto.addptr %20, %c0 : <i8, gm> -> <i8, gm>
          %23 = pto.addptr %21, %c0 : <i8, ub> -> <i8, ub>
          pto.copy_gm_to_ubuf %22, %23, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, gm>, !pto.ptr<i8, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.copy_ubuf_to_gm %23, %22, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %24 = pto.load_scalar %arg3[%18] : !pto.ptr<f32, gm> -> f32
          pto.store_scalar %24, %arg3[%18] : !pto.ptr<f32, gm>, f32
        }
      }
      return
    }
  }
}

