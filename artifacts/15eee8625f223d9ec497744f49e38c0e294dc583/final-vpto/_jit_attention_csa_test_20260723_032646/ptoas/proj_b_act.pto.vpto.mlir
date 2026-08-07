module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @proj_b_act(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<bf16, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c2048_i64 = arith.constant 2048 : i64
      %c18432_i64 = arith.constant 18432 : i64
      %c34816_i64 = arith.constant 34816 : i64
      %c34848_i64 = arith.constant 34848 : i64
      %c51232_i64 = arith.constant 51232 : i64
      %c4096 = arith.constant 4096 : index
      %c1 = arith.constant 1 : index
      %c8 = arith.constant 8 : index
      %c512 = arith.constant 512 : index
      %cst = arith.constant 0.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c2 = arith.constant 2 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c8_i64 = arith.constant 8 : i64
      %c1024_i64 = arith.constant 1024 : i64
      %c8192_i64 = arith.constant 8192 : i64
      %c32_i64 = arith.constant 32 : i64
      %c131072_i64 = arith.constant 131072 : i64
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c512 : index
      pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c2048_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      %4 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xf32, valid=?x?>
      %5 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %21 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %23 = pto.vdup %cst, %22 : f32, !pto.mask<b32> -> !pto.vreg<64xf32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %24 = arith.index_cast %arg6 : i16 to index
          %25 = arith.muli %24, %c512 : index
          pto.vsts %23, %5[%25], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %26 = arith.addi %25, %c64 : index
          pto.vsts %23, %5[%26], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %27 = arith.addi %25, %c128 : index
          pto.vsts %23, %5[%27], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %28 = arith.addi %25, %c192 : index
          pto.vsts %23, %5[%28], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %29 = arith.addi %25, %c256 : index
          pto.vsts %23, %5[%29], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %30 = arith.addi %25, %c320 : index
          pto.vsts %23, %5[%30], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %31 = arith.addi %25, %c384 : index
          pto.vsts %23, %5[%31], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          %32 = arith.addi %25, %c448 : index
          pto.vsts %23, %5[%32], %21 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_texpands", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "texpands"}
      }
      %6 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<i32, ub>
      %7 = pto.addptr %6, %c0 : <i32, ub> -> <i32, ub>
      %8 = pto.castptr %c34816_i64 : i64 -> !pto.ptr<f32, ub>
      %9 = pto.addptr %8, %c0 : <f32, ub> -> <f32, ub>
      %10 = pto.castptr %c34848_i64 : i64 -> !pto.ptr<i32, ub>
      %11 = pto.addptr %10, %c0 : <i32, ub> -> <i32, ub>
      %12 = pto.castptr %c51232_i64 : i64 -> !pto.ptr<f32, ub>
      %13 = pto.addptr %12, %c0 : <f32, ub> -> <f32, ub>
      %14 = pto.castptr %c18432_i64 : i64 -> !pto.ptr<f32, ub>
      %15 = pto.castptr %c34848_i64 : i64 -> !pto.ptr<f32, ub>
      scf.for %arg6 = %c0 to %c8 step %c2 {
        %21 = arith.muli %arg6, %c4096 : index
        %22 = arith.addi %21, %1 : index
        %23 = arith.addi %22, %c4096 : index
        pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
        %24 = pto.addptr %arg1, %22 : <i32, gm> -> <i32, gm>
        %25 = pto.addptr %24, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %25, %7, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        %26 = arith.muli %arg6, %c8 : index
        %27 = pto.addptr %arg2, %26 : <f32, gm> -> <f32, gm>
        %28 = pto.addptr %27, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %28, %9, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        %29 = pto.addptr %arg1, %23 : <i32, gm> -> <i32, gm>
        %30 = pto.addptr %29, %c0 : <i32, gm> -> <i32, gm>
        pto.copy_gm_to_ubuf %30, %11, %c0_i64, %c8_i64, %c2048_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c131072_i64, %c2048_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        %31 = arith.addi %arg6, %c1 : index
        %32 = arith.muli %31, %c8 : index
        %33 = pto.addptr %arg2, %32 : <f32, gm> -> <f32, gm>
        %34 = pto.addptr %33, %c0 : <f32, gm> -> <f32, gm>
        pto.copy_gm_to_ubuf %34, %13, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
        pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
        pto.vecscope {
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result = pto.vlds %6[%38] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %39 = arith.addi %38, %c64 : index
            %result_0 = pto.vlds %6[%39] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %40 = arith.addi %38, %c128 : index
            %result_1 = pto.vlds %6[%40] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %41 = arith.addi %38, %c192 : index
            %result_2 = pto.vlds %6[%41] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %42 = arith.addi %38, %c256 : index
            %result_3 = pto.vlds %6[%42] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %43 = arith.addi %38, %c320 : index
            %result_4 = pto.vlds %6[%43] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %44 = arith.addi %38, %c384 : index
            %result_5 = pto.vlds %6[%44] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %45 = arith.addi %38, %c448 : index
            %result_6 = pto.vlds %6[%45] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %46 = pto.vcvt %result, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vcvt %result_0, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vcvt %result_1, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vcvt %result_2, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vcvt %result_3, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vcvt %result_4, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vcvt %result_5, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vcvt %result_6, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %14[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %14[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %14[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %14[%41], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %14[%42], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %14[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %14[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %14[%45], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
        pto.vecscope {
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %result = pto.vlds %8[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vdup %result, %35 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = arith.muli %37, %c512 : index
            %result_0 = pto.vlds %14[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_1 = pto.vlds %14[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_2 = pto.vlds %14[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_3 = pto.vlds %14[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_4 = pto.vlds %14[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_5 = pto.vlds %14[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_6 = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_7 = pto.vlds %14[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_0, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_1, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_2, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_3, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_4, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_5, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_6, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_7, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %result_8 = pto.vlds %5[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %5[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %5[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %5[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %5[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %5[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %5[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %5[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vadd %result_8, %47, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result_9, %48, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_10, %49, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %result_11, %50, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %result_12, %51, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_13, %52, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %result_14, %53, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %result_15, %54, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %14[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %14[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %14[%41], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %14[%42], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %14[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %14[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %14[%45], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %14[%46], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID2>]
        pto.vecscope {
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %38 = arith.muli %37, %c512 : index
            %result = pto.vlds %10[%38] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %39 = arith.addi %38, %c64 : index
            %result_0 = pto.vlds %10[%39] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %40 = arith.addi %38, %c128 : index
            %result_1 = pto.vlds %10[%40] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %41 = arith.addi %38, %c192 : index
            %result_2 = pto.vlds %10[%41] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %42 = arith.addi %38, %c256 : index
            %result_3 = pto.vlds %10[%42] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %43 = arith.addi %38, %c320 : index
            %result_4 = pto.vlds %10[%43] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %44 = arith.addi %38, %c384 : index
            %result_5 = pto.vlds %10[%44] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %45 = arith.addi %38, %c448 : index
            %result_6 = pto.vlds %10[%45] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
            %46 = pto.vcvt %result, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %47 = pto.vcvt %result_0, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vcvt %result_1, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vcvt %result_2, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vcvt %result_3, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vcvt %result_4, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vcvt %result_5, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vcvt %result_6, %35 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %46, %15[%38], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %47, %15[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %15[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %15[%41], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %15[%42], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %15[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %15[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %15[%45], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
        }
        pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID3>]
        pto.vecscope {
          %35 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
          %36 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
          scf.for %arg7 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
            %37 = arith.index_cast %arg7 : i16 to index
            %result = pto.vlds %12[%37] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %38 = pto.vdup %result, %35 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %39 = arith.muli %37, %c512 : index
            %result_0 = pto.vlds %15[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %40 = arith.addi %39, %c64 : index
            %result_1 = pto.vlds %15[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %41 = arith.addi %39, %c128 : index
            %result_2 = pto.vlds %15[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %42 = arith.addi %39, %c192 : index
            %result_3 = pto.vlds %15[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %43 = arith.addi %39, %c256 : index
            %result_4 = pto.vlds %15[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %44 = arith.addi %39, %c320 : index
            %result_5 = pto.vlds %15[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %45 = arith.addi %39, %c384 : index
            %result_6 = pto.vlds %15[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %46 = arith.addi %39, %c448 : index
            %result_7 = pto.vlds %15[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %47 = pto.vmul %result_0, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %48 = pto.vmul %result_1, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %49 = pto.vmul %result_2, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %50 = pto.vmul %result_3, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %51 = pto.vmul %result_4, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %52 = pto.vmul %result_5, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %53 = pto.vmul %result_6, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %54 = pto.vmul %result_7, %38, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %47, %15[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %48, %15[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %49, %15[%41], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %50, %15[%42], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %51, %15[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %52, %15[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %53, %15[%45], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %54, %15[%46], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            %result_8 = pto.vlds %14[%39] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_9 = pto.vlds %14[%40] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_10 = pto.vlds %14[%41] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_11 = pto.vlds %14[%42] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_12 = pto.vlds %14[%43] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_13 = pto.vlds %14[%44] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_14 = pto.vlds %14[%45] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %result_15 = pto.vlds %14[%46] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
            %55 = pto.vadd %result_8, %47, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %56 = pto.vadd %result_9, %48, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %57 = pto.vadd %result_10, %49, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %58 = pto.vadd %result_11, %50, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %59 = pto.vadd %result_12, %51, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %60 = pto.vadd %result_13, %52, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %61 = pto.vadd %result_14, %53, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            %62 = pto.vadd %result_15, %54, %35 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
            pto.vsts %55, %5[%39], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %56, %5[%40], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %57, %5[%41], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %58, %5[%42], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %59, %5[%43], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %60, %5[%44], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %61, %5[%45], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
            pto.vsts %62, %5[%46], %36 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          } {pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib"}
        }
        pto.set_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      }
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID4>]
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_0 = pto.vlds %3[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_1 = pto.vlds %3[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %3[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %3[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %3[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %3[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %3[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c512 : index
          %result_7 = pto.vlds %5[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %24, %c64 : index
          %result_8 = pto.vlds %5[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %24, %c128 : index
          %result_9 = pto.vlds %5[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %24, %c192 : index
          %result_10 = pto.vlds %5[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %24, %c256 : index
          %result_11 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %24, %c320 : index
          %result_12 = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %24, %c384 : index
          %result_13 = pto.vlds %5[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %24, %c448 : index
          %result_14 = pto.vlds %5[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vmul %result_7, %result, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %33 = pto.vmul %result_8, %result_0, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %34 = pto.vmul %result_9, %result_1, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %35 = pto.vmul %result_10, %result_2, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_11, %result_3, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_12, %result_4, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_13, %result_5, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_14, %result_6, %21 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %32, %5[%24], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %33, %5[%25], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %34, %5[%26], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %35, %5[%27], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %36, %5[%28], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %5[%29], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %5[%30], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %5[%31], %22 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %16 = pto.alloc_tile addr = %c2048_i64 valid_row = %c8 valid_col = %c512 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x512xbf16, valid=?x?>
      %17 = pto.castptr %c2048_i64 : i64 -> !pto.ptr<bf16, ub>
      pto.vecscope {
        %21 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %22 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %23 = arith.index_cast %arg6 : i16 to index
          %24 = arith.muli %23, %c512 : index
          %result = pto.vlds %5[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %24, %c64 : index
          %result_0 = pto.vlds %5[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %24, %c128 : index
          %result_1 = pto.vlds %5[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %24, %c192 : index
          %result_2 = pto.vlds %5[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %24, %c256 : index
          %result_3 = pto.vlds %5[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %24, %c320 : index
          %result_4 = pto.vlds %5[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %24, %c384 : index
          %result_5 = pto.vlds %5[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %24, %c448 : index
          %result_6 = pto.vlds %5[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = pto.vcvt %result, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %33 = pto.vcvt %result_0, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %34 = pto.vcvt %result_1, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %35 = pto.vcvt %result_2, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %36 = pto.vcvt %result_3, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %37 = pto.vcvt %result_4, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %38 = pto.vcvt %result_5, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          %39 = pto.vcvt %result_6, %21 {part = "EVEN", rnd = "R", sat = "NOSAT"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<128xbf16>
          pto.vsts %32, %17[%24], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %33, %17[%25], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %34, %17[%26], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %35, %17[%27], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %36, %17[%28], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %37, %17[%29], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %38, %17[%30], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
          pto.vsts %39, %17[%31], %22 {dist = "PK_B32"} : !pto.vreg<128xbf16>, !pto.ptr<bf16, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %18 = pto.addptr %arg3, %1 : <bf16, gm> -> <bf16, gm>
      %19 = pto.addptr %17, %c0 : <bf16, ub> -> <bf16, ub>
      %20 = pto.addptr %18, %c0 : <bf16, gm> -> <bf16, gm>
      pto.copy_ubuf_to_gm %19, %20, %c0_i64, %c8_i64, %c1024_i64, %c0_i64, %c8192_i64, %c1024_i64 : !pto.ptr<bf16, ub>, !pto.ptr<bf16, gm>, i64, i64, i64, i64, i64, i64
      pto.wait_flag[<PIPE_V>, <PIPE_MTE2>, <EVENT_ID0>]
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
