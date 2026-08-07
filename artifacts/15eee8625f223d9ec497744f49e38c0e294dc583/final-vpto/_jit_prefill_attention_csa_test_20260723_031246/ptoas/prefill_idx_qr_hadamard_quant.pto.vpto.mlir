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
      %c64_i16 = arith.constant 64 : i16
      %c1_i16 = arith.constant 1 : i16
      %c64_i32 = arith.constant 64 : i32
      %c512_i64 = arith.constant 512 : i64
      %c384 = arith.constant 384 : index
      %c512 = arith.constant 512 : index
      %c640 = arith.constant 640 : index
      %c768 = arith.constant 768 : index
      %c896 = arith.constant 896 : index
      %c1024 = arith.constant 1024 : index
      %c1152 = arith.constant 1152 : index
      %c1280 = arith.constant 1280 : index
      %c1408 = arith.constant 1408 : index
      %c1536 = arith.constant 1536 : index
      %c1664 = arith.constant 1664 : index
      %c1792 = arith.constant 1792 : index
      %c1920 = arith.constant 1920 : index
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c24 = arith.constant 24 : index
      %c40 = arith.constant 40 : index
      %c48 = arith.constant 48 : index
      %c56 = arith.constant 56 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 8192, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg5 : i32 to index
      %2 = arith.muli %1, %c256 : index
      pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      %3 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<f32, ub>
      %4 = pto.addptr %3, %c0 : <f32, ub> -> <f32, ub>
      %5 = pto.castptr %c81920_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<i8, ub>
      %8 = pto.addptr %7, %c0 : <i8, ub> -> <i8, ub>
      scf.for %arg7 = %c0 to %c256 step %c64 {
        %9 = arith.addi %2, %arg7 : index
        pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
        %10 = arith.muli %9, %c128 : index
        %11 = pto.addptr %arg2, %10 : <f32, gm> -> <f32, gm>
        %12 = pto.addptr %11, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %12, %4, %c0_i64, %c64_i64, %c256_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c512_i64, %c256_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c64_i32 : i32 -> !pto.mask<b32>, i32
          %17 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<bf16, ub>
          scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
            %18 = arith.index_cast %arg8 : i16 to index
            %19 = arith.muli %18, %c64 : index
            %20 = pto.addptr %3, %19 : <f32, ub> -> <f32, ub>
            %result = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %21 = pto.vcvt %result, %mask {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
            %22 = pto.addptr %17, %19 : <bf16, ub> -> <bf16, ub>
            pto.vsts %21, %22[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "template_tcvt_f32_to_bf16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        %13 = pto.alloc_tile addr = %c73728_i64 valid_row = %c64 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.vecscope {
          %17 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<bf16, ub>
          %18 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<bf16, ub>
          %19 = pto.pge_b16 "PAT_VL64" : !pto.mask<b16>
          %20 = scf.for %arg8 = %c0_i16 to %c64_i16 step %c1_i16 iter_args(%arg9 = %18) -> (!pto.ptr<bf16, ub>)  : i16 {
            %21 = arith.index_cast %arg8 : i16 to index
            %22 = arith.muli %21, %c64 : index
            %result = pto.vlds %17[%22] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
            %23 = pto.addptr %arg9, %c0 : <bf16, ub> -> <bf16, ub>
            %24 = pto.vsstb %result, %23, %c64_i16, %c1_i16, %19 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
            scf.yield %24 : !pto.ptr<bf16, ub>
          } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
        }
        pto.tpush(%13, %0 : !pto.tile_buf<vec, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        %14 = pto.alloc_tile addr = %c81920_i64 valid_row = %c1 valid_col = %c64 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x64xf32, valid=?x?>
        pto.vecscope {
          %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %19 = pto.vdup %cst, %18 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %19, %5[%c0], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %17 = pto.declare_tile_memref -> memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>>
          %18 = builtin.unrealized_conversion_cast %17 : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
          %19 = pto.materialize_tile %17, %c64, %c32 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
          pto.tpop(%19, %0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
          pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID0>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %20 = arith.index_cast %arg9 : i16 to index
              %21 = arith.muli %20, %c32 : index
              %22 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %23 = pto.vneg %result, %mask : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %24 = pto.addptr %3, %21 : <f32, ub> -> <f32, ub>
              pto.vsts %23, %24[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tneg", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tneg"}
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %20 = arith.index_cast %arg9 : i16 to index
              %21 = arith.muli %20, %c32 : index
              %22 = pto.addptr %18, %21 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %22[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %23 = pto.addptr %3, %21 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %23[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %24 = pto.vmax %result, %result_2, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %25 = pto.addptr %6, %21 : <f32, ub> -> <f32, ub>
              pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tmax", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmax"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          pto.vecscope {
            %20 = pto.castptr %c73728_i64 : i64 -> !pto.ptr<f32, ub>
            %low, %high = pto.vldsx2 %6[%c0], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_2, %high_3 = pto.vldsx2 %6[%c128], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_4, %high_5 = pto.vdintlv %low, %low_2 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_6, %high_7 = pto.vdintlv %high, %high_3 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_8, %high_9 = pto.vldsx2 %6[%c256], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_10, %high_11 = pto.vldsx2 %6[%c384], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_12, %high_13 = pto.vdintlv %low_8, %low_10 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_14, %high_15 = pto.vdintlv %high_9, %high_11 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_16, %high_17 = pto.vldsx2 %6[%c512], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_18, %high_19 = pto.vldsx2 %6[%c640], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_20, %high_21 = pto.vdintlv %low_16, %low_18 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_22, %high_23 = pto.vdintlv %high_17, %high_19 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_24, %high_25 = pto.vldsx2 %6[%c768], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_26, %high_27 = pto.vldsx2 %6[%c896], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_28, %high_29 = pto.vdintlv %low_24, %low_26 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_30, %high_31 = pto.vdintlv %high_25, %high_27 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_32, %high_33 = pto.vldsx2 %6[%c1024], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_34, %high_35 = pto.vldsx2 %6[%c1152], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_36, %high_37 = pto.vdintlv %low_32, %low_34 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_38, %high_39 = pto.vdintlv %high_33, %high_35 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_40, %high_41 = pto.vldsx2 %6[%c1280], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_42, %high_43 = pto.vldsx2 %6[%c1408], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_44, %high_45 = pto.vdintlv %low_40, %low_42 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_46, %high_47 = pto.vdintlv %high_41, %high_43 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_48, %high_49 = pto.vldsx2 %6[%c1536], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_50, %high_51 = pto.vldsx2 %6[%c1664], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_52, %high_53 = pto.vdintlv %low_48, %low_50 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_54, %high_55 = pto.vdintlv %high_49, %high_51 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_56, %high_57 = pto.vldsx2 %6[%c1792], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_58, %high_59 = pto.vldsx2 %6[%c1920], "DINTLV_B32" : !pto.ptr<f32, ub>, index -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_60, %high_61 = pto.vdintlv %low_56, %low_58 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %low_62, %high_63 = pto.vdintlv %high_57, %high_59 : !pto.vreg<64xf32>, !pto.vreg<64xf32> -> !pto.vreg<64xf32>, !pto.vreg<64xf32>
            %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
            %22 = pto.vmax %low_4, %low_6, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %23 = pto.vmax %22, %high_5, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %24 = pto.vmax %23, %high_7, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %25 = pto.vcgmax %24, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %26 = pto.vmax %low_12, %low_14, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmax %26, %high_13, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %28 = pto.vmax %27, %high_15, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %29 = pto.vcgmax %28, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %30 = pto.vmax %low_20, %low_22, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %31 = pto.vmax %30, %high_21, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %32 = pto.vmax %31, %high_23, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %33 = pto.vcgmax %32, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %34 = pto.vmax %low_28, %low_30, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %35 = pto.vmax %34, %high_29, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %36 = pto.vmax %35, %high_31, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %37 = pto.vcgmax %36, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %38 = pto.vmax %low_36, %low_38, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = pto.vmax %38, %high_37, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %40 = pto.vmax %39, %high_39, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %41 = pto.vcgmax %40, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %42 = pto.vmax %low_44, %low_46, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %43 = pto.vmax %42, %high_45, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %44 = pto.vmax %43, %high_47, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %45 = pto.vcgmax %44, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %46 = pto.vmax %low_52, %low_54, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vmax %46, %high_53, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmax %47, %high_55, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vcgmax %48, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmax %low_60, %low_62, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmax %50, %high_61, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmax %51, %high_63, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vcgmax %52, %21 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
            pto.vsts %25, %20[%c0], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %29, %20[%c8], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %33, %20[%c16], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %37, %20[%c24], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %41, %20[%c32], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %45, %20[%c40], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %20[%c48], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %20[%c56], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_64 = pto.vlds %20[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
            %56 = pto.vmax %result, %result_64, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %56, %5[%c0], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          }
        }
        pto.vecscope {
          %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %18 = pto.vdup %cst_0, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %19 = pto.vdiv %18, %result, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %20 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          pto.vsts %19, %6[%c0], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %21 = pto.vdup %cst_1, %17 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %22 = pto.vdiv %21, %19, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %22, %3[%c0], %20 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID0>]
        %15 = pto.addptr %arg1, %9 : <f32, gm> -> <f32, gm>
        %16 = pto.addptr %15, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %4, %16, %c0_i64, %c1_i64, %c256_i64, %c0_i64, %c0_i64, %c256_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID0>]
        scf.for %arg8 = %c0 to %c128 step %c32 {
          %17 = pto.declare_tile_memref -> memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>>
          %18 = builtin.unrealized_conversion_cast %17 : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
          %19 = pto.materialize_tile %17, %c64, %c32 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x32xf32, strided<[32, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 64x32xf32, valid=?x?>
          pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID1>]
          pto.tpop(%19, %0 : !pto.tile_buf<vec, 64x32xf32, valid=?x?>, !pto.pipe) {split = 0}
          pto.set_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_S>, <PIPE_V>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %23 = arith.index_cast %arg9 : i16 to index
              %24 = arith.muli %23, %c32 : index
              %25 = pto.addptr %18, %24 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %25[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %26 = pto.addptr %6, %23 : <f32, ub> -> <f32, ub>
              %result_2 = pto.vlds %26[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %27 = pto.vdup %result_2, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %28 = pto.vmul %result, %27, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %29 = pto.addptr %3, %24 : <f32, ub> -> <f32, ub>
              pto.vsts %28, %29[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID1>]
          pto.tfree(%0 : !pto.pipe) {split = 0}
          pto.vecscope {
            %mask, %scalar_out = pto.plt_b32 %c32_i32 : i32 -> !pto.mask<b32>, i32
            %23 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<i32, ub>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %28 = arith.index_cast %arg9 : i16 to index
              %29 = arith.muli %28, %c32 : index
              %30 = pto.addptr %3, %29 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %31 = pto.vcvt %result, %mask {rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xi32>
              %32 = pto.addptr %23, %29 : <i32, ub> -> <i32, ub>
              pto.vsts %31, %32[%c0], %mask : !pto.vreg<64xi32>, !pto.ptr<i32, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_f32_to_i32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %24 = pto.pset_b32 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b32>
            %25 = pto.castptr %c40960_i64 : i64 -> !pto.ptr<f16, ub>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %28 = arith.index_cast %arg9 : i16 to index
              %29 = arith.muli %28, %c32 : index
              %30 = pto.addptr %23, %29 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %31 = pto.vcvt %result, %24 {rnd = "A"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %32 = pto.vcvt %31, %24 {part = "EVEN", rnd = "A", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xf16>
              %33 = pto.addptr %25, %29 : <f16, ub> -> <f16, ub>
              pto.vsts %32, %33[%c0], %mask {dist = "PK_B32"} : !pto.vreg<128xf16>, !pto.ptr<f16, ub>, !pto.mask<b32>
            } {pto.tilelib.candidate = "template_tcvt_i32_to_f16", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            %26 = pto.pset_b16 "PAT_ALL" {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"} : !pto.mask<b16>
            %mask_2, %scalar_out_3 = pto.plt_b16 %c128_i32 : i32 -> !pto.mask<b16>, i32
            %mask_4, %scalar_out_5 = pto.plt_b16 %c32_i32 : i32 -> !pto.mask<b16>, i32
            %27 = pto.vdup %c255_i16, %26 : i16, !pto.mask<b16> -> !pto.vreg<128xi16>
            scf.for %arg9 = %c0_i16 to %c64_i16 step %c1_i16  : i16 {
              %28 = arith.index_cast %arg9 : i16 to index
              %29 = arith.muli %28, %c32 : index
              %30 = pto.addptr %25, %29 : <f16, ub> -> <f16, ub>
              %result = pto.vlds %30[%c0] : !pto.ptr<f16, ub> -> !pto.vreg<128xf16>
              %31 = pto.vcvt %result, %mask_2 {rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %32 = pto.vand %31, %27, %mask_4 : !pto.vreg<128xi16>, !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xi16>
              %33 = pto.vcvt %32, %mask_2 {rnd = "Z"} : !pto.vreg<128xi16>, !pto.mask<b16> -> !pto.vreg<128xf16>
              %34 = pto.vcvt %33, %mask_2 {part = "EVEN", rnd = "Z", sat = "NOSAT"} : !pto.vreg<128xf16>, !pto.mask<b16> -> !pto.vreg<256xsi8>
              %35 = pto.addptr %7, %29 : <i8, ub> -> <i8, ub>
              pto.vsts %34, %35[%c0], %mask_4 {dist = "PK_B16"} : !pto.vreg<256xsi8>, !pto.ptr<i8, ub>, !pto.mask<b16>
            } {pto.tilelib.candidate = "template_tcvt_f16_to_si8", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
          }
          pto.set_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          pto.wait_flag[<PIPE_V>, <PIPE_MTE3>, <EVENT_ID1>]
          %20 = arith.addi %10, %arg8 : index
          %21 = pto.addptr %arg0, %20 : <i8, gm> -> <i8, gm>
          %22 = pto.addptr %21, %c0 : <i8, gm> -> <i8, gm>
          pto.copy_ubuf_to_gm %8, %22, %c0_i64, %c64_i64, %c32_i64, %c0_i64, %c128_i64, %c32_i64 : !pto.ptr<i8, ub>, !pto.ptr<i8, gm>, i64, i64, i64, i64, i64, i64
          pto.set_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
        }
        pto.set_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE3>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_V>, <PIPE_S>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE3>, <PIPE_V>, <EVENT_ID1>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
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
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
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
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        %15 = arith.muli %14, %c64 : index
        %16 = pto.addptr %arg3, %15 : <bf16, gm> -> <bf16, gm>
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %16, %3, %c0_i64, %c128_i64, %c0_i64, %c64_i64, %c64_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %arg4, %4, %c0_i64, %c256_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        %17 = pto.declare_tile_memref -> memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>>
        %18 = pto.materialize_tile %17, %c64, %c64 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>
        pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
        pto.tpop(%18, %0 : !pto.tile_buf<mat, 64x64xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
        pto.set_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_S>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        %19 = pto.castptr %17 : memref<64x64xbf16, strided<[16, 64], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
        pto.load_cbuf_to_ca %19, %5, %c0_i64, %c0_i64, %c4_i64, %c4_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
        pto.tfree(%0 : !pto.pipe) {split = 0}
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c4_i64, %c8_i64, %c4_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
        pto.set_ctrl %12 : i64
        pto.mad_raw %5, %6, %7, %c-6917529025493336000_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %8 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID2>]
        pto.set_mte2_nz_para %c274877972481_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %13, %4, %c0_i64, %c256_i64, %c0_i64, %c64_i64, %c128_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
        pto.set_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_ca %3, %5, %c0_i64, %c0_i64, %c4_i64, %c4_i64, %c4_i64, %c4_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_MTE1>, <EVENT_ID1>]
        pto.load_cbuf_to_cb %4, %6, %c0_i64, %c0_i64, %c4_i64, %c8_i64, %c4_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
        pto.set_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
        pto.wait_flag[<PIPE_MTE1>, <PIPE_M>, <EVENT_ID1>]
        pto.set_ctrl %12 : i64
        pto.mad_raw %5, %6, %7, %c2305843011361439808_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
        pto.set_ctrl %8 : i64
        pto.set_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
        pto.set_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
        pto.wait_flag[<PIPE_M>, <PIPE_FIX>, <EVENT_ID0>]
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
        pto.set_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_MTE2>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE1>, <PIPE_S>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_M>, <PIPE_MTE1>, <EVENT_ID0>]
      pto.wait_flag[<PIPE_FIX>, <PIPE_M>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
