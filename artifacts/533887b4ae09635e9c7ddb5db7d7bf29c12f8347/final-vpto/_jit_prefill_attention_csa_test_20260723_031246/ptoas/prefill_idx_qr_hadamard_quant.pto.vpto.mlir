module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_hadamard_quant_aiv(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i32 = arith.constant 0 : i32
      %c40960_i64 = arith.constant 40960 : i64
      %c73728_i64 = arith.constant 73728 : i64
      %c81920_i64 = arith.constant 81920 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c128 = arith.constant 128 : index
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %cst = arith.constant 9.99999974E-5 : f32
      %c32 = arith.constant 32 : index
      %cst_0 = arith.constant 1.270000e+02 : f32
      %c64_i64 = arith.constant 64 : i64
      %c32_i64 = arith.constant 32 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c128_i32 = arith.constant 128 : i32
      %c32_i32 = arith.constant 32 : i32
      %c255_i16 = arith.constant 255 : i16
      %c1_i64 = arith.constant 1 : i64
      %c256_i64 = arith.constant 256 : i64
      %cst_1 = arith.constant 1.000000e+00 : f32
      %c1_i32 = arith.constant 1 : i32
      %cst_2 = arith.constant -3.40282347E+38 : f32
      %c64_i16 = arith.constant 64 : i16
      %c1_i16 = arith.constant 1 : i16
      %c512_i64 = arith.constant 512 : i64
      %c64_i32 = arith.constant 64 : i32
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 8192, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg5 : i32 to index
      %2 = arith.muli %1, %c256 : index
      %3 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<bf16, ub>
      %6 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<i8, ub>
      %9 = pto.addptr %8, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg7 = %c0 to %c256 step %c64 {
        %10 = arith.addi %2, %arg7 : index
        %11 = arith.muli %10, %c128 : index
        %12 = pto.addptr %arg2, %11 : <f32, gm> -> <f32, gm>
        %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %13, %4, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %14 = pto.alloc_tile addr = %c40960_i64 valid_row = %c64 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x64xbf16, valid=?x?>
        pto.vecscope {
          %19 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %21 = arith.index_cast %arg8 : i16 to index
            %22 = arith.muli %21, %c64 : index
            %result = pto.vlds %3[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %23 = pto.vcvt %result, %19 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            pto.vsts %23, %5[%22], %20 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %15 = pto.alloc_tile addr = %c73728_i64 valid_row = %c64 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.vecscope {
          %19 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<bf16, ub>
          %20 = pto.pge_b16 "PAT_VL64" : !pto.mask<b16>
          %21 = scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16 iter_args(%arg9 = %19) -> (!pto.ptr<bf16, ub>)  : i16 {
            %22 = arith.index_cast %arg8 : i16 to index
            %23 = arith.muli %22, %c64 : index
            %result = pto.vlds %5[%23] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %24 = pto.addptr %arg9, %c0 : <bf16, ub> -> <bf16, ub>
            %25 = pto.vsstb %result, %24, %c64_i16, %c1_i16, %20 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
            scf.yield %25 : !pto.ptr<bf16, ub>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        }
        pto.tpush(%15, %0 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %19 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.addptr %6, %c0 : <f32, ub> -> <f32, ub>
          pto.vsts %19, %20[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %19 = pto.declare_tile_memref -> memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>>
          %20 = builtin.unrealized_conversion_cast %19 : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
          %21 = pto.materialize_tile %19, %c64, %c32 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.tpop(%21, %0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %23 = arith.index_cast %arg9 : i16 to index
              %24 = arith.muli %23, %c32 : index
              %25 = pto.addptr %20, %24 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %26 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %27 = pto.addptr %3, %24 : <f32, ub> -> <f32, ub>
              pto.vsts %26, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
          }
          %22 = pto.alloc_tile addr = %c32768_i64 valid_row = %c64 valid_col = %c32 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.vecscope {
            %23 = pto.pge_b32 "PAT_VL32" : !pto.mask<b32>
            %24 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %25 = pto.pand %23, %mask, %24 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %26 = arith.index_cast %arg9 : i16 to index
              %27 = arith.muli %26, %c32 : index
              %result = pto.vlds %20[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %3[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = pto.vmax %result, %result_3, %24 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %28, %7[%27], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "vmi_tmax", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          pto.vecscope {
            %23 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<f32, ub>
            %mask, %scalar_out = pto.plt_b32 %c1_i32 {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"} : i32 -> !pto.mask<b32>, i32
            %24 = pto.vbr %cst_2 : f32 -> !pto.vreg<64xf32>
            %mask_3, %scalar_out_4 = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %28 = arith.index_cast %arg9 : i16 to index
              %29 = arith.muli %28, %c32 : index
              %30 = pto.addptr %7, %29 : <f32, ub> -> <f32, ub>
              %result_6 = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vcmax %result_6, %mask_3 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %32 = pto.vsel %31, %24, %mask_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %33 = pto.vmax %24, %32, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %34 = pto.addptr %23, %28 : <f32, ub> -> <f32, ub>
              pto.vsts %33, %34[%c0], %mask {dist = "1PT_B32"} : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowmax"}
            %25 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_5 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %27 = pto.vmax %result, %result_5, %26 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %27, %6[%c0], %25 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %19 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %4[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %16 = pto.alloc_tile addr = %c32768_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        pto.vecscope {
          %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %21 = pto.vdiv %result, %result_3, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %21, %7[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %result_4 = pto.vlds %7[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = pto.vdup %cst_1, %20 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %23 = pto.vdiv %22, %result_4, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %23, %3[%c0], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %17 = pto.addptr %arg1, %10 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %18, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %19 = pto.declare_tile_memref -> memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>>
          %20 = builtin.unrealized_conversion_cast %19 : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
          %21 = pto.materialize_tile %19, %c64, %c32 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.tpop(%21, %0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %25 = arith.index_cast %arg9 : i16 to index
              %26 = arith.muli %25, %c32 : index
              %27 = pto.addptr %20, %26 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = pto.addptr %7, %25 : <f32, ub> -> <f32, ub>
              %result_3 = pto.vlds %28[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %29 = pto.vdup %result_3, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %30 = pto.vmul %result, %29, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %31 = pto.addptr %3, %26 : <f32, ub> -> <f32, ub>
              pto.vsts %30, %31[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %25 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<i32, ub>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %30 = arith.index_cast %arg9 : i16 to index
              %31 = arith.muli %30, %c32 : index
              %32 = pto.addptr %3, %31 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %32[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %33 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %34 = pto.addptr %25, %31 : <i32, ub> -> <i32, ub>
              pto.vsts %33, %34[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %26 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
            %27 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<f16, ub>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %30 = arith.index_cast %arg9 : i16 to index
              %31 = arith.muli %30, %c32 : index
              %32 = pto.addptr %25, %31 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %32[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %33 = pto.vcvt %result, %26 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %34 = pto.vcvt %33, %26 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %35 = pto.addptr %27, %31 : <f16, ub> -> <f16, ub>
              pto.vsts %34, %35[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %28 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
            %mask_3, %scalar_out_4 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
            %mask_5, %scalar_out_6 = pto.plt_b16 %c32_i32 : i32 -> !pto.mask<b16>, i32
            %29 = pto.vdup %c255_i16, %28 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %30 = arith.index_cast %arg9 : i16 to index
              %31 = arith.muli %30, %c32 : index
              %32 = pto.addptr %27, %31 : <f16, ub> -> <f16, ub>
              %result = pto.vlds %32[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %33 = pto.vcvt %result, %mask_3 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %34 = pto.vand %33, %29, %mask_5 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %35 = pto.vcvt %34, %mask_3 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %36 = pto.vcvt %35, %mask_3 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %37 = pto.addptr %8, %31 : <i8, ub> -> <i8, ub>
              pto.vsts %36, %37[%c0], %mask_5 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          %22 = arith.addi %11, %arg8 : index
          %23 = pto.addptr %arg0, %22 : <i8, gm> -> <i8, gm>
          %24 = pto.addptr %23, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %9, %24, %c0_i64, %c64_i64, %c32_i64, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
        }
      }
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_hadamard_quant_aic(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<bf16, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c2305843011361439808_i64 = arith.constant 2305843011361439808 : i64
      %c-6917529025493336000_i64 = arith.constant -6917529025493336000 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c4_i64 = arith.constant 4 : i64
      %c274877972481_i64 = arith.constant 274877972481 : i64
      %c256_i64 = arith.constant 256 : i64
      %c0_i32 = arith.constant 0 : i32
      %c32768_i64 = arith.constant 32768 : i64
      %c40960_i64 = arith.constant 40960 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192 = arith.constant 8192 : index
      %c128 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c64_i64 = arith.constant 64 : i64
      %c128_i64 = arith.constant 128 : i64
      %false = arith.constant false
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 8192, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg5 : i32 to index
      %2 = arith.muli %1, %c256 : index
      %3 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l1>
      %4 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<bf16, l1>
      %5 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
      %6 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
      %7 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
      %8 = pto.get_ctrl : i64
      %9 = pto.sbitset0 %8, %c45_i64 : i64, i64 -> i64
      %10 = pto.sbitset0 %9, %c46_i64 : i64, i64 -> i64
      %11 = pto.sbitset0 %10, %c47_i64 : i64, i64 -> i64
      %12 = pto.sbitset0 %11, %c51_i64 : i64, i64 -> i64
      %13 = pto.addptr %arg4, %c8192 : <bf16, gm> -> <bf16, gm>
      scf.for %arg7 = %c0 to %c256 step %c64 {
        %14 = arith.addi %2, %arg7 : index
        %15 = arith.muli %14, %c64 : index
        %16 = pto.addptr %arg3, %15 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %16, %3, %c0_i64, %c128_i64, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %arg4, %4, %c0_i64, %c256_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        %17 = pto.declare_tile_memref -> memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>>
        %18 = pto.materialize_tile %17, %c64, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.tpop(%18, %0 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %19 = pto.castptr %17 : memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
        pto.load_cbuf_to_ca %19, %5, %c0_i64, %c0_i64, %c4_i64, %c4_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.tfree(%0 : !pto.pipe) {split = 0}
        pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c4_i64, %c8_i64, %c4_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %12 : i64
        pto.mad_raw %5, %6, %7, %c-6917529025493336000_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %8 : i64
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %13, %4, %c0_i64, %c256_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.load_cbuf_to_ca %3, %5, %c0_i64, %c0_i64, %c4_i64, %c4_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c4_i64, %c8_i64, %c4_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %12 : i64
        pto.mad_raw %5, %6, %7, %c2305843011361439808_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %8 : i64
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %20 = arith.index_cast %arg8 : index to i64
          %21 = arith.muli %20, %c256_i64 : i64
          %22 = pto.alloc_tile addr = %21 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tpush(%22, %0 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
        }
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %20 = arith.index_cast %arg8 : index to i64
          %21 = arith.muli %20, %c256_i64 : i64
          %22 = pto.alloc_tile addr = %21 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>
          pto.tpush(%22, %0 : !pto.tile_buf<acc, 64x32xf32, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
        }
      }
      return
    }
  }
}

