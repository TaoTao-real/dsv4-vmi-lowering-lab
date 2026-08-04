module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @qk_pv_aiv(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c64_i16 = arith.constant 64 : i16
      %c512_i16 = arith.constant 512 : i16
      %c16_i16 = arith.constant 16 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c82624_i64 = arith.constant 82624 : i64
      %c82496_i64 = arith.constant 82496 : i64
      %c160 = arith.constant 160 : index
      %c63 = arith.constant 63 : index
      %c0_i32 = arith.constant 0 : i32
      %c65536_i64 = arith.constant 65536 : i64
      %c90880_i64 = arith.constant 90880 : i64
      %c82432_i64 = arith.constant 82432 : i64
      %c82560_i64 = arith.constant 82560 : i64
      %c82688_i64 = arith.constant 82688 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c640 = arith.constant 640 : index
      %c5 = arith.constant 5 : index
      %c128 = arith.constant 128 : index
      %c4 = arith.constant 4 : index
      %c32 = arith.constant 32 : index
      %c24 = arith.constant 24 : index
      %c0 = arith.constant 0 : index
      %c320 = arith.constant 320 : index
      %c2 = arith.constant 2 : index
      %cst = arith.constant 0.0441941731 : f32
      %c80 = arith.constant 80 : index
      %c16 = arith.constant 16 : index
      %cst_0 = arith.constant 0.000000e+00 : f32
      %cst_1 = arith.constant -3.000000e+38 : f32
      %c16_i64 = arith.constant 16 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c0_i64 = arith.constant 0 : i64
      %c64 = arith.constant 64 : index
      %c1_i64 = arith.constant 1 : i64
      %c128_i64 = arith.constant 128 : i64
      %c64_i64 = arith.constant 64 : i64
      %c32_i16 = arith.constant 32 : i16
      %c1_i16 = arith.constant 1 : i16
      %c512_i64 = arith.constant 512 : i64
      %cst_2 = arith.constant 0xFF800000 : f32
      %c1_i32 = arith.constant 1 : i32
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg12 : i32 to index
      %2 = arith.subi %c63, %1 : index
      %3 = arith.divsi %2, %c24 : index
      %4 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.addptr %4, %c0 : <f32, ub> -> <f32, ub>
      scf.for %arg14 = %c0 to %3 step %c1 {
        %6 = arith.muli %arg14, %c24 : index
        %7 = arith.addi %1, %6 : index
        %8 = pto.load_scalar %arg3[%7] : !pto.ptr<i32, gm> -> i32
        %9 = arith.index_cast %8 : i32 to index
        %10 = arith.divsi %9, %c5 : index
        %11 = arith.muli %10, %c5 : index
        %12 = arith.subi %9, %11 : index
        %13 = arith.muli %10, %c320 : index
        %14 = arith.muli %12, %c128 : index
        %15 = arith.muli %10, %c640 : index
        %16 = arith.addi %15, %14 : index
        %17 = pto.addptr %arg4, %16 : <f32, gm> -> <f32, gm>
        %18 = pto.addptr %17, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %18, %5, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c512_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %19 = pto.load_scalar %arg5[%9] : !pto.ptr<i32, gm> -> i32
        %20 = arith.index_cast %19 : i32 to index
        %21 = arith.cmpi sgt, %20, %c0 : index
        scf.if %21 {
          %22 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<f32, ub>
          %23 = pto.castptr %c82432_i64 : i64 -> !pto.ptr<f32, ub>
          %24 = pto.castptr %c82560_i64 : i64 -> !pto.ptr<f32, ub>
          %25 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<bf16, ub>
          %26 = arith.muli %12, %c16 : index
          %27 = pto.addptr %23, %c0 : <f32, ub> -> <f32, ub>
          %28 = pto.addptr %24, %c0 : <f32, ub> -> <f32, ub>
          %29 = pto.castptr %c82496_i64 : i64 -> !pto.ptr<f32, ub>
          %30 = pto.addptr %29, %c0 : <f32, ub> -> <f32, ub>
          %31 = pto.castptr %c82624_i64 : i64 -> !pto.ptr<f32, ub>
          %32 = pto.addptr %31, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg15 = %c0 to %c2 step %c1 {
            %33 = pto.declare_tile_memref -> memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>>
            %34 = builtin.unrealized_conversion_cast %33 : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> to !pto.ptr<f32, ub>
            %35 = pto.materialize_tile %33, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<row_major>, slayout=#pto.slayout<none_box>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xf32, strided<[128, 1], offset: ?>, #pto.address_space<vec>> -> !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.tpop(%35, %0 : !pto.tile_buf<vec, 32x128xf32, valid=?x?>, !pto.pipe) {split = 0}
            %36 = pto.alloc_tile addr = %c90880_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xf32, valid=?x?>
            pto.vecscope {
              %54 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %56 = pto.vdup %cst, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %57 = arith.index_cast %arg16 : i16 to index
                %58 = arith.muli %57, %c128 : index
                %result = pto.vlds %34[%58] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %59 = arith.addi %58, %c64 : index
                %result_3 = pto.vlds %34[%59] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %60 = pto.vmul %result, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %61 = pto.vmul %result_3, %56, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %60, %22[%58], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %61, %22[%59], %54 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tmuls", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmuls"}
            }
            pto.tfree(%0 : !pto.pipe) {split = 0}
            pto.vecscope {
              %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %result_3 = pto.vlds %4[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
              %54 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
              %55 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
              %56 = pto.vdup %cst_2, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              %57 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
              %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
              %58 = pto.pand %54, %mask, %55 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
              %59 = pto.vdup %cst_0, %55 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %60 = arith.index_cast %arg16 : i16 to index
                %61 = arith.muli %60, %c128 : index
                %result_4 = pto.vlds %22[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = arith.addi %61, %c64 : index
                %result_5 = pto.vlds %22[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %63 = pto.vadd %result_4, %result, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %64 = pto.vadd %result_5, %result_3, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %65 = pto.vmax %63, %64, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %66 = pto.vcmax %65, %57 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %67 = pto.vmax %66, %56, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %67, %23[%60], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %68 = pto.vdup %67, %55 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %69 = pto.vsub %63, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %70 = pto.vsub %64, %68, %55 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %71 = pto.vexp %69, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %72 = pto.vexp %70, %55 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %71, %22[%61], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                pto.vsts %72, %22[%62], %57 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                %73 = pto.vadd %71, %72, %57 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %74 = pto.vcadd %73, %57 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                %75 = pto.vadd %74, %59, %54 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
                pto.vsts %75, %24[%60], %58 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
              } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
              scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16  : i16 {
                %60 = arith.index_cast %arg16 : i16 to index
                %61 = arith.muli %60, %c128 : index
                %result_4 = pto.vlds %22[%61] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %62 = arith.addi %61, %c64 : index
                %result_5 = pto.vlds %22[%62] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
                %63 = pto.vcvt %result_4, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                %64 = pto.vcvt %result_5, %55 {part = "EVEN", rnd = "R", sat = "SAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
                pto.vsts %63, %25[%61], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
                pto.vsts %64, %25[%62], %57 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
              } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
            }
            %37 = pto.alloc_tile addr = %c82688_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
            pto.vecscope {
              %54 = pto.castptr %c82688_i64 : i64 -> !pto.ptr<bf16, ub>
              %55 = pto.pge_b16 "PAT_ALL" : !pto.mask<b16>
              %56 = scf.for %arg16 = %c0_i16 to %c32_i16 step %c1_i16 iter_args(%arg17 = %54) -> (!pto.ptr<bf16, ub>)  : i16 {
                %57 = arith.index_cast %arg16 : i16 to index
                %58 = arith.muli %57, %c128 : index
                %result = pto.vlds %25[%58] : !pto.ptr<bf16, ub> -> !pto.vreg<128xbf16>
                %59 = pto.addptr %arg17, %c0 : <bf16, ub> -> <bf16, ub>
                %60 = pto.vsstb %result, %59, %c32_i16, %c1_i16, %55 : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, i16, i16, !pto.mask<b16> -> !pto.ptr<bf16, ub>
                scf.yield %60 : !pto.ptr<bf16, ub>
              } {pto.tilelib.candidate = "vmi_tmov", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmov"}
            }
            pto.tpush(%37, %0 : !pto.tile_buf<vec, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
            %38 = arith.muli %arg15, %c2 : index
            %39 = arith.muli %arg15, %c160 : index
            %40 = arith.addi %13, %39 : index
            %41 = arith.addi %40, %26 : index
            %42 = pto.addptr %arg1, %41 : <f32, gm> -> <f32, gm>
            %43 = pto.addptr %42, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %27, %43, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %44 = pto.addptr %arg0, %41 : <f32, gm> -> <f32, gm>
            %45 = pto.addptr %44, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %28, %45, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %46 = arith.addi %38, %c1 : index
            %47 = arith.muli %46, %c80 : index
            %48 = arith.addi %13, %47 : index
            %49 = arith.addi %48, %26 : index
            %50 = pto.addptr %arg1, %49 : <f32, gm> -> <f32, gm>
            %51 = pto.addptr %50, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %30, %51, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
            %52 = pto.addptr %arg0, %49 : <f32, gm> -> <f32, gm>
            %53 = pto.addptr %52, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %32, %53, %c0_i64, %c1_i64, %c64_i64, %c0_i64, %c0_i64, %c128_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        } else {
          %22 = pto.castptr %c90880_i64 : i64 -> !pto.ptr<f32, ub>
          pto.vecscope {
            scf.for %arg15 = %c0_i16 to %c16_i16 step %c1_i16  : i16 {
              %25 = arith.index_cast %arg15 : i16 to index
              %26 = arith.muli %25, %c512 : index
              %27 = scf.for %arg16 = %c0_i16 to %c512_i16 step %c64_i16 iter_args(%arg17 = %c512) -> (index)  : i16 {
                %28 = arith.index_cast %arg16 : i16 to index
                %29 = arith.index_cast %arg17 : index to i32
                %mask, %scalar_out = pto.plt_b32 %29 : i32 -> !pto.mask<b32>, i32
                %30 = arith.index_cast %scalar_out : i32 to index
                %31 = pto.vdup %cst_0, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
                %32 = arith.addi %26, %28 : index
                %33 = pto.addptr %22, %32 : <f32, ub> -> <f32, ub>
                pto.vsts %31, %33[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
                scf.yield %30 : index
              }
            } {pto.tilelib.candidate = "template_texpands", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "local", pto.vmi.fusion.boundary_reason = "non_vmi_local_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
          }
          %23 = arith.muli %12, %c16 : index
          %24 = pto.addptr %22, %c0 : <f32, ub> -> <f32, ub>
          scf.for %arg15 = %c0 to %c4 step %c1 {
            %25 = arith.muli %arg15, %c80 : index
            %26 = arith.addi %13, %25 : index
            %27 = arith.addi %26, %23 : index
            scf.for %arg16 = %c0 to %c16 step %c1 {
              %31 = arith.addi %27, %arg16 : index
              pto.store_scalar %cst_1, %arg1[%31] : !pto.ptr<f32, gm>, f32
              pto.store_scalar %cst_0, %arg0[%31] : !pto.ptr<f32, gm>, f32
            }
            %28 = arith.muli %27, %c512 : index
            %29 = pto.addptr %arg2, %28 : <f32, gm> -> <f32, gm>
            %30 = pto.addptr %29, %c0 : <f32, gm> -> <f32, gm>
            pto.copy_ubuf_to_gm %24, %30, %c0_i64, %c16_i64, %c2048_i64, %c0_i64, %c2048_i64, %c2048_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
          }
        }
      }
      return
    }
  }
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<cube>, pto.target_arch = "a5"} {
    func.func @qk_pv_aic(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<i32, gm>, %arg4: !pto.ptr<f32, gm>, %arg5: !pto.ptr<i32, gm>, %arg6: !pto.ptr<i32, gm>, %arg7: !pto.ptr<bf16, gm>, %arg8: !pto.ptr<i32, gm>, %arg9: !pto.ptr<i32, gm>, %arg10: !pto.ptr<bf16, gm>, %arg11: !pto.ptr<bf16, gm>, %arg12: i32, %arg13: i32) attributes {pto.kernel_kind = #pto.kernel_kind<cube>} {
      %c8796093022240_i64 = arith.constant 8796093022240 : i64
      %c2199024312320_i64 = arith.constant 2199024312320 : i64
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
      %c4295032833_i64 = arith.constant 4295032833 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c32_i64 = arith.constant 32 : i64
      %c63 = arith.constant 63 : index
      %c0_i32 = arith.constant 0 : i32
      %c240 = arith.constant 240 : index
      %c160 = arith.constant 160 : index
      %c80 = arith.constant 80 : index
      %c65536_i64 = arith.constant 65536 : i64
      %c196608_i64 = arith.constant 196608 : i64
      %c0_i64 = arith.constant 0 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c1 = arith.constant 1 : index
      %c512 = arith.constant 512 : index
      %c5 = arith.constant 5 : index
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %c24 = arith.constant 24 : index
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c320 = arith.constant 320 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %c16 = arith.constant 16 : index
      %c512_i64 = arith.constant 512 : i64
      %c1_i64 = arith.constant 1 : i64
      %false = arith.constant false
      %c32768 = arith.constant 32768 : index
      %0 = pto.initialize_l2l_pipe{dir_mask = 3, slot_size = 16384, slot_num = 4, flag_base = 0, nosplit = true} (%c0_i32 : i32, %c0_i32 : i32) {__pto.frontend_id = 0 : i32} -> !pto.pipe
      %1 = arith.index_cast %arg12 : i32 to index
      %2 = arith.subi %c63, %1 : index
      %3 = arith.divsi %2, %c24 : index
      scf.for %arg14 = %c0 to %3 step %c1 {
        %4 = arith.muli %arg14, %c24 : index
        %5 = arith.addi %1, %4 : index
        %6 = pto.load_scalar %arg3[%5] : !pto.ptr<i32, gm> -> i32
        %7 = arith.index_cast %6 : i32 to index
        %8 = arith.divsi %7, %c5 : index
        %9 = arith.muli %8, %c5 : index
        %10 = arith.subi %7, %9 : index
        %11 = arith.divsi %8, %c2 : index
        %12 = arith.muli %8, %c320 : index
        %13 = arith.muli %10, %c128 : index
        %14 = pto.load_scalar %arg5[%7] : !pto.ptr<i32, gm> -> i32
        %15 = arith.index_cast %14 : i32 to index
        %16 = arith.cmpi sgt, %15, %c0 : index
        scf.if %16 {
          scf.for %arg15 = %c0 to %c128 step %c1 {
            %60 = arith.addi %13, %arg15 : index
            %61 = arith.cmpi slt, %60, %c128 : index
            scf.if %61 {
              %62 = arith.muli %8, %c128 : index
              %63 = arith.addi %62, %60 : index
              %64 = pto.load_scalar %arg6[%63] : !pto.ptr<i32, gm> -> i32
              %65 = arith.index_cast %64 : i32 to index
              %66 = arith.cmpi sge, %65, %c0 : index
              scf.if %66 {
                %67 = arith.index_cast %arg15 : index to i64
                %68 = arith.muli %67, %c32_i64 : i64
                %69 = arith.addi %68, %c65536_i64 : i64
                %70 = arith.muli %65, %c512 : index
                %71 = pto.addptr %arg7, %70 : <bf16, gm> -> <bf16, gm>
                %72 = pto.castptr %69 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %71, %72, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              } else {
                %67 = arith.index_cast %arg15 : index to i64
                %68 = arith.muli %67, %c32_i64 : i64
                %69 = arith.addi %68, %c65536_i64 : i64
                %70 = pto.castptr %69 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %70, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              }
            } else {
              %62 = arith.subi %60, %c128 : index
              %63 = arith.cmpi slt, %62, %c512 : index
              scf.if %63 {
                %64 = arith.muli %8, %c512 : index
                %65 = arith.addi %64, %62 : index
                %66 = pto.load_scalar %arg8[%65] : !pto.ptr<i32, gm> -> i32
                %67 = arith.index_cast %66 : i32 to index
                %68 = arith.cmpi sge, %67, %c0 : index
                scf.if %68 {
                  %69 = arith.divsi %67, %c128 : index
                  %70 = arith.muli %11, %c32 : index
                  %71 = arith.addi %70, %69 : index
                  %72 = pto.load_scalar %arg9[%71] : !pto.ptr<i32, gm> -> i32
                  %73 = arith.index_cast %72 : i32 to index
                  %74 = arith.muli %73, %c128 : index
                  %75 = arith.remsi %67, %c128 : index
                  %76 = arith.addi %74, %75 : index
                  %77 = arith.index_cast %arg15 : index to i64
                  %78 = arith.muli %77, %c32_i64 : i64
                  %79 = arith.addi %78, %c65536_i64 : i64
                  %80 = arith.muli %76, %c512 : index
                  %81 = pto.addptr %arg10, %80 : <bf16, gm> -> <bf16, gm>
                  %82 = pto.castptr %79 : i64 -> !pto.ptr<bf16, l1>
                  pto.set_mte2_nz_para %c4295032833_i64 : i64
                  pto.copy_gm_to_cbuf_multi_nd2nz %81, %82, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
                } else {
                  %69 = arith.index_cast %arg15 : index to i64
                  %70 = arith.muli %69, %c32_i64 : i64
                  %71 = arith.addi %70, %c65536_i64 : i64
                  %72 = pto.castptr %71 : i64 -> !pto.ptr<bf16, l1>
                  pto.set_mte2_nz_para %c4295032833_i64 : i64
                  pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %72, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
                }
              } else {
                %64 = arith.index_cast %arg15 : index to i64
                %65 = arith.muli %64, %c32_i64 : i64
                %66 = arith.addi %65, %c65536_i64 : i64
                %67 = pto.castptr %66 : i64 -> !pto.ptr<bf16, l1>
                pto.set_mte2_nz_para %c4295032833_i64 : i64
                pto.copy_gm_to_cbuf_multi_nd2nz %arg7, %67, %c0_i64, %c1024_i64, %c0_i64, %c1_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
              }
            }
          }
          %17 = arith.muli %8, %c64 : index
          %18 = arith.muli %8, %c32768 : index
          %19 = pto.addptr %arg11, %18 : <bf16, gm> -> <bf16, gm>
          %20 = pto.castptr %c196608_i64 : i64 -> !pto.ptr<bf16, l1>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %19, %20, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %21 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          %22 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0a>
          %23 = pto.castptr %c65536_i64 : i64 -> !pto.ptr<bf16, l1>
          %24 = pto.castptr %c0_i64 : i64 -> !pto.ptr<bf16, l0b>
          %25 = pto.castptr %c8192_i64 : i64 -> !pto.ptr<bf16, l0a>
          %26 = pto.castptr %c32768_i64 : i64 -> !pto.ptr<bf16, l0b>
          %27 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, l0c>
          %28 = pto.get_ctrl : i64
          %29 = pto.sbitset0 %28, %c45_i64 : i64, i64 -> i64
          %30 = pto.sbitset0 %29, %c46_i64 : i64, i64 -> i64
          %31 = pto.sbitset0 %30, %c47_i64 : i64, i64 -> i64
          %32 = pto.sbitset0 %31, %c51_i64 : i64, i64 -> i64
          scf.for %arg15 = %c0 to %c512 step %c256 {
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %22, %c0_i64, %61, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %63 = arith.addi %arg15, %c128 : index
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %25, %c0_i64, %65, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %67 = arith.cmpi eq, %arg15, %c0 : index
            scf.if %67 {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
          }
          pto.tpush(%21, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          %33 = arith.addi %17, %c32 : index
          %34 = arith.muli %33, %c512 : index
          %35 = pto.addptr %arg11, %34 : <bf16, gm> -> <bf16, gm>
          pto.set_mte2_nz_para %c137439019009_i64 : i64
          pto.copy_gm_to_cbuf_multi_nd2nz %35, %20, %c0_i64, %c1024_i64, %c0_i64, %c32_i64, %c512_i64, %c0_i64, %false : !pto.ptr<bf16, gm>, !pto.ptr<bf16, l1>, i64, i64, i64, i64, i64, i64, i1
          %36 = pto.alloc_tile addr = %c0_i64 valid_row = %c32 valid_col = %c128 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>
          scf.for %arg15 = %c0 to %c512 step %c256 {
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %22, %c0_i64, %61, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %63 = arith.addi %arg15, %c128 : index
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %20, %25, %c0_i64, %65, %c2_i64, %c8_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right_trans", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c8_i64, %c8_i64, %c8_i64, %c8_i64 {transpose = true} : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %67 = arith.cmpi eq, %arg15, %c0 : index
            scf.if %67 {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529025493073888_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843011361701920_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
          }
          pto.tpush(%36, %0 : !pto.tile_buf<acc, 32x128xf32, valid=?x?, blayout=col_major, slayout=row_major, fractal=1024>, !pto.pipe) {split = 0}
          %37 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %38 = pto.materialize_tile %37, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tpop(%38, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          %39 = pto.castptr %37 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg15 = %c0 to %c128 step %c64 {
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %39, %22, %c0_i64, %61, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %63 = arith.addi %arg15, %c32 : index
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %39, %25, %c0_i64, %65, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %67 = arith.cmpi eq, %arg15, %c0 : index
            scf.if %67 {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %40 = arith.muli %10, %c16 : index
          %41 = arith.addi %12, %40 : index
          %42 = arith.muli %41, %c512 : index
          %43 = pto.addptr %arg2, %42 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %27, %43, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %44 = arith.addi %12, %c80 : index
          %45 = arith.addi %44, %40 : index
          %46 = pto.castptr %c1024_i64 : i64 -> !pto.ptr<f32, l0c>
          %47 = arith.muli %45, %c512 : index
          %48 = pto.addptr %arg2, %47 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %46, %48, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %49 = pto.declare_tile_memref -> memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>>
          %50 = pto.materialize_tile %49, %c32, %c128 {__pto.force_dynamic_valid_shape, config = #pto.tile_buf_config<blayout=#pto.blayout<col_major>, slayout=#pto.slayout<row_major>, s_fractal_size=512, pad=#pto.pad_value<null>, compact=#pto.compact_mode<null>>} : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>
          pto.tpop(%50, %0 : !pto.tile_buf<mat, 32x128xbf16, valid=?x?, blayout=col_major, slayout=row_major>, !pto.pipe) {split = 0}
          %51 = pto.castptr %49 : memref<32x128xbf16, strided<[16, 32], offset: ?>, #pto.address_space<mat>> -> !pto.ptr<bf16, l1>
          scf.for %arg15 = %c0 to %c128 step %c64 {
            %60 = arith.index_cast %arg15 : index to i32
            %61 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %51, %22, %c0_i64, %61, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %62 = arith.extsi %60 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %24, %62, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %63 = arith.addi %arg15, %c32 : index
            %64 = arith.index_cast %63 : index to i32
            %65 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2left", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_ca %51, %25, %c0_i64, %65, %c2_i64, %c2_i64, %c2_i64, %c2_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0a>, i64, i64, i64, i64, i64, i64
            %66 = arith.extsi %64 {pto.tilelib.candidate = "template_textract_mat2right", pto.tilelib.impl = "ptodsl", pto.vmi.fusion.boundary = "hard", pto.vmi.fusion.boundary_reason = "non_vmi_hard_boundary_fallback", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "textract"} : i32 to i64
            pto.load_cbuf_to_cb %23, %26, %66, %c0_i64, %c32_i64, %c2_i64, %c32_i64, %c32_i64 : !pto.ptr<bf16, l1>, !pto.ptr<bf16, l0b>, i64, i64, i64, i64, i64, i64
            %67 = arith.cmpi eq, %arg15, %c0 : index
            scf.if %67 {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c-6917529019051016160_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            } else {
              pto.set_ctrl %32 : i64
              pto.mad_raw %22, %24, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
              pto.set_ctrl %28 : i64
            }
            pto.set_ctrl %32 : i64
            pto.mad_raw %25, %26, %27, %c2305843017803759648_i64 : !pto.ptr<bf16, l0a>, !pto.ptr<bf16, l0b>, !pto.ptr<f32, l0c>, i64
            pto.set_ctrl %28 : i64
          }
          pto.tfree(%0 : !pto.pipe) {split = 0}
          %52 = arith.addi %12, %c160 : index
          %53 = arith.addi %52, %40 : index
          %54 = arith.muli %53, %c512 : index
          %55 = pto.addptr %arg2, %54 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %27, %55, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
          %56 = arith.addi %12, %c240 : index
          %57 = arith.addi %56, %40 : index
          %58 = arith.muli %57, %c512 : index
          %59 = pto.addptr %arg2, %58 : <f32, gm> -> <f32, gm>
          pto.set_loop3_para %c1_i64, %c0_i64 : i64, i64
          pto.set_channel_para %c0_i64, %c0_i64 : i64, i64
          pto.copy_matrix_cc_to_gm %46, %59, %c2199024312320_i64, %c8796093022240_i64 : !pto.ptr<f32, l0c>, !pto.ptr<f32, gm>, i64, i64
        }
      }
      return
    }
  }
}
