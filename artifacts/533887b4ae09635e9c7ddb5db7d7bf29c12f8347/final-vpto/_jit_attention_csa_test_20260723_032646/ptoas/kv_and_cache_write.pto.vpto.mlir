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
      %3 = pto.alloc_tile addr = %c16448_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xbf16, valid=?x?>
      %4 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      pto.vecscope {
        %11 = pto.castptr %c16448_i64 : i64 -> !pto.ptr<bf16, ub>
        %12 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          %result = pto.vlds %0[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = arith.addi %20, %c64 : index
          %result_7 = pto.vlds %0[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vcvt %result, %12 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %23 = pto.vcvt %result_7, %12 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %22, %11[%20], %13 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %23, %11[%21], %13 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %21 = arith.index_cast %arg7 : i16 to index
            %22 = arith.addi %20, %21 : index
            %23 = pto.addptr %11, %22 : <bf16, ub> -> <bf16, ub>
            %result = pto.vlds %23[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %24 = pto.vcvt %result, %14 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %25 = pto.addptr %0, %22 : <f32, ub> -> <f32, ub>
            pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          %21 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %22 = arith.index_cast %arg7 : i16 to index
            %23 = arith.index_cast %arg8 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %23 : i32 -> !pto.mask<b32>, i32
            %24 = arith.index_cast %scalar_out_8 : i32 to index
            %25 = arith.addi %20, %22 : index
            %26 = pto.addptr %0, %25 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = pto.vabs %result, %mask_7 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %28 = pto.addptr %4, %25 : <f32, ub> -> <f32, ub>
            pto.vsts %27, %28[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %24 : index
          }
        } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %15 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        %16 = pto.vdup %cst_2, %12 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
        %17 = pto.pand %15, %mask_3, %12 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          %result = pto.vlds %4[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = arith.addi %20, %c64 : index
          %result_7 = pto.vlds %4[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmax %result, %result_7, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.vcmax %22, %13 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %24 = pto.vmax %23, %16, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %24, %5[%19], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %18, %6[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %7 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      %8 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %11 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %12 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %13 = pto.vmax %result, %result_3, %12 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pand %11, %mask, %12 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %13, %4[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %15 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %15, %16[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %9 = pto.alloc_tile addr = %c16448_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %11 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %12 = pto.vdiv %result, %result_3, %11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %13 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.pand %13, %mask, %11 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %12, %4[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.vdup %cst_1, %11 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vdiv %15, %result_4, %11 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %16, %8[%c0], %14 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          %19 = pto.addptr %4, %17 : <f32, ub> -> <f32, ub>
          %20 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %21 = arith.index_cast %arg7 : i16 to index
            %22 = arith.index_cast %arg8 : index to i32
            %mask_5, %scalar_out_6 = pto.plt_b32 %22 : i32 -> !pto.mask<b32>, i32
            %23 = arith.index_cast %scalar_out_6 : i32 to index
            %24 = arith.addi %18, %21 : index
            %25 = pto.addptr %0, %24 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vdup %result_7, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmul %result, %26, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %27, %25[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %23 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %11 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %19 = arith.index_cast %arg7 : i16 to index
            %20 = arith.addi %18, %19 : index
            %21 = pto.addptr %0, %20 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %22 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %23 = pto.addptr %11, %20 : <i32, ub> -> <i32, ub>
            pto.vsts %22, %23[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %12 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
        %13 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %19 = arith.index_cast %arg7 : i16 to index
            %20 = arith.addi %18, %19 : index
            %21 = pto.addptr %11, %20 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %21[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %22 = pto.vcvt %result, %12 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %23 = pto.vcvt %22, %12 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %24 = pto.addptr %13, %20 : <f16, ub> -> <f16, ub>
            pto.vsts %23, %24[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %14 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %15 = pto.vdup %c255_i16, %14 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %16 = pto.castptr %c8256_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %17 = arith.index_cast %arg6 : i16 to index
          %18 = arith.muli %17, %c128 : index
          %19 = pto.addptr %13, %18 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %19[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %20 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %21 = pto.vand %20, %15, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %22 = pto.vcvt %21, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %23 = pto.vcvt %22, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %24 = pto.addptr %16, %18 : <i8, ub> -> <i8, ub>
          pto.vsts %23, %24[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg6 = %c0 to %c4 step %c1 {
        %11 = arith.muli %arg6, %c2 : index
        %12 = pto.load_scalar %arg3[%11] : !pto.ptr<i32, gm> -> i32
        %13 = arith.index_cast %12 : i32 to index
        %14 = arith.remsi %13, %c4 : index
        %15 = arith.cmpi sge, %14, %c2 : index
        scf.if %15 {
          %16 = arith.subi %c3, %14 : index
          %17 = arith.muli %arg6, %c128 : index
          %18 = pto.addptr %arg0, %17 : <f32, gm> -> <f32, gm>
          %19 = pto.addptr %18, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %19, %6, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %20 = arith.addi %11, %16 : index
          %21 = pto.load_scalar %arg4[%20] : !pto.ptr<i64, gm> -> i64
          %22 = arith.index_cast %21 : i64 to index
          %23 = arith.cmpi sge, %22, %c0 : index
          scf.if %23 {
            %24 = arith.muli %arg6, %c256 : index
            %25 = pto.addptr %arg2, %24 : <f32, gm> -> <f32, gm>
            %26 = pto.addptr %25, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %6, %26, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %27 = arith.index_cast %arg6 : index to i64
            %28 = arith.muli %27, %c128_i64 : i64
            %29 = arith.addi %28, %c8256_i64 : i64
            %30 = pto.castptr %29 : i64 -> !pto.ptr<i8, ub>
            %31 = arith.muli %22, %c128 : index
            %32 = pto.addptr %arg1, %31 : <i8, gm> -> <i8, gm>
            %33 = pto.addptr %30, %c0 : <i8, ub> -> <i8, ub>
            %34 = pto.addptr %32, %c0 : <i8, gm> -> <i8, gm>
            pto.copy_ubuf_to_gm %33, %34, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
            %35 = pto.tgetval ins(%10, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
            pto.store_scalar %35, %arg5[%22] : !pto.ptr<f32, gm>, f32
          }
        }
      }
      return
    }
  }
}

