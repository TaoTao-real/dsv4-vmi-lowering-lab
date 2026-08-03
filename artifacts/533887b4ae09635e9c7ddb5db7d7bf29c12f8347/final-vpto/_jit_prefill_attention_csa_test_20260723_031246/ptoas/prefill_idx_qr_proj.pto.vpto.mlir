module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_proj_aiv(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c256_i16 = arith.constant 256 : i16
      %c1_i16 = arith.constant 1 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i32 = arith.constant 0 : i32
      %c131072_i64 = arith.constant 131072 : i64
      %c132096_i64 = arith.constant 132096 : i64
      %c148480_i64 = arith.constant 148480 : i64
      %c128 = arith.constant 128 : index
      %c8192 = arith.constant 8192 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64 = arith.constant 64 : index
      %c16_i64 = arith.constant 16 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c64_i64 = arith.constant 64 : i64
      %c256_i32 = arith.constant 256 : i32
      %c192 = arith.constant 192 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 16384, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg5 : i32 to index
      %2 = arith.muli %1, %c256 : index
      %3 = pto.addptr %arg2, %2 : <f32, gm> -> <f32, gm>
      %4 = pto.castptr %c131072_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %3, %4, %c0_i64, %c1_i64, %c1024_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c1024_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %5 = pto.castptr %c148480_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
      %7 = pto.castptr %c132096_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.addptr %7, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg7 = %c0 to %c128 step %c16 {
        %9 = pto.declare_tile_memref -> memref<16x256xi32, strided<[256, 1], offset: ?>, #pto.address_space<vec>>
        %10 = builtin.unrealized_conversion_cast %9 : memref<16x256xi32, strided<[256, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<i32, ub>
        %11 = pto.materialize_tile %9, %c16, %c256 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<16x256xi32, strided<[256, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 16x256xi32, valid=?x?>
        pto.tpop(%11, %0 : !pto.tile_buf<vec, 16x256xi32, valid=?x?>, !pto.pipe) {split = 0}
        pto.vecscope {
          %mask, %scalar_out = pto.plt_b32 %c256_i32 : i32 -> !pto.mask<b32>, i32
          scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %19 = arith.index_cast %arg8 : i16 to index
            %20 = arith.muli %19, %c256 : index
            scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16  : i16 {
              %21 = arith.index_cast %arg9 : i16 to index
              %22 = arith.addi %20, %21 : index
              %23 = pto.addptr %10, %22 : <i32, ub> -> <i32, ub>
              %result = pto.vlds %23[%c0] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
              %24 = pto.vcvt %result, %mask {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %25 = pto.addptr %7, %22 : <f32, ub> -> <f32, ub>
              pto.vsts %24, %25[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            }
          } {pto.tilelib.candidate = "template_tcvt_i32_to_f32", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.tfree(%0 : !pto.pipe) {split = 0}
        %12 = pto.addptr %arg4, %arg7 : <f32, gm> -> <f32, gm>
        %13 = pto.addptr %12, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %13, %6, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c64_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.vecscope {
          scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %19 = arith.index_cast %arg8 : i16 to index
            %20 = arith.muli %19, %c256 : index
            %21 = pto.addptr %5, %19 : <f32, ub> -> <f32, ub>
            %22 = scf.for %arg9 = %c0_i16 to %c256_i16 step %c64_i16 iter_args(%arg10 = %c256) -> (index)  : i16 {
              %23 = arith.index_cast %arg9 : i16 to index
              %24 = arith.index_cast %arg10 : index to i32
              %mask, %scalar_out = pto.plt_b32 %24 : i32 -> !pto.mask<b32>, i32
              %25 = arith.index_cast %scalar_out : i32 to index
              %26 = arith.addi %20, %23 : index
              %27 = pto.addptr %7, %26 : <f32, ub> -> <f32, ub>
              %result = pto.vlds %27[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_0 = pto.vlds %21[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %28 = pto.vdup %result_0, %mask {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              %29 = pto.vmul %result, %28, %mask : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
              pto.vsts %29, %27[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              scf.yield %25 : index
            }
          } {pto.tilelib.candidate = "template_trowexpandmul", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
        }
        %14 = pto.alloc_tile addr = %c132096_i64 valid_row = %c16 valid_col = %c256 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 16x256xf32, valid=?x?>
        pto.vecscope {
          %19 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_0 = pto.vlds %4[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_1 = pto.vlds %4[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_2 = pto.vlds %4[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg8 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
            %21 = arith.index_cast %arg8 : i16 to index
            %22 = arith.muli %21, %c256 : index
            %result_3 = pto.vlds %7[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %23 = arith.addi %22, %c64 : index
            %result_4 = pto.vlds %7[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %24 = arith.addi %22, %c128 : index
            %result_5 = pto.vlds %7[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %25 = arith.addi %22, %c192 : index
            %result_6 = pto.vlds %7[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %26 = pto.vmul %result_3, %result, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %27 = pto.vmul %result_4, %result_0, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %28 = pto.vmul %result_5, %result_1, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %29 = pto.vmul %result_6, %result_2, %20 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %26, %7[%22], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %27, %7[%23], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %28, %7[%24], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %29, %7[%25], %19 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
        }
        %15 = arith.muli %arg7, %c8192 : index
        %16 = arith.addi %15, %2 : index
        %17 = pto.addptr %arg3, %16 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_ubuf_to_gm %8, %18, %c0_i64, %c16_i64, %c1024_i64, %c0_i64, %c32768_i64, %c1024_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      }
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @prefill_idx_qr_proj_aic(%arg0: !pto.ptr<i8, gm>, %arg1: !pto.ptr<i8, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: i32, %arg6: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c2305843013509185664_i64 = arith.constant 2305843013509185664 : i64
      %c-6917529023345590144_i64 = arith.constant -6917529023345590144 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c16_i64 = arith.constant 16 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c64_i64 = arith.constant 64 : i64
      %c0_i32 = arith.constant 0 : i32
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c49152_i64 = arith.constant 49152 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c128 = arith.constant 128 : index
      %c8192 = arith.constant 8192 : index
      %c256 = arith.constant 256 : index
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c2 = arith.constant 2 : index
      %c16 = arith.constant 16 : index
      %c128_i64 = arith.constant 128 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %false = arith.constant false
      %c256_i64 = arith.constant 256 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c1048576 = arith.constant 1048576 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 1, slot_size = 16384, slot_num = 8, flag_base = 0, nosplit = true} (%c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg5 : i32 to index
      %2 = arith.muli %1, %c256 : index
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l1>
      %4 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<i8, l1>
      %5 = pto.castptr %c49152_i64 : i64 -> !pto.ptr<i8, l1>
      %6 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<i8, l1>
      %7 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<i8, l0a>
      %8 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<i8, l0b>
      %9 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i32, l0c>
      %10 = pto.get_ctrl : i64
      %11 = pto.sbitset0 %10, %c45_i64 : i64, i64 -> i64
      %12 = pto.sbitset0 %11, %c46_i64 : i64, i64 -> i64
      %13 = pto.sbitset0 %12, %c47_i64 : i64, i64 -> i64
      %14 = pto.sbitset0 %13, %c51_i64 : i64, i64 -> i64
      scf.for %arg7 = %c0 to %c8 step %c2 {
        %15 = arith.muli %arg7, %c128 : index
        %16 = arith.addi %15, %c128 : index
        %17 = pto.addptr %arg0, %15 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %17, %3, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %18 = arith.muli %arg7, %c1048576 : index
        %19 = arith.addi %18, %2 : index
        %20 = pto.addptr %arg1, %19 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %20, %4, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %21 = pto.addptr %arg0, %16 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %21, %5, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c128_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %22 = arith.muli %16, %c8192 : index
        %23 = arith.addi %22, %2 : index
        %24 = pto.addptr %arg1, %23 : <i8, gm> -> <i8, gm>
        pto.set_mte2_nz_para %c549755879425_i64 : i64
        pto.copy_gm_to_cbuf_multi_nd2nz %24, %6, %c0_i64, %c8192_i64, %c0_i64, %c128_i64, %c256_i64, %c0_i64, %false : !pto.ptr<i8, gm>, !pto.ptr<i8, l1>, i64, i64, i64, i64, i64, i64, i1
        %25 = arith.cmpi eq, %15, %c0 : index
        scf.if %25 {
          %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
          pto.load_cbuf_to_ca %3, %26, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
          %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
          pto.load_cbuf_to_cb %4, %27, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %14 : i64
          pto.mad_raw %26, %27, %9, %c-6917529023345590144_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
          pto.set_ctrl %10 : i64
        } else {
          %26 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0a>
          pto.load_cbuf_to_ca %3, %26, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
          %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<i8, l0b>
          pto.load_cbuf_to_cb %4, %27, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
          pto.set_ctrl %14 : i64
          pto.mad_raw %26, %27, %9, %c2305843013509185664_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
          pto.set_ctrl %10 : i64
        }
        pto.load_cbuf_to_ca %5, %7, %c0_i64, %c0_i64, %c8_i64, %c4_i64, %c8_i64, %c8_i64 : !pto.ptr<i8, l1>, !pto.ptr<i8, l0a>, i64, i64, i64, i64, i64, i64
        pto.load_cbuf_to_cb %6, %8, %c0_i64, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c16_i64 {transpose = true} : !pto.ptr<i8, l1>, !pto.ptr<i8, l0b>, i64, i64, i64, i64, i64, i64
        pto.set_ctrl %14 : i64
        pto.mad_raw %7, %8, %9, %c2305843013509185664_i64 : !pto.ptr<i8, l0a>, !pto.ptr<i8, l0b>, !pto.ptr<i32, l0c>, i64
        pto.set_ctrl %10 : i64
      }
      scf.for %arg7 = %c0 to %c128 step %c16 {
        %15 = arith.index_cast %arg7 : index to i64
        %16 = arith.muli %15, %c64_i64 : i64
        %17 = pto.alloc_tile addr = %16 : !pto.tile_buf<acc, 128x256xi32, valid=16x256, blayout=col_major, slayout=row_major, fractal=1024>
        pto.tpush(%17, %0 : !pto.tile_buf<acc, 128x256xi32, valid=16x256, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
      }
      return
    }
  }
}

