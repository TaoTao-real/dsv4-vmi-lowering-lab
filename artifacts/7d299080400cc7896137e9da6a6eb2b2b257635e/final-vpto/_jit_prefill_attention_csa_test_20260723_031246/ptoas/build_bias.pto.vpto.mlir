module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @build_bias(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: i32, %arg4: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c256_i16 = arith.constant 256 : i16
      %c64_i16 = arith.constant 64 : i16
      %c128_i16 = arith.constant 128 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c128 = arith.constant 128 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant 1.000000e+00 : f32
      %cst_0 = arith.constant 0.000000e+00 : f32
      %cst_1 = arith.constant 3.40282347E+38 : f32
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c16_i64 = arith.constant 16 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c1536_i64 = arith.constant 1536 : i64
      %c64 = arith.constant 64 : index
      %c256_i32 = arith.constant 256 : i32
      %c2048_i64 = arith.constant 2048 : i64
      %c512_i64 = arith.constant 512 : i64
      %c128_i32 = arith.constant 128 : i32
      %c2048 = arith.constant 2048 : index
      %c6144 = arith.constant 6144 : index
      %c8192 = arith.constant 8192 : index
      %c192 = arith.constant 192 : index
      %0 = arith.index_cast %arg3 : i32 to index
      %1 = arith.muli %0, %c2048 : index
      %2 = pto.addptr %arg0, %1 : <i32, gm> -> <i32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, ub>
      %4 = pto.addptr %2, %c0 : <i32, gm> -> <i32, gm>
      %5 = pto.addptr %3, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %4, %5, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c512_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c128 : index
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.addi %25, %26 : index
            %28 = pto.addptr %3, %27 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %29 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.addptr %6, %27 : <f32, ub> -> <f32, ub>
            pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %21 = pto.vdup %cst, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.vdup %cst_0, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c128 : index
          %result = pto.vlds %6[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %25, %c64 : index
          %result_2 = pto.vlds %6[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vadd %result, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vadd %result_2, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vmax %27, %22, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vmax %28, %22, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vmin %29, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmin %30, %21, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %6[%25], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %6[%26], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %23 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c128 : index
          %26 = scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg7 = %c128) -> (index)  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.index_cast %arg7 : index to i32
            %mask_2, %scalar_out_3 = pto.plt_b32 %28 : i32 -> !pto.mask<b32>, i32
            %29 = arith.index_cast %scalar_out_3 : i32 to index
            %30 = arith.addi %25, %27 : index
            %31 = pto.addptr %6, %30 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vsub %result, %23, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %31[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %29 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %7 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst_1, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c128 : index
          %result = pto.vlds %6[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %23, %c64 : index
          %result_2 = pto.vlds %6[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = pto.vmul %result, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %26 = pto.vmul %result_2, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %25, %6[%23], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %26, %6[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %8 = arith.muli %0, %c6144 : index
      %9 = pto.addptr %arg1, %8 : <f32, gm> -> <f32, gm>
      %10 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
      %11 = pto.addptr %9, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %10, %11, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c1536_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %12 = arith.muli %0, %c8192 : index
      %13 = pto.addptr %arg2, %12 : <i32, gm> -> <i32, gm>
      %14 = pto.addptr %13, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %14, %5, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c1024_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c256 : index
          scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %26 = arith.index_cast %arg6 : i16 to index
            %27 = arith.addi %25, %26 : index
            %28 = pto.addptr %3, %27 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %28[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %29 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.addptr %6, %27 : <f32, ub> -> <f32, ub>
            pto.vsts %29, %30[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vdup %cst_0, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c256 : index
          %result = pto.vlds %6[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %25, %c64 : index
          %result_2 = pto.vlds %6[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %25, %c128 : index
          %result_3 = pto.vlds %6[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %25, %c192 : index
          %result_4 = pto.vlds %6[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = pto.vadd %result, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vadd %result_2, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result_3, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result_4, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmax %29, %21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmax %30, %21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmax %31, %21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmax %32, %21, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmin %33, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmin %34, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmin %35, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmin %36, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %6[%25], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %6[%26], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %6[%27], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %6[%28], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        %23 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg5 : i16 to index
          %25 = arith.muli %24, %c256 : index
          %26 = scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg7 = %c256) -> (index)  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.index_cast %arg7 : index to i32
            %mask_2, %scalar_out_3 = pto.plt_b32 %28 : i32 -> !pto.mask<b32>, i32
            %29 = arith.index_cast %scalar_out_3 : i32 to index
            %30 = arith.addi %25, %27 : index
            %31 = pto.addptr %6, %30 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %31[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %32 = pto.vsub %result, %23, %mask_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %32, %31[%c0], %mask_2 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %29 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %15 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %20 = pto.vdup %cst_1, %19 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %22 = arith.index_cast %arg5 : i16 to index
          %23 = arith.muli %22, %c256 : index
          %result = pto.vlds %6[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %23, %c64 : index
          %result_2 = pto.vlds %6[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %23, %c128 : index
          %result_3 = pto.vlds %6[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %23, %c192 : index
          %result_4 = pto.vlds %6[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = pto.vmul %result, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %28 = pto.vmul %result_2, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %29 = pto.vmul %result_3, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %30 = pto.vmul %result_4, %20, %19 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %27, %6[%23], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %28, %6[%24], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %29, %6[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %30, %6[%26], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %16 = arith.addi %8, %c128 : index
      %17 = pto.addptr %arg1, %16 : <f32, gm> -> <f32, gm>
      %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %10, %18, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c1536_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}
