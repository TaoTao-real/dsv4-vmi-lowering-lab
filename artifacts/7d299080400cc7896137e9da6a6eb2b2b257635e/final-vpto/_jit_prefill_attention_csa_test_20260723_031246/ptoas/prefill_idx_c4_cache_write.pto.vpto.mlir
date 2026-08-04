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
      %7 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %15 = arith.index_cast %arg6 : i16 to index
          %16 = arith.muli %15, %c128 : index
          %result = pto.vlds %4[%16] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %17 = arith.addi %16, %c64 : index
          %result_3 = pto.vlds %4[%17] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %18 = pto.vcvt %result, %13 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %19 = pto.vcvt %result_3, %13 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %18, %7[%16], %14 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %19, %7[%17], %14 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      %9 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.pset_b16 "PAT_ALL" : !pto.mask<b16>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %29 = arith.index_cast %arg7 : i16 to index
            %30 = arith.addi %28, %29 : index
            %31 = pto.addptr %7, %30 : <bf16, ub> -> <bf16, ub>
            %result_8 = pto.vlds %31[%c0] {dist = "UNPK_B16"} : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %32 = pto.vcvt %result_8, %13 {part = "EVEN"} : !pto.vreg<128xbf16>, !pto.mask<b16> -> !pto.vreg<64xf32>
            %33 = pto.addptr %4, %30 : <f32, ub> -> <f32, ub>
            pto.vsts %32, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_bf16_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c128 : index
          %29 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %30 = arith.index_cast %arg7 : i16 to index
            %31 = arith.index_cast %arg8 : index to i32
            %mask_8, %scalar_out_9 = pto.plt_b32 %31 : i32 -> !pto.mask<b32>, i32
            %32 = arith.index_cast %scalar_out_9 : i32 to index
            %33 = arith.addi %28, %30 : index
            %34 = pto.addptr %4, %33 : <f32, ub> -> <f32, ub>
            %result_10 = pto.vlds %34[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %35 = pto.vabs %result_10, %mask_8 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.addptr %9, %33 : <f32, ub> -> <f32, ub>
            pto.vsts %35, %36[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %32 : index
          }
        } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %14 = pto.castptr %c24576_i64 : i64 -> !pto.ptr<f32, ub>
        %15 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.vdup %cst_2, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pand %16, %mask_3, %17 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %27 = arith.index_cast %arg6 : i16 to index
          %28 = arith.muli %27, %c128 : index
          %result_8 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %28, %c64 : index
          %result_9 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = pto.vmax %result_8, %result_9, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vcmax %30, %15 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmax %31, %18, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %14[%27], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %mask_5, %scalar_out_6 = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %20 = pto.vdup %cst, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %20, %21[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %22 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %result = pto.vlds %14[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %23 = pto.vmax %result, %result_7, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %24 = pto.pand %22, %mask_5, %17 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %23, %9[%c0], %24 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %25 = pto.vdup %cst_0, %mask_5 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %26 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %25, %26[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %11 = pto.alloc_tile addr = %c8192_i64 valid_row = %c1 valid_col = %c16 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x16xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.vdiv %result, %result_3, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.pge_b32 "PAT_VL16" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c16_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.pand %15, %mask, %13 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %14, %9[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %17 = pto.vdup %cst_1, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.vdiv %17, %result_4, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %18, %10[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %12 = pto.alloc_tile addr = %c16384_i64 valid_row = %c16 valid_col = %c1 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>
      pto.vecscope {
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          %21 = pto.addptr %9, %19 : <f32, ub> -> <f32, ub>
          %22 = scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg8 = %c128) -> (index)  : i16 {
            %23 = arith.index_cast %arg7 : i16 to index
            %24 = arith.index_cast %arg8 : index to i32
            %mask_5, %scalar_out_6 = pto.plt_b32 %24 : i32 -> !pto.mask<b32>, i32
            %25 = arith.index_cast %scalar_out_6 : i32 to index
            %26 = arith.addi %20, %23 : index
            %27 = pto.addptr %4, %26 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %28 = pto.vdup %result_7, %mask_5 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %29 = pto.vmul %result, %28, %mask_5 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %29, %27[%c0], %mask_5 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %25 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %13 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %21 = arith.index_cast %arg7 : i16 to index
            %22 = arith.addi %20, %21 : index
            %23 = pto.addptr %4, %22 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %24 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %25 = pto.addptr %13, %22 : <i32, ub> -> <i32, ub>
            pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %14 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
        %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          scf.for %arg7 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %21 = arith.index_cast %arg7 : i16 to index
            %22 = arith.addi %20, %21 : index
            %23 = pto.addptr %13, %22 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %24 = pto.vcvt %result, %14 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %25 = pto.vcvt %24, %14 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %26 = pto.addptr %15, %22 : <f16, ub> -> <f16, ub>
            pto.vsts %25, %26[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %16 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %17 = pto.vdup %c255_i16, %16 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg6 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c128 : index
          %21 = pto.addptr %15, %20 : <f16, ub> -> <f16, ub>
          %result = pto.vlds %21[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
          %22 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %23 = pto.vand %22, %17, %mask_3 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
          %24 = pto.vcvt %23, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
          %25 = pto.vcvt %24, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
          %26 = pto.addptr %18, %20 : <i8, ub> -> <i8, ub>
          pto.vsts %25, %26[%c0], %mask_3 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      scf.for %arg6 = %c0 to %c16 step %c1 {
        %13 = arith.addi %1, %arg6 : index
        %14 = pto.load_scalar %arg2[%13] : !pto.ptr<i32, gm> -> i32
        %15 = arith.index_cast %14 : i32 to index
        %16 = arith.cmpi sge, %15, %c0 : index
        scf.if %16 {
          %17 = arith.index_cast %arg6 : index to i64
          %18 = arith.muli %17, %c128_i64 : i64
          %19 = pto.castptr %18 : i64 -> !pto.ptr<i8, ub>
          %20 = arith.muli %15, %c128 : index
          %21 = pto.addptr %arg1, %20 : <i8, gm> -> <i8, gm>
          %22 = pto.addptr %19, %c0 : <i8, ub> -> <i8, ub>
          %23 = pto.addptr %21, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %22, %23, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %24 = pto.tgetval ins(%12, %arg6 : !pto.tile_buf<vec, 16x1xf32, valid=?x?, blayout=col_major>, index) outs : f32
          pto.store_scalar %24, %arg3[%15] : !pto.ptr<f32, gm>, f32
        } else {
          %17 = arith.addi %13, %c8160 : index
          %18 = arith.muli %17, %c128 : index
          %19 = pto.addptr %arg1, %18 : <i8, gm> -> <i8, gm>
          %20 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<i8, ub>
          %21 = pto.addptr %19, %c0 : <i8, gm> -> <i8, gm>
          %22 = pto.addptr %20, %c0 : <i8, ub> -> <i8, ub>
          pto.copy_gm_to_ubuf %21, %22, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, gm>, !pto.ptr<i8, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          pto.copy_ubuf_to_gm %22, %21, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          %23 = pto.load_scalar %arg3[%17] : !pto.ptr<f32, gm> -> f32
          pto.store_scalar %23, %arg3[%17] : !pto.ptr<f32, gm>, f32
        }
      }
      return
    }
  }
}
