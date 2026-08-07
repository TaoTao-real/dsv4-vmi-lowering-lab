module attributes {pto.backend = "vpto", pto.target_arch = "a5"} {
  module attributes {pto.backend = "vpto", pto.kernel_kind = #pto.kernel_kind<vector>, pto.target_arch = "a5"} {
    func.func @idx_qr_proj_dequant(%arg0: !pto.ptr<f32, gm>, %arg1: !pto.ptr<i32, gm>, %arg2: !pto.ptr<f32, gm>, %arg3: !pto.ptr<f32, gm>, %arg4: i32, %arg5: i32) attributes {pto.kernel_kind = #pto.kernel_kind<vector>} {
      %c1_i16 = arith.constant 1 : i16
      %c8_i16 = arith.constant 8 : i16
      %c0_i16 = arith.constant 0 : i16
      %false = arith.constant false
      %c0_i64 = arith.constant 0 : i64
      %c4096_i64 = arith.constant 4096 : i64
      %c36864_i64 = arith.constant 36864 : i64
      %c8 = arith.constant 8 : index
      %c1024 = arith.constant 1024 : index
      %c1_i64 = arith.constant 1 : i64
      %c4_i64 = arith.constant 4 : i64
      %c0 = arith.constant 0 : index
      %c8_i64 = arith.constant 8 : i64
      %c32768_i64 = arith.constant 32768 : i64
      %c32_i64 = arith.constant 32 : i64
      %c64 = arith.constant 64 : index
      %c128 = arith.constant 128 : index
      %c192 = arith.constant 192 : index
      %c256 = arith.constant 256 : index
      %c320 = arith.constant 320 : index
      %c384 = arith.constant 384 : index
      %c448 = arith.constant 448 : index
      %c512 = arith.constant 512 : index
      %c576 = arith.constant 576 : index
      %c640 = arith.constant 640 : index
      %c704 = arith.constant 704 : index
      %c768 = arith.constant 768 : index
      %c832 = arith.constant 832 : index
      %c896 = arith.constant 896 : index
      %c960 = arith.constant 960 : index
      %0 = arith.index_cast %arg4 : i32 to index
      %1 = arith.muli %0, %c1024 : index
      %2 = pto.addptr %arg0, %1 : <f32, gm> -> <f32, gm>
      %3 = pto.castptr %c0_i64 : i64 -> !pto.ptr<f32, ub>
      pto.copy_gm_to_ubuf %2, %3, %c0_i64, %c1_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c4_i64, %c4096_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      %4 = pto.addptr %arg1, %1 : <i32, gm> -> <i32, gm>
      %5 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<i32, ub>
      %6 = pto.addptr %4, %c0 : <i32, gm> -> <i32, gm>
      %7 = pto.addptr %5, %c0 : <i32, ub> -> <i32, ub>
      pto.copy_gm_to_ubuf %6, %7, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<i32, gm>, !pto.ptr<i32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %8 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID0>]
      %9 = pto.castptr %c4096_i64 : i64 -> !pto.ptr<f32, ub>
      pto.vecscope {
        %17 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c1024 : index
          %result = pto.vlds %5[%20] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %21 = arith.addi %20, %c64 : index
          %result_0 = pto.vlds %5[%21] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %22 = arith.addi %20, %c128 : index
          %result_1 = pto.vlds %5[%22] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %23 = arith.addi %20, %c192 : index
          %result_2 = pto.vlds %5[%23] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %24 = arith.addi %20, %c256 : index
          %result_3 = pto.vlds %5[%24] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %25 = arith.addi %20, %c320 : index
          %result_4 = pto.vlds %5[%25] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %26 = arith.addi %20, %c384 : index
          %result_5 = pto.vlds %5[%26] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %27 = arith.addi %20, %c448 : index
          %result_6 = pto.vlds %5[%27] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %28 = arith.addi %20, %c512 : index
          %result_7 = pto.vlds %5[%28] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %29 = arith.addi %20, %c576 : index
          %result_8 = pto.vlds %5[%29] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %30 = arith.addi %20, %c640 : index
          %result_9 = pto.vlds %5[%30] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %31 = arith.addi %20, %c704 : index
          %result_10 = pto.vlds %5[%31] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %32 = arith.addi %20, %c768 : index
          %result_11 = pto.vlds %5[%32] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %33 = arith.addi %20, %c832 : index
          %result_12 = pto.vlds %5[%33] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %34 = arith.addi %20, %c896 : index
          %result_13 = pto.vlds %5[%34] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %35 = arith.addi %20, %c960 : index
          %result_14 = pto.vlds %5[%35] : !pto.ptr<i32, ub> -> !pto.vreg<64xi32>
          %36 = pto.vcvt %result, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vcvt %result_0, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vcvt %result_1, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vcvt %result_2, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vcvt %result_3, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vcvt %result_4, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vcvt %result_5, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vcvt %result_6, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vcvt %result_7, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vcvt %result_8, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vcvt %result_9, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vcvt %result_10, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vcvt %result_11, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vcvt %result_12, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vcvt %result_13, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vcvt %result_14, %18 {rnd = "R"} : !pto.vreg<64xi32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %9[%20], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %9[%21], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %9[%22], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %9[%23], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %9[%24], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %9[%25], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %9[%26], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %9[%27], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %9[%28], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %9[%29], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %9[%30], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %9[%31], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %9[%32], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %9[%33], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %9[%34], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %9[%35], %17 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcvt", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcvt"}
      }
      %10 = pto.castptr %c36864_i64 : i64 -> !pto.ptr<f32, ub>
      %11 = pto.addptr %arg2, %c0 : <f32, gm> -> <f32, gm>
      %12 = pto.addptr %10, %c0 : <f32, ub> -> <f32, ub>
      pto.copy_gm_to_ubuf %11, %12, %c0_i64, %c1_i64, %c32_i64, %c0_i64, %c0_i64, %false, %c0_i64, %c0_i64, %c32_i64 : !pto.ptr<f32, gm>, !pto.ptr<f32, ub>, i64, i64, i64, i64, i64, i1, i64, i64, i64
      pto.set_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.wait_flag[<PIPE_MTE2>, <PIPE_V>, <EVENT_ID1>]
      pto.vecscope {
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %result = pto.vlds %10[%19] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %20 = pto.vdup %result, %17 {position = "LOWEST"} : !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %21 = arith.muli %19, %c1024 : index
          %result_0 = pto.vlds %9[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = arith.addi %21, %c64 : index
          %result_1 = pto.vlds %9[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %21, %c128 : index
          %result_2 = pto.vlds %9[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %21, %c192 : index
          %result_3 = pto.vlds %9[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %21, %c256 : index
          %result_4 = pto.vlds %9[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %21, %c320 : index
          %result_5 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %21, %c384 : index
          %result_6 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %21, %c448 : index
          %result_7 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %21, %c512 : index
          %result_8 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %21, %c576 : index
          %result_9 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %21, %c640 : index
          %result_10 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %21, %c704 : index
          %result_11 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %21, %c768 : index
          %result_12 = pto.vlds %9[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %21, %c832 : index
          %result_13 = pto.vlds %9[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = arith.addi %21, %c896 : index
          %result_14 = pto.vlds %9[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = arith.addi %21, %c960 : index
          %result_15 = pto.vlds %9[%36] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_0, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_1, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_2, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_3, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_4, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_5, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_6, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result_7, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_8, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_9, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_10, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result_11, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_12, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_13, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result_14, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %52 = pto.vmul %result_15, %20, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %37, %9[%21], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %9[%22], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %9[%23], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %9[%24], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %9[%25], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %9[%26], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %9[%27], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %9[%28], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %9[%29], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %9[%30], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %9[%31], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %9[%32], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %9[%33], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %9[%34], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %9[%35], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %52, %9[%36], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_trowexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "trowexpandmul"}
      }
      %13 = pto.alloc_tile addr = %c4096_i64 valid_row = %c8 valid_col = %c1024 {__pto.force_dynamic_valid_shape} : !pto.tile_buf<vec, 8x1024xf32, valid=?x?>
      pto.vecscope {
        %result = pto.vlds %3[%c0] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_0 = pto.vlds %3[%c64] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_1 = pto.vlds %3[%c128] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_2 = pto.vlds %3[%c192] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_3 = pto.vlds %3[%c256] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_4 = pto.vlds %3[%c320] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_5 = pto.vlds %3[%c384] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_6 = pto.vlds %3[%c448] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_7 = pto.vlds %3[%c512] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_8 = pto.vlds %3[%c576] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_9 = pto.vlds %3[%c640] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_10 = pto.vlds %3[%c704] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_11 = pto.vlds %3[%c768] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_12 = pto.vlds %3[%c832] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_13 = pto.vlds %3[%c896] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %result_14 = pto.vlds %3[%c960] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
        %17 = pto.pset_b32 "PAT_ALL" : !pto.mask<b32>
        %18 = pto.pge_b32 "PAT_ALL" : !pto.mask<b32>
        scf.for %arg6 = %c0_i16 to %c8_i16 step %c1_i16  : i16 {
          %19 = arith.index_cast %arg6 : i16 to index
          %20 = arith.muli %19, %c1024 : index
          %result_15 = pto.vlds %9[%20] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %21 = arith.addi %20, %c64 : index
          %result_16 = pto.vlds %9[%21] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %22 = arith.addi %20, %c128 : index
          %result_17 = pto.vlds %9[%22] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %23 = arith.addi %20, %c192 : index
          %result_18 = pto.vlds %9[%23] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %24 = arith.addi %20, %c256 : index
          %result_19 = pto.vlds %9[%24] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %25 = arith.addi %20, %c320 : index
          %result_20 = pto.vlds %9[%25] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %26 = arith.addi %20, %c384 : index
          %result_21 = pto.vlds %9[%26] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %27 = arith.addi %20, %c448 : index
          %result_22 = pto.vlds %9[%27] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %28 = arith.addi %20, %c512 : index
          %result_23 = pto.vlds %9[%28] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %29 = arith.addi %20, %c576 : index
          %result_24 = pto.vlds %9[%29] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %30 = arith.addi %20, %c640 : index
          %result_25 = pto.vlds %9[%30] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %31 = arith.addi %20, %c704 : index
          %result_26 = pto.vlds %9[%31] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %32 = arith.addi %20, %c768 : index
          %result_27 = pto.vlds %9[%32] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %33 = arith.addi %20, %c832 : index
          %result_28 = pto.vlds %9[%33] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %34 = arith.addi %20, %c896 : index
          %result_29 = pto.vlds %9[%34] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %35 = arith.addi %20, %c960 : index
          %result_30 = pto.vlds %9[%35] : !pto.ptr<f32, ub> -> !pto.vreg<64xf32>
          %36 = pto.vmul %result_15, %result, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %37 = pto.vmul %result_16, %result_0, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %38 = pto.vmul %result_17, %result_1, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %39 = pto.vmul %result_18, %result_2, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %40 = pto.vmul %result_19, %result_3, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %41 = pto.vmul %result_20, %result_4, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %42 = pto.vmul %result_21, %result_5, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %43 = pto.vmul %result_22, %result_6, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %44 = pto.vmul %result_23, %result_7, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %45 = pto.vmul %result_24, %result_8, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %46 = pto.vmul %result_25, %result_9, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %47 = pto.vmul %result_26, %result_10, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %48 = pto.vmul %result_27, %result_11, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %49 = pto.vmul %result_28, %result_12, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %50 = pto.vmul %result_29, %result_13, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          %51 = pto.vmul %result_30, %result_14, %17 : !pto.vreg<64xf32>, !pto.vreg<64xf32>, !pto.mask<b32> -> !pto.vreg<64xf32>
          pto.vsts %36, %9[%20], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %37, %9[%21], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %38, %9[%22], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %39, %9[%23], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %40, %9[%24], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %41, %9[%25], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %42, %9[%26], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %43, %9[%27], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %44, %9[%28], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %45, %9[%29], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %46, %9[%30], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %47, %9[%31], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %48, %9[%32], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %49, %9[%33], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %50, %9[%34], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
          pto.vsts %51, %9[%35], %18 : !pto.vreg<64xf32>, !pto.ptr<f32, ub>, !pto.mask<b32>
        } {pto.tilelib.candidate = "vmi_tcolexpandmul", pto.tilelib.impl = "vmi", pto.vmi.fusion.principal_loop, pto.vmi.fusion.source = "tilelib", pto.vmi.fusion.tileop = "tcolexpandmul"}
      }
      %14 = pto.addptr %arg3, %1 : <f32, gm> -> <f32, gm>
      %15 = pto.addptr %9, %c0 : <f32, ub> -> <f32, ub>
      %16 = pto.addptr %14, %c0 : <f32, gm> -> <f32, gm>
      pto.copy_ubuf_to_gm %15, %16, %c0_i64, %c8_i64, %c4096_i64, %c0_i64, %c32768_i64, %c4096_i64 : !pto.ptr<f32, ub>, !pto.ptr<f32, gm>, i64, i64, i64, i64, i64, i64
      pto.barrier <PIPE_ALL> {pto.auto_sync_tail_barrier}
      return
    }
  }
}
