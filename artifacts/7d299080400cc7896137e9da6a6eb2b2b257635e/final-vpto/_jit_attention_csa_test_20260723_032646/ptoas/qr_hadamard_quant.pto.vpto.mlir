module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qr_hadamard_quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i8, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c64_i16 = arith.constant 64 : i16
      %c0_i16 = arith.constant 0 : i16
      %c1_i32 = arith.constant 1 : i32
      %cst = arith.constant 0xFF800000 : f32
      %c8192 = arith.constant 8192 : index
      %cst_0 = arith.constant 1.000000e+00 : f32
      %c1_i64 = arith.constant 1 : i64
      %c512_i64 = arith.constant 512 : i64
      %c255_i16 = arith.constant 255 : i16
      %c128_i32 = arith.constant 128 : i32
      %c128_i64 = arith.constant 128 : i64
      %c64_i64 = arith.constant 64 : i64
      %cst_1 = arith.constant 1.270000e+02 : f32
      %cst_2 = arith.constant 9.99999974E-5 : f32
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c16640_i64 = arith.constant 16640 : i64
      %c256_i64 = arith.constant 256 : i64
      %c49408_i64 = arith.constant 49408 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %c64_i32 = arith.constant 64 : i32
      %0 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %12 = pto.vdup %cst_2, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %13 = pto.addptr %0, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %12, %13[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %1 = arith.index_cast %arg3 : i32 to index
      %2 = arith.muli %1, %c64 : index
      %3 = arith.muli %1, %c8192 : index
      %4 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %12 = arith.addi %3, %arg5 : index
        %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
        %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %14, %5, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %15 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg6 : i16 to index
            %24 = arith.muli %23, %c64 : index
            %25 = pto.addptr %4, %24 : <f32, ub> -> <f32, ub>
            %result_6 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vneg %result_6, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.addptr %15, %24 : <f32, ub> -> <f32, ub>
            pto.vsts %26, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
          %16 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %17 = pto.castptr %c49408_i64 : i64 -> !pto.ptr<f32, ub>
          %18 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %20 = pto.vdup %cst, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask_3, %scalar_out_4 = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %21 = pto.pand %18, %mask_3, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %23 = arith.index_cast %arg6 : i16 to index
            %24 = arith.muli %23, %c64 : index
            %result_6 = pto.vlds %4[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_7 = pto.vlds %15[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.vmax %result_6, %result_7, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %25, %15[%24], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %26 = pto.vcmax %25, %16 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmax %26, %20, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %27, %17[%23], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
          %result = pto.vlds %0[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_5 = pto.vlds %17[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vmax %result, %result_5, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %0[%c0], %16 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
        %12 = pto.vdup %cst_1, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %12, %5[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %6 = pto.alloc_tile addr = %c256_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
      %7 = pto.castptr %c256_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %12 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %0[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %13 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %14 = pto.vdiv %result, %result_3, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %14, %7[%c0], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_4 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.vdup %cst_0, %13 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vdiv %15, %result_4, %13 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %16, %4[%c0], %12 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %8 = pto.addptr %arg1, %2 : <f32, gm> -> <f32, gm>
      %9 = pto.addptr %8, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %5, %9, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %10 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<i8, ub>
      %11 = pto.addptr %10, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg5 = %c0 to %c128 step %c64 {
        %12 = arith.addi %3, %arg5 : index
        %13 = pto.addptr %arg0, %12 : <f32, gm> -> <f32, gm>
        %14 = pto.addptr %13, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %14, %5, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg6 : i16 to index
            %23 = arith.muli %22, %c64 : index
            %24 = pto.addptr %4, %23 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.addptr %7, %22 : <f32, ub> -> <f32, ub>
            %result_7 = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vdup %result_7, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmul %result, %26, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %27, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          %17 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<i32, ub>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg6 : i16 to index
            %23 = arith.muli %22, %c64 : index
            %24 = pto.addptr %4, %23 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %26 = pto.addptr %17, %23 : <i32, ub> -> <i32, ub>
            pto.vsts %25, %26[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %18 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
          %19 = pto.castptr %c16640_i64 : i64 -> !pto.ptr<f16, ub>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg6 : i16 to index
            %23 = arith.muli %22, %c64 : index
            %24 = pto.addptr %17, %23 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %25 = pto.vcvt %result, %18 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.vcvt %25, %18 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %27 = pto.addptr %19, %23 : <f16, ub> -> <f16, ub>
            pto.vsts %26, %27[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          %20 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
          %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
          %mask_5, %scalar_out_6 = pto.plt_b16 %c64_i32 : i32 -> !pto.mask<b16>, i32
          %21 = pto.vdup %c255_i16, %20 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
          scf.for %arg6 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %22 = arith.index_cast %arg6 : i16 to index
            %23 = arith.muli %22, %c64 : index
            %24 = pto.addptr %19, %23 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %24[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %25 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %26 = pto.vand %25, %21, %mask_5 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %27 = pto.vcvt %26, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %28 = pto.vcvt %27, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %29 = pto.addptr %10, %23 : <i8, ub> -> <i8, ub>
            pto.vsts %28, %29[%c0], %mask_5 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %15 = pto.addptr %arg2, %12 : <i8, gm> -> <i8, gm>
        %16 = pto.addptr %15, %c0 : <i8, gm> -> <i8, gm>
        pto.copy_ubuf_to_gm %11, %16, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %c128_i64, %c64_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
}
