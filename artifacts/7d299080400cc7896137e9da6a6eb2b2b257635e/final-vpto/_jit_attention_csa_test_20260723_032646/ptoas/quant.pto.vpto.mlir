module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @quant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: index, %arg4: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c128_i16 = arith.constant 128 : i16
      %c64_i16 = arith.constant 64 : i16
      %c1024_i16 = arith.constant 1024 : i16
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c8 = arith.constant 8 : index
      %c1 = arith.constant 1 : index
      %c1024 = arith.constant 1024 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %cst_0 = arith.constant 1.270000e+02 : f32
      %cst_1 = arith.constant 0.000000e+00 : f16
      %c64 = arith.constant 64 : index
      %c0 = arith.constant 0 : index
      %c65536 = arith.constant 65536 : index
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c128 = arith.constant 128 : index
      %c128_i32 = arith.constant 128 : i32
      %c1024_i32 = arith.constant 1024 : i32
      %c255_i16 = arith.constant 255 : i16
      %c4096_i64 = arith.constant 4096 : i64
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i32 = arith.constant 8 : i32
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c512 = arith.constant 512 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %cst_3 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %0 = pto.addptr %arg2, %arg3 : <f32, gm> -> <f32, gm>
      %1 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      %2 = pto.addptr %0, %c0 : <f32, gm> -> <f32, gm>
      %3 = pto.addptr %1, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c1024 : index
          %30 = scf.for %arg6 = %c0_i16 to %c1024_i16 step %c64_i16 iter_args(%arg7 = %c1024) -> (index)  : i16 {
            %31 = arith.index_cast %arg6 : i16 to index
            %32 = arith.index_cast %arg7 : index to i32
            %mask_7, %scalar_out_8 = pto.plt_b32 %32 : i32 -> !pto.mask<b32>, i32
            %33 = arith.index_cast %scalar_out_8 : i32 to index
            %34 = arith.addi %29, %31 : index
            %35 = pto.addptr %1, %34 : <f32, ub> -> <f32, ub>
            %result_9 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %36 = pto.vabs %result_9, %mask_7 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %36, %35[%c0], %mask_7 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %33 : index
          }
        } {pto.tilelib.candidate = "template_tabs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tabs"}
        %16 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst_3, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
        %21 = pto.pand %18, %mask, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c1024 : index
          %result_7 = pto.vlds %1[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_8 = pto.vlds %1[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %29, %c128 : index
          %result_9 = pto.vlds %1[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %29, %c192 : index
          %result_10 = pto.vlds %1[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %29, %c256 : index
          %result_11 = pto.vlds %1[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %29, %c320 : index
          %result_12 = pto.vlds %1[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = arith.addi %29, %c384 : index
          %result_13 = pto.vlds %1[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = arith.addi %29, %c448 : index
          %result_14 = pto.vlds %1[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = arith.addi %29, %c512 : index
          %result_15 = pto.vlds %1[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %38 = arith.addi %29, %c576 : index
          %result_16 = pto.vlds %1[%38] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = arith.addi %29, %c640 : index
          %result_17 = pto.vlds %1[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %40 = arith.addi %29, %c704 : index
          %result_18 = pto.vlds %1[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %41 = arith.addi %29, %c768 : index
          %result_19 = pto.vlds %1[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %42 = arith.addi %29, %c832 : index
          %result_20 = pto.vlds %1[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %43 = arith.addi %29, %c896 : index
          %result_21 = pto.vlds %1[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %44 = arith.addi %29, %c960 : index
          %result_22 = pto.vlds %1[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %45 = pto.vmax %result_7, %result_8, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmax %45, %result_9, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmax %46, %result_10, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmax %47, %result_11, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmax %48, %result_12, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmax %49, %result_13, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmax %50, %result_14, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmax %51, %result_15, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %53 = pto.vmax %52, %result_16, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %54 = pto.vmax %53, %result_17, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %55 = pto.vmax %54, %result_18, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %56 = pto.vmax %55, %result_19, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %57 = pto.vmax %56, %result_20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %58 = pto.vmax %57, %result_21, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %59 = pto.vmax %58, %result_22, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %60 = pto.vcmax %59, %17 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %61 = pto.vmax %60, %20, %18 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %61, %16[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
        %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %22 = pto.vdup %cst, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %22, %3[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %23 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %16[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %24 = pto.vmax %result, %result_6, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %25 = pto.pand %23, %mask_4, %19 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %24, %1[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %26 = pto.vdup %cst_0, %mask_4 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %26, %27[%c0], %mask_4 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %5 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %1[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %16 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %17 = pto.vdiv %result, %result_4, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %18 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %19 = pto.pand %18, %mask, %16 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %17, %4[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_5 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %20 = pto.vdup %cst_2, %16 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vdiv %20, %result_5, %16 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %21, %1[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %6 = arith.muli %arg4, %c8 : index
      %7 = pto.addptr %arg0, %6 : <f32, gm> -> <f32, gm>
      %8 = pto.addptr %7, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %3, %8, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c1024 : index
          %24 = pto.addptr %4, %22 : <f32, ub> -> <f32, ub>
          %25 = scf.for %arg6 = %c0_i16 to %c1024_i16 step %c64_i16 iter_args(%arg7 = %c1024) -> (index)  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.index_cast %arg7 : index to i32
            %mask_8, %scalar_out_9 = pto.plt_b32 %27 : i32 -> !pto.mask<b32>, i32
            %28 = arith.index_cast %scalar_out_9 : i32 to index
            %29 = arith.addi %23, %26 : index
            %30 = pto.addptr %1, %29 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %24[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %31 = pto.vdup %result_10, %mask_8 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.vmul %result, %31, %mask_8 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %30[%c0], %mask_8 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %28 : index
          }
        } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        %mask, %scalar_out = pto.plt_b32 %c1024_i32 : i32 -> !pto.mask<b32>, i32
        %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c64_i16  : i16 {
            %24 = arith.index_cast %arg6 : i16 to index
            %25 = arith.addi %23, %24 : index
            %26 = pto.addptr %1, %25 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %27 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
            %28 = pto.addptr %16, %25 : <i32, ub> -> <i32, ub>
            pto.vsts %27, %28[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %17 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
        %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c64_i16  : i16 {
            %24 = arith.index_cast %arg6 : i16 to index
            %25 = arith.addi %23, %24 : index
            %26 = pto.addptr %16, %25 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %26[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %27 = pto.vcvt %result, %17 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %28 = pto.vcvt %27, %17 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
            %29 = pto.addptr %18, %25 : <f16, ub> -> <f16, ub>
            pto.vsts %28, %29[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %19 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %mask_4, %scalar_out_5 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %mask_6, %scalar_out_7 = pto.plt_b16 %c1024_i32 : i32 -> !pto.mask<b16>, i32
        %20 = pto.vdup %c255_i16, %19 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        %21 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c128_i16  : i16 {
            %24 = arith.index_cast %arg6 : i16 to index
            %25 = arith.addi %23, %24 : index
            %26 = pto.addptr %18, %25 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %26[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %27 = pto.vcvt %result, %mask_4 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %28 = pto.vand %27, %20, %mask_6 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %29 = pto.vcvt %28, %mask_4 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %30 = pto.vcvt %29, %mask_4 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %31 = pto.addptr %21, %25 : <i8, ub> -> <i8, ub>
            pto.vsts %30, %31[%c0], %mask_6 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          }
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, ub>
      %10 = pto.addptr %arg1, %arg3 : <i8, gm> -> <i8, gm>
      %11 = pto.addptr %9, %c0 : <i8, ub> -> <i8, ub>
      %12 = pto.addptr %10, %c0 : <i8, gm> -> <i8, gm>
      pto.copy_ubuf_to_gm %11, %12, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      pto.vecscope {
        %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f16, ub>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg5 : i16 to index
          %20 = arith.muli %19, %c1024 : index
          %21 = scf.for %arg6 = %c0_i16 to %c1024_i16 step %c128_i16 iter_args(%arg7 = %c1024) -> (index)  : i16 {
            %22 = arith.index_cast %arg6 : i16 to index
            %23 = arith.index_cast %arg7 : index to i32
            %mask_6, %scalar_out_7 = pto.plt_b16 %23 : i32 -> !pto.mask<b16>, i32
            %24 = arith.index_cast %scalar_out_7 : i32 to index
            %25 = pto.vdup %cst_1, %mask_6 : f16, !pto.mask<b16> -> !pto.vreg<128xf16>
            %26 = arith.addi %20, %22 : index
            %27 = pto.addptr %16, %26 : <f16, ub> -> <f16, ub>
            pto.vsts %25, %27[%c0], %mask_6 : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b16>
            scf.yield %24 : index
          }
        } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
        %mask, %scalar_out = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
        %mask_4, %scalar_out_5 = pto.plt_b16 %c1024_i32 : i32 -> !pto.mask<b16>, i32
        %17 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
        %18 = pto.vdup %c255_i16, %17 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
        scf.for %arg5 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg5 : i16 to index
          %20 = arith.muli %19, %c1024 : index
          scf.for %arg6 = %c0_i16 to %c1024_i16 step %c128_i16  : i16 {
            %21 = arith.index_cast %arg6 : i16 to index
            %22 = arith.addi %20, %21 : index
            %23 = pto.addptr %16, %22 : <f16, ub> -> <f16, ub>
            %result = pto.vlds %23[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
            %24 = pto.vcvt %result, %mask {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %25 = pto.vand %24, %18, %mask_4 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
            %26 = pto.vcvt %25, %mask {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
            %27 = pto.vcvt %26, %mask {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
            %28 = pto.addptr %9, %22 : <i8, ub> -> <i8, ub>
            pto.vsts %27, %28[%c0], %mask_4 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
          }
        } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %13 = arith.addi %arg3, %c65536 : index
      %14 = pto.addptr %arg1, %13 : <i8, gm> -> <i8, gm>
      %15 = pto.addptr %14, %c0 : <i8, gm> -> <i8, gm>
      pto.copy_ubuf_to_gm %11, %15, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
