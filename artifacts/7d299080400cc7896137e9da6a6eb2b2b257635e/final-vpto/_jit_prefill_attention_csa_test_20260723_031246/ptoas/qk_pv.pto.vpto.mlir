module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c65728_i64 = arith.constant 65728 : i64
      %c65600_i64 = arith.constant 65600 : i64
      %c96 = arith.constant 96 : index
      %c0_i32 = arith.constant 0 : i32
      %c73984_i64 = arith.constant 73984 : i64
      %c74496_i64 = arith.constant 74496 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c65792_i64 = arith.constant 65792 : i64
      %c1 = arith.constant 1 : index
      %c128 = arith.constant 128 : index
      %c384 = arith.constant 384 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c2 = arith.constant 2 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant 0.0441941731 : f32
      %c48 = arith.constant 48 : index
      %c16 = arith.constant 16 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32_i16 = arith.constant 32 : i16
      %c1_i16 = arith.constant 1 : i16
      %c512_i64 = arith.constant 512 : i64
      %c64 = arith.constant 64 : index
      %cst_0 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %cst_1 = arith.constant 0.000000e+00 : f32
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg6 : i32 to index
      %2 = arith.cmpi slt, %1, %c128 : index
      scf.if %2 {
        %3 = arith.muli %1, %c192 : index
        %4 = arith.muli %1, %c384 : index
        %5 = pto.castptr %c73984_i64 : i64 -> !pto.ptr<f32, ub>
        %6 = pto.addptr %5, %c0 : <f32, ub> -> <f32, ub>
        %7 = pto.castptr %c74496_i64 : i64 -> !pto.ptr<f32, ub>
        %8 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
        %9 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
        %10 = pto.castptr %c74496_i64 : i64 -> !pto.ptr<bf16, ub>
        %11 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
        %12 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
        %13 = pto.castptr %c65600_i64 : i64 -> !pto.ptr<f32, ub>
        %14 = pto.addptr %13, %c0 : <f32, ub> -> <f32, ub>
        %15 = pto.castptr %c65728_i64 : i64 -> !pto.ptr<f32, ub>
        %16 = pto.addptr %15, %c0 : <f32, ub> -> <f32, ub>
        scf.for %arg8 = %c0 to %c3 step %c1 {
          %17 = arith.muli %arg8, %c128 : index
          %18 = arith.addi %4, %17 : index
          %19 = pto.addptr %arg4, %18 : <f32, gm> -> <f32, gm>
          %20 = pto.addptr %19, %c0 : <f32, gm> -> <f32, gm>
          pto.copy_gm_to_ubuf %20, %6, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
          %21 = arith.muli %arg8, %c16 : index
          scf.for %arg9 = %c0 to %c2 step %c1 {
            %22 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
            %23 = builtin.unrealized_conversion_cast %22 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
            %24 = pto.materialize_tile %22, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.tpop(%24, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
            %25 = pto.alloc_tile addr = %c74496_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.vecscope {
              %43 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %45 = pto.vdup %cst, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %46 = arith.index_cast %arg10 : i16 to index
                %47 = arith.muli %46, %c128 : index
                %result = pto.vlds %23[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %48 = arith.addi %47, %c64 : index
                %result_2 = pto.vlds %23[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %49 = pto.vmul %result, %45, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %50 = pto.vmul %result_2, %45, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %49, %7[%47], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %50, %7[%48], %43 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
            }
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_2 = pto.vlds %5[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %43 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              %44 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %45 = pto.vdup %cst_0, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %46 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
              %47 = pto.pand %43, %mask, %44 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              %48 = pto.vdup %cst_1, %44 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %49 = arith.index_cast %arg10 : i16 to index
                %50 = arith.muli %49, %c128 : index
                %result_3 = pto.vlds %7[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %51 = arith.addi %50, %c64 : index
                %result_4 = pto.vlds %7[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %52 = pto.vadd %result_3, %result, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %53 = pto.vadd %result_4, %result_2, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %54 = pto.vmax %52, %53, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %55 = pto.vcmax %54, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %56 = pto.vmax %55, %45, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %56, %8[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %57 = pto.vdup %56, %44 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %58 = pto.vsub %52, %57, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %59 = pto.vsub %53, %57, %44 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %60 = pto.vexp %58, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.vexp %59, %44 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %60, %7[%50], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %61, %7[%51], %46 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %62 = pto.vadd %60, %61, %46 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %63 = pto.vcadd %62, %46 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.vadd %63, %48, %43 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %64, %9[%49], %47 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %49 = arith.index_cast %arg10 : i16 to index
                %50 = arith.muli %49, %c128 : index
                %result_3 = pto.vlds %7[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %51 = arith.addi %50, %c64 : index
                %result_4 = pto.vlds %7[%51] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %52 = pto.vcvt %result_3, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %53 = pto.vcvt %result_4, %44 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                pto.vsts %52, %10[%50], %46 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
                pto.vsts %53, %10[%51], %46 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            %26 = pto.alloc_tile addr = %c65792_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            pto.vecscope {
              %43 = pto.castptr %c65792_i64 : i64 -> !pto.ptr<bf16, ub>
              %44 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
              %45 = scf.for %arg10 = %c0_i16 to %c32_i16 step %c1_i16 iter_args(%arg11 = %43) -> (!pto.ptr<bf16, ub>)  : i16 {
                %46 = arith.index_cast %arg10 : i16 to index
                %47 = arith.muli %46, %c128 : index
                %result = pto.vlds %10[%47] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %48 = pto.addptr %arg11, %c0 : <bf16, ub> -> <bf16, ub>
                %49 = pto.vsstb %result, %48, %c32_i16, %c1_i16, %44 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
                scf.yield %49 : !pto.ptr<bf16, ub>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.tpush(%26, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
            %27 = arith.muli %arg9, %c2 : index
            %28 = arith.muli %arg9, %c96 : index
            %29 = arith.addi %3, %28 : index
            %30 = arith.addi %29, %21 : index
            %31 = pto.addptr %arg1, %30 : <f32, gm> -> <f32, gm>
            %32 = pto.addptr %31, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %11, %32, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %33 = pto.addptr %arg0, %30 : <f32, gm> -> <f32, gm>
            %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %12, %34, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %35 = arith.addi %27, %c1 : index
            %36 = arith.muli %35, %c48 : index
            %37 = arith.addi %3, %36 : index
            %38 = arith.addi %37, %21 : index
            %39 = pto.addptr %arg1, %38 : <f32, gm> -> <f32, gm>
            %40 = pto.addptr %39, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %14, %40, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %41 = pto.addptr %arg0, %38 : <f32, gm> -> <f32, gm>
            %42 = pto.addptr %41, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %16, %42, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qk_pv_aic(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<bf16, gm>, %arg6: i32, %arg7: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022240_i64 = arith.constant 8796093022240 : i64
      %c2199024312320_i64 = arith.constant 2199024312320 : i64
      %c1_i64 = arith.constant 1 : i64
      %c2305843017803759648_i64 = arith.constant 2305843017803759648 : i64
      %c-6917529019051016160_i64 = arith.constant -6917529019051016160 : i64
      %c2305843011361701920_i64 = arith.constant 2305843011361701920 : i64
      %c-6917529025493073888_i64 = arith.constant -6917529025493073888 : i64
      %c51_i64 = arith.constant 51 : i64
      %c47_i64 = arith.constant 47 : i64
      %c46_i64 = arith.constant 46 : i64
      %c45_i64 = arith.constant 45 : i64
      %c8_i64 = arith.constant 8 : i64
      %c2_i64 = arith.constant 2 : i64
      %c137439019009_i64 = arith.constant 137439019009 : i64
      %c549755879425_i64 = arith.constant 549755879425 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c0_i32 = arith.constant 0 : i32
      %c144 = arith.constant 144 : index
      %c96 = arith.constant 96 : index
      %c48 = arith.constant 48 : index
      %c65536_i64 = arith.constant 65536 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c327680_i64 = arith.constant 327680 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c128 = arith.constant 128 : index
      %c384 = arith.constant 384 : index
      %c192 = arith.constant 192 : index
      %c0 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c64 = arith.constant 64 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %c16 = arith.constant 16 : index
      %c128_i64 = arith.constant 128 : i64
      %c512_i64 = arith.constant 512 : i64
      %false = arith.constant false
      %c32_i64 = arith.constant 32 : i64
      %c32768 = arith.constant 32768 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg6 : i32 to index
      %2 = arith.cmpi slt, %1, %c128 : index
      scf.if %2 {
        %3 = arith.muli %1, %c384 : index
        %4 = arith.muli %1, %c192 : index
        %5 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, l1>
        %6 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
        %7 = arith.muli %1, %c64 : index
        %8 = arith.muli %1, %c32768 : index
        %9 = pto.addptr %arg5, %8 : <bf16, gm> -> <bf16, gm>
        %10 = pto.castptr %c327680_i64 : i64 -> !pto.ptr<bf16, l1>
        %11 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
        %12 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
        %13 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
        %14 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
        %15 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
        %16 = pto.get_ctrl : i64
        %17 = pto.sbitset0 %16, %c45_i64 : i64, i64 -> i64
        %18 = pto.sbitset0 %17, %c46_i64 : i64, i64 -> i64
        %19 = pto.sbitset0 %18, %c47_i64 : i64, i64 -> i64
        %20 = pto.sbitset0 %19, %c51_i64 : i64, i64 -> i64
        %21 = arith.addi %7, %c32 : index
        %22 = arith.muli %21, %c512 : index
        %23 = pto.addptr %arg5, %22 : <bf16, gm> -> <bf16, gm>
        %24 = arith.addi %4, %c48 : index
        %25 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, l0c>
        %26 = arith.addi %4, %c96 : index
        %27 = arith.addi %4, %c144 : index
        scf.for %arg8 = %c0 to %c3 step %c1 {
          %28 = arith.muli %arg8, %c128 : index
          %29 = arith.addi %3, %28 : index
          %30 = arith.muli %29, %c512 : index
          %31 = pto.addptr %arg3, %30 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c549755879425_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %31, %5, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_mte2_nz_para %c549755879425_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %31, %6, %c0_i64, %c1024_i64, %c0_i64, %c128_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %9, %10, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %32 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          scf.for %arg9 = %c0 to %c512 step %c256 {
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %11, %c0_i64, %54, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %12, %55, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %56 = arith.addi %arg9, %c128 : index
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %13, %c0_i64, %58, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %14, %59, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %60 = arith.cmpi eq, %arg9, %c0 : index
            scf.if %60 {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
          }
          pto.tpush(%32, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %23, %10, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %33 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          scf.for %arg9 = %c0 to %c512 step %c256 {
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %11, %c0_i64, %54, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %12, %55, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %56 = arith.addi %arg9, %c128 : index
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %10, %13, %c0_i64, %58, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %5, %14, %59, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %60 = arith.cmpi eq, %arg9, %c0 : index
            scf.if %60 {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
          }
          pto.tpush(%33, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          %34 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %35 = pto.materialize_tile %34, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tpop(%35, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          %36 = pto.castptr %34 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg9 = %c0 to %c128 step %c64 {
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %36, %11, %c0_i64, %54, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %12, %55, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %56 = arith.addi %arg9, %c32 : index
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %36, %13, %c0_i64, %58, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %14, %59, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %60 = arith.cmpi eq, %arg9, %c0 : index
            scf.if %60 {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %37 = arith.muli %arg8, %c16 : index
          %38 = arith.addi %4, %37 : index
          %39 = arith.muli %38, %c512 : index
          %40 = pto.addptr %arg2, %39 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %15, %40, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %41 = arith.addi %24, %37 : index
          %42 = arith.muli %41, %c512 : index
          %43 = pto.addptr %arg2, %42 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %25, %43, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %44 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %45 = pto.materialize_tile %44, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tpop(%45, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          %46 = pto.castptr %44 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg9 = %c0 to %c128 step %c64 {
            %53 = arith.index_cast %arg9 : index to i32
            %54 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %46, %11, %c0_i64, %54, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %55 = arith.extsi %53 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %12, %55, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %56 = arith.addi %arg9, %c32 : index
            %57 = arith.index_cast %56 : index to i32
            %58 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %46, %13, %c0_i64, %58, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %59 = arith.extsi %57 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %6, %14, %59, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %60 = arith.cmpi eq, %arg9, %c0 : index
            scf.if %60 {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            } else {
              pto.set_ctrl %20 : i64
              pto.mad_raw %11, %12, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %16 : i64
            }
            pto.set_ctrl %20 : i64
            pto.mad_raw %13, %14, %15, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %16 : i64
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %47 = arith.addi %26, %37 : index
          %48 = arith.muli %47, %c512 : index
          %49 = pto.addptr %arg2, %48 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %15, %49, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %50 = arith.addi %27, %37 : index
          %51 = arith.muli %50, %c512 : index
          %52 = pto.addptr %arg2, %51 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %25, %52, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
        }
      }
      return
    }
  }
}
