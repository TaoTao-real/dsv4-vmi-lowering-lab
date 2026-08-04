module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_aiv(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c32_i16 = arith.constant 32 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i32 = arith.constant 0 : i32
      %c90368_i64 = arith.constant 90368 : i64
      %c90496_i64 = arith.constant 90496 : i64
      %c73984_i64 = arith.constant 73984 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c73728_i64 = arith.constant 73728 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c2048 = arith.constant 2048 : index
      %c64 = arith.constant 64 : index
      %c127 = arith.constant 127 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant -3.40282347E+38 : f32
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c32_i32 = arith.constant 32 : i32
      %c256_i64 = arith.constant 256 : i64
      %c64_i32 = arith.constant 64 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
      %2 = arith.index_cast %1 : i32 to index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.divsi %3, %c4 : index
      %5 = arith.minsi %4, %c256 : index
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %6 = arith.muli %arg9, %c32 : index
        %7 = arith.cmpi slt, %6, %5 : index
        scf.if %7 {
          %8 = arith.divsi %6, %c128 : index
          %9 = pto.load_scalar %arg2[%8] : !pto.ptr<i32, gm> -> i32
          %10 = arith.index_cast %9 : i32 to index
          %11 = arith.muli %10, %c128 : index
          %12 = arith.remsi %6, %c128 : index
          %13 = arith.addi %11, %12 : index
          %14 = pto.addptr %arg4, %13 : <f32, gm> -> <f32, gm>
          %15 = pto.castptr %c90368_i64 : i64 -> !pto.ptr<f32, ub>
          %16 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
          %17 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
          pto.copy_gm_to_ubuf %16, %17, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %18 = pto.castptr %c90496_i64 : i64 -> !pto.ptr<f32, ub>
          %19 = pto.addptr %18, %c0 : <f32, ub> -> <f32, ub>
          %20 = pto.castptr %c73984_i64 : i64 -> !pto.ptr<f32, ub>
          %21 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
          %22 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
          %24 = pto.addptr %20, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg10 = %c0 to %c128 step %c1 {
            %25 = arith.muli %arg10, %c64 : index
            %26 = pto.addptr %arg6, %25 : <f32, gm> -> <f32, gm>
            %27 = pto.addptr %26, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %27, %19, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            %28 = pto.declare_tile_memref -> memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>>
            %29 = builtin.unrealized_conversion_cast %28 : memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<i32, ub>
            %30 = pto.materialize_tile %28, %c32, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x64xi32, strided<[64, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x64xi32, valid=?x?>
            pto.tpop(%30, %0 : !pto.tile_buf<vec, 32x64xi32, valid=?x?>, !pto.pipe) {split = 0}
            pto.vecscope {
              %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %39 = arith.index_cast %arg11 : i16 to index
                %40 = arith.muli %39, %c64 : index
                %41 = pto.addptr %29, %40 : <i32, ub> -> <i32, ub>
                %result = pto.vlds %41[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
                %42 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %43 = pto.addptr %20, %40 : <f32, ub> -> <f32, ub>
                pto.vsts %42, %43[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %42 = arith.index_cast %arg11 : i16 to index
                %43 = arith.muli %42, %c64 : index
                %44 = pto.addptr %20, %43 : <f32, ub> -> <f32, ub>
                %result_1 = pto.vlds %44[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %45 = pto.addptr %15, %42 : <f32, ub> -> <f32, ub>
                %result_2 = pto.vlds %45[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %46 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %47 = pto.vmul %result_1, %46, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %47, %44[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
              %39 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %result = pto.vlds %18[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %41 = pto.vdup %cst, %40 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %42 = arith.index_cast %arg11 : i16 to index
                %43 = arith.muli %42, %c64 : index
                %result_1 = pto.vlds %20[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %44 = pto.vmul %result_1, %result, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %44, %20[%43], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %45 = pto.vmul %44, %41, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %45, %21[%43], %39 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
            }
            %31 = pto.alloc_tile addr = %c73984_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x64xf32, valid=?x?>
            pto.vecscope {
              %39 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %40 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %41 = arith.index_cast %arg11 : i16 to index
                %42 = arith.muli %41, %c64 : index
                %result = pto.vlds %20[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %result_1 = pto.vlds %21[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %43 = pto.vmax %result, %result_1, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %43, %20[%42], %40 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
            }
            %32 = pto.addptr %arg7, %25 : <f32, gm> -> <f32, gm>
            %33 = pto.addptr %32, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_gm_to_ubuf %33, %23, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
            pto.vecscope {
              %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %39 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %41 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %42 = pto.vdup %cst, %40 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
              %43 = pto.pand %39, %mask, %40 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              scf.for %arg11 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %46 = arith.index_cast %arg11 : i16 to index
                %47 = arith.muli %46, %c64 : index
                %result_4 = pto.vlds %20[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = pto.vmul %result_4, %result, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %48, %21[%47], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %49 = pto.vcadd %48, %41 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %50 = pto.vadd %49, %42, %39 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %50, %18[%46], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              %mask_1, %scalar_out_2 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %44 = pto.vdup %cst_0, %mask_1 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %44, %24[%c0], %mask_1 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %result_3 = pto.vlds %19[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              pto.vsts %result_3, %24[%c0], %mask_1 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              %45 = pto.addptr %21, %c0 : <f32, ub> -> <f32, ub>
              pto.vsts %44, %45[%c0], %mask_1 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %34 = pto.alloc_tile addr = %c73984_i64 valid_row = %c1 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x32xf32, valid=?x?, pad=3>
            pto.vecscope {
              %39 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
              %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_1 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %40 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %41 = pto.vmax %result, %result_1, %40 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
              %42 = pto.pand %39, %mask, %40 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              pto.vsts %41, %20[%c0], %42 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
            %35 = arith.muli %arg10, %c2048 : index
            %36 = arith.addi %35, %6 : index
            %37 = pto.addptr %arg1, %36 : <f32, gm> -> <f32, gm>
            %38 = pto.addptr %37, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %24, %38, %c0_i64, %c1_i64, %c128_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_score_aic(%arg0: !pto.ptr<i32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<i32, gm>, %arg3: !pto.ptr<i8, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i8, gm>, %arg6: !pto.ptr<f32, gm>, %arg7: !pto.ptr<f32, gm>, %arg8: index) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c-6917529026566815712_i64 = arith.constant -6917529026566815712 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c2_i64 = arith.constant 2 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c0_i32 = arith.constant 0 : i32
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c127 = arith.constant 127 : index
      %c4 = arith.constant 4 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c32 = arith.constant 32 : index
      %c32_i64 = arith.constant 32 : i64
      %c128_i64 = arith.constant 128 : i64
      %false = arith.constant false
      %c64_i64 = arith.constant 64 : i64
      %c8192 = arith.constant 8192 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 8192, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = pto.load_scalar %arg0[%c127] : !pto.ptr<i32, gm> -> i32
      %2 = arith.index_cast %1 : i32 to index
      %3 = arith.addi %2, %c1 : index
      %4 = arith.divsi %3, %c4 : index
      %5 = arith.minsi %4, %c256 : index
      scf.for %arg9 = %c0 to %c8 step %c1 {
        %6 = arith.muli %arg9, %c32 : index
        %7 = arith.cmpi slt, %6, %5 : index
        scf.if %7 {
          %8 = arith.divsi %6, %c128 : index
          %9 = pto.load_scalar %arg2[%8] : !pto.ptr<i32, gm> -> i32
          %10 = arith.index_cast %9 : i32 to index
          %11 = arith.muli %10, %c128 : index
          %12 = arith.remsi %6, %c128 : index
          %13 = arith.addi %11, %12 : index
          %14 = arith.muli %13, %c128 : index
          %15 = pto.addptr %arg3, %14 : <i8, gm> -> <i8, gm>
          %16 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %15, %16, %c0_i64, %c128_i64, %c0_i64, %c32_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
          %17 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i8, l1>
          %18 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
          %19 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
          %20 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
          %21 = pto.get_ctrl : i64
          %22 = pto.sbitset0 %21, %c45_i64 : i64, i64 -> i64
          %23 = pto.sbitset0 %22, %c46_i64 : i64, i64 -> i64
          %24 = pto.sbitset0 %23, %c47_i64 : i64, i64 -> i64
          %25 = pto.sbitset0 %24, %c51_i64 : i64, i64 -> i64
          scf.for %arg10 = %c0 to %c128 step %c1 {
            %26 = arith.muli %arg10, %c8192 : index
            %27 = pto.addptr %arg5, %26 : <i8, gm> -> <i8, gm>
            pto.set_mte2_nz_para %c274877972481_i64 : i64
            pto.copy_gm_to_cbuf_multi_nd2nz %27, %17, %c0_i64, %c128_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
            pto.load_cbuf_to_ca %16, %18, %c0_i64, %c0_i64, %c2_i64, %c4_i64, %c2_i64, %c2_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
            pto.load_cbuf_to_cb %17, %19, %c0_i64, %c0_i64, %c8_i64, %c2_i64, %c8_i64, %c4_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
            %28 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
            pto.set_ctrl %25 : i64
            pto.mad_raw %18, %19, %20, %c-6917529026566815712_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
            pto.set_ctrl %21 : i64
            pto.tpush(%28, %0 : !pto.tile_buf<acc, 32x64xi32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          }
        }
      }
      return
    }
  }
}
