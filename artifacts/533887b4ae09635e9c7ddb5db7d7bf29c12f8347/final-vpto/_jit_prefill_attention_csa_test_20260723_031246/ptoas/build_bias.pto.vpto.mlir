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
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c128_i32 : i32 -> !pto.mask<b32>, i32
        %25 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %26 = arith.index_cast %arg5 : i16 to index
          %27 = arith.muli %26, %c128 : index
          scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16  : i16 {
            %28 = arith.index_cast %arg6 : i16 to index
            %29 = arith.addi %27, %28 : index
            %30 = pto.addptr %3, %29 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %31 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.addptr %25, %29 : <f32, ub> -> <f32, ub>
            pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %6 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %27 = pto.vdup %cst, %26 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c128 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vadd %result, %27, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vadd %result_2, %27, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %7[%29], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %7[%30], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %8 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_0, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c128 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmax %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmax %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmaxs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmaxs"}
      }
      %9 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg5 : i16 to index
          %30 = arith.muli %29, %c128 : index
          %result = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %30, %c64 : index
          %result_2 = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmin %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmin %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %7[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
        %28 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg5 : i16 to index
          %30 = arith.muli %29, %c128 : index
          %31 = scf.for %arg6 = %c0_i16 to %c128_i16 step %c64_i16 iter_args(%arg7 = %c128) -> (index)  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = arith.addi %30, %32 : index
            %36 = pto.addptr %7, %35 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vsub %result, %28, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %10 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x128xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_1, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c128 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = pto.vmul %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %31, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %32, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %11 = arith.muli %0, %c6144 : index
      %12 = pto.addptr %arg1, %11 : <f32, gm> -> <f32, gm>
      %13 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      %14 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %13, %14, %c0_i64, %c16_i64, %c512_i64, %c0_i64, %c1536_i64, %c512_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      %15 = arith.muli %0, %c8192 : index
      %16 = pto.addptr %arg2, %15 : <i32, gm> -> <i32, gm>
      %17 = pto.addptr %16, %c0 : <i32, gm> -> <i32, gm>
      pto.copy_gm_to_ubuf %17, %5, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c2048_i64, %c1024_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %25 = arith.index_cast %arg5 : i16 to index
          %26 = arith.muli %25, %c256 : index
          scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
            %27 = arith.index_cast %arg6 : i16 to index
            %28 = arith.addi %26, %27 : index
            %29 = pto.addptr %3, %28 : <i32, ub> -> <i32, ub>
            %result = pto.vlds %29[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %30 = pto.vcvt %result, %mask {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %31 = pto.addptr %7, %28 : <f32, ub> -> <f32, ub>
            pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %18 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c256 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %29, %c128 : index
          %result_3 = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %29, %c192 : index
          %result_4 = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vadd %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vadd %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vadd %result_3, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vadd %result_4, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %7[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %7[%32], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tadds", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tadds"}
      }
      %19 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_0, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c256 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %29, %c128 : index
          %result_3 = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %29, %c192 : index
          %result_4 = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmax %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmax %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmax %result_3, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmax %result_4, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %7[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %7[%32], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmaxs", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmaxs"}
      }
      %20 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg5 : i16 to index
          %30 = arith.muli %29, %c256 : index
          %result = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %30, %c64 : index
          %result_2 = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %30, %c128 : index
          %result_3 = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %30, %c192 : index
          %result_4 = pto.vlds %7[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.vmin %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmin %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmin %result_3, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmin %result_4, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %34, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %7[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %7[%32], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %7[%33], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmins", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmins"}
        %28 = pto.vbr %cst : f32 -> !pto.vreg<64xf32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %29 = arith.index_cast %arg5 : i16 to index
          %30 = arith.muli %29, %c256 : index
          %31 = scf.for %arg6 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg7 = %c256) -> (index)  : i16 {
            %32 = arith.index_cast %arg6 : i16 to index
            %33 = arith.index_cast %arg7 : index to i32
            %mask, %scalar_out = pto.plt_b32 %33 : i32 -> !pto.mask<b32>, i32
            %34 = arith.index_cast %scalar_out : i32 to index
            %35 = arith.addi %30, %32 : index
            %36 = pto.addptr %7, %35 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %36[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %37 = pto.vsub %result, %28, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %37, %36[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            scf.yield %34 : index
          }
        } {pto.tilelib.candidate = "template_tsubs", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tsubs"}
      }
      %21 = pto.alloc_tile addr = %c0_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
      pto.vecscope {
        %25 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %26 = pto.vdup %cst_1, %25 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %27 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg5 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
          %28 = arith.index_cast %arg5 : i16 to index
          %29 = arith.muli %28, %c256 : index
          %result = pto.vlds %7[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %29, %c64 : index
          %result_2 = pto.vlds %7[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %29, %c128 : index
          %result_3 = pto.vlds %7[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %29, %c192 : index
          %result_4 = pto.vlds %7[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_2, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_3, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_4, %26, %25 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %33, %7[%29], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %7[%30], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %7[%31], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %7[%32], %27 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
      }
      %22 = arith.addi %11, %c128 : index
      %23 = pto.addptr %arg1, %22 : <f32, gm> -> <f32, gm>
      %24 = pto.addptr %23, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %13, %24, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c1536_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

