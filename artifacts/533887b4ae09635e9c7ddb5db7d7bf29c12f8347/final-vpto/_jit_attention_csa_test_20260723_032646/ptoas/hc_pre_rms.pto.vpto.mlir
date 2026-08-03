module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @hc_pre_rms(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<f32, gm>, %arg2: index, %arg3: index, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c32832_i64 = arith.constant 32832 : i64
      %c49280_i64 = arith.constant 49280 : i64
      %c65664_i64 = arith.constant 65664 : i64
      %c82048_i64 = arith.constant 82048 : i64
      %c98432_i64 = arith.constant 98432 : i64
      %c131200_i64 = arith.constant 131200 : i64
      %c0_i64 = arith.constant 0 : i64
      %c16384_i64 = arith.constant 16384 : i64
      %c32800_i64 = arith.constant 32800 : i64
      %c49248_i64 = arith.constant 49248 : i64
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c4 = arith.constant 4 : index
      %c512 = arith.constant 512 : index
      %c1024 = arith.constant 1024 : index
      %c1536 = arith.constant 1536 : index
      %cst_0 = arith.constant 6.10351563E-5 : f32
      %cst_1 = arith.constant 9.99999997E-7 : f32
      %c1_i64 = arith.constant 1 : i64
      %c32_i64 = arith.constant 32 : i64
      %cst_2 = arith.constant 1.000000e+00 : f32
      %c8_i64 = arith.constant 8 : i64
      %c65536_i64 = arith.constant 65536 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c8_i32 = arith.constant 8 : i32
      %c131072 = arith.constant 131072 : index
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c1_i32 = arith.constant 1 : i32
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c8 : index
      %2 = pto.castptr %c32832_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %14 = pto.vdup %cst, %mask : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %15 = pto.addptr %2, %c0 : <f32, ub> -> <f32, ub>
        pto.vsts %14, %15[%c0], %mask : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %3 = arith.muli %0, %c131072 : index
      %4 = pto.castptr %c49280_i64 : i64 -> !pto.ptr<f32, ub>
      %5 = pto.castptr %c65664_i64 : i64 -> !pto.ptr<f32, ub>
      %6 = pto.castptr %c82048_i64 : i64 -> !pto.ptr<f32, ub>
      %7 = pto.castptr %c98432_i64 : i64 -> !pto.ptr<f32, ub>
      %8 = pto.castptr %c131200_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.castptr %c16384_i64 : i64 -> !pto.ptr<f32, ub>
      %10 = pto.castptr %c32800_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c32 step %c4 {
        %14 = arith.muli %arg6, %c512 : index
        %15 = arith.addi %14, %c512 : index
        %16 = arith.addi %14, %c1024 : index
        %17 = arith.addi %14, %c1536 : index
        %18 = arith.addi %3, %14 : index
        %19 = pto.addptr %arg0, %18 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %19, %4, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %20 = arith.addi %3, %15 : index
        %21 = pto.addptr %arg0, %20 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %21, %5, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %22 = arith.addi %3, %16 : index
        %23 = pto.addptr %arg0, %22 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %23, %6, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %24 = arith.addi %3, %17 : index
        %25 = pto.addptr %arg0, %24 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c65536_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        %26 = pto.alloc_tile addr = %c49280_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.vecscope {
          %33 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %4[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %4[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %4[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %4[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %4[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result, %result, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_3, %result_3, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_4, %result_4, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_5, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_6, %result_6, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_7, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_8, %result_8, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_9, %result_9, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %4[%39], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %4[%40], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %4[%41], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %4[%42], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %4[%43], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %4[%44], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %4[%45], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %4[%46], %33 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %35 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %36 = pto.vdup %cst, %34 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pand %35, %mask, %34 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %4[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %4[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %4[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %4[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %4[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %4[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %4[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %4[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %47, %result_4, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %48, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %49, %result_6, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %50, %result_7, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %51, %result_8, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %52, %result_9, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vcadd %53, %33 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %36, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %8[%38], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %27 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %33 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %8[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %35 = pto.vadd %result, %result_3, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %36 = pto.pand %33, %mask, %34 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %35, %4[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %28 = pto.alloc_tile addr = %c65664_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.vecscope {
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %5[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %5[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %5[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %5[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %5[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %5[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %5[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_3, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_4, %result_4, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_5, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_6, %result_6, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_7, %result_7, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_8, %result_8, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_9, %result_9, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %5[%39], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %5[%40], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %5[%41], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %5[%42], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %5[%43], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %5[%44], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %5[%45], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %5[%46], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %35 = pto.vdup %cst, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pand %36, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %5[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %5[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %5[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %5[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %5[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %5[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %5[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result, %result_3, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %47, %result_4, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %48, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %49, %result_6, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %50, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %51, %result_8, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %52, %result_9, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vcadd %53, %34 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %35, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %9[%38], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %29 = pto.alloc_tile addr = %c65664_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %9[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.vadd %result, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %36 = pto.pand %35, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %34, %5[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %30 = pto.alloc_tile addr = %c82048_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.vecscope {
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %6[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %6[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %6[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %6[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %6[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result, %result, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_3, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_4, %result_4, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_5, %result_5, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_6, %result_6, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_7, %result_7, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_8, %result_8, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_9, %result_9, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %6[%39], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %6[%40], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %6[%41], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %6[%42], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %6[%43], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %6[%44], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %6[%45], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %6[%46], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %35 = pto.vdup %cst, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %37 = pto.pand %36, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %38 = arith.index_cast %arg7 : i16 to index
            %39 = arith.muli %38, %c512 : index
            %result = pto.vlds %6[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_3 = pto.vlds %6[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_4 = pto.vlds %6[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_5 = pto.vlds %6[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_6 = pto.vlds %6[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_7 = pto.vlds %6[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_8 = pto.vlds %6[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_9 = pto.vlds %6[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vadd %result, %result_3, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vadd %47, %result_4, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vadd %48, %result_5, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vadd %49, %result_6, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vadd %50, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %51, %result_8, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %52, %result_9, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vcadd %53, %34 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %35, %36 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %10[%38], %37 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
        }
        %31 = pto.alloc_tile addr = %c82048_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
        pto.vecscope {
          %result = pto.vlds %5[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %10[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.vadd %result, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %36 = pto.pand %35, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %34, %6[%c0], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
        %32 = pto.alloc_tile addr = %c98432_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
        pto.vecscope {
          %33 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %34 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %42 = arith.index_cast %arg7 : i16 to index
            %43 = arith.muli %42, %c512 : index
            %result_6 = pto.vlds %7[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %43, %c64 : index
            %result_7 = pto.vlds %7[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %43, %c128 : index
            %result_8 = pto.vlds %7[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %43, %c192 : index
            %result_9 = pto.vlds %7[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = arith.addi %43, %c256 : index
            %result_10 = pto.vlds %7[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = arith.addi %43, %c320 : index
            %result_11 = pto.vlds %7[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = arith.addi %43, %c384 : index
            %result_12 = pto.vlds %7[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = arith.addi %43, %c448 : index
            %result_13 = pto.vlds %7[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_6, %result_6, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_7, %result_7, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_8, %result_8, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_9, %result_9, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vmul %result_10, %result_10, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vmul %result_11, %result_11, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vmul %result_12, %result_12, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vmul %result_13, %result_13, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %51, %7[%43], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %7[%44], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %7[%45], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %7[%46], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %55, %7[%47], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %7[%48], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %7[%49], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %7[%50], %34 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tmul"}
          %35 = pto.castptr %c49248_i64 : i64 -> !pto.ptr<f32, ub>
          %36 = pto.vdup %cst, %33 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.pge_b32 "PAT_VL1" : !pto.mask<b32>
          %mask, %scalar_out = pto.plt_b32 %c1_i32 : i32 -> !pto.mask<b32>, i32
          %38 = pto.pand %37, %mask, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %42 = arith.index_cast %arg7 : i16 to index
            %43 = arith.muli %42, %c512 : index
            %result_6 = pto.vlds %7[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %43, %c64 : index
            %result_7 = pto.vlds %7[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %43, %c128 : index
            %result_8 = pto.vlds %7[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %43, %c192 : index
            %result_9 = pto.vlds %7[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = arith.addi %43, %c256 : index
            %result_10 = pto.vlds %7[%47] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %48 = arith.addi %43, %c320 : index
            %result_11 = pto.vlds %7[%48] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %49 = arith.addi %43, %c384 : index
            %result_12 = pto.vlds %7[%49] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %50 = arith.addi %43, %c448 : index
            %result_13 = pto.vlds %7[%50] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %51 = pto.vadd %result_6, %result_7, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vadd %51, %result_8, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vadd %52, %result_9, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vadd %53, %result_10, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %55 = pto.vadd %54, %result_11, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %55, %result_12, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %56, %result_13, %34 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vcadd %57, %34 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %58, %36, %37 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %59, %35[%42], %38 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_trowsum", pto.tilelib.impl = "vmi", pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowsum"}
          %result = pto.vlds %6[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %result_3 = pto.vlds %35[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %39 = pto.vadd %result, %result_3, %33 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
          %mask_4, %scalar_out_5 = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
          %41 = pto.pand %40, %mask_4, %33 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
          pto.vsts %39, %2[%c0], %41 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        }
      }
      %11 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %14 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %result = pto.vlds %2[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %15 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %16 = pto.vdup %cst_0, %15 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.vmul %result, %16, %15 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pand %14, %mask, %15 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %17, %4[%c0], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %12 = pto.alloc_tile addr = %c49280_i64 valid_row = %c1 valid_col = %c8 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 1x8xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %14 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %15 = pto.vdup %cst_1, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %16 = pto.vadd %result, %15, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %17 = pto.pge_b32 "PAT_VL8" : !pto.mask<b32>
        %mask, %scalar_out = pto.plt_b32 %c8_i32 : i32 -> !pto.mask<b32>, i32
        %18 = pto.pand %17, %mask, %14 : !pto.mask<b32>, !pto.mask<b32>, !pto.mask<b32> -> !pto.mask<b32>
        pto.vsts %16, %4[%c0], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        %result_3 = pto.vlds %4[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %19 = pto.vsqrt %result_3, %14 : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        %20 = pto.vdup %cst_2, %14 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        %21 = pto.vdiv %20, %19, %14 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
        pto.vsts %21, %6[%c0], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
      }
      %13 = pto.addptr %arg1, %1 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %6, %13, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      return
    }
  }
}

